import React from 'react';
import { ShieldAlert, RefreshCw } from 'lucide-react';

class AppErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true, error };
  }

  componentDidCatch(error, info) {
    console.error('App error:', error, info);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          height: '60vh',
          flexDirection: 'column',
          gap: '16px',
          padding: '32px',
          textAlign: 'center'
        }}>
          <div style={{ fontSize: '32px' }}>
            ⚠️
          </div>
          <h2 style={{ 
            color: '#FFB800',
            fontSize: '20px',
            fontWeight: 700
          }}>
            Something went wrong
          </h2>
          <p style={{ 
            color: 'rgba(240,244,255,0.5)',
            fontSize: '14px',
            maxWidth: '400px'
          }}>
            An error occurred in this module.
            Your data was not exposed.
          </p>
          <button
            onClick={() => {
              this.setState({ 
                hasError: false, 
                error: null 
              });
              window.location.href = '/dashboard';
            }}
            style={{
              background: 'rgba(0,212,255,0.1)',
              border: '1px solid rgba(0,212,255,0.3)',
              borderRadius: '10px',
              padding: '10px 24px',
              color: '#00D4FF',
              cursor: 'pointer',
              fontSize: '14px'
            }}
          >
            Return to Dashboard
          </button>
        </div>
      );
    }
    return this.props.children;
  }
}

export default AppErrorBoundary;

