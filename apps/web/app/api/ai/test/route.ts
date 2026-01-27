// app/api/ai/test/route.ts
// AI Configuration Test Endpoint
// This endpoint tests Azure AI Foundry API connectivity without requiring authentication

import { NextRequest, NextResponse } from 'next/server';
import { AzureOpenAI } from 'openai';

export const dynamic = 'force-dynamic';
export const runtime = 'nodejs';

interface TestResult {
  status: 'success' | 'error' | 'no_key';
  hasKey: boolean;
  keyPrefix?: string;
  model?: string;
  response?: string;
  latencyMs?: number;
  error?: string;
  errorType?: string;
  timestamp: string;
  checks: {
    envVariable: boolean;
    keyFormat: boolean;
    apiConnection: boolean;
    modelAccess: boolean;
  };
  recommendations?: string[];
}

export async function GET(_request: NextRequest) {
  const startTime = Date.now();
  const result: TestResult = {
    status: 'error',
    hasKey: false,
    timestamp: new Date().toISOString(),
    checks: {
      envVariable: false,
      keyFormat: false,
      apiConnection: false,
      modelAccess: false,
    },
    recommendations: [],
  };

  try {
    // Check 1: Environment variables exist
    const apiKey = process.env.AZURE_OPENAI_API_KEY;
    const endpoint = process.env.AZURE_OPENAI_ENDPOINT;
    const deployment = process.env.AZURE_OPENAI_DEPLOYMENT;

    if (!apiKey || !endpoint) {
      result.status = 'no_key';
      result.hasKey = false;
      result.error = 'Azure OpenAI configuration is not set';
      result.recommendations = [
        'Go to Environment settings',
        'Add AZURE_OPENAI_API_KEY with your Azure API key',
        'Add AZURE_OPENAI_ENDPOINT with your Azure endpoint',
        'Add AZURE_OPENAI_DEPLOYMENT with your deployment name',
        'Save and wait for automatic redeploy',
      ];
      return NextResponse.json(result, { status: 200 });
    }

    result.hasKey = true;
    result.checks.envVariable = true;

    // Check 2: Key format
    const keyPrefix = apiKey.substring(0, 10) + '...';
    result.keyPrefix = keyPrefix;
    result.checks.keyFormat = true;

    // Check 3: API Connection
    const openai = new AzureOpenAI({
      apiKey: apiKey,
      endpoint: endpoint,
      apiVersion: process.env.AZURE_OPENAI_API_VERSION || '2024-05-01-preview',
    });

    // Check 4: Model Access - Make a simple completion request
    const model = deployment || 'gpt-4o';
    result.model = model;

    const completion = await openai.chat.completions.create({
      model: model,
      messages: [
        {
          role: 'system',
          content: 'You are a test assistant. Respond with exactly: "AI is working!"',
        },
        {
          role: 'user',
          content: 'Test',
        },
      ],
      max_tokens: 20,
      temperature: 0,
    });

    result.checks.apiConnection = true;
    result.checks.modelAccess = true;

    const responseText = completion.choices[0]?.message?.content || '';
    result.response = responseText;
    result.status = 'success';
    result.latencyMs = Date.now() - startTime;

    // Clear recommendations if successful
    result.recommendations = [];

    return NextResponse.json(result, { status: 200 });

  } catch (error: unknown) {
    result.latencyMs = Date.now() - startTime;

    if (error instanceof Error && 'status' in error) {
      const apiError = error as Error & { status?: number; type?: string };
      result.errorType = apiError.type || 'api_error';
      result.error = error.message;

      switch (apiError.status) {
        case 401:
          result.error = 'Invalid API key - authentication failed';
          result.recommendations = [
            'Verify your Azure API key is correct',
            'Check the key in Azure Portal under your Cognitive Services resource',
            'Make sure the key has not been regenerated',
          ];
          break;
        case 403:
          result.error = 'Access forbidden - check API key permissions';
          result.recommendations = [
            'Verify your API key has the required permissions',
            'Check if your Azure subscription is active',
          ];
          break;
        case 404:
          result.error = 'Deployment not found';
          result.recommendations = [
            'Verify the AZURE_OPENAI_DEPLOYMENT name is correct',
            'Check if the model is deployed in Azure AI Foundry',
          ];
          break;
        case 429:
          result.error = 'Rate limit exceeded or quota exhausted';
          result.recommendations = [
            'Check your Azure usage and quotas',
            'Wait a moment and try again',
          ];
          break;
        case 500:
        case 502:
        case 503:
          result.error = 'Azure AI service temporarily unavailable';
          result.checks.apiConnection = true;
          result.recommendations = ['Try again in a few minutes'];
          break;
        default:
          result.recommendations = [
            'Check Azure AI Foundry status',
            'Review the error message for more details',
          ];
      }
    } else if (error instanceof Error && 'code' in error && ((error as NodeJS.ErrnoException).code === 'ECONNREFUSED' || (error as NodeJS.ErrnoException).code === 'ENOTFOUND')) {
      result.error = 'Network error - cannot reach Azure AI API';
      result.errorType = 'network_error';
      result.recommendations = [
        'Check network connectivity',
        'Verify the AZURE_OPENAI_ENDPOINT is correct',
        'Verify firewall settings allow outbound HTTPS',
      ];
    } else {
      result.error = error instanceof Error ? error.message : 'Unknown error occurred';
      result.errorType = 'unknown_error';
    }

    return NextResponse.json(result, { status: 200 });
  }
}

// Also support POST for testing with custom messages
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const testMessage = body.message || 'Hello, can you confirm you are working?';

    const apiKey = process.env.AZURE_OPENAI_API_KEY;
    const endpoint = process.env.AZURE_OPENAI_ENDPOINT;
    const deployment = process.env.AZURE_OPENAI_DEPLOYMENT || 'gpt-4o';

    if (!apiKey || !endpoint) {
      return NextResponse.json({
        status: 'error',
        error: 'Azure OpenAI configuration not set',
        hasKey: false,
      }, { status: 200 });
    }

    const openai = new AzureOpenAI({
      apiKey,
      endpoint,
      apiVersion: process.env.AZURE_OPENAI_API_VERSION || '2024-05-01-preview',
    });

    const startTime = Date.now();

    const completion = await openai.chat.completions.create({
      model: deployment,
      messages: [
        {
          role: 'system',
          content: 'You are a helpful AI assistant for DAFC OTB Platform. Keep responses brief.',
        },
        {
          role: 'user',
          content: testMessage,
        },
      ],
      max_tokens: 100,
      temperature: 0.7,
    });

    return NextResponse.json({
      status: 'success',
      hasKey: true,
      message: testMessage,
      response: completion.choices[0]?.message?.content,
      model: completion.model,
      latencyMs: Date.now() - startTime,
      usage: completion.usage,
    }, { status: 200 });

  } catch (error: unknown) {
    return NextResponse.json({
      status: 'error',
      error: error instanceof Error ? error.message : 'Unknown error',
      hasKey: !!process.env.AZURE_OPENAI_API_KEY,
    }, { status: 200 });
  }
}
