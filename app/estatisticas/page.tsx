import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getSiteStats } from '@/lib/supabase/queries/statements'
import { getMonthlyStatementCounts, getStatementsByParty, getStatementsBySourceType } from '@/lib/supabase/queries/stats'
import { MonthlyChart } from '@/components/stats/MonthlyChart'
import { PartyChart } from '@/components/stats/PartyChart'
import { SourceTypeChart } from '@/components/stats/SourceTypeChart'
import { StatsBar } from '@/components/ui/StatsBar'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estatísticas — Registra Brasil',
  description: 'Estatísticas do arquivo de declarações de políticos brasileiros.',
  openGraph: {
    title: 'Estatísticas — Registra Brasil',
    description: 'Estatísticas do arquivo de declarações de políticos brasileiros.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Estatísticas — Registra Brasil',
    description: 'Estatísticas do arquivo de declarações de políticos brasileiros.',
  },
  alternates: { canonical: '/estatisticas' },
}

export default async function EstatisticasPage() {
  const supabase = await getSupabaseServerClient()

  const [stats, monthlyData, partyData, sourceData] = await Promise.all([
    getSiteStats(supabase),
    getMonthlyStatementCounts(supabase, 12),
    getStatementsByParty(supabase),
    getStatementsBySourceType(supabase),
  ])

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
  const statsJsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Dataset',
    name: 'Estatísticas do Registra Brasil',
    description: `Agregados públicos: ${stats.totalVerified} declarações verificadas, ${stats.totalPoliticians} políticos, ${stats.totalCategories} categorias.`,
    url: `${siteUrl}/estatisticas`,
    license: 'https://creativecommons.org/licenses/by/4.0/',
    creator: { '@type': 'Organization', name: 'Registra Brasil', url: siteUrl },
    inLanguage: 'pt-BR',
    keywords: 'estatísticas, declarações, políticos, brasil, verificação de fatos',
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(statsJsonLd) }}
      />
      <Breadcrumbs items={[{ label: 'Estatísticas' }]} />
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Estatísticas</h1>

      <div className="bg-gradient-to-r from-blue-950 to-blue-900 rounded-xl p-6 mb-8">
        <StatsBar
          totalVerified={stats.totalVerified}
          totalPoliticians={stats.totalPoliticians}
          totalCategories={stats.totalCategories}
        />
      </div>

      <MonthlyChart data={monthlyData} />

      {/* Party breakdown */}
      <section className="mt-10">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Declarações por partido</h2>
        <div className="bg-white border border-gray-200 rounded-xl p-6">
          <PartyChart data={partyData} maxItems={15} />
        </div>
      </section>

      {/* Source type breakdown */}
      <section className="mt-10">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Tipos de fonte primária</h2>
        <div className="bg-white border border-gray-200 rounded-xl p-6">
          <SourceTypeChart data={sourceData} />
        </div>
      </section>
    </main>
  )
}
