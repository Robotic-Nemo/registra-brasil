import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { BarChart3, Plus, X } from 'lucide-react'

export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps {
  searchParams: Promise<{ p?: string | string[] }>
}

const SLUG_RE = /^[a-z0-9][a-z0-9-]*[a-z0-9]$/i

export async function generateMetadata({ searchParams }: PageProps): Promise<Metadata> {
  const sp = await searchParams
  const slugs = ([] as string[]).concat(sp.p ?? []).filter((s) => SLUG_RE.test(s))
  const title = slugs.length >= 2 ? `Análise: ${slugs.join(' · ')} — Registra Brasil` : 'Análise comparativa — Registra Brasil'
  return {
    title,
    description: 'Comparação lado-a-lado de políticos brasileiros com base em declarações registradas e score de atividade.',
    alternates: { canonical: `/analise${slugs.length > 0 ? '?' + slugs.map((s) => 'p=' + s).join('&') : ''}` },
    openGraph: { title, url: `${SITE_URL}/analise` },
  }
}

interface Politician {
  id: string
  slug: string
  common_name: string
  party: string
  state: string | null
  photo_url: string | null
}

interface ScoreRow {
  politician_id: string
  statements_count: number
  verified_count: number
  disputed_count: number
  severity_sum: number
  recency_score: number
  weighted_score: number
  last_statement_date: string | null
  first_statement_date: string | null
}

interface CategoryShareRow { category_id: string; count: number }

function pct(n: number, total: number): string {
  if (!total) return '—'
  return `${Math.round((n / total) * 100)}%`
}

export default async function AnalisePage({ searchParams }: PageProps) {
  const sp = await searchParams
  const rawSlugs = ([] as string[]).concat(sp.p ?? [])
  const slugs = [...new Set(rawSlugs.filter((s) => SLUG_RE.test(s)))].slice(0, 4)

  const supabase = await getSupabaseServerClient()

  const { data: polRows } = slugs.length
    ? await (supabase.from('politicians') as any)
        .select('id, slug, common_name, party, state, photo_url')
        .in('slug', slugs)
        .eq('is_active', true)
    : { data: [] as Politician[] }

  const pols = ((polRows ?? []) as Politician[])
    .sort((a, b) => slugs.indexOf(a.slug) - slugs.indexOf(b.slug))
  const ids = pols.map((p) => p.id)

  const { data: scoreRows } = ids.length
    ? await (supabase.from('politician_activity_scores') as any)
        .select('politician_id, statements_count, verified_count, disputed_count, severity_sum, recency_score, weighted_score, last_statement_date, first_statement_date')
        .in('politician_id', ids)
    : { data: [] as ScoreRow[] }

  const scoreById = new Map<string, ScoreRow>((scoreRows ?? []).map((s: ScoreRow) => [s.politician_id, s]))

  // Per-politician top categories (single pass through statement_categories with FK filter).
  const catByPolitician = new Map<string, Array<{ slug: string; label: string; count: number }>>()
  if (ids.length) {
    const { data: scRows } = await (supabase.from('statement_categories') as any)
      .select('category_id, categories(slug, label_pt), statements!inner(politician_id, verification_status)')
      .in('statements.politician_id', ids)
      .neq('statements.verification_status', 'removed')
      .eq('is_primary', true)
    type Row = { category_id: string; categories: { slug: string; label_pt: string } | null; statements: { politician_id: string } | null }
    const tally = new Map<string, Map<string, { label: string; slug: string; count: number }>>()
    for (const r of (scRows ?? []) as Row[]) {
      const polId = r.statements?.politician_id
      const cat = r.categories
      if (!polId || !cat) continue
      if (!tally.has(polId)) tally.set(polId, new Map())
      const bucket = tally.get(polId)!
      const existing = bucket.get(cat.slug) ?? { label: cat.label_pt, slug: cat.slug, count: 0 }
      existing.count++
      bucket.set(cat.slug, existing)
    }
    for (const [polId, bucket] of tally) {
      catByPolitician.set(polId, [...bucket.values()].sort((a, b) => b.count - a.count).slice(0, 5))
    }
  }

  // Severity bucket counts per politician (head-query per buckets avoided — one
  // array pull per politician OK for <=4).
  const severityByPolitician = new Map<string, Record<string, number>>()
  if (ids.length) {
    const { data: sevRows } = await (supabase.from('statements') as any)
      .select('politician_id, severity_score')
      .in('politician_id', ids)
      .neq('verification_status', 'removed')
      .not('severity_score', 'is', null)
    type Row = { politician_id: string; severity_score: number | null }
    for (const r of (sevRows ?? []) as Row[]) {
      const bucket = severityByPolitician.get(r.politician_id) ?? {}
      const k = String(r.severity_score ?? 0)
      bucket[k] = (bucket[k] ?? 0) + 1
      severityByPolitician.set(r.politician_id, bucket)
    }
  }

  const maxWeighted = Math.max(
    1,
    ...pols.map((p) => scoreById.get(p.id)?.weighted_score ?? 0),
  )

  const { data: allPoliticians } = await (supabase.from('politicians') as any)
    .select('slug, common_name, party, state')
    .eq('is_active', true)
    .order('common_name')

  const active = (allPoliticians ?? []) as Array<{ slug: string; common_name: string; party: string; state: string | null }>

  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Análise' }]} />

      <header className="mb-6">
        <div className="flex items-center gap-3 mb-2">
          <BarChart3 className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Análise comparativa</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Compare até 4 políticos lado a lado com base em declarações registradas, score de
          atividade ponderado (severidade × recência), distribuição de severidade e categorias
          dominantes.
        </p>
      </header>

      <PoliticianPicker
        current={pols.map((p) => ({ slug: p.slug, label: `${p.common_name} (${p.party}${p.state ? '-' + p.state : ''})` }))}
        options={active}
      />

      {pols.length < 2 && (
        <p className="text-sm text-gray-600 bg-blue-50 border border-blue-200 rounded p-4 mt-6">
          Selecione ao menos 2 políticos no menu acima para ver a comparação.
        </p>
      )}

      {pols.length >= 2 && (
        <div className="mt-8 space-y-8">
          {/* Header cards */}
          <section className="grid grid-cols-2 lg:grid-cols-4 gap-3">
            {pols.map((p) => (
              <article key={p.id} className="bg-white border border-gray-200 rounded-xl p-4 text-center">
                {p.photo_url ? (
                  <Image src={p.photo_url} alt="" width={72} height={72} unoptimized className="w-16 h-16 rounded-full object-cover border border-gray-200 mx-auto mb-2" />
                ) : (
                  <div className="w-16 h-16 rounded-full bg-gray-100 mx-auto mb-2 flex items-center justify-center text-xl font-bold text-gray-400">{p.common_name[0]}</div>
                )}
                <p className="font-semibold text-gray-900 text-sm truncate">{p.common_name}</p>
                <p className="text-xs text-gray-500">{p.party}{p.state ? `-${p.state}` : ''}</p>
                <Link href={`/politico/${p.slug}`} className="inline-block mt-2 text-xs text-blue-700 hover:underline">Perfil →</Link>
              </article>
            ))}
          </section>

          {/* Weighted score bars */}
          <section className="bg-white border border-gray-200 rounded-xl p-5">
            <h2 className="text-sm font-semibold text-gray-900 mb-3">Score ponderado (severidade × decaimento)</h2>
            <ul className="space-y-3">
              {pols.map((p) => {
                const sc = scoreById.get(p.id)
                const val = sc?.weighted_score ?? 0
                return (
                  <li key={p.id}>
                    <div className="flex items-center justify-between mb-1 text-xs">
                      <span className="font-medium text-gray-800">{p.common_name}</span>
                      <span className="tabular-nums text-blue-700 font-mono">{val.toFixed(1)}</span>
                    </div>
                    <div className="h-3 bg-gray-100 rounded-full overflow-hidden">
                      <div className="h-full bg-gradient-to-r from-blue-500 to-blue-700" style={{ width: `${(val / maxWeighted) * 100}%` }} aria-hidden="true" />
                    </div>
                  </li>
                )
              })}
            </ul>
          </section>

          {/* Stats table */}
          <section className="bg-white border border-gray-200 rounded-xl overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-xs text-gray-500 uppercase tracking-wider">
                  <th className="px-4 py-2">Métrica</th>
                  {pols.map((p) => <th key={p.id} className="px-3 py-2 whitespace-nowrap">{p.common_name}</th>)}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {[
                  { label: 'Total de declarações', fn: (s: ScoreRow | undefined) => s?.statements_count ?? 0 },
                  { label: 'Verificadas', fn: (s: ScoreRow | undefined) => s?.verified_count ?? 0 },
                  { label: 'Contestadas', fn: (s: ScoreRow | undefined) => s?.disputed_count ?? 0 },
                  { label: '% verificadas', fn: (s: ScoreRow | undefined) => pct(s?.verified_count ?? 0, s?.statements_count ?? 0) },
                  { label: '% contestadas', fn: (s: ScoreRow | undefined) => pct(s?.disputed_count ?? 0, s?.statements_count ?? 0) },
                  { label: 'Severidade total', fn: (s: ScoreRow | undefined) => Math.round(s?.severity_sum ?? 0) },
                  { label: 'Score de recência', fn: (s: ScoreRow | undefined) => (s?.recency_score ?? 0).toFixed(1) },
                  { label: 'Declaração mais antiga', fn: (s: ScoreRow | undefined) => s?.first_statement_date ?? '—' },
                  { label: 'Declaração mais recente', fn: (s: ScoreRow | undefined) => s?.last_statement_date ?? '—' },
                ].map((row) => (
                  <tr key={row.label}>
                    <td className="px-4 py-2 text-gray-700">{row.label}</td>
                    {pols.map((p) => (
                      <td key={p.id} className="px-3 py-2 tabular-nums font-medium text-gray-900 whitespace-nowrap">
                        {row.fn(scoreById.get(p.id))}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </section>

          {/* Severity distribution */}
          <section className="bg-white border border-gray-200 rounded-xl p-5">
            <h2 className="text-sm font-semibold text-gray-900 mb-3">Distribuição de severidade (1–5)</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {pols.map((p) => {
                const bucket = severityByPolitician.get(p.id) ?? {}
                const max = Math.max(1, ...Object.values(bucket))
                return (
                  <div key={p.id}>
                    <p className="text-xs text-gray-600 mb-1.5">{p.common_name}</p>
                    <div className="flex gap-1 items-end h-16">
                      {[1, 2, 3, 4, 5].map((lvl) => {
                        const n = bucket[String(lvl)] ?? 0
                        const h = Math.max(4, (n / max) * 64)
                        const cls = lvl >= 4 ? 'bg-red-500' : lvl === 3 ? 'bg-amber-400' : 'bg-blue-400'
                        return (
                          <div key={lvl} className="flex-1 flex flex-col items-center" title={`Severidade ${lvl}: ${n}`}>
                            <span className={`w-full rounded-t ${cls}`} style={{ height: `${h}px` }} aria-hidden="true" />
                            <span className="text-[10px] text-gray-500 mt-0.5">{lvl}</span>
                          </div>
                        )
                      })}
                    </div>
                  </div>
                )
              })}
            </div>
          </section>

          {/* Top categories */}
          <section className="bg-white border border-gray-200 rounded-xl p-5">
            <h2 className="text-sm font-semibold text-gray-900 mb-3">Top 5 categorias primárias</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {pols.map((p) => {
                const cats = catByPolitician.get(p.id) ?? []
                return (
                  <div key={p.id}>
                    <p className="text-xs text-gray-600 mb-2">{p.common_name}</p>
                    {cats.length === 0 ? (
                      <p className="text-xs text-gray-500">—</p>
                    ) : (
                      <ol className="text-xs space-y-1">
                        {cats.map((c, i) => (
                          <li key={c.slug} className="flex items-center justify-between gap-2">
                            <Link href={`/categorias/${c.slug}`} className="text-blue-700 hover:underline truncate flex-1">
                              {i + 1}. {c.label}
                            </Link>
                            <span className="tabular-nums text-gray-600">{c.count}</span>
                          </li>
                        ))}
                      </ol>
                    )}
                  </div>
                )
              })}
            </div>
          </section>
        </div>
      )}
    </main>
  )
}

function PoliticianPicker({
  current,
  options,
}: {
  current: Array<{ slug: string; label: string }>
  options: Array<{ slug: string; common_name: string; party: string; state: string | null }>
}) {
  const remainingSlots = Math.max(0, 4 - current.length)
  const currentSlugs = new Set(current.map((c) => c.slug))
  const availableOptions = options.filter((o) => !currentSlugs.has(o.slug))

  function linkWithoutSlug(removeSlug: string): string {
    const keep = current.filter((c) => c.slug !== removeSlug).map((c) => `p=${c.slug}`).join('&')
    return `/analise${keep ? '?' + keep : ''}`
  }

  function linkWithSlug(addSlug: string): string {
    const next = [...current.map((c) => c.slug), addSlug]
    return `/analise?${next.map((s) => 'p=' + s).join('&')}`
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-4">
      <div className="flex flex-wrap gap-2 items-center mb-3">
        {current.map((c) => (
          <span key={c.slug} className="inline-flex items-center gap-1 pl-3 pr-1 py-1 bg-blue-50 border border-blue-200 rounded-full text-xs">
            {c.label}
            <Link href={linkWithoutSlug(c.slug)} aria-label={`Remover ${c.label}`} className="w-5 h-5 inline-flex items-center justify-center text-blue-600 hover:text-blue-900">
              <X className="w-3 h-3" aria-hidden="true" />
            </Link>
          </span>
        ))}
        {current.length === 0 && <span className="text-xs text-gray-500">Nenhum político selecionado.</span>}
      </div>
      {remainingSlots > 0 && (
        <form method="get" action="/analise" className="flex items-center gap-2">
          {current.map((c) => <input key={c.slug} type="hidden" name="p" value={c.slug} />)}
          <Plus className="w-4 h-4 text-gray-500" aria-hidden="true" />
          <select name="p" defaultValue="" className="flex-1 px-2 py-1.5 border border-gray-300 rounded text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500">
            <option value="" disabled>Adicionar político…</option>
            {availableOptions.map((p) => (
              <option key={p.slug} value={p.slug}>{p.common_name} ({p.party}{p.state ? '-' + p.state : ''})</option>
            ))}
          </select>
          <button type="submit" className="px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium rounded">
            Adicionar
          </button>
        </form>
      )}
      {remainingSlots === 0 && (
        <p className="text-xs text-gray-500">Máximo de 4 políticos por comparação.</p>
      )}
    </div>
  )
}
