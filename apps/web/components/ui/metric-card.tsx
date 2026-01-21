'use client';

import * as React from 'react';
import { cn } from '@/lib/utils';
import { TrendValue, type TrendDirection } from './trend-value';
import { StatusBadge, type StatusType } from './status-badge';
import { ProgressBar } from './inline-progress';
import type { LucideIcon } from 'lucide-react';

// ═══════════════════════════════════════════════════════════════════════════════
// TYPES
// ═══════════════════════════════════════════════════════════════════════════════

interface MetricCardProps {
  title: string;
  value: string | number;

  // Optional elements
  subtitle?: string;
  trend?: {
    value: number;
    direction?: TrendDirection;
    label?: string;
  };
  status?: StatusType;
  progress?: {
    value: number;
    max?: number;
    label?: string;
  };
  icon?: LucideIcon;

  // Styling
  className?: string;
  valueClassName?: string;

  // Interaction
  onClick?: () => void;
  loading?: boolean;
}

// ═══════════════════════════════════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════════════════════════════════

export function MetricCard({
  title,
  value,
  subtitle,
  trend,
  status,
  progress,
  icon: Icon,
  className,
  valueClassName,
  onClick,
  loading = false,
}: MetricCardProps) {
  if (loading) {
    return (
      <div className={cn('bg-surface border border-border rounded-lg p-4', className)}>
        <div className="space-y-3">
          <div className="flex justify-between">
            <div className="skeleton h-3 w-24" />
            <div className="skeleton h-5 w-5 rounded" />
          </div>
          <div className="skeleton h-8 w-32" />
          <div className="skeleton h-3 w-20" />
        </div>
      </div>
    );
  }

  return (
    <div
      className={cn(
        'bg-surface border border-border rounded-lg p-4',
        status && `border-t-2 border-t-status-${status}`,
        onClick && 'cursor-pointer hover:border-accent/50 transition-colors',
        className
      )}
      onClick={onClick}
    >
      {/* Header */}
      <div className="flex items-center justify-between mb-3">
        <div className="flex items-center gap-2">
          <span className="text-xs font-medium uppercase tracking-wider text-content-secondary">
            {title}
          </span>
          {status && <StatusBadge status={status} size="sm" showIcon={false} />}
        </div>
        {Icon && <Icon className="w-4 h-4 text-content-muted" />}
      </div>

      {/* Value */}
      <div className={cn('font-data text-2xl font-semibold tabular-nums text-content mb-2', valueClassName)}>
        {value}
      </div>

      {/* Progress (if provided) */}
      {progress && (
        <div className="mb-2">
          <ProgressBar
            value={progress.value}
            max={progress.max}
            showLabel
            label={progress.label}
            size="sm"
          />
        </div>
      )}

      {/* Footer: Trend or Subtitle */}
      {(trend || subtitle) && (
        <div className="flex items-center gap-2">
          {trend && (
            <>
              <TrendValue
                value={trend.value}
                direction={trend.direction}
                size="sm"
              />
              {trend.label && (
                <span className="text-xs text-content-muted">{trend.label}</span>
              )}
            </>
          )}
          {!trend && subtitle && (
            <span className="text-xs text-content-secondary">{subtitle}</span>
          )}
        </div>
      )}
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// METRIC CARD GRID
// ═══════════════════════════════════════════════════════════════════════════════

interface MetricCardGridProps {
  children: React.ReactNode;
  columns?: 2 | 3 | 4 | 5 | 6;
  className?: string;
}

export function MetricCardGrid({
  children,
  columns = 4,
  className,
}: MetricCardGridProps) {
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
// COMPACT METRIC (For use in tables or dense layouts)
// ═══════════════════════════════════════════════════════════════════════════════

interface CompactMetricProps {
  label: string;
  value: string | number;
  trend?: number;
  className?: string;
}

export function CompactMetric({ label, value, trend, className }: CompactMetricProps) {
  return (
    <div className={cn('flex flex-col', className)}>
      <span className="text-[10px] text-content-muted uppercase tracking-wider">{label}</span>
      <div className="flex items-center gap-2">
        <span className="font-data text-sm font-semibold tabular-nums">{value}</span>
        {trend !== undefined && (
          <TrendValue value={trend} size="sm" showIcon={false} />
        )}
      </div>
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// EXPORTS
// ═══════════════════════════════════════════════════════════════════════════════

export type { MetricCardProps, MetricCardGridProps, CompactMetricProps };
