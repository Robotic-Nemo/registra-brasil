import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { History, Rss } from 'lucide-react'

export const revalidate = 300

const FIELD_LABELS: Record<string, string> = {
  summary: 'Resumo',
  full_quote: 'Citação literal',
  statement_date: 'Data',
  venue: 'Local',
  event_name: 'Evento',
  verification_status: 'Status',
  primary_source_url: 'URL da fonte',
  primary_source_type: 'Tipo de fonte',
  editor_notes: 'Notas editoriais',
  severity_score: 'Severidade',
  minors_involved: 'Envolve menores',
  slug: 'Slug',
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Atualizações e correções — Registra Brasil',
  description:
    'Log público, append-only, de cada edição editorial feita em declarações do arquivo. Transparência de correções.',
  alternates: {
    canonical: '/atualizacoes',
    types: { 'application/rss+xml': '/atualizacoes/feed.xml' },
  },
  openGraph: {
    title: 'Atualizações e correções — Registra Brasil',
    description: 'Cada edição feita em uma declaração fica aqui, pública e datada.',
    type: 'website',
    url: `${SITE_URL}/atualizacoes`,
  },
}

interface RevisionRow {
  id: string
  revision_number: number
  changed_fields: Record<string, { before: unknown; after: unknown }>
  reason: string | null
  actor: string | null
  created_at: string
  statement_id: string
  statements: {
    slug: string | null
    summary: string
    politicians: { common_name: string; slug: string } | null
  } | null
}

export default async function AtualizacoesPage({
  searchParams,
}: {
  searchParams: Promise<{ page?: string }>
}) {
  const { page: pageStr } = await searchParams
  const page = Math.max(1, parseInt(pageStr ?? '1', 10) || 1)
  const perPage = 30
  const offset = (page - 1) * perPage

  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('statement_revisions') as any)
    .select(
      'id, revision_number, changed_fields, reason, actor, created_at, statement_id, statements(slug, summary, politicians(common_name, slug))',
    )
    .order('created_at', { ascending: false })
    .range(offset, offset + perPage - 1)

  const revisions = ((data ?? []) as RevisionRow[]).filter((r) => r.statements !== null)

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Atualizações' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <History className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Atualizações e correções</h1>
          <a
            href="/atualizacoes/feed.xml"
            rel="alternate"
            type="application/rss+xml"
            className="ml-auto inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
          >
            <Rss className="w-3.5 h-3.5" aria-hidden="true" />
            RSS
          </a>
        </div>
        <p className="text-sm text-gray-700 leading-relaxed max-w-2xl">
          Cada edição feita em uma declaração deste arquivo deixa rastro público. Este log é
          append-only e inclui correções de fonte, ajustes de datas, reclassificações e
          retratações.
        </p>
      </header>

      {revisions.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Nada para mostrar nesta página.
        </p>
      ) : (
        <ol className="flex flex-col gap-3">
          {revisions.map((r) => {
            const fields = Object.keys(r.changed_fields).map((f) => FIELD_LABELS[f] ?? f)
            const stmt = r.statements!
            const stmtHref = `/declaracao/${stmt.slug ?? r.statement_id}`
            const polName = stmt.politicians?.common_name ?? '—'
            return (
              <li key={r.id} className="bg-white border border-gray-200 rounded-lg p-4 text-sm">
                <div className="flex items-center justify-between gap-3 mb-2">
                  <span className="text-xs text-gray-500">
                    <time dateTime={r.created_at}>
                      {new Date(r.created_at).toLocaleString('pt-BR', {
                        dateStyle: 'medium',
                        timeStyle: 'short',
                      })}
                    </time>
                    {' · '}rev #{r.revision_number}
                  </span>
                  <span className="text-xs text-gray-500">{r.actor ?? 'admin'}</span>
                </div>
                <p className="text-gray-900 mb-1">
                  <span className="font-semibold">{polName}</span>: {stmt.summary.slice(0, 140)}
                  {stmt.summary.length > 140 ? '…' : ''}
                </p>
                <p className="text-xs text-gray-600 mb-2">
                  Alterou: {fields.join(', ')}
                </p>
                {r.reason && (
                  <p className="text-xs italic text-gray-700 mb-2">“{r.reason}”</p>
                )}
                <div className="flex gap-3 text-xs">
                  <Link href={stmtHref} className="text-blue-700 hover:underline">
                    Ver declaração
                  </Link>
                  <Link href={`${stmtHref}/historico`} className="text-blue-700 hover:underline">
                    Histórico completo
                  </Link>
                </div>
              </li>
            )
          })}
        </ol>
      )}

      <nav className="mt-8 flex items-center justify-between text-sm" aria-label="Paginação">
        {page > 1 ? (
          <Link href={`/atualizacoes?page=${page - 1}`} className="text-blue-700 hover:underline">
            ← Página anterior
          </Link>
        ) : (
          <span />
        )}
        <span className="text-gray-500 text-xs">Página {page}</span>
        {revisions.length === perPage ? (
          <Link href={`/atualizacoes?page=${page + 1}`} className="text-blue-700 hover:underline">
            Próxima página →
          </Link>
        ) : (
          <span />
        )}
      </nav>
    </main>
  )
}
