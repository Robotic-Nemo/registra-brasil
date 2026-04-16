'use client'

import { useState } from 'react'
import { Share2, Code, Flag } from 'lucide-react'
import { ShareCard } from './ShareCard'
import { EmbedCode } from './EmbedCode'

interface Props {
  permalink: string
  summary: string
  politicianName: string
}

export function StatementActions({ permalink, summary, politicianName }: Props) {
  const [activeTab, setActiveTab] = useState<'share' | 'embed' | null>(null)

  const shareText = `${politicianName}: "${summary.slice(0, 100)}..." — Registra Brasil`

  return (
    <div className="border-t border-gray-100 pt-4">
      <div className="flex items-center gap-3 mb-3">
        <button
          onClick={() => setActiveTab(activeTab === 'share' ? null : 'share')}
          className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded transition-colors ${
            activeTab === 'share' ? 'bg-blue-50 text-blue-700' : 'text-gray-500 hover:text-blue-600'
          }`}
        >
          <Share2 className="w-3.5 h-3.5" />
          Compartilhar
        </button>
        <button
          onClick={() => setActiveTab(activeTab === 'embed' ? null : 'embed')}
          className={`inline-flex items-center gap-1 text-xs font-medium px-2 py-1 rounded transition-colors ${
            activeTab === 'embed' ? 'bg-blue-50 text-blue-700' : 'text-gray-500 hover:text-blue-600'
          }`}
        >
          <Code className="w-3.5 h-3.5" />
          Incorporar
        </button>
        <a
          href={`mailto:contato@registrabrasil.com.br?subject=Reportar declaração&body=Permalink: ${permalink}`}
          className="inline-flex items-center gap-1 text-xs text-gray-400 hover:text-red-500 transition-colors ml-auto"
        >
          <Flag className="w-3 h-3" />
          Reportar
        </a>
      </div>

      {activeTab === 'share' && (
        <ShareCard url={permalink} text={shareText} />
      )}

      {activeTab === 'embed' && (
        <EmbedCode
          statementUrl={permalink}
          summary={summary}
          politicianName={politicianName}
        />
      )}
    </div>
  )
}
