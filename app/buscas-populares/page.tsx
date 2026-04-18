import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Search, AlertTriangle, TrendingUp } from 'lucide-react'
import { getPopularSearches, getZeroResultSearches } from '@/lib/supabase/queries/popular-searches'

export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Buscas populares — Registra Brasil',
  description: 'O que outros leitores estão procurando no acervo Registra Brasil — e o que não foram encontrados.',
  alternates: { canonical: '/buscas-populares' },
  openGraph: {
    title: 'Buscas populares — Registra Brasil',
    url: `${SITE_URL}/buscas-populares`,
  },
}

export default async function BuscasPopularesPage() {
  const supabase = await getSupabaseServerClient()
  const [popular, zero] = await Promise.all([
    getPopularSearches(supabase, { days: 7, limit: 25 }),
    getZeroResultSearches(supabase, { days: 30, limit: 20 }),
  ])

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Buscas populares' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Search className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Buscas populares</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Termos normalizados que leitores buscaram na última semana. Sem dados pessoais, apenas
          contagens agregadas por dia. Clique para rodar a busca.
        </p>
      </header>

      <section className="mb-10">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <TrendingUp className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Top {popular.length} da semana
        </h2>
        {popular.length === 0 ? (
          <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
            Ainda sem dados suficientes para destacar buscas populares.
          </p>
        ) : (
          <ol className="flex flex-wrap gap-2">
            {popular.map((p) => (
              <li key={p.q}>
                <Link
                  href={`/buscar?q=${encodeURIComponent(p.q)}`}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm bg-white border border-gray-200 hover:border-blue-400 rounded-full text-gray-900 hover:text-blue-700 transition-colors"
                >
                  <Search className="w-3 h-3 text-gray-400" aria-hidden="true" />
                  {p.q}
                  <span className="text-xs text-gray-500 tabular-nums">{p.hits}</span>
                </Link>
              </li>
            ))}
          </ol>
        )}
      </section>

      {zero.length > 0 && (
        <section>
          <h2 className="text-sm font-semibold text-gray-900 mb-2 flex items-center gap-1.5">
            <AlertTriangle className="w-4 h-4 text-amber-600" aria-hidden="true" />
            Buscas sem resultado (últimos 30 dias)
          </h2>
          <p className="text-xs text-gray-600 mb-3">
            Estes termos foram buscados mas ainda não têm cobertura no acervo. Ajude-nos a
            preencher a lacuna:{' '}
            <Link href="/sugerir" className="underline text-blue-700">sugerir uma declaração</Link>.
          </p>
          <ul className="bg-amber-50 border border-amber-200 rounded-lg divide-y divide-amber-100">
            {zero.map((r) => (
              <li key={r.q} className="flex items-center gap-3 px-3 py-2 text-sm">
                <Link href={`/buscar?q=${encodeURIComponent(r.q)}`} className="flex-1 min-w-0 font-mono text-xs text-amber-900 hover:underline truncate">
                  {r.q}
                </Link>
                <span className="text-xs text-amber-800 tabular-nums">{r.hits} tentativa{r.hits === 1 ? '' : 's'}</span>
              </li>
            ))}
          </ul>
        </section>
      )}

      <footer className="mt-10 text-xs text-gray-500 border-t border-gray-200 pt-4">
        Dados agregados por dia. Atualização: cache de 10 minutos. Termos são normalizados
        (minúsculas, sem acentos) para agrupar variantes do mesmo conceito.
      </footer>
    </main>
  )
}
