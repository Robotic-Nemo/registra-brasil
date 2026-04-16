'use client'

import { useState, useEffect, useRef } from 'react'
import { Copy, Check } from 'lucide-react'

interface Props {
  text: string
  label?: string
}

export function CopyButton({ text, label = 'Copiar' }: Props) {
  const [copied, setCopied] = useState(false)
  const timeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const mountedRef = useRef(true)

  useEffect(() => {
    return () => {
      mountedRef.current = false
      if (timeoutRef.current) clearTimeout(timeoutRef.current)
    }
  }, [])

  function scheduleReset() {
    if (timeoutRef.current) clearTimeout(timeoutRef.current)
    timeoutRef.current = setTimeout(() => {
      if (mountedRef.current) setCopied(false)
    }, 2000)
  }

  async function handleCopy() {
    try {
      await navigator.clipboard.writeText(text)
      setCopied(true)
      scheduleReset()
    } catch {
      // Fallback for older browsers
      try {
        const textarea = document.createElement('textarea')
        textarea.value = text
        textarea.style.position = 'fixed'
        textarea.style.opacity = '0'
        document.body.appendChild(textarea)
        textarea.select()
        document.execCommand('copy')
        document.body.removeChild(textarea)
        setCopied(true)
        scheduleReset()
      } catch {
        // Give up silently if both paths fail
      }
    }
  }

  return (
    <button
      type="button"
      onClick={handleCopy}
      disabled={copied}
      className="inline-flex items-center gap-1 text-xs text-gray-500 hover:text-blue-600 transition-colors disabled:cursor-default"
      aria-label={copied ? 'Copiado!' : label}
      aria-live="polite"
    >
      {copied ? <Check className="w-3.5 h-3.5 text-green-600" /> : <Copy className="w-3.5 h-3.5" />}
      <span>{copied ? 'Copiado!' : label}</span>
    </button>
  )
}
