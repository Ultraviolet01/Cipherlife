import React, { useEffect, useState } 
  from 'react';
import ReactMarkdown from 'react-markdown';
import { useOpenAIAdvisor } 
  from '../utils/openaiAdvisor';

export default function AIInsightCard({ 
  module, scores, patterns 
}) {
  const { 
    getInsights, isLoading, 
    insights, error 
  } = useOpenAIAdvisor();

  // Auto-load on mount if scores exist
  useEffect(() => {
    const hasScores = scores && (
      scores.health > 0 || 
      scores.mind > 0 || 
      scores.finance > 0
    );
    if (hasScores) {
      getInsights(module, scores, patterns);
    }
  }, [
    scores?.health, 
    scores?.mind, 
    scores?.finance
  ]);

  // Loading state
  if (isLoading) {
    return (
      <div style={{
        background: 'rgba(255,255,255,0.04)',
        border: '1px solid rgba(255,255,255,0.08)',
        borderRadius: '16px',
        padding: '24px'
      }}>
        <div style={{
          display: 'flex',
          alignItems: 'center',
          gap: '12px',
          marginBottom: '16px'
        }}>
          <div className="spinner" />
          <div>
            <div style={{ 
              fontSize: '14px', 
              fontWeight: 600,
              color: '#F0F4FF'
            }}>
              AI Wellness Advisor
            </div>
            <div style={{ 
              fontSize: '12px',
              color: 'rgba(240,244,255,0.4)'
            }}>
              Analyzing your encrypted scores...
            </div>
          </div>
        </div>
        {/* Shimmer skeleton */}
        {[1,2,3].map(i => (
          <div key={i} style={{
            height: '14px',
            background: 
              'rgba(255,255,255,0.06)',
            borderRadius: '7px',
            marginBottom: '10px',
            width: i === 3 ? '60%' : '100%',
            animation: 
              'shimmer 1.5s infinite'
          }} />
        ))}
      </div>
    );
  }

  // Error states with helpful messages
  if (error) {
    const errorMessages = {
      API_KEY_MISSING: {
        title: 'API Key Required',
        body: 'Add your OpenAI API key to ' +
          'Vercel environment variables ' +
          '(OPENAI_API_KEY) to enable ' +
          'AI wellness advice.',
        action: null
      },
      INVALID_API_KEY: {
        title: 'Invalid API Key',
        body: 'The OpenAI API key is invalid. ' +
          'Check it in your Vercel dashboard.',
        action: null
      },
      RATE_LIMITED: {
        title: 'Too Many Requests',
        body: 'OpenAI rate limit reached. ' +
          'Please wait a moment and try again.',
        action: 'Try Again'
      },
      CONNECTION_FAILED: {
        title: 'Advisor Unavailable',
        body: 'Could not connect to the AI ' +
          'advisor. Your scores are saved ' +
          'and advice will be available ' +
          'when connection is restored.',
        action: 'Try Again'
      }
    };

    const msg = errorMessages[error] 
      || errorMessages.CONNECTION_FAILED;

    return (
      <div style={{
        background: 'rgba(255,184,0,0.06)',
        border: '1px solid rgba(255,184,0,0.2)',
        borderRadius: '16px',
        padding: '24px'
      }}>
        <div style={{ 
          fontSize: '14px', 
          fontWeight: 600,
          color: '#FFB800',
          marginBottom: '8px'
        }}>
          ⚡ {msg.title}
        </div>
        <div style={{ 
          fontSize: '13px',
          color: 'rgba(240,244,255,0.6)',
          lineHeight: 1.5,
          marginBottom: msg.action ? '16px' : 0
        }}>
          {msg.body}
        </div>
        {msg.action && (
          <button
            onClick={() => getInsights(
              module, scores, patterns
            )}
            style={{
              background: 
                'rgba(0,212,255,0.1)',
              border: 
                '1px solid rgba(0,212,255,0.3)',
              borderRadius: '8px',
              padding: '8px 16px',
              color: '#00D4FF',
              cursor: 'pointer',
              fontSize: '13px'
            }}
          >
            {msg.action}
          </button>
        )}
      </div>
    );
  }

  // No insights yet (scores are 0)
  if (!insights) {
    return (
      <div style={{
        background: 'rgba(255,255,255,0.04)',
        border: '1px solid rgba(255,255,255,0.08)',
        borderRadius: '16px',
        padding: '24px',
        textAlign: 'center',
        color: 'rgba(240,244,255,0.4)',
        fontSize: '14px'
      }}>
        Complete your health, mind, and 
        finance check-ins to unlock 
        AI wellness advice.
      </div>
    );
  }

  // Success — show insights
  return (
    <div style={{
      background: 'rgba(255,255,255,0.04)',
      border: '1px solid rgba(0,212,255,0.15)',
      borderRadius: '16px',
      padding: '24px'
    }}>
      {/* Header */}
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        marginBottom: '16px'
      }}>
        <div style={{ 
          display: 'flex', 
          alignItems: 'center', 
          gap: '8px' 
        }}>
          <span>✨</span>
          <div>
            <div style={{ 
              fontSize: '14px', 
              fontWeight: 600,
              color: '#F0F4FF'
            }}>
              AI Wellness Advisor
            </div>
            <div style={{ 
              fontSize: '11px',
              color: 'rgba(240,244,255,0.4)'
            }}>
              Powered by GPT-4o
            </div>
          </div>
        </div>
        <button
          onClick={() => {
            // Clear cache and reload
            const cacheKey = 
              `insights_${module}_` +
              `${scores.health}_` +
              `${scores.mind}_` +
              `${scores.finance}`;
            sessionStorage.removeItem(cacheKey);
            getInsights(module, scores, patterns);
          }}
          style={{
            background: 'transparent',
            border: '1px solid rgba(255,255,255,0.1)',
            borderRadius: '6px',
            padding: '4px 10px',
            color: 'rgba(240,244,255,0.4)',
            cursor: 'pointer',
            fontSize: '11px'
          }}
        >
          ↺ Refresh
        </button>
      </div>

      {/* Insights content */}
      <div style={{ 
        fontSize: '14px',
        lineHeight: 1.7,
        color: 'rgba(240,244,255,0.85)'
      }}>
        <ReactMarkdown>{insights}</ReactMarkdown>
      </div>
    </div>
  );
}
