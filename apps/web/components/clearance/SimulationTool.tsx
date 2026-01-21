'use client';

import { useState } from 'react';
import { useMutation } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Slider } from '@/components/ui/slider';
import { Badge } from '@/components/ui/badge';
import { Play, DollarSign, Package, Target } from 'lucide-react';
import { clearanceApi } from '@/lib/api-client';
import type { MarkdownSKUPlan, SimulationResult } from '@/types/clearance';

function formatCurrency(value: number): string {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0 }).format(value);
}

interface Props {
  planId: string;
  skus: MarkdownSKUPlan[];
}

export function SimulationTool({ planId, skus }: Props) {
  const [markdownPct, setMarkdownPct] = useState(20);
  const [result, setResult] = useState<SimulationResult | null>(null);

  const skuIds = skus.filter(s => s.recommendedAction !== 'NO_ACTION').map(s => s.skuId);

  const mutation = useMutation({
    mutationFn: () => clearanceApi.simulateScenario({
      planId,
      globalMarkdownPct: markdownPct,
      skuOverrides: skuIds.map(id => ({ skuId: id, markdownPct }))
    }),
    onSuccess: (response) => {
      if (response.data) {
        setResult(response.data as unknown as SimulationResult);
      }
    },
  });

  return (
    <div className="grid grid-cols-2 gap-6">
      <Card>
        <CardHeader>
          <CardTitle>Simulation Parameters</CardTitle>
          <CardDescription>Test what-if scenarios</CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="space-y-4">
            <div className="flex justify-between items-center">
              <label className="text-sm font-medium">Markdown %</label>
              <Badge variant="outline" className="text-lg font-bold">{markdownPct}%</Badge>
            </div>
            <Slider value={[markdownPct]} onValueChange={([v]) => setMarkdownPct(v)} min={0} max={70} step={5} />
          </div>
          <div className="text-sm text-muted-foreground">Testing {skuIds.length} SKUs</div>
          <Button className="w-full" onClick={() => mutation.mutate()} disabled={mutation.isPending}>
            <Play className="h-4 w-4 mr-2" />{mutation.isPending ? 'Running...' : 'Run Simulation'}
          </Button>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Results</CardTitle>
          <CardDescription>Projected outcomes</CardDescription>
        </CardHeader>
        <CardContent>
          {!result ? (
            <div className="text-center py-12 text-muted-foreground">Run simulation to see results</div>
          ) : (
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-green-50 rounded-lg p-4">
                <div className="flex items-center gap-2 text-green-700 mb-2">
                  <DollarSign className="h-5 w-5" />Revenue
                </div>
                <div className="text-2xl font-bold text-green-700">{formatCurrency(result.results.totalRevenue)}</div>
              </div>
              <div className="bg-blue-50 rounded-lg p-4">
                <div className="flex items-center gap-2 text-blue-700 mb-2">
                  <Package className="h-5 w-5" />Units
                </div>
                <div className="text-2xl font-bold text-blue-700">{result.results.totalUnits.toLocaleString()}</div>
              </div>
              <div className="bg-purple-50 rounded-lg p-4 col-span-2">
                <div className="flex items-center gap-2 text-purple-700 mb-2">
                  <Target className="h-5 w-5" />Avg Sell-Through
                </div>
                <div className="text-2xl font-bold text-purple-700">{result.results.avgSellThrough}%</div>
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
