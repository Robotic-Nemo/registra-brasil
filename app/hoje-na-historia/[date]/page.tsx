import Link from 'next/link'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { CalendarDays } from 'lucide-react'
import {
  statementsOnDayOfYear, todayDateLabel, parseDateParam, formatDateParam,
} from '@/lib/on-this-day/queries'
import { DayFeed } from '@/components/on-this-day/DayFeed'

export const revalidate = 86400

interface PageProps {
  params: Promise<{ date: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { date } = await params
  const parsed = parseDateParam(date)
  if (!parsed) return { title: 'Data inválida' }
  return {
    title: `${todayDateLabel(parsed.month, parsed.day)} na história — Registra Brasil`,
    description: `Declarações políticas registradas em ${String(parsed.day).padStart(2, '0')}/${String(parsed.month).padStart(2, '0')} ao longo dos anos.`,
    alternates: { canonical: `/hoje-na-historia/${date}` },
    openGraph: {
      title: `${todayDateLabel(parsed.month, parsed.day)} na história`,
      description: `Declarações políticas registradas em ${String(parsed.day).padStart(2, '0')}/${String(parsed.month).padStart(2, '0')}.`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
  }
}

function relativeDay(month: number, day: number, delta: number): { month: number; day: number } {
  const d = new Date(Date.UTC(2024, month - 1, day)) // leap-safe
  d.setUTCDate(d.getUTCDate() + delta)
  return { month: d.getUTCMonth() + 1, day: d.getUTCDate() }
}

export default async function DateHistoryPage({ params }: PageProps) {
  const { date } = await params
  const parsed = parseDateParam(date)
  if (!parsed) notFound()
  const { month, day } = parsed

  const rows = await statementsOnDayOfYear(month, day)
  const prev = relativeDay(month, day, -1)
  const next = relativeDay(month, day, 1)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <nav className="mb-4 text-sm">
        <Link href="/hoje-na-historia" className="text-indigo-700 hover:underline dark:text-indigo-300">
          ← Voltar para hoje
        </Link>
      </nav>

      <header className="mb-6 flex items-start gap-3">
        <CalendarDays className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Arquivo histórico
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            {todayDateLabel(month, day)} no arquivo
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            {rows.length} declarações registradas em
            {' '}{String(day).padStart(2, '0')}/{String(month).padStart(2, '0')} ao longo dos anos.
          </p>
        </div>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2 text-xs">
        <Link
          href={`/hoje-na-historia/${formatDateParam(prev.month, prev.day)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          ← {String(prev.day).padStart(2, '0')}/{String(prev.month).padStart(2, '0')}
        </Link>
        <Link
          href={`/hoje-na-historia/${formatDateParam(next.month, next.day)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          {String(next.day).padStart(2, '0')}/{String(next.month).padStart(2, '0')} →
        </Link>
      </nav>

      <DayFeed rows={rows} />
    </main>
  )
}
