import { getSupabaseServerClient } from '@/lib/supabase/server'
import { PoliticianCard } from '@/components/politicians/PoliticianCard'
import { BRAZILIAN_STATES, getStateName } from '@/lib/constants/states'
import type { Politician } from '@/types/database'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Politicos por Estado — Registra Brasil',
  description: 'Politicos brasileiros monitorados, agrupados por estado.',
  alternates: { canonical: '/politicos/por-estado' },
}

export default async function PoliticosPorEstadoPage() {
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

  // Group by state
  const grouped: Record<string, typeof typedPoliticians> = {}
  for (const p of typedPoliticians) {
    const state = p.state ?? 'Sem estado'
    if (!grouped[state]) grouped[state] = []
    grouped[state].push(p)
  }

  // Sort states: use BRAZILIAN_STATES order, then any extra
  const orderedStates = BRAZILIAN_STATES
    .map((s) => s.uf)
    .filter((uf) => grouped[uf])

  if (grouped['Sem estado']) {
    orderedStates.push('Sem estado')
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Politicos por Estado</h1>
      <p className="text-gray-500 text-sm mb-8">
        {typedPoliticians.length} politicos agrupados por unidade federativa.
      </p>

      {/* Quick nav */}
      <div className="flex flex-wrap gap-1.5 mb-8">
        {orderedStates.map((uf) => (
          <a
            key={uf}
            href={`#state-${uf}`}
            className="text-xs px-2 py-1 bg-gray-100 hover:bg-blue-100 text-gray-700 hover:text-blue-700 rounded transition-colors tabular-nums"
          >
            {uf} ({grouped[uf].length})
          </a>
        ))}
      </div>

      {orderedStates.length === 0 && (
        <p className="text-center py-16 text-gray-500 text-sm">
          Nenhum político encontrado.
        </p>
      )}

      <div className="space-y-10">
        {orderedStates.map((uf) => {
          const pols = grouped[uf]
          return (
            <section key={uf} id={`state-${uf}`}>
              <h2 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
                <span className="text-blue-600">{uf}</span>
                <span className="text-gray-400 font-normal text-sm">
                  {uf !== 'Sem estado' ? getStateName(uf) : ''} — {pols.length}{' '}
                  {pols.length === 1 ? 'politico' : 'politicos'}
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
