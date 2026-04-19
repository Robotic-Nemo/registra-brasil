'use client'

import { useState } from 'react'
import { Check, FileText } from 'lucide-react'

interface Props {
  politicianName: string
  politicianParty?: string | null
  politicianState?: string | null
  statementDate: string
  quote: string
  permalink: string
  primarySourceUrl: string
}

/**
 * Builds a clean Markdown block ready to paste into Substack, Notion,
 * GitHub issues, or any editor that speaks Markdown, and copies it.
 * Avoids pulling in a dependency — just a short template.
 */
export function CopyMarkdownButton({
  politicianName, politicianParty, politicianState,
  statementDate, quote, permalink, primarySourceUrl,
}: Props) {
  const [copied, setCopied] = useState(false)

  function fmtDate(): string {
    return new Date(statementDate + 'T12:00:00Z').toLocaleDateString('pt-BR', {
      year: 'numeric', month: 'long', day: '2-digit',
    })
  }

  function build(): string {
    const byline = politicianParty
      ? `${politicianName} (${politicianParty}${politicianState ? `-${politicianState}` : ''})`
      : politicianName
    const escaped = quote.replace(/\r?\n/g, '\n> ')
    return [
      `> ${escaped}`,
      ``,
      `— **${byline}** — ${fmtDate()} · via [Registra Brasil](${permalink}) · [fonte original](${primarySourceUrl})`,
      ``,
    ].join('\n')
  }

  async function copy() {
    try {
      await navigator.clipboard.writeText(build())
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // ignore
    }
  }

  return (
    <button
      type="button"
      onClick={copy}
      className="inline-flex items-center gap-1 text-xs text-gray-500 hover:text-indigo-700 transition-colors"
      aria-label="Copiar como Markdown"
    >
      {copied ? <Check className="w-3.5 h-3.5" aria-hidden /> : <FileText className="w-3.5 h-3.5" aria-hidden />}
      {copied ? 'Copiado!' : 'Copiar como Markdown'}
    </button>
  )
}
