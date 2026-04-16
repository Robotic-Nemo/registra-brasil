'use client'

import { useState } from 'react'

interface CopyableCodeProps {
  code: string
  language?: string
  className?: string
}

export function CopyableCode({ code, language, className = '' }: CopyableCodeProps) {
  const [copied, setCopied] = useState(false)

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(code)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Fallback
    }
  }

  return (
    <div className={`relative group ${className}`}>
      {language && (
        <span className="absolute top-2 left-3 text-[10px] text-zinc-400 uppercase font-mono">
          {language}
        </span>
      )}
      <button
        onClick={handleCopy}
        className="absolute top-2 right-2 px-2 py-1 text-[10px] text-zinc-400 bg-zinc-800 rounded hover:text-white transition-colors opacity-0 group-hover:opacity-100"
        aria-label="Copiar código"
      >
        {copied ? '✓ Copiado' : 'Copiar'}
      </button>
      <pre className="bg-zinc-900 text-zinc-100 rounded-lg p-4 pt-8 overflow-x-auto text-sm font-mono custom-scrollbar">
        <code>{code}</code>
      </pre>
    </div>
  )
}
