'use client'

import { useState, useEffect, useRef } from 'react'

interface CopyableCodeProps {
  code: string
  language?: string
  className?: string
}

export function CopyableCode({ code, language, className = '' }: CopyableCodeProps) {
  const [copied, setCopied] = useState(false)
  const timeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const mountedRef = useRef(true)

  useEffect(() => {
    return () => {
      mountedRef.current = false
      if (timeoutRef.current) clearTimeout(timeoutRef.current)
    }
  }, [])

  const handleCopy = async () => {
    const markCopied = () => {
      setCopied(true)
      if (timeoutRef.current) clearTimeout(timeoutRef.current)
      timeoutRef.current = setTimeout(() => {
        if (mountedRef.current) setCopied(false)
      }, 2000)
    }

    if (navigator.clipboard?.writeText) {
      try {
        await navigator.clipboard.writeText(code)
        markCopied()
        return
      } catch {
        // Fall through to DOM-select fallback.
      }
    }

    // Fallback for older browsers / insecure contexts.
    const el = document.createElement('textarea')
    el.value = code
    el.setAttribute('readonly', '')
    el.style.position = 'absolute'
    el.style.left = '-9999px'
    document.body.appendChild(el)
    el.select()
    try {
      document.execCommand('copy')
      markCopied()
    } finally {
      document.body.removeChild(el)
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
        type="button"
        onClick={handleCopy}
        className="absolute top-2 right-2 px-2 py-1 text-[10px] text-zinc-400 bg-zinc-800 rounded hover:text-white transition-colors opacity-0 group-hover:opacity-100 focus:opacity-100 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        aria-label={copied ? 'Código copiado' : 'Copiar código'}
        aria-live="polite"
      >
        {copied ? '✓ Copiado' : 'Copiar'}
      </button>
      <pre className="bg-zinc-900 text-zinc-100 rounded-lg p-4 pt-8 overflow-x-auto text-sm font-mono custom-scrollbar">
        <code>{code}</code>
      </pre>
    </div>
  )
}
