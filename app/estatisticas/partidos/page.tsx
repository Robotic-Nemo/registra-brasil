import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getPartyDistribution, getPartyTimeSeries } from '@/lib/supabase/queries/statistics'
import { DistributionChart } from '@/components/stats/DistributionChart'
import { TrendChart } from '@/components/stats/TrendChart'
import { StatsSummary } from '@/components/stats/StatsSummary'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { PARTY_COLORS } from '@/lib/constants/party-colors'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estatisticas por Partido — Registra Brasil',
  description: 'Distribuicao de declaracoes verificadas por partido politico.',
  alternates: { canonical: '/estatisticas/partidos' },
}

export default async function PartidosStatsPage() {
  const supabase = getSupabaseServiceClient()

  const distribution = await getPartyDistribution(supabase)
  const topParties = distribution.slice(0, 5).map((d) => d.party)
  const timeSeries = await getPartyTimeSeries(supabase, topParties, 12)

  const totalStatements = distribution.reduce((sum, d) => sum + d.count, 0)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Estatisticas', href: '/estatisticas' },
          { label: 'Partidos' },
        ]}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Estatisticas por Partido</h1>
      <p className="text-gray-600 mb-6">
        Distribuicao das declaracoes verificadas entre os partidos politicos.
      </p>

      <StatsSummary
        items={[
          { label: 'Total de declaracoes', value: totalStatements },
          { label: 'Partidos', value: distribution.length },
          { label: 'Maior partido', value: distribution[0]?.party ?? '-' },
          {
            label: 'Concentracao (top 3)',
            value: `${distribution.slice(0, 3).reduce((s, d) => s + d.percentage, 0).toFixed(1)}%`,
          },
        ]}
      />

      {timeSeries.length > 0 && (
        <section className="mt-8">
          <h2 className="font-semibold text-gray-900 text-lg mb-4">
            Tendencia mensal (top 5 partidos)
          </h2>
          <TrendChart
            lines={timeSeries.map((ts) => ({
              label: ts.party,
              data: ts.data,
              color: PARTY_COLORS[ts.party],
            }))}
          />
        </section>
      )}

      <section className="mt-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Distribuicao completa</h2>
        <DistributionChart
          items={distribution.map((d) => ({
            label: d.party,
            value: d.count,
            percentage: d.percentage,
            color: PARTY_COLORS[d.party],
            href: `/partidos/${d.party.toLowerCase()}`,
          }))}
          maxItems={25}
        />
      </section>
    </main>
  )
}
