import Link from 'next/link'
import { ArrowLeft, Calendar as CalIcon } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { kindLabel } from '@/lib/agenda/queries'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ m?: string }>
}

const MONTH_NAMES_PT = [
  'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho',
  'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro',
]
const WEEKDAYS_PT = ['dom', 'seg', 'ter', 'qua', 'qui', 'sex', 'sáb']

function parseMonth(m: string | undefined): { year: number; month: number } {
  const now = new Date()
  const def = { year: now.getFullYear(), month: now.getMonth() + 1 }
  if (!m) return def
  const match = m.match(/^(\d{4})-(\d{2})$/)
  if (!match) return def
  const year = Number(match[1])
  const month = Number(match[2])
  if (year < 1990 || year > 2100 || month < 1 || month > 12) return def
  return { year, month }
}

function monthStr(y: number, m: number): string {
  return `${y}-${String(m).padStart(2, '0')}`
}

function prevMonth(y: number, m: number) {
  return m === 1 ? { year: y - 1, month: 12 } : { year: y, month: m - 1 }
}
function nextMonth(y: number, m: number) {
  return m === 12 ? { year: y + 1, month: 1 } : { year: y, month: m + 1 }
}

export default async function AdminCalendarPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const { year, month } = parseMonth(sp.m)

  const startOfMonth = new Date(Date.UTC(year, month - 1, 1))
  const endOfMonth = new Date(Date.UTC(year, month, 0, 23, 59, 59))
  const startIso = startOfMonth.toISOString().slice(0, 10)
  const endIso = endOfMonth.toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const [eventsRes, statementsRes, picksRes] = await Promise.all([
    (supabase.from('political_events') as any)
      .select('id, title, event_date, kind, is_published')
      .gte('event_date', startOfMonth.toISOString())
      .lte('event_date', endOfMonth.toISOString())
      .order('event_date', { ascending: true })
      .limit(500),
    (supabase.from('statements') as any)
      .select('id, statement_date, verification_status')
      .gte('statement_date', startIso)
      .lte('statement_date', endIso)
      .neq('verification_status', 'removed')
      .limit(10000),
    (supabase.from('daily_picks') as any)
      .select('pick_date, statement_id')
      .gte('pick_date', startIso)
      .lte('pick_date', endIso)
      .limit(200)
      .then((r: { data: unknown }) => r, (e: unknown) => ({ data: null, error: e })),
  ])

  type Event = { id: string; title: string; event_date: string; kind: string; is_published: boolean }
  type Stmt = { id: string; statement_date: string; verification_status: string }
  type Pick = { pick_date: string; statement_id: string }

  const events = (eventsRes.data ?? []) as Event[]
  const statements = (statementsRes.data ?? []) as Stmt[]
  const picks = (picksRes.data ?? []) as Pick[]

  // Group by day (UTC date)
  const eventsByDay = new Map<string, Event[]>()
  for (const e of events) {
    const key = e.event_date.slice(0, 10)
    if (!eventsByDay.has(key)) eventsByDay.set(key, [])
    eventsByDay.get(key)!.push(e)
  }
  const stmtCountByDay = new Map<string, { total: number; verified: number }>()
  for (const s of statements) {
    const key = s.statement_date
    const e = stmtCountByDay.get(key) ?? { total: 0, verified: 0 }
    e.total++
    if (s.verification_status === 'verified') e.verified++
    stmtCountByDay.set(key, e)
  }
  const picksByDay = new Map<string, string>()
  for (const p of picks) picksByDay.set(p.pick_date, p.statement_id)

  // Build calendar grid — always 6 rows × 7 cols
  const firstDow = new Date(Date.UTC(year, month - 1, 1)).getUTCDay()
  const daysInMonth = new Date(Date.UTC(year, month, 0)).getUTCDate()
  const cells: Array<{ date: string | null; day: number | null } > = []
  for (let i = 0; i < firstDow; i++) cells.push({ date: null, day: null })
  for (let d = 1; d <= daysInMonth; d++) {
    const date = `${year}-${String(month).padStart(2, '0')}-${String(d).padStart(2, '0')}`
    cells.push({ date, day: d })
  }
  while (cells.length < 42) cells.push({ date: null, day: null })

  const totalStmts = statements.length
  const totalEvents = events.length
  const prev = prevMonth(year, month)
  const next = nextMonth(year, month)
  const todayIso = new Date().toISOString().slice(0, 10)

  return (
    <main className="max-w-6xl mx-auto px-4 py-6">
      <nav className="mb-4 text-sm">
        <Link
          href="/admin"
          className="inline-flex items-center gap-1 text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-100"
        >
          <ArrowLeft className="h-4 w-4" /> Admin
        </Link>
      </nav>
      <header className="mb-6 flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-2">
          <CalIcon className="h-5 w-5 text-indigo-600" aria-hidden />
          <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">
            Calendário editorial · {MONTH_NAMES_PT[month - 1]} {year}
          </h1>
        </div>
        <div className="flex items-center gap-2">
          <Link
            href={`/admin/calendar?m=${monthStr(prev.year, prev.month)}`}
            className="rounded border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
          >
            ← {MONTH_NAMES_PT[prev.month - 1]}
          </Link>
          <Link
            href={`/admin/calendar`}
            className="rounded border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
          >
            Hoje
          </Link>
          <Link
            href={`/admin/calendar?m=${monthStr(next.year, next.month)}`}
            className="rounded border border-gray-300 bg-white px-3 py-1 text-xs hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900"
          >
            {MONTH_NAMES_PT[next.month - 1]} →
          </Link>
        </div>
      </header>

      <section className="mb-4 grid grid-cols-3 gap-3 text-sm">
        <Stat label="Declarações no mês" value={totalStmts.toString()} />
        <Stat label="Eventos no mês" value={totalEvents.toString()} />
        <Stat label="Declarações do dia marcadas" value={picks.length.toString()} />
      </section>

      <section className="rounded-xl border border-gray-200 bg-white p-3 dark:border-gray-800 dark:bg-gray-900">
        <div className="mb-1 grid grid-cols-7 text-[11px] uppercase tracking-wider text-gray-500 dark:text-gray-400">
          {WEEKDAYS_PT.map((d) => (
            <div key={d} className="px-1 py-0.5 text-center">{d}</div>
          ))}
        </div>
        <div className="grid grid-cols-7 gap-1">
          {cells.map((c, i) => {
            if (!c.date) {
              return <div key={i} className="min-h-[92px] rounded border border-transparent" />
            }
            const sc = stmtCountByDay.get(c.date)
            const evs = eventsByDay.get(c.date) ?? []
            const pick = picksByDay.get(c.date)
            const isToday = c.date === todayIso
            return (
              <div
                key={i}
                className={`min-h-[92px] rounded border p-1 text-[11px] ${
                  isToday
                    ? 'border-indigo-400 bg-indigo-50 dark:border-indigo-500 dark:bg-indigo-950/30'
                    : 'border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-950'
                }`}
              >
                <div className="mb-1 flex items-center justify-between">
                  <span className={`font-semibold tabular-nums ${isToday ? 'text-indigo-700 dark:text-indigo-300' : 'text-gray-700 dark:text-gray-300'}`}>
                    {c.day}
                  </span>
                  {sc && (
                    <span
                      className="rounded-full bg-indigo-100 px-1.5 text-[10px] font-medium text-indigo-800 dark:bg-indigo-900/40 dark:text-indigo-200"
                      title={`${sc.total} declarações (${sc.verified} verificadas)`}
                    >
                      {sc.total}
                    </span>
                  )}
                </div>
                <div className="flex flex-col gap-0.5">
                  {pick && (
                    <Link
                      href={`/declaracao/${pick}`}
                      className="truncate rounded bg-amber-100 px-1 text-[10px] font-medium text-amber-900 hover:underline dark:bg-amber-950/40 dark:text-amber-200"
                      title="Declaração do dia"
                    >
                      ★ dia
                    </Link>
                  )}
                  {evs.slice(0, 3).map((e) => (
                    <span
                      key={e.id}
                      className={`truncate rounded px-1 text-[10px] ${
                        e.is_published
                          ? 'bg-emerald-100 text-emerald-900 dark:bg-emerald-950/40 dark:text-emerald-200'
                          : 'bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-300'
                      }`}
                      title={`${kindLabel(e.kind)}: ${e.title}${e.is_published ? '' : ' (rascunho)'}`}
                    >
                      {kindLabel(e.kind).slice(0, 4)}: {e.title.slice(0, 16)}
                    </span>
                  ))}
                  {evs.length > 3 && (
                    <span className="px-1 text-[10px] text-gray-500">
                      +{evs.length - 3} mais
                    </span>
                  )}
                </div>
              </div>
            )
          })}
        </div>
      </section>

      <footer className="mt-6 rounded-lg border border-gray-200 bg-gray-50 p-4 text-xs text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p className="mb-1">Legenda:</p>
        <ul className="flex flex-wrap gap-3">
          <li><span className="mr-1 inline-block h-2 w-2 rounded-full bg-indigo-500" /> Badge roxo = total de declarações no dia</li>
          <li><span className="mr-1 inline-block h-2 w-2 rounded-full bg-amber-500" /> ★ dia = declaração destacada</li>
          <li><span className="mr-1 inline-block h-2 w-2 rounded-full bg-emerald-500" /> Evento publicado</li>
          <li><span className="mr-1 inline-block h-2 w-2 rounded-full bg-gray-400" /> Evento rascunho</li>
        </ul>
      </footer>
    </main>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg border border-gray-200 bg-white p-3 dark:border-gray-800 dark:bg-gray-900">
      <dt className="text-[10px] uppercase tracking-wider text-gray-500 dark:text-gray-400">{label}</dt>
      <dd className="mt-0.5 text-xl font-bold tabular-nums text-gray-900 dark:text-gray-100">{value}</dd>
    </div>
  )
}
