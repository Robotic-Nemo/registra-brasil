import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { groupIntoNarratives } from '@/lib/utils/narrative'
import { NarrativeCard } from '@/components/narratives/NarrativeCard'
import { NarrativeTimeline } from '@/components/narratives/NarrativeTimeline'
import { NarrativeHeader } from '@/components/narratives/NarrativeHeader'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Narrativas — Registra Brasil',
  description: 'Threads narrativos agrupando declaracoes relacionadas de politicos brasileiros.',
  alternates: { canonical: '/narrativas' },
}

export default async function NarrativasPage() {
  const supabase = getSupabaseServiceClient()

  const { data } = await supabase
    .from('statements')
    .select('id, summary, statement_date, politician_id, politicians!inner(id, slug, common_name, party), statement_categories(is_primary, categories(slug, label_pt, color_hex))')
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(500)

  const statementsForNarrative = ((data ?? []) as unknown as {
    id: string
    summary: string
    statement_date: string
    politician_id: string
    politicians: { id: string; slug: string; common_name: string; party: string }
    statement_categories: { is_primary: boolean; categories: { slug: string; label_pt: string; color_hex: string } }[]
  }[]).map((s) => ({
    id: s.id,
    summary: s.summary,
    statement_date: s.statement_date,
    politician_id: s.politician_id,
    politician_name: s.politicians.common_name,
    politician_party: s.politicians.party,
    politician_slug: s.politicians.slug,
    categories: (s.statement_categories ?? [])
      .filter((sc) => sc.is_primary)
      .map((sc) => ({
        slug: sc.categories.slug,
        label: sc.categories.label_pt,
        color: sc.categories.color_hex,
      })),
  }))

  const storylines = groupIntoNarratives(statementsForNarrative)
  const featured = storylines[0]

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs items={[{ label: 'Narrativas' }]} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Narrativas</h1>
      <p className="text-gray-600 mb-8">
        Declaracoes agrupadas em threads narrativos por tema e politico.
      </p>

      {featured && (
        <section className="mb-8">
          <NarrativeHeader thread={featured.thread} />
          <div className="mt-4">
            <NarrativeTimeline statements={featured.statements} />
          </div>
        </section>
      )}

      {storylines.length > 1 && (
        <section>
          <h2 className="font-semibold text-gray-900 text-lg mb-4">Outras narrativas</h2>
          <div className="grid gap-4">
            {storylines.slice(1, 20).map((storyline) => (
              <NarrativeCard key={storyline.thread.id} thread={storyline.thread} />
            ))}
          </div>
        </section>
      )}

      {storylines.length === 0 && (
        <p className="text-center text-gray-500 py-12">
          Nenhuma narrativa identificada com os dados disponiveis.
        </p>
      )}
    </main>
  )
}
