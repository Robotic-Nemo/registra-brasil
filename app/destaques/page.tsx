import Link from 'next/link'
import type { Metadata } from 'next'
import { Sparkles } from 'lucide-react'
import { computeMonthlyRecap, currentMonth, adjacentMonth, monthLabel } from '@/lib/monthly-recap/compute'
import { MonthlyRecapView } from '@/components/monthly/MonthlyRecap'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Destaques do mês — Registra Brasil',
  description: 'Os 20 registros mais graves de cada mês, mais os políticos e categorias em alta.',
  alternates: { canonical: '/destaques' },
  openGraph: {
    title: 'Destaques do mês — Registra Brasil',
    description: 'Recap mensal automático.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Destaques do mês — Registra Brasil',
    description: 'Recap mensal automático.',
  },
}

export default async function DestaquesPage() {
  const month = currentMonth()
  const recap = await computeMonthlyRecap(month)
  if (!recap) return null

  // Build a simple navigation of last 12 months for quick browsing.
  const recentMonths: string[] = []
  for (let i = 0; i < 12; i++) recentMonths.push(adjacentMonth(month, -i))

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-6 flex items-start gap-3">
        <Sparkles className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Recap mensal
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Destaques
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            Cada mês do arquivo resumido em 20 registros ranqueados por
            gravidade, mais os políticos e categorias em alta. Permalinks
            estáveis no padrão{' '}
            <code className="font-mono text-xs">/destaques/AAAA-MM</code>.
          </p>
        </div>
      </header>

      <nav className="mb-8 flex flex-wrap gap-2" aria-label="Mudar de mês">
        {recentMonths.map((m) => (
          <Link
            key={m}
            href={m === month ? '/destaques' : `/destaques/${m}`}
            className={`rounded-full border px-3 py-1 text-xs font-medium ${
              m === month
                ? 'border-indigo-500 bg-indigo-50 text-indigo-800 dark:border-indigo-400 dark:bg-indigo-950/40 dark:text-indigo-200'
                : 'border-gray-300 bg-white text-gray-700 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300'
            }`}
          >
            {monthLabel(m)}
          </Link>
        ))}
      </nav>

      <MonthlyRecapView recap={recap} />
    </main>
  )
}
