import Link from 'next/link'
import type { Metadata } from 'next'
import { CalendarDays } from 'lucide-react'
import {
  statementsOnDayOfYear, todayDateLabel, formatDateParam,
} from '@/lib/on-this-day/queries'
import { DayFeed } from '@/components/on-this-day/DayFeed'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Hoje na história — Registra Brasil',
  description: 'Declarações políticas registradas neste mesmo dia do calendário em anos anteriores.',
  alternates: { canonical: '/hoje-na-historia' },
  openGraph: {
    title: 'Hoje na história — Registra Brasil',
    description: 'Declarações políticas deste dia ao longo dos anos.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

function relativeDay(delta: number): { month: number; day: number } {
  const d = new Date()
  d.setDate(d.getDate() + delta)
  return { month: d.getMonth() + 1, day: d.getDate() }
}

export default async function HojeNaHistoriaPage() {
  const now = new Date()
  const month = now.getMonth() + 1
  const day = now.getDate()

  const rows = await statementsOnDayOfYear(month, day)
  const yesterday = relativeDay(-1)
  const tomorrow = relativeDay(1)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <header className="mb-6 flex items-start gap-3">
        <CalendarDays className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Arquivo histórico
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            {todayDateLabel(month, day)} na história
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            {rows.length} declarações registradas neste dia do calendário
            ({String(day).padStart(2, '0')}/{String(month).padStart(2, '0')}) ao longo dos anos.
          </p>
        </div>
      </header>

      <nav className="mb-6 flex flex-wrap gap-2 text-xs">
        <Link
          href={`/hoje-na-historia/${formatDateParam(yesterday.month, yesterday.day)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          ← Ontem ({String(yesterday.day).padStart(2, '0')}/{String(yesterday.month).padStart(2, '0')})
        </Link>
        <Link
          href={`/hoje-na-historia/${formatDateParam(tomorrow.month, tomorrow.day)}`}
          className="rounded-full border border-gray-300 bg-white px-3 py-1 hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
        >
          Amanhã ({String(tomorrow.day).padStart(2, '0')}/{String(tomorrow.month).padStart(2, '0')}) →
        </Link>
      </nav>

      <DayFeed rows={rows} />
    </main>
  )
}
