import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { computeMonthlyRecap, isValidMonth, adjacentMonth, monthLabel } from '@/lib/monthly-recap/compute'
import { MonthlyRecapView } from '@/components/monthly/MonthlyRecap'

export const revalidate = 86400

interface PageProps {
  params: Promise<{ month: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { month } = await params
  return {
    title: `Destaques de ${monthLabel(month)} — Registra Brasil`,
    description: `Os 20 registros mais graves de ${monthLabel(month)}, mais os políticos e categorias em alta.`,
    alternates: { canonical: `/destaques/${month}` },
    openGraph: {
      title: `Destaques de ${monthLabel(month)} — Registra Brasil`,
      description: `Recap de ${monthLabel(month)}.`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
  }
}

export default async function DestaquesMonthPage({ params }: PageProps) {
  const { month } = await params
  if (!isValidMonth(month)) notFound()
  const recap = await computeMonthlyRecap(month)
  if (!recap) notFound()

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <nav className="mb-6 flex flex-wrap gap-2">
        <Link
          href={`/destaques/${adjacentMonth(month, -1)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          ← {monthLabel(adjacentMonth(month, -1))}
        </Link>
        <Link
          href="/destaques"
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          Mês atual
        </Link>
        <Link
          href={`/destaques/${adjacentMonth(month, 1)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          {monthLabel(adjacentMonth(month, 1))} →
        </Link>
      </nav>
      <MonthlyRecapView recap={recap} />
    </main>
  )
}
