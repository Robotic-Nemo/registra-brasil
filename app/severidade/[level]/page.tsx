import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SEVERITIES, severityDef } from '@/lib/severity/labels'

export const revalidate = 900

interface PageProps {
  params: Promise<{ level: string }>
  searchParams: Promise<{ page?: string }>
}

const PAGE_SIZE = 30

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { level } = await params
  const def = severityDef(Number(level))
  if (!def) return { title: 'Nível inválido' }
  return {
    title: `${def.label} — Registra Brasil`,
    description: `Declarações classificadas no ${def.label.toLowerCase()}: ${def.description}`,
    alternates: { canonical: `/severidade/${def.level}` },
    openGraph: {
      title: `${def.label} — Registra Brasil`,
      description: def.description,
      type: 'website',
      siteName: 'Registra Brasil',
    },
  }
}

export async function generateStaticParams() {
  return SEVERITIES.map((s) => ({ level: String(s.level) }))
}

function fmtDate(iso: string): string {
  return new Date(iso + 'T12:00:00Z').toLocaleDateString('pt-BR', {
    day: '2-digit', month: 'short', year: 'numeric',
  })
}

export default async function SeverityPage({ params, searchParams }: PageProps) {
  const { level: levelStr } = await params
  const { page: pageStr } = await searchParams
  const def = severityDef(Number(levelStr))
  if (!def) notFound()

  const page = Math.max(1, Math.min(50, Number(pageStr) || 1))
  const offset = (page - 1) * PAGE_SIZE

  const supabase = getSupabaseServiceClient()
  const { data, count } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, politicians(slug, common_name, party, state, photo_url)', { count: 'exact' })
    .eq('severity_score', def.level)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .range(offset, offset + PAGE_SIZE - 1)

  type Row = {
    id: string; slug: string | null; summary: string; statement_date: string
    verification_status: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null; photo_url: string | null } | null
  }
  const rows = ((data ?? []) as Row[])
  const total = Number(count ?? 0)
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE))

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <nav className="mb-4 text-sm">
        <Link href="/severidade" className="text-indigo-700 hover:underline dark:text-indigo-300">
          ← Todos os níveis
        </Link>
      </nav>

      <header className="mb-6 flex items-start gap-3">
        <AlertTriangle className="mt-1 h-7 w-7 shrink-0 text-amber-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Gravidade editorial
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            {def.label}
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            {def.description}
          </p>
          <p className="mt-2 text-sm text-gray-500">
            {total.toLocaleString('pt-BR')} declarações neste nível.
          </p>
        </div>
      </header>

      {rows.length === 0 ? (
        <p className="text-gray-500">Nenhum registro neste nível ainda.</p>
      ) : (
        <ul className="flex flex-col gap-3">
          {rows.map((r) => {
            const p = r.politicians
            return (
              <li key={r.id} className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
                <div className="flex items-start gap-3">
                  {p?.photo_url ? (
                    <Image src={p.photo_url} alt="" width={40} height={40} unoptimized className="h-10 w-10 shrink-0 rounded-full object-cover" />
                  ) : <span className="h-10 w-10 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />}
                  <div className="min-w-0 flex-1">
                    <Link
                      href={`/declaracao/${r.slug ?? r.id}`}
                      className="block font-medium text-indigo-700 hover:underline dark:text-indigo-300"
                    >
                      {r.summary.slice(0, 220)}{r.summary.length > 220 ? '…' : ''}
                    </Link>
                    <div className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                      {p && (
                        <Link href={`/politico/${p.slug}`} className="hover:underline">
                          {p.common_name}
                        </Link>
                      )}
                      {p?.party && <> · {p.party}{p.state ? `-${p.state}` : ''}</>}
                      {' · '}{fmtDate(r.statement_date)}
                      <span className={`ml-2 rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
                        r.verification_status === 'verified'
                          ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-200'
                          : r.verification_status === 'disputed'
                          ? 'bg-rose-100 text-rose-900 dark:bg-rose-950/40 dark:text-rose-200'
                          : 'bg-amber-100 text-amber-900 dark:bg-amber-950/40 dark:text-amber-200'
                      }`}>
                        {r.verification_status}
                      </span>
                    </div>
                  </div>
                </div>
              </li>
            )
          })}
        </ul>
      )}

      {totalPages > 1 && (
        <nav className="mt-8 flex items-center justify-between text-sm" aria-label="Paginação">
          <Link
            href={`/severidade/${def.level}?page=${Math.max(1, page - 1)}`}
            className={`rounded border px-3 py-1.5 ${page <= 1 ? 'pointer-events-none opacity-40' : 'border-gray-300 bg-white hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900'}`}
            aria-disabled={page <= 1}
          >
            ← Anterior
          </Link>
          <span className="tabular-nums text-gray-600 dark:text-gray-400">
            Página {page} de {totalPages}
          </span>
          <Link
            href={`/severidade/${def.level}?page=${Math.min(totalPages, page + 1)}`}
            className={`rounded border px-3 py-1.5 ${page >= totalPages ? 'pointer-events-none opacity-40' : 'border-gray-300 bg-white hover:bg-gray-50 dark:border-gray-700 dark:bg-gray-900'}`}
            aria-disabled={page >= totalPages}
          >
            Próxima →
          </Link>
        </nav>
      )}
    </main>
  )
}
