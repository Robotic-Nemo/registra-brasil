import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { BRAZILIAN_STATES } from '@/lib/supabase/queries/states'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { ArrowLeft, BarChart3, MapPin } from 'lucide-react'
import { aggregate, topCategoriesFor, type StatementForAnalytics } from '@/lib/analytics/aggregate-statements'
import { AnalyticsScorecard } from '@/components/analytics/AnalyticsScorecard'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps { params: Promise<{ uf: string }> }

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { uf } = await params
  const ufUpper = uf.toUpperCase()
  const stateName = BRAZILIAN_STATES[ufUpper]
  const state = stateName ? { uf: ufUpper, name: stateName } : undefined
  if (!state) return { title: 'Estado não encontrado' }
  return {
    title: `Análise: ${state.name} (${state.uf}) — Registra Brasil`,
    description: `Indicadores de políticos ligados a ${state.name}: evolução mensal, severidade, top parlamentares.`,
    alternates: { canonical: `/estados/${state.uf}/analise` },
    openGraph: {
      title: `Análise: ${state.name} — Registra Brasil`,
      url: `${SITE_URL}/estados/${state.uf}/analise`,
    },
  }
}

export default async function StateAnalisePage({ params }: PageProps) {
  const { uf } = await params
  const ufUpper = uf.toUpperCase()
  const stateName = BRAZILIAN_STATES[ufUpper]
  const state = stateName ? { uf: ufUpper, name: stateName } : undefined
  if (!state) notFound()

  const supabase = await getSupabaseServerClient()

  const { data: polRows } = await (supabase.from('politicians') as any)
    .select('id').eq('state', ufUpper).eq('is_active', true)
  const ids = ((polRows ?? []) as { id: string }[]).map((p) => p.id)
  if (ids.length === 0) notFound()

  const { data: stRows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, severity_score, politician_id, politicians(id, slug, common_name, party, state, photo_url)')
    .in('politician_id', ids)
    .neq('verification_status', 'removed')
    .limit(5000)

  const statements = (stRows ?? []) as StatementForAnalytics[]
  const aggregated = aggregate(statements)
  const topCategories = await topCategoriesFor(supabase, statements.map((s) => s.id))

  const data = { ...aggregated, topCategories }

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Estados', href: '/estados' },
        { label: `${state.name} (${state.uf})`, href: `/estados/${state.uf}` },
        { label: 'Análise' },
      ]} />

      <Link href={`/estados/${state.uf}`} className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline mb-3">
        <ArrowLeft className="w-4 h-4" aria-hidden="true" /> Voltar ao estado
      </Link>

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <MapPin className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <BarChart3 className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Análise: {state.name} ({state.uf})</h1>
        </div>
        <p className="text-sm text-gray-600">
          {ids.length} político{ids.length === 1 ? '' : 's'} ligado{ids.length === 1 ? '' : 's'} a {state.name}.
        </p>
      </header>

      <AnalyticsScorecard data={data} />
    </main>
  )
}
