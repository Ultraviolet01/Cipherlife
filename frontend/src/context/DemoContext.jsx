import React, { createContext, useContext, useState, useEffect } from 'react';

const DemoContext = createContext();

export const DemoProvider = ({ children }) => {
  const [isDemoMode, setIsDemoMode] = useState(() => {
    const saved = localStorage.getItem('cipherlife_demo_mode');
    return saved === 'true';
  });

  useEffect(() => {
    localStorage.setItem('cipherlife_demo_mode', isDemoMode);
  }, [isDemoMode]);

  const toggleDemoMode = () => setIsDemoMode(prev => !prev);

  // Mock data generator for Demo Mode
  const getDemoData = (module) => {
    if (!isDemoMode) return null;
    
    switch(module) {
      case 'health':
        return { symptoms: 1, meds: 0, conditions: 0, vitals: 5 };
      case 'mind':
        return { mood: 5, sleep: 8.5, stress: 2, social: 'social' };
      case 'finance':
        return { income: 12500, spending: 3100, debt: 10, savings: 45 };
      default:
        return null;
    }
  };

  return (
    <DemoContext.Provider value={{ isDemoMode, toggleDemoMode, getDemoData }}>
      {children}
    </DemoContext.Provider>
  );
};

export const useDemo = () => useContext(DemoContext);
