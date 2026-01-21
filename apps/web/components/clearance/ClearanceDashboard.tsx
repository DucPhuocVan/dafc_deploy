'use client';

import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { TrendingDown, Package, AlertTriangle, Plus, Play, CheckCircle } from 'lucide-react';
import { clearanceApi } from '@/lib/api-client';
import { MarkdownPlanCard } from './MarkdownPlanCard';
import { OptimizationResults } from './OptimizationResults';
import { SimulationTool } from './SimulationTool';
import type { MarkdownPlan, OptimizationResult } from '@/types/clearance';

interface Props {
  brandId: string;
  seasonId: string;
}

export function ClearanceDashboard({ brandId, seasonId }: Props) {
  const [selectedPlanId, setSelectedPlanId] = useState<string | null>(null);
  const [optimizationResult, setOptimizationResult] = useState<OptimizationResult | null>(null);
  const queryClient = useQueryClient();

  const { data: plansResponse, isLoading } = useQuery({
    queryKey: ['clearance-plans', brandId, seasonId],
    queryFn: () => clearanceApi.getPlans({ brandId, seasonId }),
    enabled: !!brandId && !!seasonId,
  });

  const optimizeMutation = useMutation({
    mutationFn: (planId: string) => clearanceApi.optimizePlan({ planId, strategy: 'BALANCED' }),
    onSuccess: (response) => {
      if (response.data) {
        setOptimizationResult(response.data as unknown as OptimizationResult);
      }
    },
  });

  const plans = (plansResponse?.data || []) as MarkdownPlan[];

  const summary = {
    totalPlans: plans.length,
    activePlans: plans.filter(p => p.status === 'ACTIVE').length,
    skusByAction: {} as Record<string, number>,
  };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Clearance Optimization</h1>
          <p className="text-muted-foreground">AI-powered markdown strategy</p>
        </div>
        <Button><Plus className="h-4 w-4 mr-2" />New Plan</Button>
      </div>

      {/* Summary Cards */}
      <div className="grid grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm text-muted-foreground">Total Plans</CardTitle>
          </CardHeader>
          <CardContent><div className="text-2xl font-bold">{summary.totalPlans}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm text-muted-foreground">Active</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <Play className="h-5 w-5 text-green-500" />
              <span className="text-2xl font-bold">{summary.activePlans}</span>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm text-muted-foreground">SKUs for Markdown</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <TrendingDown className="h-5 w-5 text-orange-500" />
              <span className="text-2xl font-bold">
                {Object.values(summary.skusByAction || {}).reduce((a: number, b: number) => a + b, 0)}
              </span>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm text-muted-foreground">Immediate Action</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <AlertTriangle className="h-5 w-5 text-red-500" />
              <span className="text-2xl font-bold text-red-600">{summary.skusByAction?.IMMEDIATE_CLEAR || 0}</span>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Plans List */}
      <Card>
        <CardHeader>
          <CardTitle>Markdown Plans</CardTitle>
          <CardDescription>Manage clearance strategies</CardDescription>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="text-center py-8 text-muted-foreground">Loading...</div>
          ) : plans.length === 0 ? (
            <div className="text-center py-8 text-muted-foreground">No plans found</div>
          ) : (
            <div className="grid grid-cols-2 gap-4">
              {plans.map((plan) => (
                <MarkdownPlanCard
                  key={plan.id}
                  plan={plan}
                  onOptimize={() => {
                    setSelectedPlanId(plan.id);
                    optimizeMutation.mutate(plan.id);
                  }}
                />
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Optimization Results */}
      {optimizationResult && selectedPlanId && (
        <OptimizationResults planId={selectedPlanId} result={optimizationResult} />
      )}

      {/* Simulation Tool */}
      {selectedPlanId && optimizationResult && (
        <SimulationTool planId={selectedPlanId} skus={optimizationResult.recommendations} />
      )}
    </div>
  );
}
