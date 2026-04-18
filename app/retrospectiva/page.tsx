import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { CalendarClock } from 'lucide-react'

export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Retrospectiva anual — Registra Brasil',
  description: 'Balanço anual com as declarações, políticos e categorias que marcaram cada ano.',
  alternates: { canonical: '/retrospectiva' },
  openGraph: {
    title: 'Retrospectiva anual — Registra Brasil',
    url: `${SITE_URL}/retrospectiva`,
  },
}

export default async function RetrospectivaIndex() {
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('statements') as any)
    .select('statement_date')
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(20000)

  const byYear = new Map<number, number>()
  for (const row of (data ?? []) as Array<{ statement_date: string }>) {
    const y = parseInt(row.statement_date.slice(0, 4), 10)
    if (Number.isFinite(y)) byYear.set(y, (byYear.get(y) ?? 0) + 1)
  }

  const years = [...byYear.entries()].sort((a, b) => b[0] - a[0])
  const currentYear = new Date().getUTCFullYear()

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Retrospectiva' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <CalendarClock className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Retrospectiva anual</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Balanço ano a ano do acervo: top 10 políticos, categorias dominantes, declarações
          mais contestadas e maiores correções. Cada retrospectiva é gerada dinamicamente a
          partir do banco — reflete o estado atual.
        </p>
      </header>

      <ul className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        {years.map(([year, count]) => (
          <li key={year}>
            <Link
              href={`/retrospectiva/${year}`}
              className="block bg-white border border-gray-200 rounded-xl p-4 text-center hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            >
              <p className="text-2xl font-bold text-gray-900 tabular-nums">{year}</p>
              <p className="text-xs text-gray-500 mt-1">
                {count.toLocaleString('pt-BR')} declaraç{count === 1 ? 'ão' : 'ões'}
                {year === currentYear && ' · em andamento'}
              </p>
            </Link>
          </li>
        ))}
      </ul>
    </main>
  )
}
