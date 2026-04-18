import Link from 'next/link'
import { ArrowLeft, Flag } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ sort?: string }>
}

const SORTS = [
  { key: 'contestada', label: 'Mais contestadas', field: 'contestada' },
  { key: 'erro', label: 'Mais erros reportados', field: 'erro' },
  { key: 'fora', label: 'Mais fora-de-contexto', field: 'fora_de_contexto' },
  { key: 'importante', label: 'Mais marcadas importantes', field: 'importante' },
  { key: 'total', label: 'Mais reagidas', field: 'total' },
] as const

export default async function AdminReacoesPage({ searchParams }: PageProps) {
  const { sort: sortKey } = await searchParams
  const active = SORTS.find((s) => s.key === sortKey) ?? SORTS[0]

  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statement_reaction_counts') as any)
    .select('statement_id, importante, contestada, fora_de_contexto, erro, total, last_reacted_at')
    .order(active.field, { ascending: false })
    .gt(active.field, 0)
    .limit(50)

  const ids = ((rows ?? []) as Array<{ statement_id: string }>).map((r) => r.statement_id)
  const { data: stmts } = ids.length
    ? await (supabase.from('statements') as any)
        .select('id, slug, summary, statement_date, politicians(common_name, party, state)')
        .in('id', ids)
    : { data: [] as any[] }
  const byId = new Map((stmts ?? []).map((s: any) => [s.id, s]))

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Flag className="w-5 h-5 text-red-600" />
          Reações do público
        </h1>
      </div>

      <div className="flex flex-wrap gap-2 mb-5">
        {SORTS.map((s) => (
          <Link
            key={s.key}
            href={`/admin/reacoes?sort=${s.key}`}
            className={`text-xs px-3 py-1.5 rounded-full border ${s.key === active.key ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'}`}
          >
            {s.label}
          </Link>
        ))}
      </div>

      {!rows || rows.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-4">
          Nada nesta fila.
        </p>
      ) : (
        <ol className="flex flex-col gap-3">
          {rows.map((r: any) => {
            const s: any = byId.get(r.statement_id)
            if (!s) return null
            const pol = s.politicians
            return (
              <li key={r.statement_id} className="bg-white border border-gray-200 rounded-lg p-4">
                <div className="flex items-center justify-between gap-3 mb-1">
                  <p className="text-xs text-gray-500">
                    {s.statement_date}
                    {pol && ` · ${pol.common_name} (${pol.party}${pol.state ? '-' + pol.state : ''})`}
                  </p>
                  <div className="flex items-center gap-1 text-xs">
                    <span className="px-1.5 py-0.5 rounded bg-yellow-100 text-yellow-800">★ {r.importante}</span>
                    <span className="px-1.5 py-0.5 rounded bg-red-100 text-red-800">⚠ {r.contestada}</span>
                    <span className="px-1.5 py-0.5 rounded bg-amber-100 text-amber-800">? {r.fora_de_contexto}</span>
                    <span className="px-1.5 py-0.5 rounded bg-gray-100 text-gray-700">⚑ {r.erro}</span>
                  </div>
                </div>
                <p className="text-sm text-gray-900 mb-2">{s.summary}</p>
                <div className="flex gap-3 text-xs">
                  <Link href={`/declaracao/${s.slug ?? s.id}`} className="text-blue-700 hover:underline">Ver</Link>
                  <Link href={`/admin/editar/${s.id}`} className="text-blue-700 hover:underline">Editar</Link>
                </div>
              </li>
            )
          })}
        </ol>
      )}
    </main>
  )
}
