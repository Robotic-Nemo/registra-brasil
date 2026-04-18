import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getCategoryBySlug } from '@/lib/supabase/queries/categories'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { BarChart3, ArrowLeft, Users, TrendingUp } from 'lucide-react'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const cat = await getCategoryBySlug(supabase, slug)
  if (!cat) return { title: 'Categoria não encontrada' }
  return {
    title: `Análise: ${cat.label_pt} — Registra Brasil`,
    description: `Indicadores da categoria ${cat.label_pt}: top políticos, evolução mensal, distribuição de severidade.`,
    alternates: { canonical: `/categorias/${slug}/analise` },
    openGraph: {
      title: `Análise: ${cat.label_pt} — Registra Brasil`,
      url: `${SITE_URL}/categorias/${slug}/analise`,
    },
  }
}

interface StatementRow {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  verification_status: string
  severity_score: number | null
  politician_id: string
  politicians: { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null } | null
}

function monthKey(date: string): string {
  return date.slice(0, 7)
}

export default async function CategoriaAnalisePage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const category = await getCategoryBySlug(supabase, slug)
  if (!category) notFound()

  // Fetch all non-removed statements in this category (via join table).
  const { data: joinRows } = await (supabase.from('statement_categories') as any)
    .select('statement_id, is_primary, statements!inner(id, slug, summary, statement_date, verification_status, severity_score, politician_id, politicians(id, slug, common_name, party, state, photo_url))')
    .eq('category_id', category.id)
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .limit(5000)

  const statements = ((joinRows ?? []) as Array<{ statements: StatementRow }>)
    .map((r) => r.statements)
    .filter(Boolean)

  // Aggregations
  const total = statements.length
  const byVerified: Record<string, number> = {}
  const bySeverity: Record<string, number> = {}
  const byMonth = new Map<string, number>()
  const byPolitician = new Map<string, { pol: StatementRow['politicians']; count: number; severity: number }>()

  for (const s of statements) {
    byVerified[s.verification_status] = (byVerified[s.verification_status] ?? 0) + 1
    if (s.severity_score) {
      bySeverity[s.severity_score] = (bySeverity[s.severity_score] ?? 0) + 1
    }
    const mk = monthKey(s.statement_date)
    byMonth.set(mk, (byMonth.get(mk) ?? 0) + 1)
    if (s.politicians) {
      const key = s.politician_id
      const existing = byPolitician.get(key) ?? { pol: s.politicians, count: 0, severity: 0 }
      existing.count++
      existing.severity += s.severity_score ?? 3
      byPolitician.set(key, existing)
    }
  }

  const topPoliticians = [...byPolitician.values()]
    .sort((a, b) => b.count - a.count || b.severity - a.severity)
    .slice(0, 10)

  // Last 24 months trend.
  const now = new Date()
  const months: Array<{ month: string; count: number }> = []
  for (let i = 23; i >= 0; i--) {
    const d = new Date(now.getUTCFullYear(), now.getUTCMonth() - i, 1)
    const k = `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`
    months.push({ month: k, count: byMonth.get(k) ?? 0 })
  }
  const maxMonthly = Math.max(1, ...months.map((m) => m.count))

  const recent = [...statements]
    .sort((a, b) => (a.statement_date < b.statement_date ? 1 : -1))
    .slice(0, 6)

  // Related categories — other primary categories that co-occur on this
  // set of statements. Done with a second join query scoped to our statement IDs.
  const stmtIds = statements.map((s) => s.id)
  let relatedCats: Array<{ slug: string; label_pt: string; count: number; color_hex: string }> = []
  if (stmtIds.length > 0) {
    const { data: coRows } = await (supabase.from('statement_categories') as any)
      .select('categories(slug, label_pt, color_hex)')
      .in('statement_id', stmtIds.slice(0, 2000))
      .neq('category_id', category.id)
    const tally = new Map<string, { slug: string; label_pt: string; count: number; color_hex: string }>()
    for (const row of (coRows ?? []) as Array<{ categories: { slug: string; label_pt: string; color_hex: string } | null }>) {
      const c = row.categories
      if (!c) continue
      const existing = tally.get(c.slug) ?? { ...c, count: 0 }
      existing.count++
      tally.set(c.slug, existing)
    }
    relatedCats = [...tally.values()].sort((a, b) => b.count - a.count).slice(0, 8)
  }

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Categorias', href: '/categorias' },
        { label: category.label_pt, href: `/categorias/${category.slug}` },
        { label: 'Análise' },
      ]} />

      <Link href={`/categorias/${category.slug}`} className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline mb-3">
        <ArrowLeft className="w-4 h-4" aria-hidden="true" /> Voltar à categoria
      </Link>

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <span className="w-4 h-4 rounded-full" style={{ backgroundColor: category.color_hex }} aria-hidden="true" />
          <BarChart3 className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Análise: {category.label_pt}</h1>
        </div>
        {category.description && <p className="text-sm text-gray-600 max-w-2xl">{category.description}</p>}
      </header>

      <section className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
        <StatCard label="Total" value={total} />
        <StatCard label="Verificadas" value={byVerified.verified ?? 0} tone="green" />
        <StatCard label="Contestadas" value={byVerified.disputed ?? 0} tone="amber" />
        <StatCard label="Políticos citados" value={byPolitician.size} />
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <TrendingUp className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Últimos 24 meses
        </h2>
        <div className="flex items-end gap-0.5 h-24" role="img" aria-label={`Gráfico de ${total} declarações ao longo de 24 meses`}>
          {months.map((m) => {
            const h = Math.max(2, (m.count / maxMonthly) * 96)
            return (
              <div key={m.month} className="flex-1 bg-blue-100 hover:bg-blue-300 relative group rounded-t" style={{ height: `${h}px` }} title={`${m.month}: ${m.count}`}>
                <span className="absolute bottom-full left-1/2 -translate-x-1/2 mb-1 text-[10px] bg-gray-900 text-white px-1 py-0.5 rounded opacity-0 group-hover:opacity-100 whitespace-nowrap transition-opacity">
                  {m.month}: {m.count}
                </span>
              </div>
            )
          })}
        </div>
        <div className="flex justify-between text-[10px] text-gray-500 mt-1 font-mono">
          <span>{months[0]?.month}</span>
          <span>{months[months.length - 1]?.month}</span>
        </div>
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Distribuição de severidade</h2>
        <div className="flex gap-2 items-end h-20">
          {[1, 2, 3, 4, 5].map((lvl) => {
            const n = bySeverity[lvl] ?? 0
            const maxSev = Math.max(1, ...Object.values(bySeverity))
            const h = Math.max(4, (n / maxSev) * 80)
            const cls = lvl >= 4 ? 'bg-red-500' : lvl === 3 ? 'bg-amber-400' : 'bg-blue-400'
            return (
              <div key={lvl} className="flex-1 flex flex-col items-center justify-end" title={`Severidade ${lvl}: ${n}`}>
                <span className={`w-full rounded-t ${cls}`} style={{ height: `${h}px` }} aria-hidden="true" />
                <span className="text-[10px] text-gray-500 mt-0.5">{lvl}</span>
                <span className="text-[10px] text-gray-400 tabular-nums">{n}</span>
              </div>
            )
          })}
        </div>
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
        <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-1.5">
          <Users className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Top 10 políticos nesta categoria
        </h2>
        {topPoliticians.length === 0 ? (
          <p className="text-sm text-gray-600">Sem dados.</p>
        ) : (
          <ol className="space-y-2">
            {topPoliticians.map((p, i) => {
              if (!p.pol) return null
              const barPct = (p.count / topPoliticians[0].count) * 100
              return (
                <li key={p.pol.id} className="flex items-center gap-3">
                  <span className="w-5 text-right text-xs tabular-nums text-gray-500">{i + 1}.</span>
                  {p.pol.photo_url ? (
                    <Image src={p.pol.photo_url} alt="" width={32} height={32} unoptimized className="w-8 h-8 rounded-full border border-gray-200" />
                  ) : (
                    <div className="w-8 h-8 rounded-full bg-gray-100 flex items-center justify-center text-xs font-bold text-gray-400">{p.pol.common_name[0]}</div>
                  )}
                  <div className="flex-1 min-w-0">
                    <Link href={`/politico/${p.pol.slug}`} className="text-sm font-medium text-gray-900 hover:text-blue-700 hover:underline truncate block">
                      {p.pol.common_name}
                    </Link>
                    <div className="text-xs text-gray-500">{p.pol.party}{p.pol.state ? `-${p.pol.state}` : ''}</div>
                    <div className="h-1.5 bg-gray-100 rounded-full mt-0.5 overflow-hidden">
                      <div className="h-full bg-blue-500" style={{ width: `${barPct}%` }} aria-hidden="true" />
                    </div>
                  </div>
                  <span className="tabular-nums text-xs font-mono text-blue-700">{p.count}</span>
                </li>
              )
            })}
          </ol>
        )}
      </section>

      {relatedCats.length > 0 && (
        <section className="bg-white border border-gray-200 rounded-xl p-5 mb-8">
          <h2 className="text-sm font-semibold text-gray-900 mb-3">Categorias que co-ocorrem</h2>
          <ul className="flex flex-wrap gap-2">
            {relatedCats.map((c) => (
              <li key={c.slug}>
                <Link
                  href={`/categorias/${c.slug}`}
                  className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs rounded-full bg-gray-50 hover:bg-gray-100 border border-gray-200 text-gray-800"
                >
                  <span className="w-2 h-2 rounded-full" style={{ backgroundColor: c.color_hex }} aria-hidden="true" />
                  {c.label_pt}
                  <span className="text-gray-500 tabular-nums">{c.count}</span>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section>
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Mais recentes</h2>
        <ul className="space-y-2">
          {recent.map((s) => (
            <li key={s.id} className="bg-white border border-gray-200 rounded-lg p-3 text-sm">
              <div className="flex items-center justify-between gap-3 mb-1 text-xs text-gray-500">
                <span>{s.politicians?.common_name ?? '—'} ({s.politicians?.party ?? '—'})</span>
                <span>{s.statement_date}</span>
              </div>
              <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-gray-900 hover:text-blue-700 hover:underline">
                {s.summary.slice(0, 160)}{s.summary.length > 160 ? '…' : ''}
              </Link>
            </li>
          ))}
        </ul>
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
