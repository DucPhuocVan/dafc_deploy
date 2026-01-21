'use client';

import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
  ShoppingCart,
  Tag,
  Trash2,
  ArrowRightLeft,
  Megaphone,
  ArrowRight,
} from 'lucide-react';
import { cn } from '@/lib/utils';

export interface SKURecommendation {
  skuId: string;
  skuCode: string;
  skuName: string;
  action: 'REORDER' | 'MARKDOWN' | 'DISCONTINUE' | 'TRANSFER' | 'PROMOTE';
  reason: string;
  suggestedQuantity?: number;
  suggestedMarkdownPct?: number;
  priority: 'HIGH' | 'MEDIUM' | 'LOW';
  potentialImpact: number;
}

interface SKURecommendationsProps {
  recommendations: SKURecommendation[];
  onActionClick?: (recommendation: SKURecommendation) => void;
}

const ACTION_CONFIG: Record<
  SKURecommendation['action'],
  { icon: React.ReactNode; color: string; label: string }
> = {
  REORDER: { icon: <ShoppingCart className="h-4 w-4" />, color: 'bg-blue-500', label: 'Reorder' },
  MARKDOWN: { icon: <Tag className="h-4 w-4" />, color: 'bg-orange-500', label: 'Markdown' },
  DISCONTINUE: { icon: <Trash2 className="h-4 w-4" />, color: 'bg-red-500', label: 'Discontinue' },
  TRANSFER: { icon: <ArrowRightLeft className="h-4 w-4" />, color: 'bg-purple-500', label: 'Transfer' },
  PROMOTE: { icon: <Megaphone className="h-4 w-4" />, color: 'bg-green-500', label: 'Promote' },
};

const PRIORITY_CONFIG: Record<SKURecommendation['priority'], { color: string; label: string }> = {
  HIGH: { color: 'bg-red-100 text-red-700 border-red-200', label: 'High Priority' },
  MEDIUM: { color: 'bg-yellow-100 text-yellow-700 border-yellow-200', label: 'Medium Priority' },
  LOW: { color: 'bg-green-100 text-green-700 border-green-200', label: 'Low Priority' },
};

export function SKURecommendations({ recommendations, onActionClick }: SKURecommendationsProps) {
  const formatCurrency = (value: number) =>
    new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', maximumFractionDigits: 0 }).format(value);

  if (recommendations.length === 0) {
    return (
      <Card>
        <CardContent className="p-6 text-center text-muted-foreground">
          No recommendations available at this time.
        </CardContent>
      </Card>
    );
  }

  // Group by priority
  const groupedByPriority = recommendations.reduce(
    (acc, rec) => {
      acc[rec.priority].push(rec);
      return acc;
    },
    { HIGH: [], MEDIUM: [], LOW: [] } as Record<string, SKURecommendation[]>,
  );

  return (
    <div className="space-y-6">
      {(['HIGH', 'MEDIUM', 'LOW'] as const).map((priority) => {
        const items = groupedByPriority[priority];
        if (items.length === 0) return null;

        return (
          <Card key={priority}>
            <CardHeader className="pb-2">
              <div className="flex items-center justify-between">
                <CardTitle className="text-base flex items-center gap-2">
                  <Badge variant="outline" className={PRIORITY_CONFIG[priority].color}>
                    {PRIORITY_CONFIG[priority].label}
                  </Badge>
                  <span className="text-muted-foreground font-normal">
                    ({items.length} recommendation{items.length > 1 ? 's' : ''})
                  </span>
                </CardTitle>
                <span className="text-sm text-muted-foreground">
                  Potential Impact: {formatCurrency(items.reduce((sum, r) => sum + r.potentialImpact, 0))}
                </span>
              </div>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {items.map((rec) => {
                  const actionConfig = ACTION_CONFIG[rec.action];
                  return (
                    <div
                      key={rec.skuId}
                      className="flex items-center gap-4 p-3 rounded-lg border hover:bg-muted/50 transition-colors"
                    >
                      <div
                        className={cn(
                          'p-2 rounded-lg text-white',
                          actionConfig.color,
                        )}
                      >
                        {actionConfig.icon}
                      </div>

                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2">
                          <span className="font-medium">{rec.skuCode}</span>
                          <Badge variant="outline">{actionConfig.label}</Badge>
                        </div>
                        <p className="text-sm text-muted-foreground truncate">{rec.skuName}</p>
                        <p className="text-xs text-muted-foreground mt-1">{rec.reason}</p>
                      </div>

                      <div className="text-right">
                        {rec.suggestedQuantity && (
                          <p className="text-sm">
                            <span className="text-muted-foreground">Qty:</span>{' '}
                            <span className="font-medium">{rec.suggestedQuantity}</span>
                          </p>
                        )}
                        {rec.suggestedMarkdownPct && (
                          <p className="text-sm">
                            <span className="text-muted-foreground">MD:</span>{' '}
                            <span className="font-medium text-orange-600">
                              {rec.suggestedMarkdownPct.toFixed(0)}%
                            </span>
                          </p>
                        )}
                        <p className="text-xs text-muted-foreground mt-1">
                          Impact: {formatCurrency(rec.potentialImpact)}
                        </p>
                      </div>

                      {onActionClick && (
                        <Button
                          variant="ghost"
                          size="sm"
                          onClick={() => onActionClick(rec)}
                        >
                          <ArrowRight className="h-4 w-4" />
                        </Button>
                      )}
                    </div>
                  );
                })}
              </div>
            </CardContent>
          </Card>
        );
      })}
    </div>
  );
}
