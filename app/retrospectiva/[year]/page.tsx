import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import {
  CalendarClock, TrendingUp, Users, AlertTriangle, BarChart3, History,
} from 'lucide-react'
import { ScopeDownloads } from '@/components/export/ScopeDownloads'

export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps { params: Promise<{ year: string }> }

interface StatementRow {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  verification_status: string
  severity_score: number | null
  politician_id: string
  politicians: { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null } | null
  statement_categories: Array<{ is_primary: boolean; categories: { slug: string; label_pt: string; color_hex: string } | null }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { year } = await params
  return {
    title: `Retrospectiva ${year} — Registra Brasil`,
    description: `Balanço de ${year}: top políticos, categorias mais frequentes, declarações mais contestadas e correções.`,
    alternates: { canonical: `/retrospectiva/${year}` },
    openGraph: {
      title: `Retrospectiva ${year} — Registra Brasil`,
      url: `${SITE_URL}/retrospectiva/${year}`,
      type: 'article',
    },
  }
}

export default async function RetrospectivaYear({ params }: PageProps) {
  const { year: yearStr } = await params
  const year = parseInt(yearStr, 10)
  if (!Number.isFinite(year) || year < 1980 || year > 2100) notFound()

  const startIso = `${year}-01-01`
  const endIso = `${year}-12-31`

  const supabase = await getSupabaseServerClient()

  const { data: stRows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, severity_score, politician_id, politicians(id, slug, common_name, party, state, photo_url), statement_categories(is_primary, categories(slug, label_pt, color_hex))')
    .neq('verification_status', 'removed')
    .gte('statement_date', startIso)
    .lte('statement_date', endIso)
    .order('statement_date', { ascending: false })
    .limit(5000)

  const statements = (stRows ?? []) as StatementRow[]
  if (statements.length === 0) notFound()

  // Revisions made during the year (editorial accountability)
  const yearStartTs = `${year}-01-01T00:00:00Z`
  const yearEndTs = `${year + 1}-01-01T00:00:00Z`
  const { data: revRows } = await (supabase.from('statement_revisions') as any)
    .select('id, statement_id, reason, created_at')
    .gte('created_at', yearStartTs)
    .lt('created_at', yearEndTs)
    .order('created_at', { ascending: false })
    .limit(2000)
  const revisionsCount = (revRows ?? []).length
  const statementsRevised = new Set(((revRows ?? []) as Array<{ statement_id: string }>).map((r) => r.statement_id)).size

  // Aggregations
  const byStatus: Record<string, number> = {}
  const byMonth = new Array<number>(12).fill(0)
  const byPol = new Map<string, { pol: StatementRow['politicians']; count: number; severity: number }>()
  const byCat = new Map<string, { slug: string; label: string; color: string; count: number }>()

  for (const s of statements) {
    byStatus[s.verification_status] = (byStatus[s.verification_status] ?? 0) + 1
    const m = parseInt(s.statement_date.slice(5, 7), 10) - 1
    if (m >= 0 && m < 12) byMonth[m]++
    if (s.politicians) {
      const key = s.politician_id
      const ex = byPol.get(key) ?? { pol: s.politicians, count: 0, severity: 0 }
      ex.count++
      ex.severity += s.severity_score ?? 3
      byPol.set(key, ex)
    }
    for (const sc of s.statement_categories) {
      if (sc.is_primary && sc.categories) {
        const c = sc.categories
        const ex = byCat.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
        ex.count++
        byCat.set(c.slug, ex)
      }
    }
  }

  const topPols = [...byPol.values()]
    .sort((a, b) => b.count - a.count || b.severity - a.severity)
    .slice(0, 10)
  const topCats = [...byCat.values()].sort((a, b) => b.count - a.count).slice(0, 6)

  // Notable = verified with highest severity
  const notable = [...statements]
    .filter((s) => s.verification_status === 'verified' && (s.severity_score ?? 0) >= 4)
    .sort((a, b) => (b.severity_score ?? 0) - (a.severity_score ?? 0))
    .slice(0, 6)

  const disputed = statements.filter((s) => s.verification_status === 'disputed').slice(0, 6)
  const maxMonth = Math.max(1, ...byMonth)

  const monthLabels = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez']

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Retrospectiva', href: '/retrospectiva' },
        { label: `${year}` },
      ]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <CalendarClock className="w-8 h-8 text-blue-700" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Retrospectiva {year}</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          {statements.length.toLocaleString('pt-BR')} declarações registradas em {year} de{' '}
          {byPol.size} políticos em {byCat.size} categorias distintas.
        </p>
        <ScopeDownloads base={`/api/dump/year/${year}`} label={`Baixar arquivo ${year}:`} />
      </header>

      <section className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-10">
        <StatCard label="Declarações" value={statements.length} />
        <StatCard label="Verificadas" value={byStatus.verified ?? 0} tone="green" />
        <StatCard label="Contestadas" value={byStatus.disputed ?? 0} tone="amber" />
        <StatCard label="Revisões feitas" value={revisionsCount} />
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-10">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <TrendingUp className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Meses mais ativos
        </h2>
        <div className="flex items-end gap-1 h-24" role="img" aria-label={`Declarações em ${year} por mês`}>
          {byMonth.map((n, i) => {
            const h = Math.max(4, (n / maxMonth) * 96)
            return (
              <div key={i} className="flex-1 flex flex-col items-center justify-end" title={`${monthLabels[i]}: ${n}`}>
                <span className="w-full bg-blue-500 rounded-t" style={{ height: `${h}px` }} aria-hidden="true" />
                <span className="text-[10px] text-gray-500 mt-0.5">{monthLabels[i]}</span>
                <span className="text-[9px] text-gray-400 tabular-nums">{n}</span>
              </div>
            )
          })}
        </div>
      </section>

      <section className="grid grid-cols-1 md:grid-cols-2 gap-5 mb-10">
        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
            <Users className="w-4 h-4 text-blue-700" aria-hidden="true" />
            Top 10 políticos
          </h2>
          <ol className="space-y-2">
            {topPols.map((p, i) => {
              if (!p.pol) return null
              const pct = (p.count / topPols[0].count) * 100
              return (
                <li key={p.pol.id} className="flex items-center gap-2">
                  <span className="w-5 text-right text-xs text-gray-500 tabular-nums">{i + 1}.</span>
                  {p.pol.photo_url ? (
                    <Image src={p.pol.photo_url} alt="" width={28} height={28} unoptimized className="w-7 h-7 rounded-full border border-gray-200" />
                  ) : (
                    <div className="w-7 h-7 rounded-full bg-gray-100 flex items-center justify-center text-xs font-bold text-gray-400">{p.pol.common_name[0]}</div>
                  )}
                  <div className="flex-1 min-w-0">
                    <Link href={`/politico/${p.pol.slug}`} className="text-sm font-medium text-gray-900 hover:text-blue-700 hover:underline truncate block">
                      {p.pol.common_name}
                    </Link>
                    <div className="h-1 bg-gray-100 rounded-full mt-0.5 overflow-hidden">
                      <div className="h-full bg-blue-500" style={{ width: `${pct}%` }} aria-hidden="true" />
                    </div>
                  </div>
                  <span className="tabular-nums text-xs font-mono text-blue-700">{p.count}</span>
                </li>
              )
            })}
          </ol>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
            <BarChart3 className="w-4 h-4 text-blue-700" aria-hidden="true" />
            Categorias dominantes
          </h2>
          <ul className="space-y-2">
            {topCats.map((c) => {
              const pct = (c.count / topCats[0].count) * 100
              return (
                <li key={c.slug}>
                  <Link href={`/categorias/${c.slug}`} className="flex items-center gap-2 group">
                    <span className="w-2.5 h-2.5 rounded-full flex-shrink-0" style={{ backgroundColor: c.color }} aria-hidden="true" />
                    <span className="flex-1 text-sm text-gray-900 group-hover:text-blue-700 truncate">{c.label}</span>
                    <div className="h-1 bg-gray-100 rounded-full w-24 overflow-hidden">
                      <div className="h-full bg-blue-500" style={{ width: `${pct}%` }} aria-hidden="true" />
                    </div>
                    <span className="tabular-nums text-xs font-mono text-blue-700 w-10 text-right">{c.count}</span>
                  </Link>
                </li>
              )
            })}
          </ul>
        </div>
      </section>

      {notable.length > 0 && (
        <section className="mb-10">
          <h2 className="text-lg font-semibold text-gray-900 mb-3">Declarações notáveis</h2>
          <ul className="space-y-2">
            {notable.map((s) => (
              <li key={s.id} className="bg-white border border-gray-200 rounded-lg p-3 text-sm">
                <div className="flex items-center justify-between gap-3 mb-1 text-xs text-gray-500">
                  <span>{s.politicians?.common_name ?? '—'} ({s.politicians?.party ?? '—'})</span>
                  <span className="flex items-center gap-2">
                    {s.severity_score && <span className="tabular-nums">severidade {s.severity_score}</span>}
                    <span>{s.statement_date}</span>
                  </span>
                </div>
                <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-gray-900 hover:text-blue-700 hover:underline">
                  {s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      {disputed.length > 0 && (
        <section className="mb-10">
          <h2 className="text-lg font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <AlertTriangle className="w-5 h-5 text-amber-600" aria-hidden="true" />
            Contestadas
          </h2>
          <ul className="space-y-2">
            {disputed.map((s) => (
              <li key={s.id} className="bg-amber-50 border border-amber-200 rounded-lg p-3 text-sm">
                <div className="flex items-center justify-between gap-3 mb-1 text-xs text-amber-900">
                  <span>{s.politicians?.common_name ?? '—'}</span>
                  <span>{s.statement_date}</span>
                </div>
                <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-amber-950 hover:text-amber-900 hover:underline">
                  {s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section className="bg-blue-50 border border-blue-200 rounded-xl p-4 text-sm text-blue-900 flex items-start gap-3">
        <History className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div>
          <p className="font-semibold mb-1">Transparência em {year}</p>
          <p>
            {revisionsCount.toLocaleString('pt-BR')} revisões editoriais afetaram{' '}
            {statementsRevised.toLocaleString('pt-BR')} declarações durante o ano. Veja o log
            completo em{' '}
            <Link href="/atualizacoes" className="underline font-medium">/atualizacoes</Link>.
          </p>
        </div>
      </section>
    </main>
  )
}

function StatCard({ label, value, tone }: { label: string; value: number; tone?: 'green' | 'amber' }) {
  const cls = tone === 'green' ? 'text-green-700' : tone === 'amber' ? 'text-amber-700' : 'text-gray-900'
  return (
    <div className="bg-white border border-gray-200 rounded-lg p-4 text-center">
      <p className={`text-2xl font-bold tabular-nums ${cls}`}>{value.toLocaleString('pt-BR')}</p>
      <p className="text-xs text-gray-500 mt-1">{label}</p>
    </div>
  )
}
