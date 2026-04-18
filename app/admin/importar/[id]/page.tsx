import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { RevertBatchButton } from './RevertBatchButton'

export const dynamic = 'force-dynamic'

interface PageProps {
  params: Promise<{ id: string }>
}

interface Batch {
  id: string
  source_filename: string | null
  source_size: number | null
  checksum: string | null
  row_count_total: number
  row_count_created: number
  row_count_skipped: number
  row_count_errored: number
  status: string
  error_log: Array<{ line: number; message: string }> | null
  note: string | null
  created_at: string
  created_by: string | null
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export default async function BatchDetail({ params }: PageProps) {
  const { id } = await params
  if (!UUID_RE.test(id)) notFound()

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('import_batches') as any)
    .select('*')
    .eq('id', id)
    .maybeSingle()

  if (!data) notFound()
  const batch = data as Batch

  // Sample of statements this batch produced
  const { data: stmts } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, politicians(common_name, party)')
    .eq('import_batch_id', id)
    .order('statement_date', { ascending: false })
    .limit(25)

  const sampled = (stmts ?? []) as Array<{
    id: string
    slug: string | null
    summary: string
    statement_date: string
    verification_status: string
    politicians: { common_name: string; party: string } | null
  }>

  const isReverted = batch.status === 'reverted'

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin/importar" className="p-1.5 rounded hover:bg-gray-100">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <h1 className="text-xl font-bold text-gray-900">Lote de importação</h1>
        <span className={`ml-auto text-xs px-2 py-0.5 rounded font-medium ${isReverted ? 'bg-red-100 text-red-800' : 'bg-green-100 text-green-800'}`}>
          {batch.status}
        </span>
      </div>

      <section className="bg-white border border-gray-200 rounded-xl p-5 mb-6 text-sm">
        <dl className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-2">
          <div><dt className="text-xs text-gray-500 uppercase tracking-wider">Arquivo</dt><dd className="font-mono">{batch.source_filename ?? '—'}</dd></div>
          <div><dt className="text-xs text-gray-500 uppercase tracking-wider">Tamanho</dt><dd>{batch.source_size ? `${(batch.source_size / 1024).toFixed(1)} KB` : '—'}</dd></div>
          <div><dt className="text-xs text-gray-500 uppercase tracking-wider">Criado em</dt><dd>{new Date(batch.created_at).toLocaleString('pt-BR')}</dd></div>
          <div><dt className="text-xs text-gray-500 uppercase tracking-wider">Por</dt><dd>{batch.created_by ?? 'admin'}</dd></div>
          <div className="sm:col-span-2"><dt className="text-xs text-gray-500 uppercase tracking-wider">Checksum</dt><dd className="font-mono text-xs break-all text-gray-600">{batch.checksum}</dd></div>
          {batch.note && <div className="sm:col-span-2"><dt className="text-xs text-gray-500 uppercase tracking-wider">Nota</dt><dd className="italic">{batch.note}</dd></div>}
        </dl>

        <hr className="my-4 border-gray-100" />

        <div className="grid grid-cols-4 gap-3 text-center text-xs">
          <div><p className="text-lg font-bold tabular-nums text-gray-800">{batch.row_count_total}</p><p className="text-gray-500">total</p></div>
          <div><p className="text-lg font-bold tabular-nums text-green-700">{batch.row_count_created}</p><p className="text-gray-500">criadas</p></div>
          <div><p className="text-lg font-bold tabular-nums text-amber-700">{batch.row_count_skipped}</p><p className="text-gray-500">puladas</p></div>
          <div><p className="text-lg font-bold tabular-nums text-red-700">{batch.row_count_errored}</p><p className="text-gray-500">erros</p></div>
        </div>
      </section>

      {batch.error_log && batch.error_log.length > 0 && (
        <details className="mb-6 bg-white border border-gray-200 rounded-xl p-5 text-sm">
          <summary className="cursor-pointer font-semibold text-gray-900">Log de erros ({batch.error_log.length})</summary>
          <ul className="mt-3 space-y-1 text-xs font-mono">
            {batch.error_log.slice(0, 200).map((e, i) => (
              <li key={i}>
                linha {e.line}: <span className="text-red-700">{e.message}</span>
              </li>
            ))}
            {batch.error_log.length > 200 && <li className="italic text-gray-500">…+{batch.error_log.length - 200} linhas</li>}
          </ul>
        </details>
      )}

      <section className="mb-6">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">
          Declarações produzidas ({sampled.length === 25 ? `mostrando 25 mais recentes de ${batch.row_count_created}` : sampled.length})
        </h2>
        {sampled.length === 0 ? (
          <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-3">
            Nenhuma declaração ativa neste lote {isReverted ? '(já revertido)' : ''}.
          </p>
        ) : (
          <ul className="flex flex-col gap-2 text-sm">
            {sampled.map((s) => (
              <li key={s.id} className="bg-white border border-gray-200 rounded p-3">
                <div className="flex items-center justify-between gap-3 mb-1 text-xs text-gray-500">
                  <span>{s.politicians?.common_name ?? '—'} ({s.politicians?.party ?? '—'}) · {s.statement_date}</span>
                  <span className={`px-1.5 py-0.5 rounded font-medium ${s.verification_status === 'removed' ? 'bg-red-100 text-red-800' : 'bg-gray-100 text-gray-700'}`}>{s.verification_status}</span>
                </div>
                <p className="text-gray-900">{s.summary.slice(0, 180)}{s.summary.length > 180 ? '…' : ''}</p>
                <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-xs text-blue-700 hover:underline mt-1 inline-block">Ver</Link>
              </li>
            ))}
          </ul>
        )}
      </section>

      {!isReverted && batch.row_count_created > 0 && (
        <section className="bg-red-50 border border-red-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-red-900 mb-2 flex items-center gap-2">
            <AlertTriangle className="w-4 h-4" aria-hidden="true" />
            Zona de perigo: reverter lote
          </h2>
          <p className="text-sm text-red-900 mb-3">
            Reverter marca cada declaração criada por este lote como <code>removed</code>
            (soft-delete). O histórico de revisões registra a mudança automaticamente.
            Declarações editadas manualmente após a importação <strong>também</strong> são
            marcadas como removidas — edite manualmente depois se quiser preservá-las.
          </p>
          <RevertBatchButton batchId={batch.id} affected={batch.row_count_created} />
        </section>
      )}

      {isReverted && (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-3">
          Este lote já foi revertido. As declarações associadas permanecem no banco com status
          <code className="bg-white px-1 rounded">removed</code> — preservando o histórico.
        </p>
      )}
    </main>
  )
}
