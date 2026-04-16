import Link from 'next/link'
import { PlusCircle, List, LogOut, AlertCircle, Download, Clock } from 'lucide-react'
import { adminLogout } from './login/actions'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getUnverifiedStatements, getSiteStats } from '@/lib/supabase/queries/statements'
import { ReviewQueue } from './review/ReviewQueue'
import { ScanButton } from './review/ScanButton'

export const dynamic = 'force-dynamic'

export default async function AdminPage() {
  const supabase = getSupabaseServiceClient()
  const [unverified, stats, { count: disputedCount }, { data: latestScan }, { data: recentEdits }] = await Promise.all([
    getUnverifiedStatements(supabase, 25),
    getSiteStats(supabase),
    supabase.from('statements').select('id', { count: 'exact', head: true }).eq('verification_status', 'disputed'),
    supabase.from('statements').select('created_at').eq('verification_status', 'unverified').order('created_at', { ascending: false }).limit(1).maybeSingle(),
    supabase.from('statements').select('id, slug, summary, updated_at, reviewed_at, politicians(common_name)').not('reviewed_at', 'is', null).order('reviewed_at', { ascending: false }).limit(8),
  ])

  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <div className="flex items-start justify-between mb-8">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 mb-1">Painel de Edição</h1>
          <p className="text-gray-500 text-sm">Área restrita a editores.</p>
        </div>
        <form action={adminLogout}>
          <button
            type="submit"
            className="flex items-center gap-1.5 text-sm text-gray-500 hover:text-gray-800 transition-colors px-3 py-1.5 rounded-lg hover:bg-gray-100"
          >
            <LogOut className="w-4 h-4" />
            Sair
          </button>
        </form>
      </div>

      {/* Quick stats */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-8">
        {[
          { label: 'Verificadas', value: stats.totalVerified, color: 'text-green-600' },
          { label: 'Pendentes', value: unverified.length, color: 'text-yellow-600' },
          { label: 'Disputadas', value: disputedCount ?? 0, color: 'text-orange-600' },
          { label: 'Políticos', value: stats.totalPoliticians, color: 'text-blue-600' },
        ].map((s) => (
          <div key={s.label} className="bg-white border border-gray-200 rounded-lg p-4 text-center">
            <p className={`text-2xl font-bold tabular-nums ${s.color}`}>{s.value}</p>
            <p className="text-xs text-gray-500 mt-1">{s.label}</p>
          </div>
        ))}
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-10">
        <Link
          href="/admin/adicionar"
          className="flex flex-col gap-2 p-5 border border-gray-200 rounded-xl hover:shadow-md transition-shadow"
        >
          <PlusCircle className="w-6 h-6 text-blue-600" />
          <p className="font-semibold text-gray-900">Adicionar declaração</p>
          <p className="text-sm text-gray-500">Registrar nova declaração com fonte primária</p>
        </Link>

        <Link
          href="/buscar"
          className="flex flex-col gap-2 p-5 border border-gray-200 rounded-xl hover:shadow-md transition-shadow"
        >
          <List className="w-6 h-6 text-gray-600" />
          <p className="font-semibold text-gray-900">Ver arquivo</p>
          <p className="text-sm text-gray-500">Buscar e revisar declarações existentes</p>
        </Link>

        <a
          href="/api/admin/export?status=verified"
          download
          className="flex flex-col gap-2 p-5 border border-gray-200 rounded-xl hover:shadow-md transition-shadow"
        >
          <Download className="w-6 h-6 text-green-600" />
          <p className="font-semibold text-gray-900">Exportar CSV</p>
          <p className="text-sm text-gray-500">Download de todas declarações verificadas</p>
        </a>
      </div>

      {/* Scanner */}
      {(latestScan as any)?.created_at && (
        <p className="text-xs text-gray-400 mb-2">
          Última entrada não verificada: {new Date((latestScan as any).created_at).toLocaleString('pt-BR')}
        </p>
      )}
      <section className="mb-10">
        <ScanButton />
      </section>

      {/* Review queue */}
      <section>
        <div className="flex items-center gap-2 mb-4">
          <AlertCircle className="w-5 h-5 text-yellow-600" />
          <h2 className="font-semibold text-gray-900">
            Fila de revisão
          </h2>
          {unverified.length > 0 && (
            <span className="text-xs bg-yellow-100 text-yellow-800 px-2 py-0.5 rounded-full font-medium">
              {unverified.length}
            </span>
          )}
        </div>
        <ReviewQueue statements={unverified} />
      </section>

      {/* Recent edits */}
      {recentEdits && recentEdits.length > 0 && (
        <section className="mt-10">
          <div className="flex items-center gap-2 mb-4">
            <Clock className="w-5 h-5 text-blue-600" />
            <h2 className="font-semibold text-gray-900">Edicoes recentes</h2>
          </div>
          <ul className="divide-y divide-gray-100">
            {(recentEdits as unknown as { id: string; slug: string | null; summary: string; reviewed_at: string | null; politicians: { common_name: string } }[]).map((edit) => (
              <li key={edit.id} className="py-2.5 flex items-start gap-3">
                <div className="min-w-0 flex-1">
                  <Link
                    href={`/admin/editar/${edit.id}`}
                    className="text-sm font-medium text-gray-900 hover:text-blue-700 transition-colors line-clamp-1"
                  >
                    {edit.politicians.common_name}: {edit.summary}
                  </Link>
                  {edit.reviewed_at && (
                    <p className="text-xs text-gray-400 mt-0.5">
                      Revisado em {new Date(edit.reviewed_at).toLocaleString('pt-BR')}
                    </p>
                  )}
                </div>
              </li>
            ))}
          </ul>
        </section>
      )}
    </main>
  )
}
