'use client';

import { useMutation, useQueryClient } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Checkbox } from '@/components/ui/checkbox';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/components/ui/table';
import { AlertTriangle, AlertCircle, Info, Check } from 'lucide-react';
import { replenishmentApi } from '@/lib/api-client';
import type { ReplenishmentAlert, AlertSeverity, ReplenishmentAlertType } from '@/types/replenishment';
import { format } from 'date-fns';

const SEVERITY_CONFIG: Record<AlertSeverity, { label: string; color: string; icon: typeof AlertTriangle }> = {
  CRITICAL: { label: 'Critical', color: 'bg-red-100 text-red-800', icon: AlertTriangle },
  WARNING: { label: 'Warning', color: 'bg-yellow-100 text-yellow-800', icon: AlertCircle },
  INFO: { label: 'Info', color: 'bg-blue-100 text-blue-800', icon: Info },
};

const ALERT_TYPE_LABELS: Record<ReplenishmentAlertType, string> = {
  BELOW_MIN_MOC: 'Below Min MOC',
  APPROACHING_MIN: 'Approaching Min',
  ABOVE_MAX_MOC: 'Above Max MOC',
  STOCKOUT_RISK: 'Stockout Risk',
  LEAD_TIME_RISK: 'Lead Time Risk',
};

function formatCurrency(value: number): string {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0 }).format(value);
}

interface Props {
  alerts: ReplenishmentAlert[];
  selectedAlerts: string[];
  onSelectChange: (selected: string[]) => void;
}

export function ReplenishmentAlertList({ alerts, selectedAlerts, onSelectChange }: Props) {
  const queryClient = useQueryClient();

  const acknowledgeMutation = useMutation({
    mutationFn: (id: string) => replenishmentApi.acknowledgeAlert(id),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['replenishment-dashboard'] }),
  });

  const toggleSelect = (id: string) => {
    if (selectedAlerts.includes(id)) {
      onSelectChange(selectedAlerts.filter(a => a !== id));
    } else {
      onSelectChange([...selectedAlerts, id]);
    }
  };

  const toggleSelectAll = () => {
    if (selectedAlerts.length === alerts.length) {
      onSelectChange([]);
    } else {
      onSelectChange(alerts.map(a => a.id));
    }
  };

  if (alerts.length === 0) {
    return (
      <Card>
        <CardContent className="py-12 text-center text-muted-foreground">
          <Check className="h-12 w-12 mx-auto mb-4 text-green-500" />
          No active alerts. All inventory levels are within target range.
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Active Alerts</CardTitle>
        <CardDescription>{alerts.length} alerts requiring attention</CardDescription>
      </CardHeader>
      <CardContent>
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-12">
                <Checkbox
                  checked={selectedAlerts.length === alerts.length}
                  onCheckedChange={toggleSelectAll}
                />
              </TableHead>
              <TableHead>Category</TableHead>
              <TableHead>Type</TableHead>
              <TableHead>Severity</TableHead>
              <TableHead className="text-right">Current MOC</TableHead>
              <TableHead className="text-right">Target MOC</TableHead>
              <TableHead className="text-right">Suggested Qty</TableHead>
              <TableHead className="text-right">Value</TableHead>
              <TableHead>Created</TableHead>
              <TableHead className="w-20">Action</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {alerts.map((alert) => {
              const severityConfig = SEVERITY_CONFIG[alert.severity];
              const Icon = severityConfig.icon;
              return (
                <TableRow key={alert.id} className={alert.isAcknowledged ? 'opacity-50' : ''}>
                  <TableCell>
                    <Checkbox
                      checked={selectedAlerts.includes(alert.id)}
                      onCheckedChange={() => toggleSelect(alert.id)}
                      disabled={alert.isAcknowledged}
                    />
                  </TableCell>
                  <TableCell className="font-medium">{alert.categoryName || 'N/A'}</TableCell>
                  <TableCell>{ALERT_TYPE_LABELS[alert.alertType]}</TableCell>
                  <TableCell>
                    <Badge className={severityConfig.color}>
                      <Icon className="h-3 w-3 mr-1" />
                      {severityConfig.label}
                    </Badge>
                  </TableCell>
                  <TableCell className="text-right font-mono">{alert.currentMOC.toFixed(1)}</TableCell>
                  <TableCell className="text-right font-mono">{alert.targetMOC.toFixed(1)}</TableCell>
                  <TableCell className="text-right font-mono">{alert.suggestedOrderQty.toLocaleString()}</TableCell>
                  <TableCell className="text-right">{formatCurrency(alert.suggestedOrderValue)}</TableCell>
                  <TableCell>{format(new Date(alert.createdAt), 'MMM d, HH:mm')}</TableCell>
                  <TableCell>
                    {!alert.isAcknowledged && (
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => acknowledgeMutation.mutate(alert.id)}
                        disabled={acknowledgeMutation.isPending}
                      >
                        <Check className="h-4 w-4" />
                      </Button>
                    )}
                  </TableCell>
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </CardContent>
    </Card>
  );
}
