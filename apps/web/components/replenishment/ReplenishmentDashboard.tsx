'use client';

import { useState } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { AlertTriangle, CheckCircle, Clock, RefreshCw, ShoppingCart } from 'lucide-react';
import { replenishmentApi } from '@/lib/api-client';
import { MOCStatusGrid } from './MOCStatusGrid';
import { ReplenishmentAlertList } from './ReplenishmentAlertList';
import type { ReplenishmentDashboardData } from '@/types/replenishment';

interface Props {
  brandId: string;
}

export function ReplenishmentDashboard({ brandId }: Props) {
  const [selectedAlerts, setSelectedAlerts] = useState<string[]>([]);
  const queryClient = useQueryClient();

  const { data: dashboardResponse, isLoading } = useQuery({
    queryKey: ['replenishment-dashboard', brandId],
    queryFn: () => replenishmentApi.getDashboard({ brandId }),
    enabled: !!brandId,
  });

  const checkMutation = useMutation({
    mutationFn: () => replenishmentApi.generateAlerts({ brandId }),
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['replenishment-dashboard'] }),
  });

  const createOrderMutation = useMutation({
    mutationFn: () => replenishmentApi.createOrder({
      supplierName: 'Default Supplier',
      expectedDelivery: new Date(Date.now() + 14 * 24 * 60 * 60 * 1000).toISOString(),
      items: [],
      alertIds: selectedAlerts,
    }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['replenishment-dashboard'] });
      setSelectedAlerts([]);
    },
  });

  const dashboard = dashboardResponse?.data as ReplenishmentDashboardData | undefined;
  const summary = dashboard?.summary || { totalCategories: 0, criticalCount: 0, warningCount: 0, healthyCount: 0 };

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold">Replenishment Management</h1>
          <p className="text-muted-foreground">MOC/MOQ monitoring</p>
        </div>
        <div className="flex gap-2">
          <Button variant="outline" onClick={() => checkMutation.mutate()} disabled={checkMutation.isPending}>
            <RefreshCw className={`h-4 w-4 mr-2 ${checkMutation.isPending ? 'animate-spin' : ''}`} />Check Needs
          </Button>
          {selectedAlerts.length > 0 && (
            <Button onClick={() => createOrderMutation.mutate()}>
              <ShoppingCart className="h-4 w-4 mr-2" />Create Order ({selectedAlerts.length})
            </Button>
          )}
        </div>
      </div>

      {/* Summary */}
      <div className="grid grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-2"><CardTitle className="text-sm text-muted-foreground">Categories</CardTitle></CardHeader>
          <CardContent><div className="text-2xl font-bold">{summary.totalCategories}</div></CardContent>
        </Card>
        <Card className="border-red-200 bg-red-50">
          <CardHeader className="pb-2"><CardTitle className="text-sm text-red-700">Critical</CardTitle></CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <AlertTriangle className="h-5 w-5 text-red-500" />
              <span className="text-2xl font-bold text-red-700">{summary.criticalCount}</span>
            </div>
          </CardContent>
        </Card>
        <Card className="border-yellow-200 bg-yellow-50">
          <CardHeader className="pb-2"><CardTitle className="text-sm text-yellow-700">Warning</CardTitle></CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <Clock className="h-5 w-5 text-yellow-500" />
              <span className="text-2xl font-bold text-yellow-700">{summary.warningCount}</span>
            </div>
          </CardContent>
        </Card>
        <Card className="border-green-200 bg-green-50">
          <CardHeader className="pb-2"><CardTitle className="text-sm text-green-700">Healthy</CardTitle></CardHeader>
          <CardContent>
            <div className="flex items-center gap-2">
              <CheckCircle className="h-5 w-5 text-green-500" />
              <span className="text-2xl font-bold text-green-700">{summary.healthyCount}</span>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Tabs */}
      <Tabs defaultValue="moc">
        <TabsList>
          <TabsTrigger value="moc">MOC Status</TabsTrigger>
          <TabsTrigger value="alerts">
            Alerts{dashboard?.alerts?.length ? <Badge variant="destructive" className="ml-2">{dashboard.alerts.length}</Badge> : null}
          </TabsTrigger>
        </TabsList>
        <TabsContent value="moc" className="mt-4">
          <MOCStatusGrid data={dashboard?.mocByCategory || []} />
        </TabsContent>
        <TabsContent value="alerts" className="mt-4">
          <ReplenishmentAlertList
            alerts={dashboard?.alerts || []}
            selectedAlerts={selectedAlerts}
            onSelectChange={setSelectedAlerts}
          />
        </TabsContent>
      </Tabs>
    </div>
  );
}
