'use client';

import * as React from 'react';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';
import {
  TrendingUp,
  TrendingDown,
  Minus,
  type LucideIcon
} from 'lucide-react';

// ═══════════════════════════════════════════════════════════════════════════════
// KPI CARD VARIANTS
// ═══════════════════════════════════════════════════════════════════════════════

const kpiCardVariants = cva(
  'bg-card border border-border rounded-lg relative overflow-hidden transition-all duration-200',
  {
    variants: {
      status: {
        default: '',
        critical: 'border-t-2 border-t-status-critical',
        warning: 'border-t-2 border-t-status-warning',
        success: 'border-t-2 border-t-status-success',
        info: 'border-t-2 border-t-status-info',
        // DAFC Brand Variants
        gold: 'border-t-3 border-t-dafc-gold',
        green: 'border-t-3 border-t-dafc-green',
      },
      size: {
        sm: 'p-3',
        md: 'p-4',
        lg: 'p-5',
      },
    },
    defaultVariants: {
      status: 'default',
      size: 'md',
    },
  }
);

// ═══════════════════════════════════════════════════════════════════════════════
// TYPES
// ═══════════════════════════════════════════════════════════════════════════════

interface TrendData {
  value: number;
  direction: 'up' | 'down' | 'neutral';
  label?: string;
}

interface KPICardProps extends VariantProps<typeof kpiCardVariants> {
  label: string;
  value: string | number | React.ReactNode;
  trend?: TrendData;
  icon?: LucideIcon | React.ReactNode;
  subtitle?: string;
  className?: string;
  loading?: boolean;
  onClick?: () => void;
}

// ═══════════════════════════════════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════════════════════════════════

export function KPICard({
  label,
  value,
  trend,
  status,
  size,
  icon,
  subtitle,
  className,
  loading = false,
  onClick,
}: KPICardProps) {
  // Trend icon and color
  const getTrendIcon = () => {
    if (!trend) return null;

    switch (trend.direction) {
      case 'up':
        return <TrendingUp className="w-3.5 h-3.5" />;
      case 'down':
        return <TrendingDown className="w-3.5 h-3.5" />;
      default:
        return <Minus className="w-3.5 h-3.5" />;
    }
  };

  const getTrendColor = () => {
    if (!trend) return '';

    switch (trend.direction) {
      case 'up':
        return 'text-data-positive';
      case 'down':
        return 'text-data-negative';
      default:
        return 'text-data-neutral';
    }
  };

  const formatTrendValue = (val: number) => {
    const sign = val >= 0 ? '+' : '';
    return `${sign}${val.toFixed(1)}%`;
  };

  // Loading skeleton
  if (loading) {
    return (
      <div className={cn(kpiCardVariants({ status, size }), className)}>
        <div className="space-y-3">
          <div className="skeleton h-3 w-20" />
          <div className="skeleton h-8 w-24" />
          <div className="skeleton h-3 w-16" />
        </div>
      </div>
    );
  }

  // Render icon
  const renderIcon = () => {
    if (!icon) return null;

    // Check if icon is a LucideIcon component
    if (typeof icon === 'function') {
      const IconComponent = icon as LucideIcon;
      return <IconComponent className="w-4 h-4 text-content-muted" />;
    }

    // Otherwise it's a ReactNode
    return <span className="text-content-secondary">{icon}</span>;
  };

  return (
    <div
      className={cn(
        kpiCardVariants({ status, size }),
        onClick && 'cursor-pointer hover:border-accent/50 transition-colors',
        className
      )}
      onClick={onClick}
    >
      {/* Header: Label + Icon */}
      <div className="flex items-center justify-between mb-2">
        <span className="text-xs font-medium uppercase tracking-wider text-content-secondary">
          {label}
        </span>
        {renderIcon()}
      </div>

      {/* Value */}
      <div className="mb-1">
        {typeof value === 'string' || typeof value === 'number' ? (
          <span className="font-data text-2xl font-semibold tabular-nums text-content">
            {value}
          </span>
        ) : (
          value
        )}
      </div>

      {/* Trend & Subtitle */}
      <div className="flex items-center gap-2">
        {trend && (
          <div className={cn('flex items-center gap-1 text-xs font-medium font-data', getTrendColor())}>
            {getTrendIcon()}
            <span className="tabular-nums">{formatTrendValue(trend.value)}</span>
            {trend.label && (
              <span className="text-content-muted ml-1">{trend.label}</span>
            )}
          </div>
        )}
        {subtitle && !trend && (
          <span className="text-xs text-content-secondary">{subtitle}</span>
        )}
      </div>
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// KPI CARD GRID
// ═══════════════════════════════════════════════════════════════════════════════

interface KPICardGridProps {
  children: React.ReactNode;
  columns?: 2 | 3 | 4 | 5 | 6;
  className?: string;
}

export function KPICardGrid({
  children,
  columns = 4,
  className
}: KPICardGridProps) {
  const gridCols = {
    2: 'grid-cols-1 sm:grid-cols-2',
    3: 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-3',
    4: 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-4',
    5: 'grid-cols-2 sm:grid-cols-3 lg:grid-cols-5',
    6: 'grid-cols-2 sm:grid-cols-3 lg:grid-cols-6',
  };

  return (
    <div className={cn('grid gap-4', gridCols[columns], className)}>
      {children}
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// EXPORTS
// ═══════════════════════════════════════════════════════════════════════════════

export type { KPICardProps, TrendData, KPICardGridProps };
