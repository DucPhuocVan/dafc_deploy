'use client';

import * as React from 'react';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';
import {
  AlertTriangle,
  XCircle,
  Info,
  CheckCircle,
  X,
  type LucideIcon,
} from 'lucide-react';

// ═══════════════════════════════════════════════════════════════════════════════
// VARIANTS
// ═══════════════════════════════════════════════════════════════════════════════

const alertVariants = cva(
  'relative flex gap-3 p-4 rounded-lg border',
  {
    variants: {
      variant: {
        critical: 'bg-status-critical-muted border-status-critical/30 text-status-critical-text',
        warning: 'bg-status-warning-muted border-status-warning/30 text-status-warning-text',
        success: 'bg-status-success-muted border-status-success/30 text-status-success-text',
        info: 'bg-status-info-muted border-status-info/30 text-status-info-text',
        default: 'bg-surface border-border text-content',
      },
    },
    defaultVariants: {
      variant: 'default',
    },
  }
);

// ═══════════════════════════════════════════════════════════════════════════════
// TYPES
// ═══════════════════════════════════════════════════════════════════════════════

interface AlertCardProps extends VariantProps<typeof alertVariants> {
  title?: string;
  description: string;
  icon?: LucideIcon;
  action?: React.ReactNode;
  dismissible?: boolean;
  onDismiss?: () => void;
  className?: string;
}

// ═══════════════════════════════════════════════════════════════════════════════
// ALERT CONFIG
// ═══════════════════════════════════════════════════════════════════════════════

const ALERT_ICONS: Record<string, LucideIcon> = {
  critical: XCircle,
  warning: AlertTriangle,
  success: CheckCircle,
  info: Info,
  default: Info,
};

// ═══════════════════════════════════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════════════════════════════════

export function AlertCard({
  title,
  description,
  variant = 'default',
  icon,
  action,
  dismissible = false,
  onDismiss,
  className,
}: AlertCardProps) {
  const Icon = icon || ALERT_ICONS[variant || 'default'];

  return (
    <div className={cn(alertVariants({ variant }), className)}>
      {/* Icon */}
      <Icon className="w-5 h-5 flex-shrink-0 mt-0.5" />

      {/* Content */}
      <div className="flex-1 min-w-0">
        {title && (
          <h5 className="font-semibold text-sm mb-1">{title}</h5>
        )}
        <p className="text-sm opacity-90">{description}</p>
        {action && (
          <div className="mt-3">{action}</div>
        )}
      </div>

      {/* Dismiss button */}
      {dismissible && (
        <button
          onClick={onDismiss}
          className="flex-shrink-0 p-1 rounded hover:bg-black/10 dark:hover:bg-white/10 transition-colors"
        >
          <X className="w-4 h-4" />
        </button>
      )}
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// ALERT LIST
// ═══════════════════════════════════════════════════════════════════════════════

interface AlertListProps {
  alerts: Array<{
    id: string;
    variant?: 'critical' | 'warning' | 'success' | 'info' | 'default';
    title?: string;
    description: string;
  }>;
  onDismiss?: (id: string) => void;
  className?: string;
}

export function AlertList({ alerts, onDismiss, className }: AlertListProps) {
  if (alerts.length === 0) return null;

  return (
    <div className={cn('space-y-2', className)}>
      {alerts.map((alert) => (
        <AlertCard
          key={alert.id}
          variant={alert.variant}
          title={alert.title}
          description={alert.description}
          dismissible={!!onDismiss}
          onDismiss={() => onDismiss?.(alert.id)}
        />
      ))}
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// ALERT BANNER (Full-width for page-level alerts)
// ═══════════════════════════════════════════════════════════════════════════════

interface AlertBannerProps extends AlertCardProps {
  fullWidth?: boolean;
}

export function AlertBanner({
  fullWidth = true,
  className,
  ...props
}: AlertBannerProps) {
  return (
    <AlertCard
      {...props}
      className={cn(
        fullWidth && 'rounded-none border-x-0',
        className
      )}
    />
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// INLINE ALERT (Compact, for use within forms)
// ═══════════════════════════════════════════════════════════════════════════════

interface InlineAlertProps {
  variant?: 'critical' | 'warning' | 'success' | 'info';
  message: string;
  className?: string;
}

export function InlineAlert({ variant = 'info', message, className }: InlineAlertProps) {
  const Icon = ALERT_ICONS[variant];

  const colorClasses = {
    critical: 'text-status-critical-text',
    warning: 'text-status-warning-text',
    success: 'text-status-success-text',
    info: 'text-status-info-text',
  }[variant];

  return (
    <div className={cn('flex items-center gap-2 text-xs', colorClasses, className)}>
      <Icon className="w-3.5 h-3.5" />
      <span>{message}</span>
    </div>
  );
}

// ═══════════════════════════════════════════════════════════════════════════════
// EXPORTS
// ═══════════════════════════════════════════════════════════════════════════════

export type { AlertCardProps, AlertListProps, AlertBannerProps, InlineAlertProps };
