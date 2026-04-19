import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { Trophy } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Top de todos os tempos — Registra Brasil',
  description:
    'Ranking consolidado do arquivo: declarações mais graves, políticos mais registrados e categorias mais usadas, em todos os anos.',
  alternates: { canonical: '/top' },
  openGraph: {
    title: 'Top de todos os tempos — Registra Brasil',
    description: 'Leaderboards consolidados do acervo.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Top de todos os tempos — Registra Brasil',
    description: 'Leaderboards consolidados do acervo.',
  },
}

function fmtDate(iso: string): string {
  return new Date(iso + 'T12:00:00Z').toLocaleDateString('pt-BR', {
    day: '2-digit', month: 'short', year: 'numeric',
  })
}

export default async function TopPage() {
  const supabase = getSupabaseServiceClient()

  const [stmtRes, polRes, catRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, statement_date, severity_score, politicians!inner(slug, common_name, party, state, photo_url)')
      .neq('verification_status', 'removed')
      .order('severity_score', { ascending: false, nullsFirst: false })
      .order('statement_date', { ascending: false })
      .limit(20),
    (supabase.rpc as any)('top_politicians_all_time', { result_limit: 20 }),
    (supabase.rpc as any)('top_categories_all_time', { result_limit: 20 }),
  ])

  type StmtRow = {
    id: string; slug: string | null; summary: string; statement_date: string; severity_score: number | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null }
  }
  const topStatements = ((stmtRes.data ?? []) as StmtRow[])

  type PolRow = { id: string; slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null; total: number | string }
  const polCounts = ((polRes.data ?? []) as PolRow[]).map((p) => ({ ...p, count: Number(p.total) }))

  type CatRow = { id: string; slug: string; label_pt: string; color_hex: string | null; total: number | string }
  const catCounts = ((catRes.data ?? []) as CatRow[]).map((c) => ({ ...c, count: Number(c.total) }))

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <Trophy className="mt-1 h-7 w-7 shrink-0 text-amber-500" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Leaderboards
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Top de todos os tempos
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            Ranking consolidado do arquivo em três dimensões: declarações mais
            graves, políticos mais registrados e categorias mais usadas,
            considerando toda a história do acervo.
          </p>
        </div>
      </header>

      <div className="grid grid-cols-1 gap-8 md:grid-cols-5">
        <section className="md:col-span-3">
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
            Top 20 por gravidade
          </h2>
          {topStatements.length === 0 ? (
            <p className="text-sm text-gray-500">—</p>
          ) : (
            <ol className="flex flex-col gap-2">
              {topStatements.map((s, i) => {
                const p = s.politicians
                return (
                  <li key={s.id} className="flex gap-3 rounded-xl border border-gray-200 bg-white p-3 dark:border-gray-800 dark:bg-gray-900">
                    <span className="shrink-0 rounded-full bg-gray-100 px-2 py-1 text-xs font-bold tabular-nums text-gray-700 dark:bg-gray-800 dark:text-gray-300">
                      #{i + 1}
                    </span>
                    <div className="min-w-0 flex-1">
                      <Link href={`/declaracao/${s.slug ?? s.id}`} className="block text-sm font-medium text-indigo-700 hover:underline dark:text-indigo-300">
                        {s.summary.slice(0, 180)}{s.summary.length > 180 ? '…' : ''}
                      </Link>
                      <div className="mt-0.5 text-xs text-gray-500 dark:text-gray-400">
                        <Link href={`/politico/${p.slug}`} className="hover:underline">{p.common_name}</Link>
                        {p.party && <> · {p.party}{p.state ? `-${p.state}` : ''}</>}
                        {' · '}{fmtDate(s.statement_date)}
                        {s.severity_score !== null && <> · <span className="font-semibold text-amber-700 dark:text-amber-300">sev {s.severity_score}</span></>}
                      </div>
                    </div>
                  </li>
                )
              })}
            </ol>
          )}
        </section>

        <aside className="md:col-span-2 flex flex-col gap-6">
          <section>
            <h2 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
              Políticos mais registrados
            </h2>
            <ol className="flex flex-col gap-1.5">
              {polCounts.map((p, i) => (
                <li key={p.id}>
                  <Link href={`/politico/${p.slug}`} className="flex items-center gap-2 rounded px-1 py-0.5 hover:bg-gray-50 dark:hover:bg-gray-800">
                    <span className="w-6 shrink-0 text-xs tabular-nums text-gray-500 dark:text-gray-500">{i + 1}.</span>
                    {p.photo_url ? (
                      <Image src={p.photo_url} alt="" width={24} height={24} unoptimized className="h-6 w-6 shrink-0 rounded-full object-cover" />
                    ) : <span className="h-6 w-6 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />}
                    <span className="min-w-0 flex-1 truncate text-sm">{p.common_name}</span>
                    <span className="shrink-0 text-sm font-semibold tabular-nums text-indigo-700 dark:text-indigo-300">{p.count.toLocaleString('pt-BR')}</span>
                  </Link>
                </li>
              ))}
            </ol>
          </section>

          <section>
            <h2 className="mb-3 text-sm font-semibold uppercase tracking-wider text-gray-700 dark:text-gray-300">
              Categorias mais usadas
            </h2>
            <ol className="flex flex-col gap-1.5">
              {catCounts.map((c, i) => (
                <li key={c.id}>
                  <Link href={`/categorias/${c.slug}`} className="flex items-center gap-2 rounded px-1 py-0.5 hover:bg-gray-50 dark:hover:bg-gray-800">
                    <span className="w-6 shrink-0 text-xs tabular-nums text-gray-500 dark:text-gray-500">{i + 1}.</span>
                    <span aria-hidden className="h-2.5 w-2.5 rounded-full" style={{ backgroundColor: c.color_hex ?? '#9ca3af' }} />
                    <span className="min-w-0 flex-1 truncate text-sm">{c.label_pt}</span>
                    <span className="shrink-0 text-sm font-semibold tabular-nums text-indigo-700 dark:text-indigo-300">{c.count.toLocaleString('pt-BR')}</span>
                  </Link>
                </li>
              ))}
            </ol>
          </section>
        </aside>
      </div>

      <footer className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Veja também o <Link href="/ranking" className="underline">ranking
          ponderado</Link> (que penaliza registros antigos), os{' '}
          <Link href="/destaques" className="underline">destaques do mês</Link>,
          e <Link href="/esta-semana" className="underline">a semana</Link>.
        </p>
      </footer>
    </main>
  )
}
