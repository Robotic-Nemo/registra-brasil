import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getCategoryDistribution } from '@/lib/supabase/queries/statistics'
import { DistributionChart } from '@/components/stats/DistributionChart'
import { StatsSummary } from '@/components/stats/StatsSummary'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estatisticas por Categoria — Registra Brasil',
  description: 'Distribuicao de declaracoes verificadas por categoria tematica.',
  alternates: { canonical: '/estatisticas/categorias' },
}

export default async function CategoriasStatsPage() {
  const supabase = getSupabaseServiceClient()
  const distribution = await getCategoryDistribution(supabase)

  const totalTags = distribution.reduce((sum, d) => sum + d.count, 0)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Estatisticas', href: '/estatisticas' },
          { label: 'Categorias' },
        ]}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Estatisticas por Categoria</h1>
      <p className="text-gray-600 mb-6">
        Distribuicao tematica das declaracoes verificadas.
      </p>

      <StatsSummary
        items={[
          { label: 'Total de tags', value: totalTags },
          { label: 'Categorias usadas', value: distribution.length },
          { label: 'Categoria principal', value: distribution[0]?.label ?? '-' },
          {
            label: 'Concentracao (top 3)',
            value: `${distribution.slice(0, 3).reduce((s, d) => s + d.percentage, 0).toFixed(1)}%`,
          },
        ]}
      />

      <section className="mt-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Todas as categorias</h2>
        <DistributionChart
          items={distribution.map((d) => ({
            label: d.label,
            value: d.count,
            percentage: d.percentage,
            color: d.color,
            href: `/categorias/${d.slug}`,
          }))}
          maxItems={30}
        />
      </section>
    </main>
  )
}
