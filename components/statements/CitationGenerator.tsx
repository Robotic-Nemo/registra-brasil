'use client'

import { useMemo, useState } from 'react'
import { BookOpen, Copy, Check, ChevronDown } from 'lucide-react'
import { CITATION_STYLES, type CitationInput, type CitationStyleKey } from '@/lib/citations/format'

interface Props {
  statement: CitationInput
}

/**
 * Collapsible citation helper rendered in the statement share block.
 * Uses the shared formatters so the output matches what a server-side
 * RSS or PDF export would produce.
 */
export function CitationGenerator({ statement }: Props) {
  const [open, setOpen] = useState(false)
  const [style, setStyle] = useState<CitationStyleKey>('abnt')
  const [copied, setCopied] = useState(false)

  const text = useMemo(() => {
    const entry = CITATION_STYLES.find((s) => s.key === style) ?? CITATION_STYLES[0]
    return entry.fn(statement)
  }, [style, statement])

  async function onCopy() {
    try {
      await navigator.clipboard.writeText(text)
      setCopied(true)
      setTimeout(() => setCopied(false), 1500)
    } catch {
      // Fallback: select the text via a hidden textarea
    }
  }

  if (!open) {
    return (
      <button
        type="button"
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 text-xs px-3 py-1.5 border border-gray-300 text-gray-700 hover:bg-gray-50 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
      >
        <BookOpen className="w-3.5 h-3.5" aria-hidden="true" />
        Gerar citação acadêmica
        <ChevronDown className="w-3 h-3" aria-hidden="true" />
      </button>
    )
  }

  return (
    <div className="bg-white border border-gray-200 rounded-lg p-3 space-y-3 text-sm max-w-2xl">
      <div className="flex items-center justify-between">
        <p className="font-semibold text-gray-900 flex items-center gap-1.5">
          <BookOpen className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Citação acadêmica
        </p>
        <button type="button" onClick={() => setOpen(false)} className="text-xs text-gray-500 hover:text-gray-700">
          Fechar
        </button>
      </div>

      <div className="flex flex-wrap gap-1.5">
        {CITATION_STYLES.map((s) => (
          <button
            key={s.key}
            type="button"
            onClick={() => setStyle(s.key)}
            className={`text-xs px-2.5 py-1 rounded-full border transition-colors ${
              style === s.key
                ? 'bg-blue-600 border-blue-600 text-white'
                : 'border-gray-300 text-gray-700 hover:bg-gray-50'
            }`}
          >
            {s.label}
          </button>
        ))}
      </div>

      <div className="bg-gray-50 border border-gray-200 rounded p-3 text-xs font-mono text-gray-800 leading-relaxed whitespace-pre-wrap break-words">
        {text}
      </div>

      <div className="flex items-center justify-between text-xs text-gray-500">
        <span>
          {style === 'abnt' && 'NBR 6023/2018 — padrão brasileiro.'}
          {style === 'apa' && 'APA 7 — ciências sociais.'}
          {style === 'chicago' && 'Chicago 17 — humanidades.'}
          {style === 'mla' && 'MLA 9 — literatura e artes.'}
          {style === 'plain' && 'Formato simples para artigo jornalístico.'}
        </span>
        <button
          type="button"
          onClick={onCopy}
          className="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-600 hover:bg-blue-700 text-white rounded font-medium"
        >
          {copied ? <Check className="w-3.5 h-3.5" aria-hidden="true" /> : <Copy className="w-3.5 h-3.5" aria-hidden="true" />}
          {copied ? 'Copiado' : 'Copiar'}
        </button>
      </div>
    </div>
  )
}
