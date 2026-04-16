'use client'

import { useState } from 'react'

interface EmbedWidgetProps {
  statementId: string
  politicianName: string
  summary: string
  date: string
  siteUrl?: string
}

type EmbedTheme = 'light' | 'dark'
type EmbedSize = 'compact' | 'default' | 'full'

export function EmbedWidget({
  statementId,
  politicianName,
  summary,
  date,
  siteUrl = 'https://registrabrasil.com.br',
}: EmbedWidgetProps) {
  const [theme, setTheme] = useState<EmbedTheme>('light')
  const [size, setSize] = useState<EmbedSize>('default')
  const [copied, setCopied] = useState(false)

  const url = `${siteUrl}/declaracao/${statementId}`

  const embedCode = `<blockquote class="registra-brasil-embed" data-theme="${theme}" data-size="${size}">
  <p>${summary}</p>
  <footer>— ${politicianName}, ${date}</footer>
  <a href="${url}" target="_blank" rel="noopener noreferrer">
    Ver no Registra Brasil
  </a>
</blockquote>
<script async src="${siteUrl}/embed.js" charset="utf-8"></script>`

  const iframeCode = `<iframe
  src="${siteUrl}/embed/declaracao/${statementId}?theme=${theme}&size=${size}"
  width="${size === 'compact' ? '350' : '500'}"
  height="${size === 'compact' ? '150' : '200'}"
  frameborder="0"
  style="border: 1px solid #e4e4e7; border-radius: 8px;"
  title="Declaração de ${politicianName} - Registra Brasil"
></iframe>`

  const handleCopy = async (code: string) => {
    try {
      await navigator.clipboard.writeText(code)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Fallback
      const textarea = document.createElement('textarea')
      textarea.value = code
      document.body.appendChild(textarea)
      textarea.select()
      document.execCommand('copy')
      document.body.removeChild(textarea)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    }
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center gap-4">
        <div>
          <label className="text-xs text-zinc-500 block mb-1">Tema</label>
          <select
            value={theme}
            onChange={(e) => setTheme(e.target.value as EmbedTheme)}
            className="text-sm border border-zinc-300 rounded px-2 py-1"
          >
            <option value="light">Claro</option>
            <option value="dark">Escuro</option>
          </select>
        </div>
        <div>
          <label className="text-xs text-zinc-500 block mb-1">Tamanho</label>
          <select
            value={size}
            onChange={(e) => setSize(e.target.value as EmbedSize)}
            className="text-sm border border-zinc-300 rounded px-2 py-1"
          >
            <option value="compact">Compacto</option>
            <option value="default">Padrão</option>
            <option value="full">Completo</option>
          </select>
        </div>
      </div>

      <div>
        <div className="flex items-center justify-between mb-1">
          <span className="text-xs font-medium text-zinc-600">Código HTML</span>
          <button
            onClick={() => handleCopy(embedCode)}
            className="text-xs text-blue-600 hover:text-blue-800"
          >
            {copied ? '✓ Copiado' : 'Copiar'}
          </button>
        </div>
        <pre className="bg-zinc-50 border border-zinc-200 rounded p-3 text-xs overflow-x-auto max-h-32">
          <code>{embedCode}</code>
        </pre>
      </div>

      <div>
        <div className="flex items-center justify-between mb-1">
          <span className="text-xs font-medium text-zinc-600">iFrame</span>
          <button
            onClick={() => handleCopy(iframeCode)}
            className="text-xs text-blue-600 hover:text-blue-800"
          >
            Copiar
          </button>
        </div>
        <pre className="bg-zinc-50 border border-zinc-200 rounded p-3 text-xs overflow-x-auto max-h-32">
          <code>{iframeCode}</code>
        </pre>
      </div>
    </div>
  )
}
