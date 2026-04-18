import Link from 'next/link'
import { ArrowLeft, Sparkles, CalendarClock } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SchedulerForm } from './SchedulerForm'
import { PickRow } from './PickRow'

export const dynamic = 'force-dynamic'

interface Row {
  pick_date: string
  curator_note: string | null
  statement_id: string
  created_at: string
  created_by: string | null
  statements: { id: string; slug: string | null; summary: string; statement_date: string; politicians: { common_name: string; party: string } | null } | null
}

export default async function AdminDailyPicksPage() {
  const supabase = getSupabaseServiceClient()
  const today = new Date().toISOString().slice(0, 10)

  const { data } = await (supabase.from('daily_picks') as any)
    .select('pick_date, curator_note, statement_id, created_at, created_by, statements(id, slug, summary, statement_date, politicians(common_name, party))')
    .order('pick_date', { ascending: false })
    .limit(120)

  const rows = (data ?? []) as Row[]
  const upcoming = rows.filter((r) => r.pick_date >= today).sort((a, b) => a.pick_date.localeCompare(b.pick_date))
  const past = rows.filter((r) => r.pick_date < today)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Sparkles className="w-5 h-5 text-blue-700" />
          Declaração do dia — agenda
        </h1>
      </div>

      <p className="text-sm text-gray-600 mb-6">
        Agende picks editoriais futuros. Quando não houver pick manual para um dia, o widget
        cai para a declaração verificada de maior severidade dos últimos 30 dias.
      </p>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Agendar pick</h2>
        <SchedulerForm today={today} />
      </section>

      <section className="mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <CalendarClock className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Próximos ({upcoming.length})
        </h2>
        {upcoming.length === 0 ? (
          <p className="text-sm text-gray-600">Sem picks agendados. Use o formulário acima.</p>
        ) : (
          <ul className="flex flex-col gap-2">
            {upcoming.map((r) => <PickRow key={r.pick_date} row={r} />)}
          </ul>
        )}
      </section>

      <section>
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Últimos picks</h2>
        {past.length === 0 ? (
          <p className="text-sm text-gray-600">Sem histórico.</p>
        ) : (
          <ul className="flex flex-col gap-2">
            {past.slice(0, 30).map((r) => <PickRow key={r.pick_date} row={r} readOnly />)}
          </ul>
        )}
      </section>
    </main>
  )
}
