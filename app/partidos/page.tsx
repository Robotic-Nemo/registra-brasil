import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getParties } from '@/lib/supabase/queries/parties'
import Link from 'next/link'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Partidos — Registra Brasil',
  description: 'Lista de partidos politicos brasileiros com declaracoes registradas no Registra Brasil.',
  openGraph: {
    title: 'Partidos — Registra Brasil',
    description: 'Lista de partidos politicos brasileiros com declaracoes registradas.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Partidos — Registra Brasil',
    description: 'Lista de partidos politicos brasileiros com declaracoes registradas.',
  },
  alternates: { canonical: '/partidos' },
}

export default async function PartidosPage() {
  const supabase = await getSupabaseServerClient()
  const parties = await getParties(supabase)

  const totalStatements = parties.reduce((sum, p) => sum + p.count, 0)
  const totalPoliticians = parties.reduce((sum, p) => sum + p.politicianCount, 0)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: 'Partidos — Registra Brasil',
    description: 'Lista de partidos politicos brasileiros com declaracoes registradas.',
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/partidos`,
    numberOfItems: parties.length,
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Partidos</h1>
      <p className="text-gray-500 text-sm mb-2">
        Declaracoes organizadas por partido politico.
      </p>
      <div className="flex gap-4 text-sm text-gray-400 mb-8">
        <span>{parties.length} partidos</span>
        <span>{totalPoliticians} politicos</span>
        <span>{totalStatements} declaracoes verificadas</span>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {parties.map((p) => (
          <Link
            key={p.party}
            href={`/partidos/${encodeURIComponent(p.party)}`}
            className="flex items-center justify-between p-4 border border-gray-200 rounded-lg bg-white hover:bg-gray-50 hover:border-gray-300 transition-colors"
          >
            <div>
              <span className="font-semibold text-gray-900">{p.party}</span>
              <p className="text-xs text-gray-500 mt-0.5">
                {p.politicianCount} {p.politicianCount === 1 ? 'politico' : 'politicos'}
              </p>
            </div>
            <span className="text-sm font-medium text-blue-700 bg-blue-50 px-2 py-0.5 rounded">
              {p.count} {p.count === 1 ? 'declaracao' : 'declaracoes'}
            </span>
          </Link>
        ))}
      </div>

      {parties.length === 0 && (
        <p className="text-gray-400 text-center py-12">Nenhum partido encontrado.</p>
      )}
    </main>
  )
}
