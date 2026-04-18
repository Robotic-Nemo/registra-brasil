import Link from 'next/link'
import { ArrowLeft, Upload } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { ImportClient } from './ImportClient'

export const dynamic = 'force-dynamic'

export default async function ImportPage() {
  const supabase = getSupabaseServiceClient()
  const { data: recent } = await (supabase.from('import_batches') as any)
    .select('id, source_filename, row_count_total, row_count_created, row_count_skipped, row_count_errored, note, created_at')
    .order('created_at', { ascending: false })
    .limit(10)

  const batches = (recent ?? []) as Array<{
    id: string
    source_filename: string | null
    row_count_total: number
    row_count_created: number
    row_count_skipped: number
    row_count_errored: number
    note: string | null
    created_at: string
  }>

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Upload className="w-5 h-5 text-blue-700" />
          Importação em lote
        </h1>
      </div>

      <ImportClient />

      {batches.length > 0 && (
        <section className="mt-10">
          <h2 className="text-sm font-semibold text-gray-900 mb-3">Últimos lotes</h2>
          <ol className="flex flex-col gap-2">
            {batches.map((b) => (
              <li key={b.id} className="bg-white border border-gray-200 rounded p-3 text-sm">
                <div className="flex items-center justify-between gap-2 mb-1">
                  <span className="font-mono text-xs text-gray-500">{b.id.slice(0, 8)}</span>
                  <time className="text-xs text-gray-500">
                    {new Date(b.created_at).toLocaleString('pt-BR')}
                  </time>
                </div>
                <p className="text-gray-900">{b.source_filename ?? '(sem nome)'}</p>
                <p className="text-xs text-gray-600 mt-1">
                  <span className="text-green-700">{b.row_count_created} criadas</span>
                  {' · '}
                  <span className="text-amber-700">{b.row_count_skipped} puladas</span>
                  {' · '}
                  <span className="text-red-700">{b.row_count_errored} erros</span>
                  {' · '}
                  total {b.row_count_total}
                </p>
                {b.note && <p className="text-xs text-gray-500 italic mt-1">{b.note}</p>}
              </li>
            ))}
          </ol>
        </section>
      )}
    </main>
  )
}
