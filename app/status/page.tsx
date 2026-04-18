import type { Metadata } from 'next'
import { StatusIndicator } from '@/components/status/StatusIndicator'
import { UptimeChart } from '@/components/status/UptimeChart'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const revalidate = 60 // live-ish, but cached

export const metadata: Metadata = {
  title: 'Status do sistema — Registra Brasil',
  description: 'Métricas ao vivo do site, banco e filas editoriais do Registra Brasil.',
  alternates: { canonical: '/status' },
}

interface Metric {
  label: string
  value: string
  detail?: string
  tone: 'ok' | 'warn' | 'bad'
}

function ageText(iso: string | null | undefined): { text: string; tone: Metric['tone'] } {
  if (!iso) return { text: '—', tone: 'warn' }
  const age = Date.now() - new Date(iso).getTime()
  const hours = age / (60 * 60 * 1000)
  const days = hours / 24
  let text = ''
  if (hours < 1) text = `há ${Math.max(1, Math.round(age / 60_000))} min`
  else if (hours < 24) text = `há ${Math.round(hours)} h`
  else text = `há ${Math.round(days)} dia${Math.round(days) === 1 ? '' : 's'}`
  let tone: Metric['tone'] = 'ok'
  if (hours > 72) tone = 'warn'
  if (hours > 14 * 24) tone = 'bad'
  return { text, tone }
}

function queueAge(iso: string | null | undefined, slaDays: number): { text: string; tone: Metric['tone'] } {
  if (!iso) return { text: 'vazia', tone: 'ok' }
  const ageDays = (Date.now() - new Date(iso).getTime()) / (24 * 60 * 60 * 1000)
  const rounded = Math.round(ageDays)
  const text = rounded < 1 ? `<1 dia` : `${rounded} dia${rounded === 1 ? '' : 's'}`
  let tone: Metric['tone'] = 'ok'
  if (ageDays > slaDays * 0.75) tone = 'warn'
  if (ageDays > slaDays) tone = 'bad'
  return { text, tone }
}

const TONE_CLASSES = {
  ok: 'bg-green-50 border-green-200 text-green-900',
  warn: 'bg-amber-50 border-amber-200 text-amber-900',
  bad: 'bg-red-50 border-red-200 text-red-900',
} as const

export default async function StatusPage() {
  const supabase = await getSupabaseServerClient()
  const dbStart = Date.now()

  const [
    { count: statementsTotal },
    { count: politiciansTotal },
    { data: lastStatement },
    { data: lastRevision },
    { data: oldestPendingSub },
    { data: oldestPendingRetraction },
    { data: lastDigest },
  ] = await Promise.all([
    (supabase.from('statements') as any).select('id', { count: 'exact', head: true }).neq('verification_status', 'removed'),
    (supabase.from('politicians') as any).select('id', { count: 'exact', head: true }).eq('is_active', true),
    (supabase.from('statements') as any).select('created_at').order('created_at', { ascending: false }).limit(1).maybeSingle(),
    (supabase.from('statement_revisions') as any).select('created_at').order('created_at', { ascending: false }).limit(1).maybeSingle(),
    (supabase.from('statement_submissions') as any).select('created_at').eq('status', 'pending').order('created_at', { ascending: true }).limit(1).maybeSingle(),
    (supabase.from('retraction_requests') as any).select('created_at').in('status', ['pending', 'in_review']).order('created_at', { ascending: true }).limit(1).maybeSingle(),
    (supabase.from('newsletter_digests') as any).select('sent_at, week_of').not('sent_at', 'is', null).order('sent_at', { ascending: false }).limit(1).maybeSingle(),
  ])

  const dbLatencyMs = Date.now() - dbStart
  const dbTone: Metric['tone'] = dbLatencyMs < 600 ? 'ok' : dbLatencyMs < 2000 ? 'warn' : 'bad'

  const lastStmt = ageText(lastStatement?.created_at)
  const lastRev = ageText(lastRevision?.created_at)
  const lastDig = ageText(lastDigest?.sent_at)
  const subAge = queueAge(oldestPendingSub?.created_at, 10) // 10-day SLA
  const retAge = queueAge(oldestPendingRetraction?.created_at, 10) // 10-business-day policy

  const metrics: Metric[] = [
    { label: 'Banco de dados', value: `${dbLatencyMs} ms`, detail: 'latência desta consulta', tone: dbTone },
    { label: 'Total de declarações', value: (statementsTotal ?? 0).toLocaleString('pt-BR'), detail: 'não-removidas', tone: 'ok' },
    { label: 'Políticos ativos', value: (politiciansTotal ?? 0).toLocaleString('pt-BR'), tone: 'ok' },
    { label: 'Última declaração adicionada', value: lastStmt.text, tone: lastStmt.tone },
    { label: 'Última revisão editorial', value: lastRev.text, tone: lastRev.tone },
    { label: 'Submissão pendente mais antiga', value: subAge.text, detail: 'SLA editorial: 10 dias úteis', tone: subAge.tone },
    { label: 'Retificação pendente mais antiga', value: retAge.text, detail: 'SLA editorial: 10 dias úteis', tone: retAge.tone },
    { label: 'Último boletim enviado', value: lastDig.text, detail: lastDigest?.week_of ? `semana de ${lastDigest.week_of}` : undefined, tone: lastDig.tone },
  ]

  const anyBad = metrics.some((m) => m.tone === 'bad')
  const anyWarn = metrics.some((m) => m.tone === 'warn')
  const overall: Metric['tone'] = anyBad ? 'bad' : anyWarn ? 'warn' : 'ok'
  const overallText = overall === 'ok'
    ? 'Todos os sistemas operacionais.'
    : overall === 'warn'
    ? 'Operacional com alertas — algumas filas próximas do SLA.'
    : 'Atenção: há métricas fora do SLA editorial.'

  return (
    <main className="container mx-auto max-w-3xl px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Status do sistema</h1>
      <p className="text-sm text-gray-600 mb-8">
        Métricas ao vivo. Cache de 60 segundos na borda; o banco responde diretamente.
      </p>

      <div className={`${TONE_CLASSES[overall]} border rounded-xl p-4 mb-8 flex items-center gap-3`}>
        <StatusIndicator status={overall === 'ok' ? 'operational' : overall === 'warn' ? 'degraded' : 'outage'} />
        <span className="font-medium">{overallText}</span>
      </div>

      <section className="mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 uppercase tracking-wider">Métricas editoriais</h2>
        <ul className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          {metrics.map((m) => (
            <li key={m.label} className={`border rounded-lg p-3 text-sm ${TONE_CLASSES[m.tone]}`}>
              <p className="text-xs uppercase tracking-wider opacity-75">{m.label}</p>
              <p className="text-lg font-bold tabular-nums mt-0.5">{m.value}</p>
              {m.detail && <p className="text-[11px] opacity-70 mt-0.5">{m.detail}</p>}
            </li>
          ))}
        </ul>
      </section>

      <section className="mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 uppercase tracking-wider">Disponibilidade (30 dias)</h2>
        <UptimeChart />
      </section>

      <p className="text-xs text-gray-500 border-t border-gray-200 pt-4">
        Tons: verde = ok, âmbar = próximo do limite, vermelho = fora do SLA. As contagens vêm
        diretamente do banco público; veja também <a href="/transparencia" className="underline">Transparência</a>{' '}
        para séries históricas.
      </p>
    </main>
  )
}
