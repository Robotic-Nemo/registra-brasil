'use client'

import { useState } from 'react'
import Link from 'next/link'
import { ExternalLink, ArrowUpDown } from 'lucide-react'
import type { SourceInfo } from '@/lib/supabase/queries/sources'
import type { SourceType } from '@/types/database'

interface SourceListProps {
  sources: SourceInfo[]
  total: number
}

const SOURCE_LABELS: Record<SourceType, string> = {
  youtube_video: 'YouTube',
  youtube_live_archive: 'YouTube Live',
  camara_tv: 'Camara TV',
  senado_tv: 'Senado TV',
  diario_oficial: 'Diario Oficial',
  transcript_pdf: 'PDF',
  news_article: 'Noticia',
  social_media_post: 'Rede Social',
  other: 'Outro',
}

export function SourceList({ sources, total }: SourceListProps) {
  const [filterType, setFilterType] = useState<string>('')
  const [searchTerm, setSearchTerm] = useState('')

  const filtered = sources.filter((s) => {
    const matchType = !filterType || s.primary_source_type === filterType
    const matchSearch = !searchTerm || s.primary_source_url.toLowerCase().includes(searchTerm.toLowerCase()) || s.summary.toLowerCase().includes(searchTerm.toLowerCase())
    return matchType && matchSearch
  })

  return (
    <div>
      {/* Filters */}
      <div className="flex flex-wrap gap-3 mb-4">
        <input
          type="text"
          placeholder="Buscar URL ou resumo..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 w-64"
        />
        <select
          value={filterType}
          onChange={(e) => setFilterType(e.target.value)}
          className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">Todos os tipos</option>
          {Object.entries(SOURCE_LABELS).map(([value, label]) => (
            <option key={value} value={value}>{label}</option>
          ))}
        </select>
        <span className="text-sm text-gray-500 self-center">
          {filtered.length} de {total} fontes
        </span>
      </div>

      {/* Table */}
      <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-gray-100 bg-gray-50">
                <th className="text-left px-4 py-2.5 font-medium text-gray-600">
                  <span className="inline-flex items-center gap-1">
                    Declaracao <ArrowUpDown className="w-3 h-3" />
                  </span>
                </th>
                <th className="text-left px-4 py-2.5 font-medium text-gray-600">Politico</th>
                <th className="text-left px-4 py-2.5 font-medium text-gray-600">Tipo</th>
                <th className="text-left px-4 py-2.5 font-medium text-gray-600">Data</th>
                <th className="text-left px-4 py-2.5 font-medium text-gray-600">URL</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {filtered.map((source) => (
                <tr key={source.id} className="hover:bg-gray-50 transition-colors">
                  <td className="px-4 py-2.5">
                    <Link
                      href={`/admin/editar/${source.id}`}
                      className="text-gray-900 hover:text-blue-700 font-medium line-clamp-1 max-w-xs"
                    >
                      {source.summary}
                    </Link>
                  </td>
                  <td className="px-4 py-2.5 text-gray-600">{source.politician_name}</td>
                  <td className="px-4 py-2.5">
                    <span className="inline-flex px-2 py-0.5 text-xs rounded-full bg-gray-100 text-gray-700">
                      {SOURCE_LABELS[source.primary_source_type] ?? source.primary_source_type}
                    </span>
                  </td>
                  <td className="px-4 py-2.5 text-gray-600 tabular-nums">
                    {new Date(source.statement_date).toLocaleDateString('pt-BR')}
                  </td>
                  <td className="px-4 py-2.5">
                    <a
                      href={source.primary_source_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-blue-600 hover:text-blue-800 truncate max-w-[200px]"
                    >
                      <ExternalLink className="w-3 h-3 shrink-0" />
                      <span className="truncate">{source.primary_source_url}</span>
                    </a>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        {filtered.length === 0 && (
          <div className="px-4 py-8 text-center text-sm text-gray-500">
            Nenhuma fonte encontrada.
          </div>
        )}
      </div>
    </div>
  )
}
