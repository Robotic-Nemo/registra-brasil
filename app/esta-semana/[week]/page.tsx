import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { computeWeeklyRecap, parseIsoWeek } from '@/lib/weekly-recap/compute'
import { WeeklyRecapView } from '@/components/weekly/WeeklyRecap'

export const revalidate = 86400

interface PageProps {
  params: Promise<{ week: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { week } = await params
  return {
    title: `Semana ${week} — Registra Brasil`,
    description: `Recap da semana ${week}: top declarações por gravidade, políticos mais ativos e temas em alta.`,
    alternates: { canonical: `/esta-semana/${week}` },
    openGraph: {
      title: `Semana ${week} — Registra Brasil`,
      description: `Recap da semana ${week}.`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
  }
}

function priorWeek(iso: string): string {
  const m = iso.match(/^(\d{4})-W(\d{2})$/)!
  const year = Number(m[1])
  const week = Number(m[2])
  if (week <= 1) return `${year - 1}-W52`
  return `${year}-W${String(week - 1).padStart(2, '0')}`
}
function nextWeek(iso: string): string {
  const m = iso.match(/^(\d{4})-W(\d{2})$/)!
  const year = Number(m[1])
  const week = Number(m[2])
  if (week >= 52) return `${year + 1}-W01`
  return `${year}-W${String(week + 1).padStart(2, '0')}`
}

export default async function WeekPage({ params }: PageProps) {
  const { week } = await params
  const range = parseIsoWeek(week)
  if (!range) notFound()
  const recap = await computeWeeklyRecap(range.start, range.end)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <nav className="mb-6 flex flex-wrap items-center gap-2 text-sm">
        <Link
          href={`/esta-semana/${priorWeek(recap.isoWeek)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-800"
        >
          ← Anterior
        </Link>
        <Link
          href={`/esta-semana`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-800"
        >
          Semana atual
        </Link>
        <Link
          href={`/esta-semana/${nextWeek(recap.isoWeek)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-800"
        >
          Próxima →
        </Link>
      </nav>
      <WeeklyRecapView recap={recap} />
    </main>
  )
}
