import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getStateDistribution } from '@/lib/supabase/queries/statistics'
import { DistributionChart } from '@/components/stats/DistributionChart'
import { GeoHeatMap } from '@/components/stats/GeoHeatMap'
import { StatsSummary } from '@/components/stats/StatsSummary'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { BRAZILIAN_STATES } from '@/lib/constants/states'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estatisticas por Estado — Registra Brasil',
  description: 'Distribuicao de declaracoes verificadas por estado brasileiro.',
  alternates: { canonical: '/estatisticas/estados' },
}

export default async function EstadosStatsPage() {
  const supabase = getSupabaseServiceClient()
  const distribution = await getStateDistribution(supabase)

  const totalStatements = distribution.reduce((sum, d) => sum + d.count, 0)
  const stateNameMap = new Map(BRAZILIAN_STATES.map((s) => [s.uf, s.name]))

  // Group by region
  const regionCounts = new Map<string, number>()
  for (const d of distribution) {
    const bs = BRAZILIAN_STATES.find((s) => s.uf === d.state)
    if (bs) {
      regionCounts.set(bs.region, (regionCounts.get(bs.region) ?? 0) + d.count)
    }
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Estatisticas', href: '/estatisticas' },
          { label: 'Estados' },
        ]}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Estatisticas por Estado</h1>
      <p className="text-gray-600 mb-6">
        Distribuicao geografica das declaracoes verificadas.
      </p>

      <StatsSummary
        items={[
          { label: 'Total de declaracoes', value: totalStatements },
          { label: 'Estados representados', value: distribution.filter((d) => d.count > 0).length },
          { label: 'Maior estado', value: stateNameMap.get(distribution[0]?.state ?? '') ?? distribution[0]?.state ?? '-' },
          {
            label: 'Maior regiao',
            value: Array.from(regionCounts.entries()).sort((a, b) => b[1] - a[1])[0]?.[0] ?? '-',
          },
        ]}
      />

      <section className="mt-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Mapa de calor</h2>
        <GeoHeatMap data={distribution} />
      </section>

      <section className="mt-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Ranking por estado</h2>
        <DistributionChart
          items={distribution.map((d) => ({
            label: `${stateNameMap.get(d.state) ?? d.state} (${d.state})`,
            value: d.count,
            percentage: d.percentage,
            href: `/estados/${d.state.toLowerCase()}`,
          }))}
          maxItems={27}
        />
      </section>
    </main>
  )
}
