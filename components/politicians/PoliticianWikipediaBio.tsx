'use client'

import { useState } from 'react'
import { BookOpen, ExternalLink, ChevronDown, ChevronUp } from 'lucide-react'
import { renderWithGlossary } from '@/lib/glossary/render'

interface Props {
  excerpt: string
  sourceUrl: string | null
}

export function PoliticianWikipediaBio({ excerpt, sourceUrl }: Props) {
  const [open, setOpen] = useState(true)
  const short = excerpt.length > 320 ? excerpt.slice(0, 317) + '…' : excerpt

  return (
    <div className="bg-gray-50 border border-gray-200 rounded-lg p-4 text-sm">
      <div className="flex items-center gap-2 mb-2">
        <BookOpen className="w-4 h-4 text-gray-500" aria-hidden="true" />
        <p className="text-xs font-semibold text-gray-700 uppercase tracking-wider">Biografia</p>
        <button
          type="button"
          onClick={() => setOpen((v) => !v)}
          className="ml-auto inline-flex items-center gap-1 text-xs text-gray-500 hover:text-gray-700"
          aria-expanded={open}
        >
          {open ? <><ChevronUp className="w-3.5 h-3.5" /> Recolher</> : <><ChevronDown className="w-3.5 h-3.5" /> Expandir</>}
        </button>
      </div>
      {open ? (
        <p className="text-gray-800 leading-relaxed whitespace-pre-wrap">{renderWithGlossary(excerpt)}</p>
      ) : (
        <p className="text-gray-600 line-clamp-2">{short}</p>
      )}
      {sourceUrl && (
        <p className="text-[11px] text-gray-500 mt-2">
          Extrato do Wikipédia (CC BY-SA 4.0) ·{' '}
          <a
            href={sourceUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-0.5 underline hover:text-gray-700"
          >
            artigo completo <ExternalLink className="w-3 h-3" aria-hidden="true" />
          </a>
        </p>
      )}
    </div>
  )
}
