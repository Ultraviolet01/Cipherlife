import React, { useState, useRef, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Send, Loader2, Sparkles, MessageSquare, AlertCircle } from 'lucide-react';
import ReactMarkdown from 'react-markdown';
import { useOpenAIAdvisor, askAdvisor } from '../utils/openaiAdvisor';
import GlassCard from './GlassCard';

const MAX_MESSAGES = 5;

const AIChat = ({ scores, patterns }) => {
  const [messages, setMessages] = useState([
    { role: 'ai', content: "I am your GPT-4o powered CipherLife advisor. I analyze your decrypted wellness scores across all domains to provide secure, contextual guidance. How can I help you optimize your baseline today?" }
  ]);
  const [input, setInput] = useState("");
  const { getInsights, isLoading } = useOpenAIAdvisor();
  const scrollRef = useRef(null);

  const isLocked = !scores.health || !scores.mind || !scores.finance;
  const questionsCount = messages.filter(m => m.role === 'user').length;
  const canChat = !isLocked && questionsCount < MAX_MESSAGES;

  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTo({
        top: scrollRef.current.scrollHeight,
        behavior: 'smooth'
      });
    }
  }, [messages, isLoading]);

  const handleSend = async () => {
    if (!input.trim() || isLoading) return;
    
    const question = input.trim();
    setInput('');
    // setIsLoading is handled inside handleSend if we were using the hook's state, 
    // but here AIChat seems to have its own isLoading or uses the hook's one.
    // Let's stick to the user's provided logic.
    
    // Add user message
    setMessages(prev => [...prev, { role: 'user', content: question }]);

    try {
      const response = await askAdvisor(
        question,
        scores.health || 0,
        scores.mind || 0,
        scores.finance || 0
      );
      
      setMessages(prev => [...prev, { role: 'ai', content: response }]);
      
    } catch (err) {
      console.error('Chat advisor error:', err);
      
      let errorMsg = '';
      
      if (err.message === 
          'OPENAI_KEY_NOT_CONFIGURED' ||
          err.message?.includes('API_KEY')) {
        errorMsg = 
          'AI advisor needs an OpenAI API key ' +
          'to be configured. Check your Vercel ' +
          'environment variables.';
      } else if (err.message?.includes('429')) {
        errorMsg = 
          'Too many requests. Please wait ' +
          'a moment before asking again.';
      } else if (err.message?.includes('401')) {
        errorMsg = 
          'Invalid API key. Please check ' +
          'your OpenAI configuration.';
      } else {
        errorMsg = 
          'Could not get a response right now. ' +
          'Please try again in a moment.';
      }
      
      setMessages(prev => [...prev, { role: 'ai', content: errorMsg }]);
    }
  };

  return (
    <div className="space-y-4">
      <div className="flex items-center gap-2 mb-2">
        <MessageSquare className="w-4 h-4 text-purple-400" />
        <h3 className="text-[10px] font-black uppercase tracking-widest text-slate-400">Interactive Advisor</h3>
        {!isLocked && (
          <span className={`ml-auto text-[9px] font-bold uppercase ${questionsCount >= MAX_MESSAGES ? 'text-rose-500' : 'text-slate-600'}`}>
            {MAX_MESSAGES - questionsCount}/{MAX_MESSAGES} Questions Left
          </span>
        )}
      </div>

      <GlassCard className="flex flex-col h-[480px] justify-between p-0 overflow-hidden relative border-white/5 shadow-2xl shadow-purple-500/5">
        {/* Messages */}
        <div 
          ref={scrollRef}
          className="flex-1 overflow-y-auto p-5 space-y-6"
        >
          {messages.map((m, i) => (
            <motion.div
              key={i}
              initial={{ opacity: 0, y: 10, scale: 0.98 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              transition={{ duration: 0.3 }}
              className={`flex gap-4 ${m.role === 'user' ? 'flex-row-reverse' : ''}`}
            >
              <div className={`w-9 h-9 rounded-xl flex items-center justify-center shrink-0 shadow-lg ${
                m.role === 'ai' 
                  ? 'bg-gradient-to-br from-purple-500/20 to-purple-900/40 border border-purple-500/30' 
                  : 'bg-gradient-to-br from-cipher-primary/20 to-cipher-primary/40 border border-cipher-primary/30'
              }`}>
                {m.role === 'ai' ? (
                  <Sparkles className="w-4 h-4 text-purple-400" />
                ) : (
                  <div className="text-[10px] font-black text-cipher-primary">USR</div>
                )}
              </div>
              <div className={`max-w-[85%] p-4 rounded-2xl text-[11px] leading-relaxed shadow-xl ${
                m.role === 'ai' 
                  ? 'bg-white/5 border border-white/10 rounded-tl-none text-slate-300' 
                  : 'bg-cipher-primary/5 border border-cipher-primary/20 rounded-tr-none text-cipher-primary'
              }`}>
                {m.role === 'ai' ? (
                  <div className="prose prose-invert prose-xs max-w-none">
                    <ReactMarkdown
                      components={{
                        p: ({node, ...props}) => <p className="mb-2 last:mb-0" {...props} />,
                        strong: ({node, ...props}) => <strong className="text-purple-400 font-black uppercase tracking-wider" {...props} />,
                        ul: ({node, ...props}) => <ul className="list-disc pl-4 mb-2" {...props} />,
                        li: ({node, ...props}) => <li className="mb-1" {...props} />
                      }}
                    >
                      {m.content}
                    </ReactMarkdown>
                  </div>
                ) : (
                  m.content
                )}
                {m.role === 'ai' && i > 0 && (
                   <div className="mt-4 pt-3 border-t border-white/5 text-[9px] text-slate-500 italic opacity-50">
                      ⚕️ AI-generated holistic alignment insight.
                   </div>
                )}
              </div>
            </motion.div>
          ))}
          {isLoading && (
            <motion.div 
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              className="flex gap-4"
            >
              <div className="w-9 h-9 rounded-xl bg-purple-500/10 border border-purple-500/20 flex items-center justify-center shrink-0">
                <Loader2 className="w-4 h-4 text-purple-400 animate-spin" />
              </div>
              <div className="p-4 rounded-2xl rounded-tl-none bg-white/5 border border-white/5">
                 <div className="flex gap-1.5 py-1">
                    <span className="w-2 h-2 bg-purple-400/40 rounded-full animate-bounce" />
                    <span className="w-2 h-2 bg-purple-400/40 rounded-full animate-bounce [animation-delay:0.2s]" />
                    <span className="w-2 h-2 bg-purple-400/40 rounded-full animate-bounce [animation-delay:0.4s]" />
                 </div>
              </div>
            </motion.div>
          )}
        </div>

        {/* Input area */}
        <div className="p-4 bg-black/40 border-t border-white/5">
          {isLocked ? (
             <div className="p-3 bg-rose-500/5 rounded-xl border border-rose-500/20 flex items-center gap-3">
                <AlertCircle className="w-4 h-4 text-rose-500" />
                <p className="text-[10px] font-bold text-rose-500/80 uppercase tracking-tight">
                  Complete Health, Mind and Finance check-ins to unlock your advisor
                </p>
             </div>
          ) : (
            <div className="relative group">
              <input 
                type="text"
                placeholder={questionsCount >= MAX_MESSAGES ? "Session limit reached" : "Ask your advisor anything..."}
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleSend()}
                disabled={!canChat || isLoading}
                className="w-full bg-white/5 border border-white/10 rounded-xl py-3 pl-4 pr-12 text-xs focus:ring-1 ring-purple-500 outline-none transition-all disabled:opacity-30 placeholder:text-slate-800"
              />
              <button 
                onClick={handleSend}
                disabled={!canChat || isLoading || !input.trim()}
                className="absolute right-2 top-1/2 -translate-y-1/2 w-8 h-8 rounded-lg bg-purple-500 flex items-center justify-center hover:bg-purple-600 disabled:opacity-0 transition-all shadow-lg"
              >
                {isLoading ? <Loader2 className="w-3 h-3 animate-spin" /> : <Send className="w-3 h-3 text-white" />}
              </button>
            </div>
          )}
          {questionsCount >= MAX_MESSAGES && (
             <p className="mt-3 text-center text-[9px] text-slate-600 font-bold uppercase tracking-widest">
               For ongoing support, consult a licensed professional.
             </p>
          )}
        </div>
      </GlassCard>
    </div>
  );
};

export default AIChat;
