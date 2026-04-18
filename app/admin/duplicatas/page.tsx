import Link from 'next/link'
import { ArrowLeft, Copy, AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { findAllSimilarPairs } from '@/lib/utils/similar-statements'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ threshold?: string; days?: string }>
}

export default async function DuplicatasPage({ searchParams }: PageProps) {
  const { threshold: tParam, days: dParam } = await searchParams
  const threshold = Math.min(0.95, Math.max(0.4, parseFloat(tParam ?? '0.6')))
  const days = Math.min(3650, Math.max(0, parseInt(dParam ?? '180', 10) || 180))
  const sinceDate = days > 0
    ? new Date(Date.now() - days * 86400_000).toISOString().slice(0, 10)
    : undefined

  const supabase = getSupabaseServiceClient()
  const pairs = await findAllSimilarPairs(supabase, {
    minSimilarity: threshold,
    sinceDate,
    limit: 200,
  })

  // Join politician names in a single query.
  const polIds = [...new Set(pairs.flatMap((p) => [p.politician_id_a, p.politician_id_b]))]
  const { data: pols } = polIds.length
    ? await supabase.from('politicians').select('id, common_name, party').in('id', polIds)
    : { data: [] as { id: string; common_name: string; party: string }[] }
  const polById = new Map((pols ?? []).map((p: any) => [p.id, p as { id: string; common_name: string; party: string }]))

  const presets = [
    { label: '180 dias · 0.6', days: 180, threshold: 0.6 },
    { label: '90 dias · 0.7', days: 90, threshold: 0.7 },
    { label: 'Tudo · 0.8', days: 0, threshold: 0.8 },
  ]

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <Copy className="w-5 h-5 text-orange-500" />
            Detecção de duplicatas
          </h1>
          <p className="text-sm text-gray-500">
            pg_trgm similarity ≥ {threshold} {days > 0 ? `• últimos ${days} dias` : '• corpus completo'}
            {' • '}
            {pairs.length} par{pairs.length === 1 ? '' : 'es'}
          </p>
        </div>
      </div>

      <div className="flex flex-wrap gap-2 mb-5">
        {presets.map((p) => {
          const active = p.days === days && Math.abs(p.threshold - threshold) < 0.01
          return (
            <Link
              key={p.label}
              href={`/admin/duplicatas?days=${p.days}&threshold=${p.threshold}`}
              className={`text-xs px-3 py-1.5 rounded-full border transition-colors ${
                active ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'
              }`}
            >
              {p.label}
            </Link>
          )
        })}
      </div>

      {pairs.length === 0 && (
        <p className="text-sm text-gray-600 bg-green-50 border border-green-200 rounded-lg p-4">
          Nenhuma duplicata acima do limiar — o acervo está limpo nesta faixa.
        </p>
      )}

      <ul className="flex flex-col gap-4">
        {pairs.map((p) => {
          const polA = polById.get(p.politician_id_a)
          const polB = polById.get(p.politician_id_b)
          const samePol = p.politician_id_a === p.politician_id_b
          return (
            <li key={`${p.id_a}-${p.id_b}`} className="bg-white border border-gray-200 rounded-lg p-4">
              <div className="flex items-center justify-between mb-2">
                <span className={`text-xs font-semibold px-2 py-0.5 rounded ${
                  p.similarity >= 0.85 ? 'bg-red-100 text-red-800' :
                  p.similarity >= 0.7 ? 'bg-orange-100 text-orange-800' :
                  'bg-yellow-100 text-yellow-800'
                }`}>
                  {(p.similarity * 100).toFixed(0)}% similar
                </span>
                {samePol && (
                  <span className="text-xs text-gray-500 flex items-center gap-1">
                    <AlertTriangle className="w-3.5 h-3.5" aria-hidden="true" />
                    Mesmo político
                  </span>
                )}
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                {[
                  { id: p.id_a, summary: p.summary_a, date: p.date_a, pol: polA },
                  { id: p.id_b, summary: p.summary_b, date: p.date_b, pol: polB },
                ].map((s) => (
                  <div key={s.id} className="border border-gray-100 rounded p-3 bg-gray-50">
                    <p className="text-xs text-gray-500 mb-1">
                      {s.pol ? `${s.pol.common_name} (${s.pol.party})` : 'Político desconhecido'}
                      {' · '}{s.date}
                    </p>
                    <p className="text-gray-900 mb-2">{s.summary}</p>
                    <Link href={`/admin/editar/${s.id}`} className="text-xs text-blue-700 underline">
                      Editar
                    </Link>
                  </div>
                ))}
              </div>
              <div className="mt-2 flex justify-end">
                <Link
                  href={`/admin/merge?a=${p.id_a}&b=${p.id_b}`}
                  className="inline-flex items-center gap-1 text-xs bg-purple-700 hover:bg-purple-800 text-white px-2.5 py-1 rounded font-medium"
                >
                  Mesclar →
                </Link>
              </div>
            </li>
          )
        })}
      </ul>
    </main>
  )
}
