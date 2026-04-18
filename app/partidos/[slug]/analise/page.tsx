import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { ArrowLeft, BarChart3, Flag } from 'lucide-react'
import { aggregate, topCategoriesFor, type StatementForAnalytics } from '@/lib/analytics/aggregate-statements'
import { AnalyticsScorecard } from '@/components/analytics/AnalyticsScorecard'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps { params: Promise<{ slug: string }> }

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const party = decodeURIComponent(slug)
  return {
    title: `Análise: ${party} — Registra Brasil`,
    description: `Indicadores do partido ${party}: top políticos, evolução mensal, distribuição de severidade.`,
    alternates: { canonical: `/partidos/${encodeURIComponent(party)}/analise` },
    openGraph: {
      title: `Análise: ${party} — Registra Brasil`,
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}/analise`,
    },
  }
}

export default async function PartyAnalisePage({ params }: PageProps) {
  const { slug } = await params
  const party = decodeURIComponent(slug)
  if (!party || party.length > 30) notFound()

  const supabase = await getSupabaseServerClient()

  const { data: polRows } = await (supabase.from('politicians') as any)
    .select('id').eq('party', party).eq('is_active', true)
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
        { label: 'Partidos', href: '/partidos' },
        { label: party, href: `/partidos/${encodeURIComponent(party)}` },
        { label: 'Análise' },
      ]} />

      <Link href={`/partidos/${encodeURIComponent(party)}`} className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline mb-3">
        <ArrowLeft className="w-4 h-4" aria-hidden="true" /> Voltar ao partido
      </Link>

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Flag className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <BarChart3 className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Análise: {party}</h1>
        </div>
        <p className="text-sm text-gray-600">
          {ids.length} político{ids.length === 1 ? '' : 's'} do partido.
        </p>
      </header>

      <AnalyticsScorecard data={data} />
    </main>
  )
}
