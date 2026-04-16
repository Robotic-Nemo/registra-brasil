'use client'

import { useState } from 'react'
import { Code, Check, Copy } from 'lucide-react'

interface Props {
  statementUrl: string
  summary: string
  politicianName: string
}

export function EmbedCode({ statementUrl, summary, politicianName }: Props) {
  const [open, setOpen] = useState(false)
  const [copied, setCopied] = useState(false)

  const siteUrl = typeof window !== 'undefined' ? window.location.origin : 'https://registrabrasil.com.br'
  const fullUrl = `${siteUrl}${statementUrl}`

  const embedHtml = `<blockquote cite="${fullUrl}">
  <p>&ldquo;${summary.replace(/"/g, '&quot;')}&rdquo;</p>
  <footer>&mdash; ${politicianName}, via <a href="${fullUrl}">Registra Brasil</a></footer>
</blockquote>`

  async function copyEmbed() {
    try {
      await navigator.clipboard.writeText(embedHtml)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch { /* ignore */ }
  }

  if (!open) {
    return (
      <button
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1 text-xs text-gray-500 hover:text-blue-600 transition-colors"
      >
        <Code className="w-3.5 h-3.5" />
        Incorporar
      </button>
    )
  }

  return (
    <div className="bg-gray-50 rounded-lg p-3 text-xs">
      <div className="flex items-center justify-between mb-2">
        <span className="font-medium text-gray-700">Código de incorporação</span>
        <button onClick={copyEmbed} className="inline-flex items-center gap-1 text-blue-600 hover:text-blue-800">
          {copied ? <Check className="w-3 h-3" /> : <Copy className="w-3 h-3" />}
          {copied ? 'Copiado!' : 'Copiar'}
        </button>
      </div>
      <pre className="bg-white border border-gray-200 rounded p-2 text-[11px] text-gray-600 overflow-x-auto whitespace-pre-wrap font-mono">
        {embedHtml}
      </pre>
    </div>
  )
}
