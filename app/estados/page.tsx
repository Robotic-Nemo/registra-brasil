import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStates, BRAZILIAN_STATES } from '@/lib/supabase/queries/states'
import Link from 'next/link'
import { MapPin } from 'lucide-react'
import { BrazilTileMap } from '@/components/maps/BrazilTileMap'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Estados — Registra Brasil',
  description: 'Declaracoes de politicos brasileiros organizadas por estado.',
  openGraph: {
    title: 'Estados — Registra Brasil',
    description: 'Declaracoes de politicos brasileiros organizadas por estado.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Estados — Registra Brasil',
    description: 'Declaracoes de politicos brasileiros organizadas por estado.',
  },
  alternates: { canonical: '/estados' },
}

export default async function EstadosPage() {
  const supabase = await getSupabaseServerClient()
  const states = await getStates(supabase)

  const totalStatements = states.reduce((sum, s) => sum + s.count, 0)
  const totalPoliticians = states.reduce((sum, s) => sum + s.politicianCount, 0)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: 'Estados — Registra Brasil',
    description: 'Declaracoes de politicos brasileiros organizadas por estado.',
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/estados`,
    numberOfItems: states.length,
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Estados</h1>
      <p className="text-gray-500 text-sm mb-2">
        Declaracoes organizadas por estado brasileiro.
      </p>
      <div className="flex gap-4 text-sm text-gray-400 mb-8">
        <span>{states.length} estados</span>
        <span>{totalPoliticians} politicos</span>
        <span>{totalStatements} declaracoes verificadas</span>
      </div>

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 sm:p-6">
        <BrazilTileMap
          counts={Object.fromEntries(states.map((s) => [s.state, s.count]))}
          labelFor={(_, c) => (c === 0 ? '—' : c.toLocaleString('pt-BR'))}
          rampColor="#047857"
          hrefTemplate="/estados/{uf}"
          title="Declarações por UF — cartograma em grade"
        />
      </section>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {states.map((s) => (
          <Link
            key={s.state}
            href={`/estados/${s.state.toLowerCase()}`}
            className="flex items-center justify-between p-4 border border-gray-200 rounded-lg bg-white hover:bg-gray-50 hover:border-gray-300 transition-colors"
          >
            <div className="flex items-center gap-2">
              <MapPin className="w-4 h-4 text-gray-400" aria-hidden="true" />
              <div>
                <span className="font-semibold text-gray-900">{s.state}</span>
                <span className="text-gray-500 text-sm ml-1.5">
                  {BRAZILIAN_STATES[s.state] ?? ''}
                </span>
                <p className="text-xs text-gray-500">
                  {s.politicianCount} {s.politicianCount === 1 ? 'politico' : 'politicos'}
                </p>
              </div>
            </div>
            <span className="text-sm font-medium text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded">
              {s.count}
            </span>
          </Link>
        ))}
      </div>

      {states.length === 0 && (
        <p className="text-gray-400 text-center py-12">Nenhum estado encontrado.</p>
      )}
    </main>
  )
}
