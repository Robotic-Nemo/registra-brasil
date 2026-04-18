import Link from 'next/link'
import Image from 'next/image'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'
import { BarChart3, Award } from 'lucide-react'

export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Ranking de políticos — Registra Brasil',
  description: 'Ranking dos políticos brasileiros com mais declarações registradas no arquivo público.',
  alternates: { canonical: '/ranking' },
  openGraph: {
    title: 'Ranking de políticos com mais declarações registradas',
    description: 'Quais políticos brasileiros têm mais declarações documentadas com fonte primária.',
    type: 'website',
    url: `${SITE_URL}/ranking`,
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Ranking de políticos — Registra Brasil',
    description: 'Ranking pelos políticos com mais declarações registradas.',
  },
}

interface PoliticianRankRow {
  id: string
  slug: string
  common_name: string
  full_name: string
  party: string
  state: string | null
  photo_url: string | null
  statements: { count: number }[]
}

async function getRanking(limit = 50): Promise<(PoliticianRankRow & { count: number })[]> {
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state, photo_url, statements!inner(count)')
    .eq('is_active', true)
    .eq('statements.verification_status', 'verified')
    .limit(200)

  const rows = (data ?? []) as unknown as PoliticianRankRow[]
  return rows
    .map((p) => ({ ...p, count: p.statements[0]?.count ?? 0 }))
    .sort((a, b) => b.count - a.count)
    .slice(0, limit)
}

function medalFor(idx: number): string | null {
  if (idx === 0) return '🥇'
  if (idx === 1) return '🥈'
  if (idx === 2) return '🥉'
  return null
}

export default async function RankingPage() {
  const ranking = await getRanking(50)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: 'Ranking de políticos com mais declarações registradas',
    numberOfItems: ranking.length,
    itemListElement: ranking.map((p, i) => ({
      '@type': 'ListItem',
      position: i + 1,
      name: p.common_name,
      url: `${SITE_URL}/politico/${p.slug}`,
    })),
  }

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <Breadcrumbs items={[{ label: 'Ranking' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <BarChart3 className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Ranking de políticos</h1>
        </div>
        <p className="text-gray-600 max-w-2xl">
          Políticos com mais declarações verificadas no arquivo Registra Brasil, ordenados pela
          quantidade de registros documentados com fonte primária. Atualizado a cada hora.
        </p>
      </header>

      {ranking.length === 0 ? (
        <p className="text-gray-500">Sem dados disponíveis no momento.</p>
      ) : (
        <ol className="space-y-2" aria-label="Lista ordenada de políticos por número de declarações">
          {ranking.map((p, idx) => {
            const medal = medalFor(idx)
            return (
              <li
                key={p.slug}
                className="flex items-center gap-4 bg-white border border-gray-200 rounded-lg px-4 py-3 hover:border-blue-300 transition-colors"
              >
                <span
                  className="w-10 text-center font-bold text-gray-500 tabular-nums"
                  aria-label={`Posição ${idx + 1}`}
                >
                  {medal ?? `#${idx + 1}`}
                </span>
                {p.photo_url ? (
                  <Image
                    src={p.photo_url}
                    alt=""
                    width={48}
                    height={48}
                    className="rounded-full w-12 h-12 object-cover border border-gray-200"
                    referrerPolicy="no-referrer"
                  />
                ) : (
                  <div
                    className="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center font-bold text-gray-500"
                    aria-hidden="true"
                  >
                    {p.common_name[0] ?? '?'}
                  </div>
                )}
                <div className="flex-1 min-w-0">
                  <Link
                    href={`/politico/${p.slug}`}
                    className="font-semibold text-gray-900 hover:text-blue-700 hover:underline"
                  >
                    {p.common_name}
                  </Link>
                  <p className="text-xs text-gray-500">
                    <span className="font-mono">{p.party}</span>
                    {p.state ? ` · ${p.state}` : null}
                  </p>
                </div>
                <div className="text-right">
                  <p className="text-lg font-bold text-gray-900 tabular-nums">{p.count}</p>
                  <p className="text-xs text-gray-500">declarações</p>
                </div>
              </li>
            )
          })}
        </ol>
      )}

      <aside className="mt-12 bg-amber-50 border border-amber-200 rounded-lg p-5 flex gap-3">
        <Award className="w-6 h-6 text-amber-600 shrink-0" aria-hidden="true" />
        <div className="text-sm text-amber-900">
          <strong>Leitura crítica:</strong> a posição neste ranking reflete apenas o volume de
          declarações registradas no arquivo — não o conteúdo, gravidade ou relevância política.
          Use-o como ponto de partida para a pesquisa, não como juízo de valor.
        </div>
      </aside>
    </main>
  )
}
