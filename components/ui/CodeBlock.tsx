'use client'

import { useState } from 'react'
import { Copy, Check } from 'lucide-react'

interface Props {
  code: string
  language?: string
  filename?: string
  showLineNumbers?: boolean
  className?: string
}

/**
 * Styled code display block with optional line numbers and copy button.
 * Uses monospace font and basic syntax highlighting via CSS.
 */
export function CodeBlock({
  code,
  language,
  filename,
  showLineNumbers = false,
  className = '',
}: Props) {
  const [copied, setCopied] = useState(false)

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(code)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Fallback: do nothing
    }
  }

  const lines = code.split('\n')

  return (
    <div className={`relative rounded-lg bg-gray-900 text-gray-100 text-sm overflow-hidden ${className}`}>
      {/* Header bar */}
      {(filename || language) && (
        <div className="flex items-center justify-between px-4 py-2 bg-gray-800 border-b border-gray-700">
          <span className="text-xs text-gray-400">{filename ?? language}</span>
          <button
            onClick={handleCopy}
            className="text-gray-400 hover:text-gray-200 transition-colors p-1"
            aria-label={copied ? 'Copiado' : 'Copiar codigo'}
          >
            {copied ? <Check className="w-3.5 h-3.5" /> : <Copy className="w-3.5 h-3.5" />}
          </button>
        </div>
      )}

      {/* Code area */}
      <div className="overflow-x-auto">
        <pre className="p-4 leading-relaxed">
          <code>
            {lines.map((line, i) => (
              <span key={i} className="block">
                {showLineNumbers && (
                  <span className="inline-block w-8 text-right text-gray-600 mr-4 select-none">
                    {i + 1}
                  </span>
                )}
                {line || ' '}
              </span>
            ))}
          </code>
        </pre>
      </div>

      {/* Floating copy button when no header */}
      {!filename && !language && (
        <button
          onClick={handleCopy}
          className="absolute top-2 right-2 text-gray-500 hover:text-gray-300 transition-colors p-1.5 rounded bg-gray-800/50"
          aria-label={copied ? 'Copiado' : 'Copiar codigo'}
        >
          {copied ? <Check className="w-3.5 h-3.5" /> : <Copy className="w-3.5 h-3.5" />}
        </button>
      )}
    </div>
  )
}
