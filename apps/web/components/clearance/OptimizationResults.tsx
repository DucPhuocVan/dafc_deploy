'use client';

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';
import { Sparkles, TrendingUp, AlertTriangle, CheckCircle } from 'lucide-react';
import type { OptimizationResult, MarkdownAction } from '@/types/clearance';

const ACTION_CONFIG: Record<MarkdownAction, { label: string; color: string; icon: typeof CheckCircle }> = {
  NO_ACTION: { label: 'No Action', color: 'bg-gray-100 text-gray-800', icon: CheckCircle },
  INCLUDE_PHASE_1: { label: 'Phase 1', color: 'bg-blue-100 text-blue-800', icon: TrendingUp },
  INCLUDE_PHASE_2: { label: 'Phase 2', color: 'bg-yellow-100 text-yellow-800', icon: TrendingUp },
  INCLUDE_PHASE_3: { label: 'Phase 3', color: 'bg-orange-100 text-orange-800', icon: TrendingUp },
  IMMEDIATE_CLEAR: { label: 'Immediate', color: 'bg-red-100 text-red-800', icon: AlertTriangle },
  REMOVE_FROM_FLOOR: { label: 'Remove', color: 'bg-purple-100 text-purple-800', icon: AlertTriangle },
};

function formatCurrency(value: number): string {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0 }).format(value);
}

function formatPercent(value: number): string {
  return `${value.toFixed(1)}%`;
}

interface Props {
  planId: string;
  result: OptimizationResult;
}

export function OptimizationResults({ planId, result }: Props) {
  return (
    <div className="space-y-6">
      {/* Summary */}
      <div className="grid grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-2"><CardTitle className="text-sm text-muted-foreground">SKUs Analyzed</CardTitle></CardHeader>
          <CardContent><div className="text-2xl font-bold">{result.totalSKUs}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2"><CardTitle className="text-sm text-muted-foreground">Expected Revenue</CardTitle></CardHeader>
          <CardContent><div className="text-2xl font-bold text-green-600">{formatCurrency(result.summary.totalExpectedRevenue)}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2"><CardTitle className="text-sm text-muted-foreground">Avg Confidence</CardTitle></CardHeader>
          <CardContent><div className="text-2xl font-bold">{formatPercent(result.summary.avgConfidence * 100)}</div></CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2"><CardTitle className="text-sm text-muted-foreground">Immediate Action</CardTitle></CardHeader>
          <CardContent><div className="text-2xl font-bold text-red-600">{result.summary.byAction.IMMEDIATE_CLEAR || 0}</div></CardContent>
        </Card>
      </div>

      {/* Distribution */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2"><Sparkles className="h-5 w-5 text-yellow-500" />Recommendation Distribution</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex gap-2 flex-wrap">
            {Object.entries(result.summary.byAction).map(([action, count]) => {
              const config = ACTION_CONFIG[action as MarkdownAction];
              return (
                <Badge key={action} className={`${config.color} px-3 py-1`}>
                  {config.label}: {count}
                </Badge>
              );
            })}
          </div>
        </CardContent>
      </Card>

      {/* Table */}
      <Card>
        <CardHeader>
          <CardTitle>SKU Recommendations</CardTitle>
          <CardDescription>Top 20 by revenue impact</CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>SKU</TableHead>
                <TableHead className="text-right">Stock</TableHead>
                <TableHead className="text-right">WoC</TableHead>
                <TableHead className="text-right">ST%</TableHead>
                <TableHead>Action</TableHead>
                <TableHead className="text-right">MD%</TableHead>
                <TableHead className="text-right">Pred. Revenue</TableHead>
                <TableHead className="text-right">Confidence</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {result.recommendations.slice(0, 20).map((sku) => {
                const config = ACTION_CONFIG[sku.recommendedAction];
                const Icon = config.icon;
                return (
                  <TableRow key={sku.skuId}>
                    <TableCell className="font-mono">{sku.skuCode || sku.skuId.slice(0, 8)}</TableCell>
                    <TableCell className="text-right">{sku.currentStock}</TableCell>
                    <TableCell className="text-right">{sku.currentWoC.toFixed(1)}</TableCell>
                    <TableCell className="text-right">{sku.currentSellThrough.toFixed(1)}%</TableCell>
                    <TableCell>
                      <Badge className={config.color}><Icon className="h-3 w-3 mr-1" />{config.label}</Badge>
                    </TableCell>
                    <TableCell className="text-right">{sku.recommendedMarkdownPct ? `${sku.recommendedMarkdownPct}%` : '-'}</TableCell>
                    <TableCell className="text-right">{formatCurrency(sku.predictedRevenue || 0)}</TableCell>
                    <TableCell className="text-right">{((sku.confidenceScore || 0) * 100).toFixed(0)}%</TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
}
