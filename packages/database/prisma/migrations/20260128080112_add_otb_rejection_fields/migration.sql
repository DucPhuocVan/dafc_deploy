-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ADMIN', 'FINANCE_HEAD', 'FINANCE_USER', 'BRAND_MANAGER', 'BRAND_PLANNER', 'MERCHANDISE_LEAD', 'BOD_MEMBER');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'PENDING');

-- CreateEnum
CREATE TYPE "BudgetStatus" AS ENUM ('DRAFT', 'SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REVISED', 'REJECTED');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MEN', 'WOMEN', 'UNISEX', 'KIDS');

-- CreateEnum
CREATE TYPE "OTBPlanStatus" AS ENUM ('DRAFT', 'SYSTEM_PROPOSED', 'USER_PROPOSED', 'SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED', 'REVISED', 'FINAL');

-- CreateEnum
CREATE TYPE "OTBVersionType" AS ENUM ('V0_SYSTEM', 'V1_USER', 'V2_ADJUSTED', 'V3_REVIEWED', 'VA_APPROVED', 'VF_FINAL', 'REVISED');

-- CreateEnum
CREATE TYPE "SKUProposalStatus" AS ENUM ('DRAFT', 'VALIDATING', 'VALIDATED', 'ENRICHING', 'ENRICHED', 'SUBMITTED', 'APPROVED', 'REJECTED', 'REVISED');

-- CreateEnum
CREATE TYPE "SKUValidationStatus" AS ENUM ('PENDING', 'VALID', 'WARNING', 'ERROR');

-- CreateEnum
CREATE TYPE "WorkflowType" AS ENUM ('BUDGET_APPROVAL', 'OTB_APPROVAL', 'SKU_APPROVAL');

-- CreateEnum
CREATE TYPE "WorkflowStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'APPROVED', 'REJECTED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "WorkflowStepStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'APPROVED', 'REJECTED', 'SKIPPED');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('BUDGET_SUBMITTED', 'BUDGET_APPROVED', 'BUDGET_REJECTED', 'OTB_SUBMITTED', 'OTB_APPROVED', 'OTB_REJECTED', 'OTB_COMMENT', 'SKU_UPLOADED', 'SKU_VALIDATED', 'SKU_APPROVED', 'WORKFLOW_ASSIGNED', 'WORKFLOW_REMINDER', 'SLA_WARNING', 'SLA_BREACHED', 'SYSTEM_ALERT');

-- CreateEnum
CREATE TYPE "NotificationPriority" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "ReportType" AS ENUM ('BUDGET_SUMMARY', 'OTB_ANALYSIS', 'SKU_PERFORMANCE', 'APPROVAL_STATUS', 'USER_ACTIVITY', 'CUSTOM');

-- CreateEnum
CREATE TYPE "KPICategory" AS ENUM ('SALES', 'INVENTORY', 'MARGIN', 'OPERATIONS', 'CUSTOMER', 'FINANCIAL');

-- CreateEnum
CREATE TYPE "AggregationType" AS ENUM ('SUM', 'AVERAGE', 'COUNT', 'MIN', 'MAX', 'WEIGHTED_AVG', 'CUSTOM');

-- CreateEnum
CREATE TYPE "TargetType" AS ENUM ('HIGHER_IS_BETTER', 'LOWER_IS_BETTER', 'TARGET_VALUE', 'RANGE');

-- CreateEnum
CREATE TYPE "PeriodType" AS ENUM ('DAILY', 'WEEKLY', 'MONTHLY', 'QUARTERLY', 'SEASON', 'YEARLY');

-- CreateEnum
CREATE TYPE "AlertType" AS ENUM ('THRESHOLD_BREACH', 'TREND_CHANGE', 'ANOMALY_DETECTED', 'TARGET_AT_RISK', 'FORECAST_DEVIATION');

-- CreateEnum
CREATE TYPE "AlertSeverity" AS ENUM ('INFO', 'WARNING', 'CRITICAL');

-- CreateEnum
CREATE TYPE "ForecastType" AS ENUM ('DEMAND', 'SALES', 'INVENTORY', 'MARGIN');

-- CreateEnum
CREATE TYPE "ScenarioStatus" AS ENUM ('DRAFT', 'ANALYZING', 'COMPLETED', 'APPLIED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "InsightType" AS ENUM ('OPPORTUNITY', 'RISK', 'ANOMALY', 'TREND', 'RECOMMENDATION', 'ALERT');

-- CreateEnum
CREATE TYPE "ImpactLevel" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "InsightStatus" AS ENUM ('NEW', 'VIEWED', 'ACTION_TAKEN', 'DISMISSED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "WidgetType" AS ENUM ('METRIC_CARD', 'LINE_CHART', 'BAR_CHART', 'PIE_CHART', 'TABLE', 'HEATMAP', 'GAUGE', 'TREND', 'COMPARISON', 'AI_INSIGHT');

-- CreateEnum
CREATE TYPE "AIMessageRole" AS ENUM ('USER', 'ASSISTANT', 'SYSTEM', 'TOOL');

-- CreateEnum
CREATE TYPE "AISuggestionType" AS ENUM ('BUY_RECOMMENDATION', 'MARKDOWN_RECOMMENDATION', 'TRANSFER_RECOMMENDATION', 'REORDER_RECOMMENDATION', 'CANCEL_RECOMMENDATION', 'PRICING_RECOMMENDATION');

-- CreateEnum
CREATE TYPE "SuggestionPriority" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'URGENT');

-- CreateEnum
CREATE TYPE "SuggestionStatus" AS ENUM ('PENDING', 'ACCEPTED', 'REJECTED', 'EXPIRED', 'PARTIALLY_ACCEPTED');

-- CreateEnum
CREATE TYPE "GeneratedPlanType" AS ENUM ('OTB_PLAN', 'BUDGET_PLAN', 'MARKDOWN_PLAN', 'RECEIPT_PLAN');

-- CreateEnum
CREATE TYPE "GeneratedPlanStatus" AS ENUM ('DRAFT', 'REVIEWING', 'APPROVED', 'APPLIED', 'REJECTED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "PredictiveAlertType" AS ENUM ('STOCKOUT_RISK', 'OVERSTOCK_RISK', 'MARGIN_DECLINE', 'TREND_REVERSAL', 'DEMAND_SPIKE', 'SLOW_MOVING', 'SEASON_END_RISK', 'BUDGET_OVERRUN');

-- CreateEnum
CREATE TYPE "PredictiveAlertStatus" AS ENUM ('ACTIVE', 'ACKNOWLEDGED', 'RESOLVED', 'EXPIRED', 'FALSE_POSITIVE');

-- CreateEnum
CREATE TYPE "SSOProvider" AS ENUM ('GOOGLE', 'MICROSOFT', 'OKTA', 'AUTH0', 'SAML_CUSTOM');

-- CreateEnum
CREATE TYPE "FileCategory" AS ENUM ('IMPORT', 'EXPORT', 'DOCUMENT', 'IMAGE', 'BACKUP', 'TEMP');

-- CreateEnum
CREATE TYPE "ERPType" AS ENUM ('SAP_B1', 'SAP_HANA', 'ORACLE_NETSUITE', 'MICROSOFT_DYNAMICS', 'CSV_IMPORT', 'API_CUSTOM');

-- CreateEnum
CREATE TYPE "SyncDirection" AS ENUM ('INBOUND', 'OUTBOUND', 'BIDIRECTIONAL');

-- CreateEnum
CREATE TYPE "SyncStatus" AS ENUM ('SUCCESS', 'PARTIAL', 'FAILED', 'IN_PROGRESS');

-- CreateEnum
CREATE TYPE "DeliveryStatus" AS ENUM ('PENDING', 'SUCCESS', 'FAILED', 'RETRYING');

-- CreateEnum
CREATE TYPE "RealtimeNotificationType" AS ENUM ('INFO', 'SUCCESS', 'WARNING', 'ERROR', 'APPROVAL_REQUEST', 'APPROVAL_COMPLETED', 'SYNC_COMPLETED', 'EXPORT_READY', 'AI_SUGGESTION');

-- CreateEnum
CREATE TYPE "WSSIForecastType" AS ENUM ('PLAN', 'REFORECAST', 'ACTUAL');

-- CreateEnum
CREATE TYPE "WSSIAlertType" AS ENUM ('LOW_STOCK', 'HIGH_STOCK', 'SALES_BELOW_PLAN', 'SALES_ABOVE_PLAN', 'INTAKE_DELAYED', 'STOCKOUT_RISK', 'MARKDOWN_NEEDED');

-- CreateEnum
CREATE TYPE "OTBPlanVersionType" AS ENUM ('SYSTEM_PROPOSED', 'USER_ADJUSTED', 'FINANCE_REVIEWED', 'BOD_APPROVED', 'BRAND_CONSENSUS');

-- CreateEnum
CREATE TYPE "OTBPlanVersionStatus" AS ENUM ('DRAFT', 'SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED', 'SUPERSEDED');

-- CreateEnum
CREATE TYPE "SizeType" AS ENUM ('ALPHA', 'NUMERIC', 'WAIST', 'SHOE', 'ONE_SIZE');

-- CreateEnum
CREATE TYPE "SizeProfileType" AS ENUM ('HISTORICAL', 'CURRENT_TREND', 'SYSTEM_OPTIMAL', 'USER_ADJUSTED', 'FINAL');

-- CreateEnum
CREATE TYPE "MarkdownPlanStatus" AS ENUM ('DRAFT', 'ANALYZING', 'OPTIMIZED', 'APPROVED', 'ACTIVE', 'COMPLETED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "MarkdownPhaseStatus" AS ENUM ('PENDING', 'ACTIVE', 'COMPLETED');

-- CreateEnum
CREATE TYPE "MarkdownAction" AS ENUM ('MARKDOWN', 'TRANSFER', 'BUNDLE', 'PROMOTE', 'DISCONTINUE', 'HOLD');

-- CreateEnum
CREATE TYPE "MarkdownUrgency" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "ReplenishmentAlertStatus" AS ENUM ('OPEN', 'ACKNOWLEDGED', 'ORDERED', 'RESOLVED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "ReplenishmentOrderStatus" AS ENUM ('DRAFT', 'SUBMITTED', 'CONFIRMED', 'PARTIALLY_RECEIVED', 'RECEIVED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "ForecastMethod" AS ENUM ('MOVING_AVERAGE', 'EXPONENTIAL_SMOOTHING', 'TREND_ADJUSTED', 'SEASONAL_DECOMPOSITION', 'ENSEMBLE', 'AI_ML');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "UserRole" NOT NULL DEFAULT 'BRAND_PLANNER',
    "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE',
    "avatar" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "lastLoginAt" TIMESTAMP(3),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "divisions" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "divisions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "brands" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "logoUrl" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "divisionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "brands_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "collections" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "brandId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "collections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subcategories" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "categoryId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "subcategories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales_locations" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "type" TEXT NOT NULL DEFAULT 'STORE',
    "address" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sales_locations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seasons" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "seasonGroup" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "isCurrent" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "seasons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget_allocations" (
    "id" TEXT NOT NULL,
    "seasonId" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,
    "totalBudget" DECIMAL(15,2) NOT NULL,
    "seasonalBudget" DECIMAL(15,2),
    "replenishmentBudget" DECIMAL(15,2),
    "currency" TEXT NOT NULL DEFAULT 'USD',
    "status" "BudgetStatus" NOT NULL DEFAULT 'DRAFT',
    "version" INTEGER NOT NULL DEFAULT 1,
    "parentVersionId" TEXT,
    "comments" TEXT,
    "assumptions" JSONB,
    "workflowId" TEXT,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "submittedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "rejectedById" TEXT,
    "rejectedAt" TIMESTAMP(3),
    "rejectionReason" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "budget_allocations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otb_plans" (
    "id" TEXT NOT NULL,
    "budgetId" TEXT NOT NULL,
    "seasonId" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "version" INTEGER NOT NULL DEFAULT 1,
    "versionType" "OTBVersionType" NOT NULL DEFAULT 'V0_SYSTEM',
    "versionName" TEXT,
    "parentVersionId" TEXT,
    "status" "OTBPlanStatus" NOT NULL DEFAULT 'DRAFT',
    "totalOTBValue" DECIMAL(15,2) NOT NULL,
    "totalSKUCount" INTEGER NOT NULL DEFAULT 0,
    "aiConfidenceScore" DOUBLE PRECISION,
    "aiGeneratedAt" TIMESTAMP(3),
    "aiModelUsed" TEXT,
    "comments" TEXT,
    "executiveSummary" TEXT,
    "workflowId" TEXT,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "submittedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "rejectedById" TEXT,
    "rejectedAt" TIMESTAMP(3),
    "rejectionReason" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "otb_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otb_line_items" (
    "id" TEXT NOT NULL,
    "otbPlanId" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "collectionId" TEXT,
    "gender" "Gender",
    "categoryId" TEXT,
    "subcategoryId" TEXT,
    "sizeGroup" TEXT,
    "historicalSalesPct" DECIMAL(5,2),
    "historicalSalesValue" DECIMAL(15,2),
    "historicalUnits" INTEGER,
    "systemProposedPct" DECIMAL(5,2),
    "systemProposedValue" DECIMAL(15,2),
    "systemConfidence" DOUBLE PRECISION,
    "userBuyPct" DECIMAL(5,2) NOT NULL,
    "userBuyValue" DECIMAL(15,2) NOT NULL,
    "userUnits" INTEGER,
    "varianceFromSystem" DECIMAL(5,2),
    "varianceFromHist" DECIMAL(5,2),
    "comment" TEXT,
    "aiGeneratedComment" TEXT,
    "hasAnomaly" BOOLEAN NOT NULL DEFAULT false,
    "anomalyType" TEXT,
    "isLocked" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "otb_line_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sizing_analyses" (
    "id" TEXT NOT NULL,
    "otbPlanId" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "subcategoryId" TEXT,
    "gender" "Gender" NOT NULL,
    "locationId" TEXT,
    "sizeData" JSONB NOT NULL,
    "aiInsight" TEXT,
    "aiRecommendation" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sizing_analyses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sku_proposals" (
    "id" TEXT NOT NULL,
    "otbPlanId" TEXT NOT NULL,
    "seasonId" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "uploadedFileName" TEXT,
    "uploadedFileUrl" TEXT,
    "uploadedAt" TIMESTAMP(3),
    "status" "SKUProposalStatus" NOT NULL DEFAULT 'DRAFT',
    "totalSKUs" INTEGER NOT NULL DEFAULT 0,
    "validSKUs" INTEGER NOT NULL DEFAULT 0,
    "errorSKUs" INTEGER NOT NULL DEFAULT 0,
    "warningSKUs" INTEGER NOT NULL DEFAULT 0,
    "totalValue" DECIMAL(15,2),
    "totalUnits" INTEGER,
    "workflowId" TEXT,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "submittedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sku_proposals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sku_items" (
    "id" TEXT NOT NULL,
    "proposalId" TEXT NOT NULL,
    "skuCode" TEXT NOT NULL,
    "styleName" TEXT NOT NULL,
    "colorCode" TEXT,
    "colorName" TEXT,
    "material" TEXT,
    "collectionId" TEXT,
    "gender" "Gender" NOT NULL,
    "categoryId" TEXT NOT NULL,
    "subcategoryId" TEXT,
    "retailPrice" DECIMAL(15,2) NOT NULL,
    "costPrice" DECIMAL(15,2) NOT NULL,
    "margin" DECIMAL(5,2),
    "orderQuantity" INTEGER NOT NULL,
    "orderValue" DECIMAL(15,2),
    "sizeBreakdown" JSONB,
    "supplierSKU" TEXT,
    "leadTime" INTEGER,
    "moq" INTEGER,
    "countryOfOrigin" TEXT,
    "validationStatus" "SKUValidationStatus" NOT NULL DEFAULT 'PENDING',
    "validationErrors" JSONB,
    "validationWarnings" JSONB,
    "aiDemandScore" DOUBLE PRECISION,
    "aiDemandPrediction" TEXT,
    "aiRecommendedQty" INTEGER,
    "aiSimilarSKUs" JSONB,
    "aiInsights" TEXT,
    "aiEnrichedAt" TIMESTAMP(3),
    "imageUrl" TEXT,
    "imageUploadedAt" TIMESTAMP(3),
    "isNew" BOOLEAN NOT NULL DEFAULT true,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sku_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "workflows" (
    "id" TEXT NOT NULL,
    "type" "WorkflowType" NOT NULL,
    "referenceId" TEXT NOT NULL,
    "referenceType" TEXT NOT NULL,
    "status" "WorkflowStatus" NOT NULL DEFAULT 'PENDING',
    "currentStep" INTEGER NOT NULL DEFAULT 1,
    "totalSteps" INTEGER NOT NULL,
    "initiatedById" TEXT NOT NULL,
    "initiatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "slaDeadline" TIMESTAMP(3),
    "slaBreached" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "workflows_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "workflow_steps" (
    "id" TEXT NOT NULL,
    "workflowId" TEXT NOT NULL,
    "stepNumber" INTEGER NOT NULL,
    "stepName" TEXT NOT NULL,
    "description" TEXT,
    "assignedRole" "UserRole",
    "assignedUserId" TEXT,
    "status" "WorkflowStepStatus" NOT NULL DEFAULT 'PENDING',
    "actionById" TEXT,
    "actionAt" TIMESTAMP(3),
    "actionType" TEXT,
    "actionComment" TEXT,
    "slaHours" INTEGER,
    "dueAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "workflow_steps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" "NotificationType" NOT NULL,
    "priority" "NotificationPriority" NOT NULL DEFAULT 'MEDIUM',
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "referenceId" TEXT,
    "referenceType" TEXT,
    "referenceUrl" TEXT,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "readAt" TIMESTAMP(3),
    "emailSent" BOOLEAN NOT NULL DEFAULT false,
    "emailSentAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_interaction_logs" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "contextType" TEXT NOT NULL,
    "contextId" TEXT,
    "prompt" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "tokensUsed" INTEGER,
    "latencyMs" INTEGER,
    "wasAccepted" BOOLEAN,
    "userFeedback" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ai_interaction_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comments" (
    "id" TEXT NOT NULL,
    "referenceId" TEXT NOT NULL,
    "referenceType" TEXT NOT NULL,
    "parentId" TEXT,
    "content" TEXT NOT NULL,
    "isAIGenerated" BOOLEAN NOT NULL DEFAULT false,
    "authorId" TEXT NOT NULL,
    "isResolved" BOOLEAN NOT NULL DEFAULT false,
    "resolvedById" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "audit_logs" (
    "id" TEXT NOT NULL,
    "tableName" TEXT NOT NULL,
    "recordId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "oldValue" JSONB,
    "newValue" JSONB,
    "changedFields" TEXT[],
    "userId" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "audit_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "saved_filters" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "entityType" TEXT NOT NULL,
    "filterConfig" JSONB NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "isShared" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "saved_filters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_preferences" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "theme" TEXT NOT NULL DEFAULT 'system',
    "language" TEXT NOT NULL DEFAULT 'en',
    "timezone" TEXT NOT NULL DEFAULT 'Asia/Ho_Chi_Minh',
    "dateFormat" TEXT NOT NULL DEFAULT 'DD/MM/YYYY',
    "numberFormat" TEXT NOT NULL DEFAULT 'en-US',
    "dashboardLayout" JSONB,
    "defaultFilters" JSONB,
    "emailNotifications" BOOLEAN NOT NULL DEFAULT true,
    "emailDigestFrequency" TEXT NOT NULL DEFAULT 'daily',
    "pushNotifications" BOOLEAN NOT NULL DEFAULT true,
    "tablePageSize" INTEGER NOT NULL DEFAULT 20,
    "tableColumns" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_preferences_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reports" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "type" "ReportType" NOT NULL,
    "config" JSONB NOT NULL,
    "schedule" TEXT,
    "lastRunAt" TIMESTAMP(3),
    "lastRunStatus" TEXT,
    "isTemplate" BOOLEAN NOT NULL DEFAULT false,
    "isShared" BOOLEAN NOT NULL DEFAULT false,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_executions" (
    "id" TEXT NOT NULL,
    "reportId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "format" TEXT NOT NULL,
    "fileUrl" TEXT,
    "fileSize" INTEGER,
    "parameters" JSONB,
    "errorMessage" TEXT,
    "executedById" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),

    CONSTRAINT "report_executions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "search_index" (
    "id" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "metadata" JSONB,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "search_index_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recent_searches" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "query" TEXT NOT NULL,
    "resultCount" INTEGER NOT NULL,
    "clickedResult" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "recent_searches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kpi_definitions" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "category" "KPICategory" NOT NULL,
    "formula" TEXT NOT NULL,
    "dataSource" TEXT NOT NULL,
    "aggregationType" "AggregationType" NOT NULL,
    "unit" TEXT,
    "format" TEXT,
    "decimals" INTEGER NOT NULL DEFAULT 2,
    "targetType" "TargetType" NOT NULL DEFAULT 'HIGHER_IS_BETTER',
    "warningThreshold" DOUBLE PRECISION,
    "criticalThreshold" DOUBLE PRECISION,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "isSystem" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "kpi_definitions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kpi_targets" (
    "id" TEXT NOT NULL,
    "kpiId" TEXT NOT NULL,
    "seasonId" TEXT,
    "brandId" TEXT,
    "locationId" TEXT,
    "targetValue" DOUBLE PRECISION NOT NULL,
    "minValue" DOUBLE PRECISION,
    "maxValue" DOUBLE PRECISION,
    "stretchTarget" DOUBLE PRECISION,
    "periodType" "PeriodType" NOT NULL DEFAULT 'SEASON',
    "periodStart" TIMESTAMP(3),
    "periodEnd" TIMESTAMP(3),
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "kpi_targets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kpi_values" (
    "id" TEXT NOT NULL,
    "kpiId" TEXT NOT NULL,
    "seasonId" TEXT,
    "brandId" TEXT,
    "locationId" TEXT,
    "categoryId" TEXT,
    "value" DOUBLE PRECISION NOT NULL,
    "previousValue" DOUBLE PRECISION,
    "changePercent" DOUBLE PRECISION,
    "periodType" "PeriodType" NOT NULL,
    "periodDate" TIMESTAMP(3) NOT NULL,
    "calculatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dataAsOf" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "kpi_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kpi_alerts" (
    "id" TEXT NOT NULL,
    "kpiId" TEXT NOT NULL,
    "alertType" "AlertType" NOT NULL,
    "severity" "AlertSeverity" NOT NULL,
    "currentValue" DOUBLE PRECISION NOT NULL,
    "thresholdValue" DOUBLE PRECISION NOT NULL,
    "message" TEXT NOT NULL,
    "seasonId" TEXT,
    "brandId" TEXT,
    "locationId" TEXT,
    "isAcknowledged" BOOLEAN NOT NULL DEFAULT false,
    "acknowledgedById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "kpi_alerts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forecasts" (
    "id" TEXT NOT NULL,
    "forecastType" "ForecastType" NOT NULL,
    "modelUsed" TEXT NOT NULL,
    "seasonId" TEXT NOT NULL,
    "brandId" TEXT,
    "categoryId" TEXT,
    "forecastData" JSONB NOT NULL,
    "confidence" DOUBLE PRECISION NOT NULL,
    "accuracy" JSONB,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "validUntil" TIMESTAMP(3) NOT NULL,
    "inputDataRange" JSONB NOT NULL,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "forecasts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scenarios" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "baseSeasonId" TEXT NOT NULL,
    "baseBudgetId" TEXT,
    "parameters" JSONB NOT NULL,
    "impactSummary" JSONB NOT NULL,
    "detailedResults" JSONB,
    "status" "ScenarioStatus" NOT NULL DEFAULT 'DRAFT',
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "scenarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_insights" (
    "id" TEXT NOT NULL,
    "insightType" "InsightType" NOT NULL,
    "category" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "impactLevel" "ImpactLevel" NOT NULL,
    "confidence" DOUBLE PRECISION NOT NULL,
    "dataContext" JSONB NOT NULL,
    "affectedEntities" JSONB,
    "recommendations" JSONB,
    "status" "InsightStatus" NOT NULL DEFAULT 'NEW',
    "viewedAt" TIMESTAMP(3),
    "actionTakenAt" TIMESTAMP(3),
    "dismissedAt" TIMESTAMP(3),
    "userId" TEXT,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "ai_insights_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dashboard_widgets" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "widgetType" "WidgetType" NOT NULL,
    "title" TEXT NOT NULL,
    "gridX" INTEGER NOT NULL,
    "gridY" INTEGER NOT NULL,
    "width" INTEGER NOT NULL DEFAULT 1,
    "height" INTEGER NOT NULL DEFAULT 1,
    "config" JSONB NOT NULL,
    "isVisible" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "dashboard_widgets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_conversations" (
    "id" TEXT NOT NULL,
    "title" TEXT,
    "summary" TEXT,
    "userId" TEXT NOT NULL,
    "context" JSONB,
    "metadata" JSONB,
    "isArchived" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "lastMessageAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ai_conversations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_messages" (
    "id" TEXT NOT NULL,
    "conversationId" TEXT NOT NULL,
    "role" "AIMessageRole" NOT NULL,
    "content" TEXT NOT NULL,
    "toolCalls" JSONB,
    "toolResults" JSONB,
    "tokenCount" INTEGER,
    "latencyMs" INTEGER,
    "model" TEXT,
    "rating" INTEGER,
    "feedback" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ai_messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_suggestions" (
    "id" TEXT NOT NULL,
    "type" "AISuggestionType" NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "confidence" DOUBLE PRECISION NOT NULL,
    "priority" "SuggestionPriority" NOT NULL DEFAULT 'MEDIUM',
    "impact" "ImpactLevel" NOT NULL DEFAULT 'MEDIUM',
    "seasonId" TEXT,
    "brandId" TEXT,
    "categoryId" TEXT,
    "data" JSONB NOT NULL,
    "reasoning" TEXT,
    "metrics" JSONB,
    "status" "SuggestionStatus" NOT NULL DEFAULT 'PENDING',
    "reviewedById" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "reviewNotes" TEXT,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "ai_suggestions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ai_generated_plans" (
    "id" TEXT NOT NULL,
    "type" "GeneratedPlanType" NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "seasonId" TEXT,
    "brandId" TEXT,
    "planData" JSONB NOT NULL,
    "assumptions" JSONB,
    "historicalBasis" JSONB,
    "projectedRevenue" DECIMAL(15,2),
    "projectedMargin" DECIMAL(5,2),
    "confidenceScore" DOUBLE PRECISION,
    "status" "GeneratedPlanStatus" NOT NULL DEFAULT 'DRAFT',
    "appliedAt" TIMESTAMP(3),
    "appliedToId" TEXT,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ai_generated_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "predictive_alerts" (
    "id" TEXT NOT NULL,
    "type" "PredictiveAlertType" NOT NULL,
    "severity" "AlertSeverity" NOT NULL DEFAULT 'WARNING',
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "predictedDate" TIMESTAMP(3),
    "probability" DOUBLE PRECISION NOT NULL,
    "timeframe" TEXT,
    "seasonId" TEXT,
    "brandId" TEXT,
    "categoryId" TEXT,
    "skuId" TEXT,
    "data" JSONB NOT NULL,
    "recommendations" JSONB,
    "metrics" JSONB,
    "status" "PredictiveAlertStatus" NOT NULL DEFAULT 'ACTIVE',
    "acknowledgedById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "resolvedAt" TIMESTAMP(3),
    "resolutionNotes" TEXT,
    "userId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "predictive_alerts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "accounts" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sso_configs" (
    "id" TEXT NOT NULL,
    "provider" "SSOProvider" NOT NULL,
    "name" TEXT NOT NULL,
    "clientId" TEXT,
    "clientSecret" TEXT,
    "entryPoint" TEXT,
    "issuer" TEXT,
    "certificate" TEXT,
    "isEnabled" BOOLEAN NOT NULL DEFAULT false,
    "autoProvision" BOOLEAN NOT NULL DEFAULT true,
    "defaultRole" "UserRole" NOT NULL DEFAULT 'BRAND_PLANNER',
    "allowedDomains" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "sso_configs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stored_files" (
    "id" TEXT NOT NULL,
    "filename" TEXT NOT NULL,
    "originalName" TEXT NOT NULL,
    "mimeType" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "bucket" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "category" "FileCategory" NOT NULL,
    "entityType" TEXT,
    "entityId" TEXT,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "expiresAt" TIMESTAMP(3),
    "uploadedById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "stored_files_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "erp_connections" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "ERPType" NOT NULL,
    "host" TEXT NOT NULL,
    "port" INTEGER,
    "database" TEXT,
    "username" TEXT,
    "password" TEXT,
    "apiKey" TEXT,
    "isEnabled" BOOLEAN NOT NULL DEFAULT false,
    "syncDirection" "SyncDirection" NOT NULL DEFAULT 'BIDIRECTIONAL',
    "lastSyncAt" TIMESTAMP(3),
    "lastSyncStatus" "SyncStatus",
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "erp_connections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "erp_field_mappings" (
    "id" TEXT NOT NULL,
    "connectionId" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "sourceField" TEXT NOT NULL,
    "targetField" TEXT NOT NULL,
    "transformation" TEXT,
    "defaultValue" TEXT,
    "isRequired" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "erp_field_mappings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "erp_sync_logs" (
    "id" TEXT NOT NULL,
    "connectionId" TEXT NOT NULL,
    "syncType" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "direction" "SyncDirection" NOT NULL,
    "status" "SyncStatus" NOT NULL,
    "recordsTotal" INTEGER NOT NULL DEFAULT 0,
    "recordsSuccess" INTEGER NOT NULL DEFAULT 0,
    "recordsFailed" INTEGER NOT NULL DEFAULT 0,
    "errors" JSONB,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "completedAt" TIMESTAMP(3),
    "triggeredById" TEXT,

    CONSTRAINT "erp_sync_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "webhooks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "secret" TEXT NOT NULL,
    "headers" JSONB,
    "events" TEXT[],
    "isEnabled" BOOLEAN NOT NULL DEFAULT true,
    "retryCount" INTEGER NOT NULL DEFAULT 3,
    "timeoutSeconds" INTEGER NOT NULL DEFAULT 30,
    "lastTriggeredAt" TIMESTAMP(3),
    "successCount" INTEGER NOT NULL DEFAULT 0,
    "failureCount" INTEGER NOT NULL DEFAULT 0,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "webhooks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "webhook_deliveries" (
    "id" TEXT NOT NULL,
    "webhookId" TEXT NOT NULL,
    "event" TEXT NOT NULL,
    "payload" JSONB NOT NULL,
    "statusCode" INTEGER,
    "responseBody" TEXT,
    "responseTime" INTEGER,
    "status" "DeliveryStatus" NOT NULL,
    "attempts" INTEGER NOT NULL DEFAULT 1,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "webhook_deliveries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "api_keys" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "prefix" TEXT NOT NULL,
    "scopes" TEXT[],
    "rateLimit" INTEGER NOT NULL DEFAULT 1000,
    "lastUsedAt" TIMESTAMP(3),
    "usageCount" INTEGER NOT NULL DEFAULT 0,
    "createdById" TEXT NOT NULL,
    "isEnabled" BOOLEAN NOT NULL DEFAULT true,
    "expiresAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "api_keys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "realtime_notifications" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" "RealtimeNotificationType" NOT NULL,
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "entityType" TEXT,
    "entityId" TEXT,
    "actionUrl" TEXT,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "readAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "realtime_notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "automation_rules" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "type" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "priority" INTEGER NOT NULL DEFAULT 10,
    "conditions" JSONB NOT NULL,
    "conditionLogic" TEXT NOT NULL DEFAULT 'AND',
    "actions" JSONB NOT NULL,
    "cooldownMinutes" INTEGER,
    "maxExecutionsPerDay" INTEGER,
    "lastExecutedAt" TIMESTAMP(3),
    "executionCount" INTEGER NOT NULL DEFAULT 0,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "automation_rules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wssi_records" (
    "id" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "weekNumber" INTEGER NOT NULL,
    "weekStartDate" TIMESTAMP(3) NOT NULL,
    "weekEndDate" TIMESTAMP(3) NOT NULL,
    "divisionId" TEXT NOT NULL,
    "brandId" TEXT NOT NULL,
    "categoryId" TEXT,
    "subcategoryId" TEXT,
    "seasonId" TEXT NOT NULL,
    "locationId" TEXT,
    "openingStockValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "closingStockValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "openingStockUnits" INTEGER NOT NULL DEFAULT 0,
    "closingStockUnits" INTEGER NOT NULL DEFAULT 0,
    "salesPlanValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "salesPlanUnits" INTEGER NOT NULL DEFAULT 0,
    "salesActualValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "salesActualUnits" INTEGER NOT NULL DEFAULT 0,
    "intakePlanValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "intakePlanUnits" INTEGER NOT NULL DEFAULT 0,
    "intakeActualValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "intakeActualUnits" INTEGER NOT NULL DEFAULT 0,
    "markdownPlanValue" DECIMAL(18,2),
    "markdownActualValue" DECIMAL(18,2),
    "weeksOfCover" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "salesVariancePct" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "intakeVariancePct" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "sellThroughPct" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "forecastType" "WSSIForecastType" NOT NULL DEFAULT 'PLAN',
    "reforecastedAt" TIMESTAMP(3),
    "reforecastedById" TEXT,
    "reforecastReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,

    CONSTRAINT "wssi_records_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wssi_alerts" (
    "id" TEXT NOT NULL,
    "wssiRecordId" TEXT NOT NULL,
    "alertType" "WSSIAlertType" NOT NULL,
    "severity" "AlertSeverity" NOT NULL,
    "thresholdValue" DECIMAL(10,2) NOT NULL,
    "actualValue" DECIMAL(10,2) NOT NULL,
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "recommendation" TEXT,
    "isAcknowledged" BOOLEAN NOT NULL DEFAULT false,
    "acknowledgedById" TEXT,
    "acknowledgedAt" TIMESTAMP(3),
    "resolutionNotes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "wssi_alerts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wssi_thresholds" (
    "id" TEXT NOT NULL,
    "divisionId" TEXT,
    "brandId" TEXT,
    "categoryId" TEXT,
    "wocMinimum" DECIMAL(5,2) NOT NULL DEFAULT 3.0,
    "wocMaximum" DECIMAL(5,2) NOT NULL DEFAULT 8.0,
    "wocTarget" DECIMAL(5,2) NOT NULL DEFAULT 5.0,
    "salesVarianceAlert" DECIMAL(5,2) NOT NULL DEFAULT 10.0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "wssi_thresholds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "budget_change_logs" (
    "id" TEXT NOT NULL,
    "budgetId" TEXT NOT NULL,
    "fieldName" TEXT NOT NULL,
    "oldValue" TEXT,
    "newValue" TEXT,
    "changeReason" TEXT NOT NULL,
    "changedById" TEXT NOT NULL,
    "changedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "budget_change_logs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otb_plan_versions" (
    "id" TEXT NOT NULL,
    "otbPlanId" TEXT NOT NULL,
    "versionNumber" INTEGER NOT NULL,
    "versionType" "OTBPlanVersionType" NOT NULL,
    "snapshotData" JSONB NOT NULL,
    "totalOTBValue" DECIMAL(18,2) NOT NULL,
    "totalOTBUnits" INTEGER NOT NULL,
    "status" "OTBPlanVersionStatus" NOT NULL DEFAULT 'DRAFT',
    "submittedAt" TIMESTAMP(3),
    "submittedById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,
    "approvalComments" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT NOT NULL,

    CONSTRAINT "otb_plan_versions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "otb_version_changes" (
    "id" TEXT NOT NULL,
    "versionId" TEXT NOT NULL,
    "entityType" TEXT NOT NULL,
    "entityId" TEXT,
    "fieldName" TEXT NOT NULL,
    "previousValue" TEXT,
    "newValue" TEXT,
    "changeReason" TEXT NOT NULL,
    "changedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "otb_version_changes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "size_definitions" (
    "id" TEXT NOT NULL,
    "sizeCode" TEXT NOT NULL,
    "sizeName" TEXT NOT NULL,
    "sizeOrder" INTEGER NOT NULL,
    "sizeType" "SizeType" NOT NULL,
    "numericEquivalent" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "size_definitions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "size_profiles" (
    "id" TEXT NOT NULL,
    "categoryId" TEXT NOT NULL,
    "subcategoryId" TEXT,
    "genderId" TEXT,
    "seasonId" TEXT,
    "locationId" TEXT,
    "profileType" "SizeProfileType" NOT NULL DEFAULT 'HISTORICAL',
    "basedOnUnits" INTEGER,
    "confidenceScore" DECIMAL(3,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,

    CONSTRAINT "size_profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "size_profile_items" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "sizeId" TEXT NOT NULL,
    "percentageShare" DECIMAL(5,2) NOT NULL,

    CONSTRAINT "size_profile_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "markdown_plans" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "seasonId" TEXT NOT NULL,
    "brandId" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "status" "MarkdownPlanStatus" NOT NULL DEFAULT 'DRAFT',
    "targetRecoveryValue" DECIMAL(18,2) NOT NULL,
    "targetSellThroughPct" DECIMAL(5,2) NOT NULL,
    "maxMarkdownPct" DECIMAL(5,2) NOT NULL DEFAULT 70,
    "aiOptimizedAt" TIMESTAMP(3),
    "aiConfidenceScore" DECIMAL(3,2),
    "aiRecommendations" JSONB,
    "totalSKUs" INTEGER NOT NULL DEFAULT 0,
    "totalCurrentValue" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "projectedRecovery" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "projectedMarginLoss" DECIMAL(18,2) NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,

    CONSTRAINT "markdown_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "markdown_phases" (
    "id" TEXT NOT NULL,
    "planId" TEXT NOT NULL,
    "phaseNumber" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "markdownPct" DECIMAL(5,2) NOT NULL,
    "minDaysAtPrice" INTEGER NOT NULL DEFAULT 14,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "status" "MarkdownPhaseStatus" NOT NULL DEFAULT 'PENDING',
    "targetSellThroughPct" DECIMAL(5,2) NOT NULL,
    "actualSellThroughPct" DECIMAL(5,2),
    "actualRevenue" DECIMAL(18,2),
    "unitsCleared" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "markdown_phases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "markdown_sku_plans" (
    "id" TEXT NOT NULL,
    "planId" TEXT NOT NULL,
    "skuId" TEXT NOT NULL,
    "skuCode" TEXT NOT NULL,
    "skuName" TEXT NOT NULL,
    "categoryId" TEXT,
    "brandId" TEXT,
    "currentStock" INTEGER NOT NULL,
    "currentPrice" DECIMAL(18,2) NOT NULL,
    "originalPrice" DECIMAL(18,2) NOT NULL,
    "costPrice" DECIMAL(18,2) NOT NULL,
    "currentStockValue" DECIMAL(18,2) NOT NULL,
    "weeksOnHand" DECIMAL(5,2) NOT NULL,
    "sellThroughRate" DECIMAL(5,2) NOT NULL,
    "weeksToSeasonEnd" INTEGER NOT NULL,
    "urgencyScore" DECIMAL(3,2) NOT NULL,
    "urgencyLevel" "MarkdownUrgency" NOT NULL DEFAULT 'MEDIUM',
    "demandElasticity" DECIMAL(4,2),
    "optimalMarkdownPct" DECIMAL(5,2),
    "recommendedAction" "MarkdownAction" NOT NULL DEFAULT 'MARKDOWN',
    "recommendedMarkdownPct" DECIMAL(5,2),
    "recommendedNewPrice" DECIMAL(18,2),
    "projectedUnitsSold" INTEGER,
    "projectedRevenue" DECIMAL(18,2),
    "projectedMarginLoss" DECIMAL(18,2),
    "projectedDaysToSell" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "markdown_sku_plans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "markdown_sku_plan_phases" (
    "id" TEXT NOT NULL,
    "skuPlanId" TEXT NOT NULL,
    "phaseId" TEXT NOT NULL,
    "markdownPct" DECIMAL(5,2) NOT NULL,
    "newPrice" DECIMAL(18,2) NOT NULL,
    "projectedUnits" INTEGER,
    "projectedRevenue" DECIMAL(18,2),
    "actualUnits" INTEGER,
    "actualRevenue" DECIMAL(18,2),

    CONSTRAINT "markdown_sku_plan_phases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "markdown_results" (
    "id" TEXT NOT NULL,
    "planId" TEXT NOT NULL,
    "skuPlanId" TEXT,
    "recordDate" TIMESTAMP(3) NOT NULL,
    "week" INTEGER NOT NULL,
    "openingStock" INTEGER NOT NULL,
    "closingStock" INTEGER NOT NULL,
    "unitsSold" INTEGER NOT NULL,
    "revenue" DECIMAL(18,2) NOT NULL,
    "avgSellingPrice" DECIMAL(18,2) NOT NULL,
    "markdownPct" DECIMAL(5,2) NOT NULL,
    "marginLoss" DECIMAL(18,2) NOT NULL,
    "sellThroughActual" DECIMAL(5,2) NOT NULL,
    "sellThroughVariance" DECIMAL(5,2) NOT NULL,
    "revenueVariancePct" DECIMAL(5,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "markdown_results_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moc_targets" (
    "id" TEXT NOT NULL,
    "brandId" TEXT,
    "categoryId" TEXT,
    "seasonId" TEXT,
    "locationId" TEXT,
    "minMOC" DECIMAL(4,2) NOT NULL DEFAULT 1.5,
    "targetMOC" DECIMAL(4,2) NOT NULL DEFAULT 2.5,
    "maxMOC" DECIMAL(4,2) NOT NULL DEFAULT 4.0,
    "leadTimeDays" INTEGER NOT NULL DEFAULT 30,
    "safetyStockDays" INTEGER NOT NULL DEFAULT 14,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "moc_targets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moq_rules" (
    "id" TEXT NOT NULL,
    "supplierId" TEXT,
    "supplierName" TEXT,
    "brandId" TEXT,
    "categoryId" TEXT,
    "moqUnits" INTEGER NOT NULL DEFAULT 50,
    "moqValue" DECIMAL(18,2) NOT NULL DEFAULT 1000,
    "packSize" INTEGER NOT NULL DEFAULT 1,
    "cartonSize" INTEGER,
    "pricingTiers" JSONB,
    "leadTimeDays" INTEGER NOT NULL DEFAULT 30,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "moq_rules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "replenishment_alerts" (
    "id" TEXT NOT NULL,
    "skuId" TEXT NOT NULL,
    "skuCode" TEXT NOT NULL,
    "skuName" TEXT NOT NULL,
    "brandId" TEXT,
    "categoryId" TEXT,
    "locationId" TEXT,
    "alertType" TEXT NOT NULL,
    "currentStock" INTEGER NOT NULL,
    "currentMOC" DECIMAL(4,2) NOT NULL,
    "avgWeeklySales" DECIMAL(10,2) NOT NULL,
    "targetMOC" DECIMAL(4,2) NOT NULL,
    "safetyStock" INTEGER NOT NULL,
    "recommendedOrderQty" INTEGER NOT NULL,
    "recommendedOrderValue" DECIMAL(18,2) NOT NULL,
    "recommendedOrderDate" TIMESTAMP(3) NOT NULL,
    "projectedStockoutDate" TIMESTAMP(3),
    "status" "ReplenishmentAlertStatus" NOT NULL DEFAULT 'OPEN',
    "acknowledgedAt" TIMESTAMP(3),
    "acknowledgedById" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "resolutionNotes" TEXT,
    "orderId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "replenishment_alerts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "replenishment_orders" (
    "id" TEXT NOT NULL,
    "orderNumber" TEXT NOT NULL,
    "supplierId" TEXT,
    "supplierName" TEXT,
    "orderDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expectedDelivery" TIMESTAMP(3) NOT NULL,
    "actualDelivery" TIMESTAMP(3),
    "totalUnits" INTEGER NOT NULL,
    "totalValue" DECIMAL(18,2) NOT NULL,
    "status" "ReplenishmentOrderStatus" NOT NULL DEFAULT 'DRAFT',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,
    "approvedAt" TIMESTAMP(3),
    "approvedById" TEXT,

    CONSTRAINT "replenishment_orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "replenishment_order_items" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "skuId" TEXT NOT NULL,
    "skuCode" TEXT NOT NULL,
    "skuName" TEXT NOT NULL,
    "orderedQty" INTEGER NOT NULL,
    "receivedQty" INTEGER NOT NULL DEFAULT 0,
    "unitCost" DECIMAL(18,2) NOT NULL,
    "totalValue" DECIMAL(18,2) NOT NULL,
    "discountPct" DECIMAL(5,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "replenishment_order_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forecast_configs" (
    "id" TEXT NOT NULL,
    "brandId" TEXT,
    "categoryId" TEXT,
    "seasonId" TEXT,
    "primaryMethod" "ForecastMethod" NOT NULL DEFAULT 'ENSEMBLE',
    "lookbackWeeks" INTEGER NOT NULL DEFAULT 12,
    "forecastWeeks" INTEGER NOT NULL DEFAULT 8,
    "movingAvgWeight" DECIMAL(3,2) NOT NULL DEFAULT 0.25,
    "expSmoothWeight" DECIMAL(3,2) NOT NULL DEFAULT 0.35,
    "trendWeight" DECIMAL(3,2) NOT NULL DEFAULT 0.40,
    "expSmoothAlpha" DECIMAL(3,2) NOT NULL DEFAULT 0.30,
    "expSmoothBeta" DECIMAL(3,2) NOT NULL DEFAULT 0.10,
    "expSmoothGamma" DECIMAL(3,2) NOT NULL DEFAULT 0.20,
    "seasonalPeriod" INTEGER NOT NULL DEFAULT 52,
    "seasonalAdjust" BOOLEAN NOT NULL DEFAULT true,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "forecast_configs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forecast_runs" (
    "id" TEXT NOT NULL,
    "seasonId" TEXT,
    "brandId" TEXT,
    "categoryId" TEXT,
    "runDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "method" "ForecastMethod" NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'COMPLETED',
    "inputStartDate" TIMESTAMP(3) NOT NULL,
    "inputEndDate" TIMESTAMP(3) NOT NULL,
    "dataPoints" INTEGER NOT NULL,
    "mape" DECIMAL(5,2),
    "rmse" DECIMAL(10,2),
    "confidenceInterval" DECIMAL(3,2),
    "parameters" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdById" TEXT,

    CONSTRAINT "forecast_runs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forecast_run_results" (
    "id" TEXT NOT NULL,
    "runId" TEXT NOT NULL,
    "weekNumber" INTEGER NOT NULL,
    "weekStartDate" TIMESTAMP(3) NOT NULL,
    "weekEndDate" TIMESTAMP(3) NOT NULL,
    "forecastValue" DECIMAL(18,2) NOT NULL,
    "forecastUnits" INTEGER NOT NULL,
    "confidenceLower" DECIMAL(18,2) NOT NULL,
    "confidenceUpper" DECIMAL(18,2) NOT NULL,
    "movingAvgForecast" DECIMAL(18,2),
    "expSmoothForecast" DECIMAL(18,2),
    "trendForecast" DECIMAL(18,2),
    "actualValue" DECIMAL(18,2),
    "actualUnits" INTEGER,
    "variance" DECIMAL(5,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "forecast_run_results_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_UserBrands" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "divisions_name_key" ON "divisions"("name");

-- CreateIndex
CREATE UNIQUE INDEX "divisions_code_key" ON "divisions"("code");

-- CreateIndex
CREATE UNIQUE INDEX "brands_code_key" ON "brands"("code");

-- CreateIndex
CREATE UNIQUE INDEX "collections_brandId_code_key" ON "collections"("brandId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "categories_code_key" ON "categories"("code");

-- CreateIndex
CREATE UNIQUE INDEX "subcategories_categoryId_code_key" ON "subcategories"("categoryId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "sales_locations_code_key" ON "sales_locations"("code");

-- CreateIndex
CREATE UNIQUE INDEX "seasons_code_key" ON "seasons"("code");

-- CreateIndex
CREATE UNIQUE INDEX "budget_allocations_seasonId_brandId_locationId_version_key" ON "budget_allocations"("seasonId", "brandId", "locationId", "version");

-- CreateIndex
CREATE UNIQUE INDEX "otb_plans_budgetId_version_key" ON "otb_plans"("budgetId", "version");

-- CreateIndex
CREATE INDEX "otb_line_items_otbPlanId_level_idx" ON "otb_line_items"("otbPlanId", "level");

-- CreateIndex
CREATE INDEX "sku_items_proposalId_validationStatus_idx" ON "sku_items"("proposalId", "validationStatus");

-- CreateIndex
CREATE UNIQUE INDEX "sku_items_proposalId_skuCode_key" ON "sku_items"("proposalId", "skuCode");

-- CreateIndex
CREATE INDEX "workflows_type_status_idx" ON "workflows"("type", "status");

-- CreateIndex
CREATE INDEX "workflows_referenceId_referenceType_idx" ON "workflows"("referenceId", "referenceType");

-- CreateIndex
CREATE UNIQUE INDEX "workflow_steps_workflowId_stepNumber_key" ON "workflow_steps"("workflowId", "stepNumber");

-- CreateIndex
CREATE INDEX "notifications_userId_isRead_idx" ON "notifications"("userId", "isRead");

-- CreateIndex
CREATE INDEX "notifications_userId_createdAt_idx" ON "notifications"("userId", "createdAt");

-- CreateIndex
CREATE INDEX "ai_interaction_logs_userId_contextType_idx" ON "ai_interaction_logs"("userId", "contextType");

-- CreateIndex
CREATE INDEX "comments_referenceId_referenceType_idx" ON "comments"("referenceId", "referenceType");

-- CreateIndex
CREATE INDEX "audit_logs_tableName_recordId_idx" ON "audit_logs"("tableName", "recordId");

-- CreateIndex
CREATE INDEX "audit_logs_userId_idx" ON "audit_logs"("userId");

-- CreateIndex
CREATE INDEX "audit_logs_createdAt_idx" ON "audit_logs"("createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "saved_filters_userId_name_entityType_key" ON "saved_filters"("userId", "name", "entityType");

-- CreateIndex
CREATE UNIQUE INDEX "user_preferences_userId_key" ON "user_preferences"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "search_index_entityType_entityId_key" ON "search_index"("entityType", "entityId");

-- CreateIndex
CREATE INDEX "recent_searches_userId_createdAt_idx" ON "recent_searches"("userId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "kpi_definitions_code_key" ON "kpi_definitions"("code");

-- CreateIndex
CREATE UNIQUE INDEX "kpi_targets_kpiId_seasonId_brandId_locationId_periodType_key" ON "kpi_targets"("kpiId", "seasonId", "brandId", "locationId", "periodType");

-- CreateIndex
CREATE INDEX "kpi_values_kpiId_periodDate_idx" ON "kpi_values"("kpiId", "periodDate");

-- CreateIndex
CREATE UNIQUE INDEX "kpi_values_kpiId_seasonId_brandId_locationId_categoryId_per_key" ON "kpi_values"("kpiId", "seasonId", "brandId", "locationId", "categoryId", "periodType", "periodDate");

-- CreateIndex
CREATE INDEX "kpi_alerts_kpiId_createdAt_idx" ON "kpi_alerts"("kpiId", "createdAt");

-- CreateIndex
CREATE INDEX "kpi_alerts_isAcknowledged_idx" ON "kpi_alerts"("isAcknowledged");

-- CreateIndex
CREATE INDEX "forecasts_seasonId_forecastType_idx" ON "forecasts"("seasonId", "forecastType");

-- CreateIndex
CREATE INDEX "ai_insights_insightType_status_idx" ON "ai_insights"("insightType", "status");

-- CreateIndex
CREATE INDEX "ai_insights_userId_generatedAt_idx" ON "ai_insights"("userId", "generatedAt");

-- CreateIndex
CREATE INDEX "dashboard_widgets_userId_idx" ON "dashboard_widgets"("userId");

-- CreateIndex
CREATE INDEX "ai_conversations_userId_lastMessageAt_idx" ON "ai_conversations"("userId", "lastMessageAt");

-- CreateIndex
CREATE INDEX "ai_conversations_userId_isArchived_idx" ON "ai_conversations"("userId", "isArchived");

-- CreateIndex
CREATE INDEX "ai_messages_conversationId_createdAt_idx" ON "ai_messages"("conversationId", "createdAt");

-- CreateIndex
CREATE INDEX "ai_suggestions_userId_status_idx" ON "ai_suggestions"("userId", "status");

-- CreateIndex
CREATE INDEX "ai_suggestions_type_status_idx" ON "ai_suggestions"("type", "status");

-- CreateIndex
CREATE INDEX "ai_suggestions_seasonId_brandId_idx" ON "ai_suggestions"("seasonId", "brandId");

-- CreateIndex
CREATE INDEX "ai_generated_plans_userId_status_idx" ON "ai_generated_plans"("userId", "status");

-- CreateIndex
CREATE INDEX "ai_generated_plans_seasonId_brandId_idx" ON "ai_generated_plans"("seasonId", "brandId");

-- CreateIndex
CREATE INDEX "predictive_alerts_type_status_idx" ON "predictive_alerts"("type", "status");

-- CreateIndex
CREATE INDEX "predictive_alerts_severity_status_idx" ON "predictive_alerts"("severity", "status");

-- CreateIndex
CREATE INDEX "predictive_alerts_userId_status_idx" ON "predictive_alerts"("userId", "status");

-- CreateIndex
CREATE INDEX "predictive_alerts_seasonId_brandId_idx" ON "predictive_alerts"("seasonId", "brandId");

-- CreateIndex
CREATE UNIQUE INDEX "accounts_provider_providerAccountId_key" ON "accounts"("provider", "providerAccountId");

-- CreateIndex
CREATE INDEX "stored_files_entityType_entityId_idx" ON "stored_files"("entityType", "entityId");

-- CreateIndex
CREATE INDEX "stored_files_uploadedById_idx" ON "stored_files"("uploadedById");

-- CreateIndex
CREATE UNIQUE INDEX "erp_field_mappings_connectionId_entityType_sourceField_key" ON "erp_field_mappings"("connectionId", "entityType", "sourceField");

-- CreateIndex
CREATE INDEX "erp_sync_logs_connectionId_startedAt_idx" ON "erp_sync_logs"("connectionId", "startedAt");

-- CreateIndex
CREATE INDEX "webhook_deliveries_webhookId_createdAt_idx" ON "webhook_deliveries"("webhookId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "api_keys_key_key" ON "api_keys"("key");

-- CreateIndex
CREATE INDEX "realtime_notifications_userId_isRead_createdAt_idx" ON "realtime_notifications"("userId", "isRead", "createdAt");

-- CreateIndex
CREATE INDEX "automation_rules_type_enabled_idx" ON "automation_rules"("type", "enabled");

-- CreateIndex
CREATE INDEX "wssi_records_year_weekNumber_idx" ON "wssi_records"("year", "weekNumber");

-- CreateIndex
CREATE INDEX "wssi_records_brandId_idx" ON "wssi_records"("brandId");

-- CreateIndex
CREATE INDEX "wssi_records_seasonId_idx" ON "wssi_records"("seasonId");

-- CreateIndex
CREATE INDEX "wssi_records_forecastType_idx" ON "wssi_records"("forecastType");

-- CreateIndex
CREATE UNIQUE INDEX "wssi_records_year_weekNumber_divisionId_brandId_categoryId__key" ON "wssi_records"("year", "weekNumber", "divisionId", "brandId", "categoryId", "subcategoryId", "seasonId", "locationId");

-- CreateIndex
CREATE INDEX "wssi_alerts_severity_idx" ON "wssi_alerts"("severity");

-- CreateIndex
CREATE INDEX "wssi_alerts_isAcknowledged_idx" ON "wssi_alerts"("isAcknowledged");

-- CreateIndex
CREATE INDEX "wssi_alerts_alertType_idx" ON "wssi_alerts"("alertType");

-- CreateIndex
CREATE UNIQUE INDEX "wssi_thresholds_divisionId_brandId_categoryId_key" ON "wssi_thresholds"("divisionId", "brandId", "categoryId");

-- CreateIndex
CREATE INDEX "budget_change_logs_budgetId_idx" ON "budget_change_logs"("budgetId");

-- CreateIndex
CREATE INDEX "budget_change_logs_changedAt_idx" ON "budget_change_logs"("changedAt");

-- CreateIndex
CREATE INDEX "otb_plan_versions_versionType_idx" ON "otb_plan_versions"("versionType");

-- CreateIndex
CREATE INDEX "otb_plan_versions_status_idx" ON "otb_plan_versions"("status");

-- CreateIndex
CREATE UNIQUE INDEX "otb_plan_versions_otbPlanId_versionNumber_key" ON "otb_plan_versions"("otbPlanId", "versionNumber");

-- CreateIndex
CREATE INDEX "otb_version_changes_versionId_idx" ON "otb_version_changes"("versionId");

-- CreateIndex
CREATE UNIQUE INDEX "size_definitions_sizeCode_key" ON "size_definitions"("sizeCode");

-- CreateIndex
CREATE UNIQUE INDEX "size_profiles_categoryId_subcategoryId_genderId_seasonId_lo_key" ON "size_profiles"("categoryId", "subcategoryId", "genderId", "seasonId", "locationId", "profileType");

-- CreateIndex
CREATE UNIQUE INDEX "size_profile_items_profileId_sizeId_key" ON "size_profile_items"("profileId", "sizeId");

-- CreateIndex
CREATE INDEX "markdown_plans_seasonId_idx" ON "markdown_plans"("seasonId");

-- CreateIndex
CREATE INDEX "markdown_plans_status_idx" ON "markdown_plans"("status");

-- CreateIndex
CREATE INDEX "markdown_phases_status_idx" ON "markdown_phases"("status");

-- CreateIndex
CREATE UNIQUE INDEX "markdown_phases_planId_phaseNumber_key" ON "markdown_phases"("planId", "phaseNumber");

-- CreateIndex
CREATE INDEX "markdown_sku_plans_urgencyLevel_idx" ON "markdown_sku_plans"("urgencyLevel");

-- CreateIndex
CREATE INDEX "markdown_sku_plans_recommendedAction_idx" ON "markdown_sku_plans"("recommendedAction");

-- CreateIndex
CREATE UNIQUE INDEX "markdown_sku_plans_planId_skuId_key" ON "markdown_sku_plans"("planId", "skuId");

-- CreateIndex
CREATE UNIQUE INDEX "markdown_sku_plan_phases_skuPlanId_phaseId_key" ON "markdown_sku_plan_phases"("skuPlanId", "phaseId");

-- CreateIndex
CREATE INDEX "markdown_results_planId_recordDate_idx" ON "markdown_results"("planId", "recordDate");

-- CreateIndex
CREATE INDEX "markdown_results_skuPlanId_idx" ON "markdown_results"("skuPlanId");

-- CreateIndex
CREATE UNIQUE INDEX "moc_targets_brandId_categoryId_seasonId_locationId_key" ON "moc_targets"("brandId", "categoryId", "seasonId", "locationId");

-- CreateIndex
CREATE INDEX "moq_rules_supplierId_idx" ON "moq_rules"("supplierId");

-- CreateIndex
CREATE INDEX "moq_rules_brandId_idx" ON "moq_rules"("brandId");

-- CreateIndex
CREATE INDEX "replenishment_alerts_status_idx" ON "replenishment_alerts"("status");

-- CreateIndex
CREATE INDEX "replenishment_alerts_alertType_idx" ON "replenishment_alerts"("alertType");

-- CreateIndex
CREATE INDEX "replenishment_alerts_skuId_idx" ON "replenishment_alerts"("skuId");

-- CreateIndex
CREATE UNIQUE INDEX "replenishment_orders_orderNumber_key" ON "replenishment_orders"("orderNumber");

-- CreateIndex
CREATE INDEX "replenishment_orders_status_idx" ON "replenishment_orders"("status");

-- CreateIndex
CREATE INDEX "replenishment_orders_orderDate_idx" ON "replenishment_orders"("orderDate");

-- CreateIndex
CREATE UNIQUE INDEX "replenishment_order_items_orderId_skuId_key" ON "replenishment_order_items"("orderId", "skuId");

-- CreateIndex
CREATE UNIQUE INDEX "forecast_configs_brandId_categoryId_seasonId_key" ON "forecast_configs"("brandId", "categoryId", "seasonId");

-- CreateIndex
CREATE INDEX "forecast_runs_seasonId_brandId_idx" ON "forecast_runs"("seasonId", "brandId");

-- CreateIndex
CREATE INDEX "forecast_runs_runDate_idx" ON "forecast_runs"("runDate");

-- CreateIndex
CREATE INDEX "forecast_run_results_weekStartDate_idx" ON "forecast_run_results"("weekStartDate");

-- CreateIndex
CREATE UNIQUE INDEX "forecast_run_results_runId_weekNumber_key" ON "forecast_run_results"("runId", "weekNumber");

-- CreateIndex
CREATE UNIQUE INDEX "_UserBrands_AB_unique" ON "_UserBrands"("A", "B");

-- CreateIndex
CREATE INDEX "_UserBrands_B_index" ON "_UserBrands"("B");

-- AddForeignKey
ALTER TABLE "brands" ADD CONSTRAINT "brands_divisionId_fkey" FOREIGN KEY ("divisionId") REFERENCES "divisions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "collections" ADD CONSTRAINT "collections_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subcategories" ADD CONSTRAINT "subcategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "sales_locations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_parentVersionId_fkey" FOREIGN KEY ("parentVersionId") REFERENCES "budget_allocations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_workflowId_fkey" FOREIGN KEY ("workflowId") REFERENCES "workflows"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES "budget_allocations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_parentVersionId_fkey" FOREIGN KEY ("parentVersionId") REFERENCES "otb_plans"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_workflowId_fkey" FOREIGN KEY ("workflowId") REFERENCES "workflows"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plans" ADD CONSTRAINT "otb_plans_rejectedById_fkey" FOREIGN KEY ("rejectedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_line_items" ADD CONSTRAINT "otb_line_items_otbPlanId_fkey" FOREIGN KEY ("otbPlanId") REFERENCES "otb_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_line_items" ADD CONSTRAINT "otb_line_items_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "collections"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_line_items" ADD CONSTRAINT "otb_line_items_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_line_items" ADD CONSTRAINT "otb_line_items_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "subcategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sizing_analyses" ADD CONSTRAINT "sizing_analyses_otbPlanId_fkey" FOREIGN KEY ("otbPlanId") REFERENCES "otb_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sizing_analyses" ADD CONSTRAINT "sizing_analyses_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sizing_analyses" ADD CONSTRAINT "sizing_analyses_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "subcategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sizing_analyses" ADD CONSTRAINT "sizing_analyses_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "sales_locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_otbPlanId_fkey" FOREIGN KEY ("otbPlanId") REFERENCES "otb_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_workflowId_fkey" FOREIGN KEY ("workflowId") REFERENCES "workflows"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_proposals" ADD CONSTRAINT "sku_proposals_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_items" ADD CONSTRAINT "sku_items_proposalId_fkey" FOREIGN KEY ("proposalId") REFERENCES "sku_proposals"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_items" ADD CONSTRAINT "sku_items_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "collections"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_items" ADD CONSTRAINT "sku_items_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sku_items" ADD CONSTRAINT "sku_items_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "subcategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workflows" ADD CONSTRAINT "workflows_initiatedById_fkey" FOREIGN KEY ("initiatedById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workflow_steps" ADD CONSTRAINT "workflow_steps_workflowId_fkey" FOREIGN KEY ("workflowId") REFERENCES "workflows"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workflow_steps" ADD CONSTRAINT "workflow_steps_assignedUserId_fkey" FOREIGN KEY ("assignedUserId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "workflow_steps" ADD CONSTRAINT "workflow_steps_actionById_fkey" FOREIGN KEY ("actionById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_interaction_logs" ADD CONSTRAINT "ai_interaction_logs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "comments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_resolvedById_fkey" FOREIGN KEY ("resolvedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit_logs" ADD CONSTRAINT "audit_logs_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "saved_filters" ADD CONSTRAINT "saved_filters_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_preferences" ADD CONSTRAINT "user_preferences_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reports" ADD CONSTRAINT "reports_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "report_executions" ADD CONSTRAINT "report_executions_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "reports"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "report_executions" ADD CONSTRAINT "report_executions_executedById_fkey" FOREIGN KEY ("executedById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recent_searches" ADD CONSTRAINT "recent_searches_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_targets" ADD CONSTRAINT "kpi_targets_kpiId_fkey" FOREIGN KEY ("kpiId") REFERENCES "kpi_definitions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_targets" ADD CONSTRAINT "kpi_targets_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_targets" ADD CONSTRAINT "kpi_targets_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_targets" ADD CONSTRAINT "kpi_targets_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "sales_locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_targets" ADD CONSTRAINT "kpi_targets_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_values" ADD CONSTRAINT "kpi_values_kpiId_fkey" FOREIGN KEY ("kpiId") REFERENCES "kpi_definitions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_alerts" ADD CONSTRAINT "kpi_alerts_kpiId_fkey" FOREIGN KEY ("kpiId") REFERENCES "kpi_definitions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kpi_alerts" ADD CONSTRAINT "kpi_alerts_acknowledgedById_fkey" FOREIGN KEY ("acknowledgedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forecasts" ADD CONSTRAINT "forecasts_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forecasts" ADD CONSTRAINT "forecasts_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forecasts" ADD CONSTRAINT "forecasts_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forecasts" ADD CONSTRAINT "forecasts_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scenarios" ADD CONSTRAINT "scenarios_baseSeasonId_fkey" FOREIGN KEY ("baseSeasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scenarios" ADD CONSTRAINT "scenarios_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_insights" ADD CONSTRAINT "ai_insights_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dashboard_widgets" ADD CONSTRAINT "dashboard_widgets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_conversations" ADD CONSTRAINT "ai_conversations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_messages" ADD CONSTRAINT "ai_messages_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "ai_conversations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_suggestions" ADD CONSTRAINT "ai_suggestions_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_suggestions" ADD CONSTRAINT "ai_suggestions_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_suggestions" ADD CONSTRAINT "ai_suggestions_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_suggestions" ADD CONSTRAINT "ai_suggestions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_generated_plans" ADD CONSTRAINT "ai_generated_plans_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_generated_plans" ADD CONSTRAINT "ai_generated_plans_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ai_generated_plans" ADD CONSTRAINT "ai_generated_plans_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "predictive_alerts" ADD CONSTRAINT "predictive_alerts_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "predictive_alerts" ADD CONSTRAINT "predictive_alerts_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "predictive_alerts" ADD CONSTRAINT "predictive_alerts_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "predictive_alerts" ADD CONSTRAINT "predictive_alerts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stored_files" ADD CONSTRAINT "stored_files_uploadedById_fkey" FOREIGN KEY ("uploadedById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "erp_field_mappings" ADD CONSTRAINT "erp_field_mappings_connectionId_fkey" FOREIGN KEY ("connectionId") REFERENCES "erp_connections"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "erp_sync_logs" ADD CONSTRAINT "erp_sync_logs_connectionId_fkey" FOREIGN KEY ("connectionId") REFERENCES "erp_connections"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "erp_sync_logs" ADD CONSTRAINT "erp_sync_logs_triggeredById_fkey" FOREIGN KEY ("triggeredById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "webhooks" ADD CONSTRAINT "webhooks_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "webhook_deliveries" ADD CONSTRAINT "webhook_deliveries_webhookId_fkey" FOREIGN KEY ("webhookId") REFERENCES "webhooks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_keys" ADD CONSTRAINT "api_keys_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "realtime_notifications" ADD CONSTRAINT "realtime_notifications_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "automation_rules" ADD CONSTRAINT "automation_rules_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_divisionId_fkey" FOREIGN KEY ("divisionId") REFERENCES "divisions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "subcategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "sales_locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_reforecastedById_fkey" FOREIGN KEY ("reforecastedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_records" ADD CONSTRAINT "wssi_records_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_alerts" ADD CONSTRAINT "wssi_alerts_wssiRecordId_fkey" FOREIGN KEY ("wssiRecordId") REFERENCES "wssi_records"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_alerts" ADD CONSTRAINT "wssi_alerts_acknowledgedById_fkey" FOREIGN KEY ("acknowledgedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_thresholds" ADD CONSTRAINT "wssi_thresholds_divisionId_fkey" FOREIGN KEY ("divisionId") REFERENCES "divisions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_thresholds" ADD CONSTRAINT "wssi_thresholds_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "brands"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wssi_thresholds" ADD CONSTRAINT "wssi_thresholds_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_change_logs" ADD CONSTRAINT "budget_change_logs_budgetId_fkey" FOREIGN KEY ("budgetId") REFERENCES "budget_allocations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "budget_change_logs" ADD CONSTRAINT "budget_change_logs_changedById_fkey" FOREIGN KEY ("changedById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plan_versions" ADD CONSTRAINT "otb_plan_versions_otbPlanId_fkey" FOREIGN KEY ("otbPlanId") REFERENCES "otb_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plan_versions" ADD CONSTRAINT "otb_plan_versions_submittedById_fkey" FOREIGN KEY ("submittedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plan_versions" ADD CONSTRAINT "otb_plan_versions_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_plan_versions" ADD CONSTRAINT "otb_plan_versions_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "otb_version_changes" ADD CONSTRAINT "otb_version_changes_versionId_fkey" FOREIGN KEY ("versionId") REFERENCES "otb_plan_versions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profiles" ADD CONSTRAINT "size_profiles_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profiles" ADD CONSTRAINT "size_profiles_subcategoryId_fkey" FOREIGN KEY ("subcategoryId") REFERENCES "subcategories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profiles" ADD CONSTRAINT "size_profiles_seasonId_fkey" FOREIGN KEY ("seasonId") REFERENCES "seasons"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profiles" ADD CONSTRAINT "size_profiles_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "sales_locations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profiles" ADD CONSTRAINT "size_profiles_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profile_items" ADD CONSTRAINT "size_profile_items_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "size_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "size_profile_items" ADD CONSTRAINT "size_profile_items_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES "size_definitions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_phases" ADD CONSTRAINT "markdown_phases_planId_fkey" FOREIGN KEY ("planId") REFERENCES "markdown_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_sku_plans" ADD CONSTRAINT "markdown_sku_plans_planId_fkey" FOREIGN KEY ("planId") REFERENCES "markdown_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_sku_plan_phases" ADD CONSTRAINT "markdown_sku_plan_phases_skuPlanId_fkey" FOREIGN KEY ("skuPlanId") REFERENCES "markdown_sku_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_sku_plan_phases" ADD CONSTRAINT "markdown_sku_plan_phases_phaseId_fkey" FOREIGN KEY ("phaseId") REFERENCES "markdown_phases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_results" ADD CONSTRAINT "markdown_results_planId_fkey" FOREIGN KEY ("planId") REFERENCES "markdown_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "markdown_results" ADD CONSTRAINT "markdown_results_skuPlanId_fkey" FOREIGN KEY ("skuPlanId") REFERENCES "markdown_sku_plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "replenishment_alerts" ADD CONSTRAINT "replenishment_alerts_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "replenishment_orders"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "replenishment_order_items" ADD CONSTRAINT "replenishment_order_items_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "replenishment_orders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "forecast_run_results" ADD CONSTRAINT "forecast_run_results_runId_fkey" FOREIGN KEY ("runId") REFERENCES "forecast_runs"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBrands" ADD CONSTRAINT "_UserBrands_A_fkey" FOREIGN KEY ("A") REFERENCES "brands"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserBrands" ADD CONSTRAINT "_UserBrands_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
