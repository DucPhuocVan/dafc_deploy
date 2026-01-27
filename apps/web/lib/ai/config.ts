import { createAzure } from '@ai-sdk/azure';

// Azure AI Foundry client configuration
export const azure = createAzure({
  apiKey: process.env.AZURE_OPENAI_API_KEY,
  resourceName: 'projecttest01-resource',
});

// Default model (Azure deployment name)
export const DEFAULT_MODEL = 'gpt-4o';

// Export azure as openai for backward compatibility
export const openai = azure;

// AI Settings
export const AI_CONFIG = {
  maxTokens: 2000,
  temperature: 0.7,
  topP: 1,
  frequencyPenalty: 0,
  presencePenalty: 0,
};

// Rate limiting
export const RATE_LIMIT = {
  maxRequestsPerMinute: 20,
  maxTokensPerDay: 100000,
};
