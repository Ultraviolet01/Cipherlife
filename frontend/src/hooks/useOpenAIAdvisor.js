import { useState, useCallback } from 'react';
import * as advisorUtils from '../utils/openaiAdvisor';

/**
 * Hook for managing OpenAI AI insights with session caching.
 */
export const useOpenAIAdvisor = () => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const [insights, setInsights] = useState({});

  const getInsights = useCallback(async (moduleType, ...args) => {
    const cacheKey = `cipherlife_ai_${moduleType}_${JSON.stringify(args)}`;
    
    // Check session storage cache
    const cached = sessionStorage.getItem(cacheKey);
    if (cached) {
      setInsights(prev => ({ ...prev, [moduleType]: cached }));
      return cached;
    }

    setIsLoading(true);
    setError(null);

    try {
      let result;
      switch (moduleType) {
        case 'health':
          result = await advisorUtils.getHealthInsights(...args);
          break;
        case 'mind':
          result = await advisorUtils.getMentalHealthInsights(...args);
          break;
        case 'finance':
          result = await advisorUtils.getFinanceInsights(...args);
          break;
        case 'combined':
          result = await advisorUtils.getCombinedInsights(...args);
          break;
        default:
          throw new Error("Invalid module type");
      }

      // Update state and cache
      setInsights(prev => ({ ...prev, [moduleType]: result }));
      sessionStorage.setItem(cacheKey, result);
      return result;
    } catch (err) {
      const msg = err.response?.data?.error || "Strategic advisor currently offline.";
      setError(msg);
      throw err;
    } finally {
      setIsLoading(false);
    }
  }, []);

  return {
    getInsights,
    isLoading,
    insights,
    error
  };
};
