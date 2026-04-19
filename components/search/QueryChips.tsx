'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { X, Info } from 'lucide-react'
import { parseSearchQuery, tokensToQueryString, type Token } from '@/lib/search/parse'

interface Props {
  q: string
}

const TOKEN_TONES: Record<Token['kind'], string> = {
  phrase: 'bg-blue-50 border-blue-200 text-blue-900',
  term: 'bg-gray-50 border-gray-200 text-gray-800',
  negation: 'bg-red-50 border-red-200 text-red-900',
  or: 'bg-purple-50 border-purple-200 text-purple-900',
  field: 'bg-amber-50 border-amber-200 text-amber-900',
}

function tokenLabel(t: Token): string {
  switch (t.kind) {
    case 'phrase': return `"${t.value}"`
    case 'term': return t.value
    case 'negation': return `não: ${t.value}`
    case 'or': return 'OU'
    case 'field': return `${t.key}: ${t.value}`
  }
}

/**
 * Chips displayed above search results that surface how the query
 * was parsed. Each non-OR chip has an × button that rebuilds the
 * query string without it and navigates. Helps users learn the
 * operator syntax (quoted phrases, -negation, politico:slug, etc.)
 */
export function QueryChips({ q }: Props) {
  const router = useRouter()
  const sp = useSearchParams()
  const tokens = parseSearchQuery(q)
  if (tokens.length <= 1) return null

  function removeAt(idx: number) {
    const next = tokens.filter((_, i) => i !== idx)
    const params = new URLSearchParams(sp.toString())
    const qs = tokensToQueryString(next).trim()
    if (qs) params.set('q', qs)
    else params.delete('q')
    router.push(`/buscar?${params.toString()}`)
  }

  return (
    <div className="flex items-start gap-2 mb-4 flex-wrap" role="group" aria-label="Filtros de busca">
      <Info className="w-3.5 h-3.5 text-gray-400 flex-shrink-0 mt-1" aria-hidden="true" />
      <p className="text-[11px] text-gray-500 mt-0.5">Interpretado como:</p>
      {tokens.map((t, i) => (
        <span
          key={i}
          className={`inline-flex items-center gap-1 text-xs px-2 py-0.5 rounded-full border font-mono ${TOKEN_TONES[t.kind]}`}
        >
          {tokenLabel(t)}
          {t.kind !== 'or' && (
            <button
              type="button"
              onClick={() => removeAt(i)}
              aria-label={`Remover ${tokenLabel(t)}`}
              className="inline-flex items-center justify-center w-3.5 h-3.5 hover:text-red-700"
            >
              <X className="w-3 h-3" aria-hidden="true" />
            </button>
          )}
        </span>
      ))}
      <a
        href="/api-docs#search-operators"
        className="inline-flex items-center gap-0.5 text-[11px] text-blue-700 hover:underline ml-auto mt-1"
      >
        operadores
      </a>
    </div>
  )
}
