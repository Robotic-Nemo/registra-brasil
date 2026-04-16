'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Copy, Check, X, ChevronDown, ChevronUp } from 'lucide-react'
import type { DuplicateCandidate } from '@/lib/utils/duplicate-detection'

interface DuplicateListProps {
  duplicates: DuplicateCandidate[]
}

export function DuplicateList({ duplicates }: DuplicateListProps) {
  const [dismissed, setDismissed] = useState<Set<string>>(new Set())
  const [expanded, setExpanded] = useState<Set<string>>(new Set())

  const visible = duplicates.filter((d) => !dismissed.has(`${d.idA}:${d.idB}`))

  function dismiss(idA: string, idB: string) {
    setDismissed((prev) => new Set(prev).add(`${idA}:${idB}`))
  }

  function toggleExpand(key: string) {
    setExpanded((prev) => {
      const next = new Set(prev)
      if (next.has(key)) next.delete(key)
      else next.add(key)
      return next
    })
  }

  if (visible.length === 0) {
    return (
      <div className="bg-white border border-gray-200 rounded-xl p-8 text-center">
        <Copy className="w-8 h-8 text-gray-300 mx-auto mb-2" />
        <p className="text-sm text-gray-500">Nenhuma duplicata potencial encontrada.</p>
      </div>
    )
  }

  return (
    <div className="space-y-3">
      <p className="text-sm text-gray-500">{visible.length} duplicatas potenciais</p>

      {visible.map((dup) => {
        const key = `${dup.idA}:${dup.idB}`
        const isExpanded = expanded.has(key)
        const simPct = Math.round(dup.similarity * 100)

        return (
          <div key={key} className="bg-white border border-gray-200 rounded-xl overflow-hidden">
            <div
              className="flex items-center gap-3 px-4 py-3 cursor-pointer hover:bg-gray-50 transition-colors"
              onClick={() => toggleExpand(key)}
            >
              <div className={`w-10 h-10 rounded-full flex items-center justify-center text-xs font-bold ${
                simPct >= 80 ? 'bg-red-100 text-red-700' :
                simPct >= 60 ? 'bg-yellow-100 text-yellow-700' :
                'bg-orange-100 text-orange-700'
              }`}>
                {simPct}%
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-gray-900 truncate">{dup.summaryA}</p>
                <p className="text-xs text-gray-500">{dup.reason}</p>
              </div>
              {isExpanded ? <ChevronUp className="w-4 h-4 text-gray-400" /> : <ChevronDown className="w-4 h-4 text-gray-400" />}
            </div>

            {isExpanded && (
              <div className="px-4 pb-4 border-t border-gray-100">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mt-3">
                  <div className="p-3 bg-gray-50 rounded-lg">
                    <p className="text-xs font-medium text-gray-500 mb-1">Declaracao A</p>
                    <p className="text-sm text-gray-900">{dup.summaryA}</p>
                    <p className="text-xs text-gray-500 mt-1">
                      {dup.politicianA} &middot; {new Date(dup.dateA).toLocaleDateString('pt-BR')}
                    </p>
                    <Link href={`/admin/editar/${dup.idA}`} className="text-xs text-blue-600 hover:text-blue-800 mt-1 inline-block">
                      Editar
                    </Link>
                  </div>
                  <div className="p-3 bg-gray-50 rounded-lg">
                    <p className="text-xs font-medium text-gray-500 mb-1">Declaracao B</p>
                    <p className="text-sm text-gray-900">{dup.summaryB}</p>
                    <p className="text-xs text-gray-500 mt-1">
                      {dup.politicianB} &middot; {new Date(dup.dateB).toLocaleDateString('pt-BR')}
                    </p>
                    <Link href={`/admin/editar/${dup.idB}`} className="text-xs text-blue-600 hover:text-blue-800 mt-1 inline-block">
                      Editar
                    </Link>
                  </div>
                </div>

                <div className="flex gap-2 mt-3">
                  <button
                    onClick={() => dismiss(dup.idA, dup.idB)}
                    className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-gray-600 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors"
                  >
                    <X className="w-3 h-3" />
                    Dispensar
                  </button>
                  <Link
                    href={`/admin/editar/${dup.idA}`}
                    className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors"
                  >
                    <Check className="w-3 h-3" />
                    Revisar
                  </Link>
                </div>
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
