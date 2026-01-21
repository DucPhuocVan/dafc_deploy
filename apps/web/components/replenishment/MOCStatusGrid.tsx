'use client';

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Progress } from '@/components/ui/progress';
import type { MOCData, MOCStatus } from '@/types/replenishment';

const STATUS_CONFIG: Record<MOCStatus, { label: string; color: string; bgColor: string }> = {
  CRITICAL: { label: 'Critical', color: 'text-red-700', bgColor: 'bg-red-100' },
  WARNING: { label: 'Warning', color: 'text-yellow-700', bgColor: 'bg-yellow-100' },
  HEALTHY: { label: 'Healthy', color: 'text-green-700', bgColor: 'bg-green-100' },
  OVERSTOCK: { label: 'Overstock', color: 'text-purple-700', bgColor: 'bg-purple-100' },
  UNKNOWN: { label: 'Unknown', color: 'text-gray-700', bgColor: 'bg-gray-100' },
};

interface Props {
  data: MOCData[];
}

export function MOCStatusGrid({ data }: Props) {
  if (data.length === 0) return <div className="text-center py-8 text-muted-foreground">No MOC data</div>;

  return (
    <div className="grid grid-cols-3 gap-4">
      {data.map((item) => {
        const config = STATUS_CONFIG[item.status];
        const pct = Math.min(100, (item.currentMOC / item.maxMOC) * 100);
        return (
          <Card key={item.categoryId} className={config.bgColor}>
            <CardHeader className="pb-2">
              <div className="flex items-start justify-between">
                <CardTitle className="text-base">{item.categoryName}</CardTitle>
                <Badge className={`${config.bgColor} ${config.color}`}>{config.label}</Badge>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="text-center">
                <div className={`text-4xl font-bold ${config.color}`}>{item.currentMOC.toFixed(1)}</div>
                <div className="text-sm text-muted-foreground">Months of Cover</div>
              </div>
              <Progress value={pct} className="h-3" />
              <div className="flex justify-between text-xs text-muted-foreground">
                <span>Min: {item.minMOC}</span>
                <span>Target: {item.targetMOC}</span>
                <span>Max: {item.maxMOC}</span>
              </div>
              <div className="grid grid-cols-2 gap-2 text-sm">
                <div><span className="text-muted-foreground">Stock:</span> {item.currentStock.toLocaleString()}</div>
                <div><span className="text-muted-foreground">Monthly:</span> {item.monthlyRate.toLocaleString()}</div>
              </div>
            </CardContent>
          </Card>
        );
      })}
    </div>
  );
}
