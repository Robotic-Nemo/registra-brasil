'use client'

import { useMemo, useState } from 'react'
import { Code, Check, Copy } from 'lucide-react'

interface Props {
  statementUrl: string
  summary: string
  politicianName: string
}

type Theme = 'light' | 'dark' | 'auto'
type Size = 'sm' | 'md' | 'lg'

const SIZE_HEIGHT: Record<Size, number> = { sm: 180, md: 220, lg: 280 }

export function EmbedCode({ statementUrl, summary, politicianName }: Props) {
  const [open, setOpen] = useState(false)
  const [copied, setCopied] = useState<null | 'iframe' | 'quote'>(null)
  const [theme, setTheme] = useState<Theme>('auto')
  const [size, setSize] = useState<Size>('md')
  const [hidePhoto, setHidePhoto] = useState(false)
  const [hideMeta, setHideMeta] = useState(false)

  const siteUrl = typeof window !== 'undefined' ? window.location.origin : 'https://registrabrasil.com.br'
  const fullUrl = `${siteUrl}${statementUrl}`

  // The embed URL; statementUrl is /declaracao/<slug|id>, we reroute to /embed/declaracao/<…>.
  const embedParams = new URLSearchParams()
  if (theme !== 'auto') embedParams.set('theme', theme)
  if (size !== 'md') embedParams.set('size', size)
  if (hidePhoto) embedParams.set('hide_photo', '1')
  if (hideMeta) embedParams.set('hide_meta', '1')
  const qs = embedParams.toString()
  const idPart = statementUrl.replace(/^\/declaracao\//, '')
  const embedUrl = `${siteUrl}/embed/declaracao/${idPart}${qs ? `?${qs}` : ''}`

  const iframeHtml = useMemo(
    () => `<iframe src="${embedUrl}" width="100%" height="${SIZE_HEIGHT[size]}" style="border:1px solid #e5e7eb;border-radius:12px;max-width:560px" loading="lazy" title="Declaração — Registra Brasil"></iframe>`,
    [embedUrl, size],
  )

  const quoteHtml = `<blockquote cite="${fullUrl}">
  <p>&ldquo;${summary.replace(/"/g, '&quot;')}&rdquo;</p>
  <footer>&mdash; ${politicianName}, via <a href="${fullUrl}">Registra Brasil</a></footer>
</blockquote>`

  async function copy(text: string, which: 'iframe' | 'quote') {
    try {
      await navigator.clipboard.writeText(text)
      setCopied(which)
      setTimeout(() => setCopied(null), 2000)
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
    <div className="rounded-lg border border-gray-200 bg-gray-50 p-3 text-xs">
      <div className="mb-3 flex flex-wrap items-center gap-2">
        <span className="font-medium text-gray-700">Incorporar — configurar</span>
      </div>

      <div className="mb-3 grid gap-2 md:grid-cols-3">
        <label className="grid gap-1">
          <span className="text-[10px] uppercase tracking-wider text-gray-500">Tema</span>
          <select
            value={theme}
            onChange={(e) => setTheme(e.target.value as Theme)}
            className="rounded border border-gray-300 bg-white px-2 py-1 text-xs"
          >
            <option value="auto">Auto (sistema)</option>
            <option value="light">Claro</option>
            <option value="dark">Escuro</option>
          </select>
        </label>
        <label className="grid gap-1">
          <span className="text-[10px] uppercase tracking-wider text-gray-500">Tamanho</span>
          <select
            value={size}
            onChange={(e) => setSize(e.target.value as Size)}
            className="rounded border border-gray-300 bg-white px-2 py-1 text-xs"
          >
            <option value="sm">Compacto ({SIZE_HEIGHT.sm}px)</option>
            <option value="md">Médio ({SIZE_HEIGHT.md}px)</option>
            <option value="lg">Grande ({SIZE_HEIGHT.lg}px)</option>
          </select>
        </label>
        <div className="grid gap-1">
          <span className="text-[10px] uppercase tracking-wider text-gray-500">Esconder</span>
          <div className="flex items-center gap-2 py-1">
            <label className="inline-flex items-center gap-1">
              <input type="checkbox" checked={hidePhoto} onChange={(e) => setHidePhoto(e.target.checked)} />
              Foto
            </label>
            <label className="inline-flex items-center gap-1">
              <input type="checkbox" checked={hideMeta} onChange={(e) => setHideMeta(e.target.checked)} />
              Metadados
            </label>
          </div>
        </div>
      </div>

      <details open className="mb-3">
        <summary className="cursor-pointer font-medium text-gray-700">
          Pré-visualização
        </summary>
        <div className="mt-2 overflow-hidden rounded border border-gray-200 bg-white">
          <iframe
            key={embedUrl}
            src={embedUrl}
            width="100%"
            height={SIZE_HEIGHT[size]}
            style={{ border: 0 }}
            title="Pré-visualização"
          />
        </div>
      </details>

      <div className="mb-2 flex items-center justify-between">
        <span className="font-medium text-gray-700">Iframe (recomendado)</span>
        <button onClick={() => copy(iframeHtml, 'iframe')} className="inline-flex items-center gap-1 text-blue-600 hover:text-blue-800">
          {copied === 'iframe' ? <Check className="h-3 w-3" /> : <Copy className="h-3 w-3" />}
          {copied === 'iframe' ? 'Copiado!' : 'Copiar'}
        </button>
      </div>
      <pre className="mb-3 overflow-x-auto whitespace-pre-wrap rounded border border-gray-200 bg-white p-2 font-mono text-[11px] text-gray-600">
        {iframeHtml}
      </pre>

      <div className="mb-2 flex items-center justify-between">
        <span className="font-medium text-gray-700">HTML (blockquote, texto puro)</span>
        <button onClick={() => copy(quoteHtml, 'quote')} className="inline-flex items-center gap-1 text-blue-600 hover:text-blue-800">
          {copied === 'quote' ? <Check className="h-3 w-3" /> : <Copy className="h-3 w-3" />}
          {copied === 'quote' ? 'Copiado!' : 'Copiar'}
        </button>
      </div>
      <pre className="overflow-x-auto whitespace-pre-wrap rounded border border-gray-200 bg-white p-2 font-mono text-[11px] text-gray-600">
        {quoteHtml}
      </pre>
    </div>
  )
}
