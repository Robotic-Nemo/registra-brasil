import { getSupabaseServerClient } from '@/lib/supabase/server'
import { PoliticianCard } from '@/components/politicians/PoliticianCard'
import { getPartyColor } from '@/lib/constants/party-colors'
import type { Politician } from '@/types/database'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Politicos por Partido — Registra Brasil',
  description: 'Politicos brasileiros monitorados, agrupados por partido.',
  alternates: { canonical: '/politicos/por-partido' },
}

export default async function PoliticosPorPartidoPage() {
  const supabase = await getSupabaseServerClient()

  const [{ data: politicians }, { data: countRows }] = await Promise.all([
    supabase
      .from('politicians')
      .select('id, slug, common_name, full_name, party, state, photo_url')
      .eq('is_active', true)
      .order('common_name', { ascending: true }),
    supabase
      .from('statements')
      .select('politician_id')
      .eq('verification_status', 'verified'),
  ])

  const countMap: Record<string, number> = {}
  for (const row of (countRows ?? []) as { politician_id: string }[]) {
    countMap[row.politician_id] = (countMap[row.politician_id] ?? 0) + 1
  }

  const typedPoliticians = (politicians ?? []) as Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]

  // Group by party
  const grouped: Record<string, typeof typedPoliticians> = {}
  for (const p of typedPoliticians) {
    const party = p.party || 'Sem partido'
    if (!grouped[party]) grouped[party] = []
    grouped[party].push(p)
  }

  // Sort parties by count (descending)
  const orderedParties = Object.keys(grouped).sort(
    (a, b) => grouped[b].length - grouped[a].length
  )

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Politicos por Partido</h1>
      <p className="text-gray-500 text-sm mb-8">
        {typedPoliticians.length} politicos em {orderedParties.length} partidos.
      </p>

      {/* Quick nav */}
      <div className="flex flex-wrap gap-1.5 mb-8">
        {orderedParties.map((party) => (
          <a
            key={party}
            href={`#party-${party}`}
            className="text-xs px-2 py-1 rounded font-mono text-white transition-opacity hover:opacity-80 tabular-nums"
            style={{ backgroundColor: getPartyColor(party) }}
          >
            {party} ({grouped[party].length})
          </a>
        ))}
      </div>

      {orderedParties.length === 0 && (
        <p className="text-center py-16 text-gray-500 text-sm">
          Nenhum político encontrado.
        </p>
      )}

      <div className="space-y-10">
        {orderedParties.map((party) => {
          const pols = grouped[party]
          return (
            <section key={party} id={`party-${party}`}>
              <h2 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
                <span
                  className="w-3 h-3 rounded-full flex-shrink-0"
                  style={{ backgroundColor: getPartyColor(party) }}
                />
                <span translate="no">{party}</span>
                <span className="text-gray-400 font-normal text-sm">
                  {pols.length} {pols.length === 1 ? 'politico' : 'politicos'}
                </span>
              </h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                {pols.map((p) => (
                  <PoliticianCard key={p.slug} politician={p} statementCount={countMap[p.id] ?? 0} />
                ))}
              </div>
            </section>
          )
        })}
      </div>
    </main>
  )
}
