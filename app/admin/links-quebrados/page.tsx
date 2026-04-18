import Link from 'next/link'
import { ArrowLeft, AlertTriangle, ExternalLink, Clock } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { ArchiveNowButton } from './ArchiveNowButton'

export const dynamic = 'force-dynamic'

interface Row {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  primary_source_url: string
  source_http_status: number | null
  source_last_checked_at: string | null
  source_check_error: string | null
  verification_status: string
  politicians: { common_name: string; party: string } | null
}

function statusTone(status: number | null, err: string | null): 'bad' | 'warn' | 'unknown' {
  if (err) return 'bad'
  if (status === null) return 'unknown'
  if (status >= 500) return 'bad'
  if (status >= 400) return 'bad'
  if (status >= 300) return 'warn'
  return 'unknown'
}

function statusLabel(status: number | null, err: string | null): string {
  if (err) return `falha: ${err.slice(0, 80)}`
  if (status === null) return 'não verificado'
  return `HTTP ${status}`
}

export default async function LinksQuebradosPage() {
  const supabase = getSupabaseServiceClient()

  const { data: broken, count } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, primary_source_url, source_http_status, source_last_checked_at, source_check_error, verification_status, politicians(common_name, party)', { count: 'exact' })
    .neq('verification_status', 'removed')
    .or('source_http_status.gte.400,source_check_error.not.is.null')
    .order('source_last_checked_at', { ascending: false })
    .limit(200)

  const rows = (broken ?? []) as Row[]

  // Coverage stats
  const { count: totalChecked } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .not('source_last_checked_at', 'is', null)
    .neq('verification_status', 'removed')

  const { count: totalLive } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .neq('verification_status', 'removed')

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <AlertTriangle className="w-5 h-5 text-red-600" />
          Links quebrados
        </h1>
      </div>

      <section className="grid grid-cols-1 sm:grid-cols-3 gap-3 mb-6">
        <div className="bg-white border border-gray-200 rounded-lg p-3">
          <p className="text-xs text-gray-500">Cobertura</p>
          <p className="text-lg font-bold tabular-nums text-gray-900">
            {(totalChecked ?? 0).toLocaleString('pt-BR')} / {(totalLive ?? 0).toLocaleString('pt-BR')}
          </p>
          <p className="text-[11px] text-gray-500">URLs já verificadas</p>
        </div>
        <div className="bg-red-50 border border-red-200 rounded-lg p-3">
          <p className="text-xs text-red-900">Quebrados</p>
          <p className="text-lg font-bold tabular-nums text-red-900">{(count ?? 0).toLocaleString('pt-BR')}</p>
          <p className="text-[11px] text-red-800">4xx/5xx/erro</p>
        </div>
        <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
          <p className="text-xs text-blue-900">Cron</p>
          <p className="text-[11px] text-blue-800 mt-1">
            Diário via <code>/api/maintenance/check-links</code>. Lote de 50. Rode manualmente com{' '}
            <code className="text-[10px]">curl -H &quot;x-cron-secret: $REVALIDATE_SECRET&quot; /api/maintenance/check-links</code>.
          </p>
        </div>
      </section>

      <p className="text-xs text-gray-500 mb-4">
        Mostrando até 200 links com status 4xx/5xx ou erro de rede na última verificação.
      </p>

      {rows.length === 0 ? (
        <p className="text-sm text-gray-600 bg-green-50 border border-green-200 rounded-lg p-4">
          Nenhum link quebrado detectado.
        </p>
      ) : (
        <ul className="flex flex-col gap-2">
          {rows.map((r) => {
            const tone = statusTone(r.source_http_status, r.source_check_error)
            return (
              <li key={r.id} className="bg-white border border-gray-200 rounded-lg p-3 text-sm">
                <div className="flex items-center justify-between gap-3 mb-1">
                  <span className="text-xs text-gray-500">
                    {r.statement_date}
                    {r.politicians && ` · ${r.politicians.common_name} (${r.politicians.party})`}
                  </span>
                  <span className={`text-xs font-medium px-2 py-0.5 rounded ${
                    tone === 'bad' ? 'bg-red-100 text-red-800' :
                    tone === 'warn' ? 'bg-amber-100 text-amber-800' :
                    'bg-gray-100 text-gray-700'
                  }`}>
                    {statusLabel(r.source_http_status, r.source_check_error)}
                  </span>
                </div>
                <p className="text-gray-900 mb-1">{r.summary.slice(0, 140)}{r.summary.length > 140 ? '…' : ''}</p>
                <div className="flex items-center gap-3 text-xs">
                  <a href={r.primary_source_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 text-blue-700 hover:underline truncate">
                    <ExternalLink className="w-3 h-3" aria-hidden="true" />
                    <span className="truncate font-mono">{r.primary_source_url}</span>
                  </a>
                  <Link href={`/admin/editar/${r.id}`} className="text-blue-700 hover:underline flex-shrink-0">Editar</Link>
                  <ArchiveNowButton statementId={r.id} />
                  {r.source_last_checked_at && (
                    <span className="text-gray-500 inline-flex items-center gap-1 flex-shrink-0">
                      <Clock className="w-3 h-3" aria-hidden="true" />
                      {new Date(r.source_last_checked_at).toLocaleString('pt-BR', { dateStyle: 'short', timeStyle: 'short' })}
                    </span>
                  )}
                </div>
              </li>
            )
          })}
        </ul>
      )}
    </main>
  )
}
