'use client';

import { useState, useEffect, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { ColumnDef } from '@tanstack/react-table';
import {
  MoreHorizontal,
  Eye,
  RefreshCw,
  AlertTriangle,
  TrendingUp,
  TrendingDown,
  Package,
  BarChart3,
  Bell,
  Filter,
} from 'lucide-react';
import { toast } from 'sonner';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select';
import { PageHeader } from '@/components/shared/page-header';
import { DataTable } from '@/components/shared/data-table';
import { Season, Brand, Division } from '@/types';

interface WSSIRecord {
  id: string;
  year: number;
  weekNumber: number;
  weekStartDate: string;
  weekEndDate: string;
  division: { id: string; name: string; code: string };
  brand: { id: string; name: string; code: string };
  category: { id: string; name: string; code: string } | null;
  subcategory: { id: string; name: string; code: string } | null;
  season: { id: string; name: string; code: string };
  location: { id: string; name: string; code: string } | null;
  openingStockValue: number;
  closingStockValue: number;
  salesPlanValue: number;
  salesActualValue: number;
  intakePlanValue: number;
  intakeActualValue: number;
  weeksOfCover: number;
  salesVariancePct: number;
  intakeVariancePct: number;
  sellThroughPct: number;
  forecastType: 'PLAN' | 'REFORECAST' | 'ACTUAL';
  alerts: Array<{
    id: string;
    alertType: string;
    severity: string;
    title: string;
    isAcknowledged: boolean;
  }>;
}

interface WSSISummary {
  year: number;
  recordCount: number;
  totals: {
    totalSalesPlan: number;
    totalSalesActual: number;
    totalIntakePlan: number;
    totalIntakeActual: number;
    averageWoC: number;
    averageSellThrough: number;
    averageSalesVariance: number;
  };
}

export default function WSSIPage() {
  const router = useRouter();
  const currentYear = new Date().getFullYear();

  const [records, setRecords] = useState<WSSIRecord[]>([]);
  const [summary, setSummary] = useState<WSSISummary | null>(null);
  const [seasons, setSeasons] = useState<Season[]>([]);
  const [brands, setBrands] = useState<Brand[]>([]);
  const [divisions, setDivisions] = useState<Division[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [alertCount, setAlertCount] = useState(0);

  // Filters
  const [yearFilter, setYearFilter] = useState<number>(currentYear);
  const [seasonFilter, setSeasonFilter] = useState<string>('all');
  const [brandFilter, setBrandFilter] = useState<string>('all');
  const [divisionFilter, setDivisionFilter] = useState<string>('all');
  const [weekStart, setWeekStart] = useState<string>('');
  const [weekEnd, setWeekEnd] = useState<string>('');

  const fetchData = useCallback(async () => {
    try {
      setIsLoading(true);

      const params = new URLSearchParams();
      params.append('year', yearFilter.toString());
      if (seasonFilter !== 'all') params.append('seasonId', seasonFilter);
      if (brandFilter !== 'all') params.append('brandId', brandFilter);
      if (divisionFilter !== 'all') params.append('divisionId', divisionFilter);
      if (weekStart) params.append('weekStart', weekStart);
      if (weekEnd) params.append('weekEnd', weekEnd);

      const [recordsRes, summaryRes, seasonsRes, brandsRes, divisionsRes, alertsRes] = await Promise.all([
        fetch(`/api/v1/wssi?${params.toString()}`),
        fetch(`/api/v1/wssi/summary?year=${yearFilter}`),
        fetch('/api/v1/seasons'),
        fetch('/api/v1/brands'),
        fetch('/api/v1/divisions'),
        fetch('/api/v1/wssi/alerts?acknowledged=false&limit=100'),
      ]);

      const recordsData = await recordsRes.json();
      const summaryData = await summaryRes.json();
      const seasonsData = await seasonsRes.json();
      const brandsData = await brandsRes.json();
      const divisionsData = await divisionsRes.json();
      const alertsData = await alertsRes.json();

      if (recordsData.success !== false) setRecords(recordsData.data || []);
      if (summaryData.success !== false) setSummary(summaryData);
      if (seasonsData.success) setSeasons(seasonsData.data);
      if (brandsData.success) setBrands(brandsData.data);
      if (divisionsData.success) setDivisions(divisionsData.data);
      if (alertsData.success !== false) setAlertCount(alertsData.meta?.total || 0);
    } catch (error) {
      console.error('Failed to fetch WSSI data:', error);
      toast.error('Failed to load WSSI data');
    } finally {
      setIsLoading(false);
    }
  }, [yearFilter, seasonFilter, brandFilter, divisionFilter, weekStart, weekEnd]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const getVarianceBadge = (variance: number) => {
    if (variance >= 10) {
      return (
        <Badge className="bg-green-100 text-green-800">
          <TrendingUp className="mr-1 h-3 w-3" />
          +{variance.toFixed(1)}%
        </Badge>
      );
    } else if (variance <= -10) {
      return (
        <Badge className="bg-red-100 text-red-800">
          <TrendingDown className="mr-1 h-3 w-3" />
          {variance.toFixed(1)}%
        </Badge>
      );
    }
    return (
      <Badge variant="secondary">
        {variance > 0 ? '+' : ''}{variance.toFixed(1)}%
      </Badge>
    );
  };

  const getWoCBadge = (woc: number) => {
    if (woc < 3) {
      return <Badge className="bg-red-100 text-red-800">{woc.toFixed(1)} wks</Badge>;
    } else if (woc > 8) {
      return <Badge className="bg-yellow-100 text-yellow-800">{woc.toFixed(1)} wks</Badge>;
    }
    return <Badge className="bg-green-100 text-green-800">{woc.toFixed(1)} wks</Badge>;
  };

  const getForecastTypeBadge = (type: string) => {
    const colors: Record<string, string> = {
      PLAN: 'bg-blue-100 text-blue-800',
      REFORECAST: 'bg-purple-100 text-purple-800',
      ACTUAL: 'bg-green-100 text-green-800',
    };
    return <Badge className={colors[type]}>{type}</Badge>;
  };

  const columns: ColumnDef<WSSIRecord>[] = [
    {
      accessorKey: 'weekNumber',
      header: 'Week',
      cell: ({ row }) => (
        <div>
          <p className="font-medium">W{row.original.weekNumber}</p>
          <p className="text-xs text-muted-foreground">{row.original.year}</p>
        </div>
      ),
    },
    {
      id: 'brand',
      accessorFn: (row) => row.brand?.name || '',
      header: 'Brand',
      cell: ({ row }) => (
        <div>
          <p className="font-medium">{row.original.brand?.name}</p>
          <p className="text-xs text-muted-foreground">
            {row.original.category?.name || 'All Categories'}
          </p>
        </div>
      ),
      filterFn: 'includesString',
    },
    {
      accessorKey: 'salesActualValue',
      header: 'Sales Actual',
      cell: ({ row }) => (
        <div className="text-right">
          <p className="font-medium">${Number(row.original.salesActualValue).toLocaleString()}</p>
          <p className="text-xs text-muted-foreground">
            Plan: ${Number(row.original.salesPlanValue).toLocaleString()}
          </p>
        </div>
      ),
    },
    {
      accessorKey: 'salesVariancePct',
      header: 'Sales Var %',
      cell: ({ row }) => getVarianceBadge(Number(row.original.salesVariancePct)),
    },
    {
      accessorKey: 'closingStockValue',
      header: 'Closing Stock',
      cell: ({ row }) => (
        <span className="font-medium">
          ${Number(row.original.closingStockValue).toLocaleString()}
        </span>
      ),
    },
    {
      accessorKey: 'weeksOfCover',
      header: 'WoC',
      cell: ({ row }) => getWoCBadge(Number(row.original.weeksOfCover)),
    },
    {
      accessorKey: 'sellThroughPct',
      header: 'Sell-Through',
      cell: ({ row }) => `${Number(row.original.sellThroughPct).toFixed(1)}%`,
    },
    {
      accessorKey: 'forecastType',
      header: 'Type',
      cell: ({ row }) => getForecastTypeBadge(row.original.forecastType),
    },
    {
      accessorKey: 'alerts',
      header: 'Alerts',
      cell: ({ row }) => {
        const activeAlerts = row.original.alerts?.filter(a => !a.isAcknowledged) || [];
        if (activeAlerts.length === 0) return null;
        return (
          <Badge variant="destructive" className="gap-1">
            <AlertTriangle className="h-3 w-3" />
            {activeAlerts.length}
          </Badge>
        );
      },
    },
    {
      id: 'actions',
      cell: ({ row }) => {
        const record = row.original;
        return (
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="icon">
                <MoreHorizontal className="h-4 w-4" />
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
              <DropdownMenuItem onClick={() => router.push(`/wssi/${record.id}`)}>
                <Eye className="mr-2 h-4 w-4" />
                View Details
              </DropdownMenuItem>
              <DropdownMenuItem onClick={() => router.push(`/wssi/${record.id}?reforecast=true`)}>
                <RefreshCw className="mr-2 h-4 w-4" />
                Reforecast
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        );
      },
    },
  ];

  return (
    <div className="space-y-6">
      <PageHeader
        title="WSSI Dashboard"
        description="Weekly Sales Stock Intake - Monitor in-season performance and stock health"
      >
        <Button variant="outline" onClick={() => router.push('/wssi/alerts')}>
          <Bell className="mr-2 h-4 w-4" />
          Alerts
          {alertCount > 0 && (
            <Badge variant="destructive" className="ml-2">
              {alertCount}
            </Badge>
          )}
        </Button>
      </PageHeader>

      {/* Summary Cards */}
      <div className="grid gap-4 md:grid-cols-4">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Sales vs Plan</CardTitle>
            <BarChart3 className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {summary?.totals.averageSalesVariance
                ? `${summary.totals.averageSalesVariance > 0 ? '+' : ''}${summary.totals.averageSalesVariance.toFixed(1)}%`
                : '0%'}
            </div>
            <p className="text-xs text-muted-foreground">
              Actual: ${(summary?.totals.totalSalesActual || 0).toLocaleString()}
            </p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Avg Weeks of Cover</CardTitle>
            <Package className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {summary?.totals.averageWoC?.toFixed(1) || '0'} wks
            </div>
            <p className="text-xs text-muted-foreground">
              Target: 4-6 weeks
            </p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Sell-Through Rate</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {summary?.totals.averageSellThrough?.toFixed(1) || '0'}%
            </div>
            <p className="text-xs text-muted-foreground">
              {summary?.recordCount || 0} weeks analyzed
            </p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between pb-2">
            <CardTitle className="text-sm font-medium">Active Alerts</CardTitle>
            <AlertTriangle className="h-4 w-4 text-orange-500" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-orange-600">{alertCount}</div>
            <p className="text-xs text-muted-foreground">
              Requires attention
            </p>
          </CardContent>
        </Card>
      </div>

      {/* Filters */}
      <div className="flex flex-wrap gap-4">
        <Select value={yearFilter.toString()} onValueChange={(v) => setYearFilter(parseInt(v))}>
          <SelectTrigger className="w-[120px]">
            <SelectValue placeholder="Year" />
          </SelectTrigger>
          <SelectContent>
            {[currentYear - 1, currentYear, currentYear + 1].map((year) => (
              <SelectItem key={year} value={year.toString()}>
                {year}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Select value={divisionFilter} onValueChange={setDivisionFilter}>
          <SelectTrigger className="w-[180px]">
            <SelectValue placeholder="Division" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Divisions</SelectItem>
            {divisions.map((division) => (
              <SelectItem key={division.id} value={division.id}>
                {division.name}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Select value={brandFilter} onValueChange={setBrandFilter}>
          <SelectTrigger className="w-[180px]">
            <SelectValue placeholder="Brand" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Brands</SelectItem>
            {brands.map((brand) => (
              <SelectItem key={brand.id} value={brand.id}>
                {brand.name}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Select value={seasonFilter} onValueChange={setSeasonFilter}>
          <SelectTrigger className="w-[180px]">
            <SelectValue placeholder="Season" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="all">All Seasons</SelectItem>
            {seasons.map((season) => (
              <SelectItem key={season.id} value={season.id}>
                {season.code}
              </SelectItem>
            ))}
          </SelectContent>
        </Select>

        <Button variant="outline" onClick={fetchData}>
          <Filter className="mr-2 h-4 w-4" />
          Apply
        </Button>
      </div>

      {/* Data Table */}
      <DataTable
        columns={columns}
        data={records}
        searchKey="brand"
        searchPlaceholder="Search by brand..."
        isLoading={isLoading}
      />
    </div>
  );
}
