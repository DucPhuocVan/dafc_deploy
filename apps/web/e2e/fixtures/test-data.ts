/**
 * Test Data Fixtures for E2E Tests
 * Centralized test data for consistent testing
 */

export const TestUsers = {
  admin: {
    email: 'admin@dafc.com',
    password: 'admin123',
    role: 'ADMIN',
    name: 'Admin User',
  },
  financeHead: {
    email: 'finance.head@dafc.com',
    password: 'finance123',
    role: 'FINANCE_HEAD',
    name: 'Finance Head',
  },
  brandManager: {
    email: 'brand.manager@dafc.com',
    password: 'brand123',
    role: 'BRAND_MANAGER',
    name: 'Brand Manager',
  },
  brandPlanner: {
    email: 'brand.planner@dafc.com',
    password: 'planner123',
    role: 'BRAND_PLANNER',
    name: 'Brand Planner',
  },
  viewer: {
    email: 'viewer@dafc.com',
    password: 'viewer123',
    role: 'BOD_MEMBER',
    name: 'BOD Member',
  },
};

export const TestBrands = {
  nike: { name: 'Nike', code: 'NIKE' },
  adidas: { name: 'Adidas', code: 'ADID' },
  puma: { name: 'Puma', code: 'PUMA' },
};

export const TestSeasons = {
  ss2025: {
    name: 'Spring/Summer 2025',
    code: 'SS25',
    startDate: '2025-01-01',
    endDate: '2025-06-30',
  },
  fw2025: {
    name: 'Fall/Winter 2025',
    code: 'FW25',
    startDate: '2025-07-01',
    endDate: '2025-12-31',
  },
};

export const TestBudget = {
  valid: {
    name: 'Test Budget SS25',
    seasonalBudget: 1000000,
    replenishmentBudget: 500000,
    totalBudget: 1500000,
    currency: 'VND',
  },
  minimal: {
    name: 'Minimal Budget',
    totalBudget: 100000,
    currency: 'VND',
  },
};

export const TestSKU = {
  valid: {
    skuCode: 'SKU-TEST-001',
    styleName: 'Test Style',
    color: 'Black',
    category: 'BAGS',
    gender: 'WOMEN',
    retailPrice: 500000,
    costPrice: 200000,
    quantity: 100,
    leadTime: 60,
    moq: 50,
  },
  invalidMargin: {
    skuCode: 'SKU-INV-001',
    styleName: 'Invalid Margin Style',
    retailPrice: 100000,
    costPrice: 90000, // 10% margin - too low
  },
  invalidCost: {
    skuCode: 'SKU-INV-002',
    styleName: 'Invalid Cost Style',
    retailPrice: 100000,
    costPrice: 150000, // Cost > Retail
  },
};

export const TestRoutes = {
  public: ['/auth/login', '/auth/forgot-password'],
  protected: [
    '/dashboard',
    '/budget',
    '/budget/new',
    '/otb-plans',
    '/sku-proposal',
    '/sku-proposal/import',
    '/analytics',
    '/settings',
  ],
  adminOnly: ['/admin/users', '/admin/settings'],
};

export const ValidationMessages = {
  required: /required|bắt buộc/i,
  invalidEmail: /email.*invalid|email không hợp lệ/i,
  invalidCredentials: /invalid|incorrect|sai|không đúng/i,
  success: /success|thành công/i,
  error: /error|lỗi|failed|thất bại/i,
};

export const PerformanceThresholds = {
  pageLoad: 3000, // ms
  apiResponse: 1000, // ms
  chartRender: 2000, // ms
  tableRender: 1500, // ms
  formSubmit: 2000, // ms
};
