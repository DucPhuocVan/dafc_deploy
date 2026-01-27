/* eslint-disable @typescript-eslint/no-explicit-any */
import { NextRequest, NextResponse } from 'next/server';
import prisma from '@/lib/prisma';
import { auth } from '@/lib/auth';
import { generateOTBProposal, logAIInteraction } from '@/lib/ai';

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ success: false, error: 'Unauthorized' }, { status: 401 });
    }

    const { id } = await params;

    const plan = await prisma.oTBPlan.findUnique({
      where: { id },
      include: {
        budget: {
          include: {
            season: true,
            brand: true,
            location: true,
          },
        },
        lineItems: {
          include: {
            category: true,
          },
        },
      },
    });

    if (!plan) {
      return NextResponse.json({ success: false, error: 'OTB plan not found' }, { status: 404 });
    }

    // Get categories
    const categories = await prisma.category.findMany({
      where: { isActive: true },
      orderBy: { name: 'asc' },
    });

    // Get historical data (previous season OTB plans)
    const historicalPlans = await prisma.oTBPlan.findMany({
      where: {
        budget: {
          brandId: plan.budget.brandId,
          seasonId: { not: plan.budget.seasonId },
        },
        status: 'APPROVED',
      },
      include: {
        budget: {
          include: { season: true },
        },
        lineItems: {
          include: { category: true },
        },
      },
      orderBy: { createdAt: 'desc' },
      take: 3,
    });

    // Prepare historical data for AI
    const historicalData = historicalPlans.map((hp) => ({
      season: hp.budget.season.code,
      totalBudget: Number(hp.budget.totalBudget),
      lineItems: hp.lineItems.map((li) => ({
        category: li.category?.name ?? 'Unknown',
        gender: li.gender,
        units: li.userUnits,
        buyValue: Number(li.userBuyValue),
        buyPct: Number(li.userBuyPct),
      })),
    }));

    // Generate AI proposal
    const startTime = Date.now();
    const proposal = await generateOTBProposal({
      budget: Number(plan.budget.totalBudget),
      season: plan.budget.season.code,
      brand: plan.budget.brand.name,
      historicalData: historicalData.flatMap(hp =>
        hp.lineItems.map(li => ({
          category: li.category,
          historicalPct: li.buyPct,
          historicalValue: li.buyValue,
        }))
      ),
    });
    const responseTime = Date.now() - startTime;

    // Log AI interaction
    await logAIInteraction({
      userId: session.user.id,
      action: 'generate_otb_proposal',
      context: {
        entityType: 'OTB_PLAN',
        entityId: id,
        budgetAmount: Number(plan.budget.totalBudget),
        categoriesCount: categories.length,
        historicalPlansCount: historicalPlans.length,
      },
      latencyMs: responseTime,
    });

    // Transform AI proposal to LineItem format expected by frontend
    const totalBudget = Number(plan.budget.totalBudget);
    const transformedProposals = proposal.proposals.map((p: any) => {
      // Find category by name
      const category = categories.find(
        (c) => c.name.toLowerCase() === p.category.toLowerCase()
      ) || categories[0];

      // Calculate planned amount from percentage
      const plannedAmount = (totalBudget * p.proposedPercentage) / 100;

      // Estimate pricing based on category (these are placeholder values)
      // In production, you would use historical data or more sophisticated calculations
      const averageRetailPrice = 100; // Placeholder
      const averageCostPrice = 60; // Placeholder (60% of retail)
      const marginPercent = ((averageRetailPrice - averageCostPrice) / averageRetailPrice) * 100;
      const plannedUnits = Math.round(plannedAmount / averageCostPrice);

      return {
        categoryName: category?.name || p.category,
        gender: 'UNISEX' as const,
        plannedUnits,
        plannedAmount,
        averageRetailPrice,
        averageCostPrice,
        marginPercent,
        sellThruTarget: 85, // Default target
        weeksOfSupply: 12, // Default
      };
    });

    return NextResponse.json({
      success: true,
      data: {
        proposals: transformedProposals,
        overallConfidence: proposal.overallConfidence,
        executiveSummary: proposal.executiveSummary,
        rawProposal: proposal.proposals, // Include raw AI response for reference
      },
    });
  } catch (error) {
    console.error('Error generating AI proposal:', error);
    return NextResponse.json(
      {
        success: false,
        error: 'Failed to generate AI proposal',
        detail: error instanceof Error ? error.message : String(error)
      },
      { status: 500 }
    );
  }
}
