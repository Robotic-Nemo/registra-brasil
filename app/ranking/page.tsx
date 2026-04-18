import Link from 'next/link'
import Image from 'next/image'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'
import { BarChart3, TrendingUp, Flame, History } from 'lucide-react'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const MODES = [
  { key: 'weighted', label: 'Score ponderado', Icon: BarChart3, field: 'weighted_score', help: 'Severidade × decaimento exponencial (meia-vida de 365 dias)' },
  { key: 'recent', label: 'Atividade recente', Icon: Flame, field: 'recency_score', help: 'Apenas decaimento por recência; ignora severidade' },
  { key: 'count', label: 'Mais declarações', Icon: TrendingUp, field: 'statements_count', help: 'Contagem absoluta de declarações verificadas/disputadas' },
  { key: 'disputed', label: 'Mais contestadas', Icon: History, field: 'disputed_count', help: 'Políticos com mais declarações em status disputado' },
] as const

interface ScoreRow {
  politician_id: string
  statements_count: number
  verified_count: number
  disputed_count: number
  weighted_score: number
  recency_score: number
  severity_sum: number
  last_statement_date: string | null
}

interface Politician {
  id: string
  slug: string
  common_name: string
  party: string
  state: string | null
  photo_url: string | null
  photo_source_url: string | null
}

export async function generateMetadata({ searchParams }: {
  searchParams: Promise<{ mode?: string }>
}): Promise<Metadata> {
  const { mode } = await searchParams
  const active = MODES.find((m) => m.key === mode) ?? MODES[0]
  return {
    title: `Ranking — ${active.label} — Registra Brasil`,
    description: active.help,
    alternates: { canonical: `/ranking${mode && mode !== 'weighted' ? `?mode=${mode}` : ''}` },
    openGraph: {
      title: `Ranking — ${active.label} — Registra Brasil`,
      description: active.help,
      type: 'website',
      url: `${SITE_URL}/ranking`,
      siteName: 'Registra Brasil',
    },
  }
}

function medal(idx: number): string | null {
  if (idx === 0) return '🥇'
  if (idx === 1) return '🥈'
  if (idx === 2) return '🥉'
  return null
}

export default async function RankingPage({
  searchParams,
}: {
  searchParams: Promise<{ mode?: string }>
}) {
  const { mode } = await searchParams
  const active = MODES.find((m) => m.key === mode) ?? MODES[0]

  const supabase = getSupabaseServiceClient()

  const { data: scoreRows } = await (supabase.from('politician_activity_scores') as any)
    .select('politician_id, statements_count, verified_count, disputed_count, weighted_score, recency_score, severity_sum, last_statement_date')
    .order(active.field, { ascending: false })
    .limit(50)

  const scores = (scoreRows ?? []) as ScoreRow[]
  const ids = scores.map((s) => s.politician_id)

  const { data: polRows } = ids.length
    ? await (supabase.from('politicians') as any)
        .select('id, slug, common_name, party, state, photo_url, photo_source_url')
        .in('id', ids)
        .eq('is_active', true)
    : { data: [] as Politician[] }

  const polById = new Map<string, Politician>((polRows ?? []).map((p: Politician) => [p.id, p]))

  const ranked = scores
    .map((s) => ({ score: s, pol: polById.get(s.politician_id) }))
    .filter((x): x is { score: ScoreRow; pol: Politician } => Boolean(x.pol))

  const maxValue = Math.max(
    ...ranked.map((r) => Number(r.score[active.field as keyof ScoreRow]) || 0),
    1,
  )

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: `Ranking de políticos — ${active.label}`,
    numberOfItems: ranked.length,
    itemListElement: ranked.map((r, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: r.pol.common_name,
      url: `${SITE_URL}/politico/${r.pol.slug}`,
    })),
  }

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <Breadcrumbs items={[{ label: 'Ranking' }]} />

      <header className="mb-6">
        <div className="flex items-center gap-3 mb-2">
          <active.Icon className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Ranking: {active.label}</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">{active.help}</p>
      </header>

      <div className="flex flex-wrap gap-2 mb-6" role="tablist" aria-label="Modo de ranking">
        {MODES.map((m) => {
          const isActive = m.key === active.key
          return (
            <Link
              key={m.key}
              href={`/ranking?mode=${m.key}`}
              role="tab"
              aria-selected={isActive}
              className={`text-xs px-3 py-1.5 rounded-full border flex items-center gap-1.5 transition-colors ${
                isActive ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'
              }`}
            >
              <m.Icon className="w-3.5 h-3.5" aria-hidden="true" />
              {m.label}
            </Link>
          )
        })}
      </div>

      {ranked.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-4">
          Sem dados para este modo.
        </p>
      ) : (
        <ol className="flex flex-col gap-2">
          {ranked.map((r, i) => {
            const val = Number(r.score[active.field as keyof ScoreRow]) || 0
            const barWidth = Math.max(4, (val / maxValue) * 100)
            const m = medal(i)
            return (
              <li key={r.pol.id}>
                <Link
                  href={`/politico/${r.pol.slug}`}
                  className="flex items-center gap-3 bg-white border border-gray-200 rounded-lg p-3 hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
                >
                  <span className="w-8 text-right text-sm tabular-nums text-gray-500 flex-shrink-0">
                    {m ?? `${i + 1}.`}
                  </span>
                  {r.pol.photo_url ? (
                    <Image
                      src={r.pol.photo_url}
                      alt=""
                      width={40}
                      height={40}
                      unoptimized
                      className="w-10 h-10 rounded-full object-cover border border-gray-200 flex-shrink-0"
                    />
                  ) : (
                    <div className="w-10 h-10 rounded-full bg-gray-100 flex-shrink-0 flex items-center justify-center text-gray-400 text-sm font-bold">
                      {r.pol.common_name[0] ?? '?'}
                    </div>
                  )}
                  <div className="flex-1 min-w-0">
                    <p className="font-semibold text-gray-900 truncate">{r.pol.common_name}</p>
                    <p className="text-xs text-gray-500">
                      {r.pol.party}{r.pol.state ? `-${r.pol.state}` : ''}
                      {' · '}
                      {r.score.statements_count} declaraç{r.score.statements_count === 1 ? 'ão' : 'ões'}
                      {r.score.disputed_count > 0 && (
                        <span className="text-amber-700"> · {r.score.disputed_count} contestadas</span>
                      )}
                    </p>
                    <div className="h-1.5 bg-gray-100 rounded-full mt-1.5 overflow-hidden">
                      <div
                        className="h-full bg-gradient-to-r from-blue-500 to-blue-700"
                        style={{ width: `${barWidth}%` }}
                        aria-hidden="true"
                      />
                    </div>
                  </div>
                  <span className="tabular-nums text-sm font-mono text-blue-700 flex-shrink-0">
                    {active.field === 'statements_count' || active.field === 'disputed_count'
                      ? val.toLocaleString('pt-BR')
                      : val.toFixed(1)}
                  </span>
                </Link>
              </li>
            )
          })}
        </ol>
      )}

      <footer className="mt-8 text-xs text-gray-500 border-t border-gray-200 pt-4 space-y-1">
        <p>
          Cache: 30 min. Materialização do score é refeita pelo cron diário em{' '}
          <code>/api/maintenance/refresh-scores</code>.
        </p>
        <p>
          <strong>Score ponderado</strong> combina severidade (×0,6 a ×1,4 para severidades 1–5) e
          decaimento exponencial por idade (meia-vida de 365 dias): uma declaração de 1 ano atrás
          vale metade de uma de hoje; de 2 anos, um quarto; e assim por diante.
        </p>
      </footer>
    </main>
  )
}
