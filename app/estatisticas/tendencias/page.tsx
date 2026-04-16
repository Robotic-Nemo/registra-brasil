import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getStatementTimeSeries, getPartyTimeSeries, getSummaryStats } from '@/lib/supabase/queries/statistics'
import { getStatementsByParty } from '@/lib/supabase/queries/stats'
import { TrendChart } from '@/components/stats/TrendChart'
import { StatsSummary } from '@/components/stats/StatsSummary'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { PARTY_COLORS } from '@/lib/constants/party-colors'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Tendencias — Registra Brasil',
  description: 'Tendencias ao longo do tempo das declaracoes verificadas.',
  alternates: { canonical: '/estatisticas/tendencias' },
}

export default async function TendenciasPage() {
  const supabase = getSupabaseServiceClient()

  const [timeSeries, partyData, summary] = await Promise.all([
    getStatementTimeSeries(supabase, 24),
    getStatementsByParty(supabase),
    getSummaryStats(supabase),
  ])

  const topParties = partyData.slice(0, 5).map((p) => p.party)
  const partyTimeSeries = await getPartyTimeSeries(supabase, topParties, 24)

  // Compute recent growth
  const recent3 = timeSeries.slice(-3)
  const prev3 = timeSeries.slice(-6, -3)
  const recentSum = recent3.reduce((s, d) => s + d.count, 0)
  const prevSum = prev3.reduce((s, d) => s + d.count, 0)
  const growthPct = prevSum > 0 ? ((recentSum - prevSum) / prevSum) * 100 : 0

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Estatisticas', href: '/estatisticas' },
          { label: 'Tendencias' },
        ]}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Tendencias</h1>
      <p className="text-gray-600 mb-6">
        Evolucao das declaracoes verificadas ao longo do tempo.
      </p>

      <StatsSummary
        items={[
          { label: 'Total acumulado', value: summary.totalStatements },
          {
            label: 'Ultimos 3 meses',
            value: recentSum,
          },
          {
            label: 'Variacao trimestral',
            value: `${growthPct >= 0 ? '+' : ''}${growthPct.toFixed(1)}%`,
          },
          {
            label: 'Media mensal',
            value: timeSeries.length > 0
              ? Math.round(timeSeries.reduce((s, d) => s + d.count, 0) / timeSeries.length)
              : 0,
          },
        ]}
      />

      <section className="mt-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Declaracoes por mes (24 meses)</h2>
        <TrendChart
          lines={[{ label: 'Declaracoes', data: timeSeries, color: '#3b82f6' }]}
          height={220}
        />
      </section>

      {partyTimeSeries.length > 0 && (
        <section className="mt-10">
          <h2 className="font-semibold text-gray-900 text-lg mb-4">
            Tendencia por partido (top 5)
          </h2>
          <TrendChart
            lines={partyTimeSeries.map((ts) => ({
              label: ts.party,
              data: ts.data,
              color: PARTY_COLORS[ts.party],
            }))}
            height={220}
          />
        </section>
      )}
    </main>
  )
}
