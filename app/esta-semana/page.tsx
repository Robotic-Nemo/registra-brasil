import Link from 'next/link'
import type { Metadata } from 'next'
import { computeWeeklyRecap, currentWeek, isoWeekFor } from '@/lib/weekly-recap/compute'
import { WeeklyRecapView } from '@/components/weekly/WeeklyRecap'

export const revalidate = 1800

export const metadata: Metadata = {
  title: 'Esta semana no Registra Brasil',
  description: 'Recap automático da semana: principais declarações por gravidade, políticos mais ativos e temas em alta.',
  alternates: { canonical: '/esta-semana' },
  openGraph: {
    title: 'Esta semana no Registra Brasil',
    description: 'Recap automático da semana.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Esta semana no Registra Brasil',
    description: 'Recap automático da semana.',
  },
}

function priorWeek(iso: string): string {
  const m = iso.match(/^(\d{4})-W(\d{2})$/)
  if (!m) return iso
  const year = Number(m[1])
  const week = Number(m[2])
  if (week <= 1) return `${year - 1}-W52`
  return `${year}-W${String(week - 1).padStart(2, '0')}`
}

export default async function EstaSemanaPage() {
  const { start, end } = currentWeek()
  const recap = await computeWeeklyRecap(start, end)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <nav className="mb-6 flex items-center gap-3 text-sm">
        <span className="text-gray-500 dark:text-gray-400">Navegação:</span>
        <Link
          href={`/esta-semana/${priorWeek(recap.isoWeek)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-800"
        >
          ← Semana anterior
        </Link>
        <span className="text-xs text-gray-500 dark:text-gray-500">
          Atualizado automaticamente a cada 30 min.
        </span>
      </nav>
      <WeeklyRecapView recap={recap} />
    </main>
  )
}
