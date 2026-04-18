import Link from 'next/link'
import { ArrowLeft, Link2, Merge } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

interface Row {
  id: string
  slug: string | null
  summary: string
  statement_date: string
  verification_status: string
  primary_source_url: string
  politicians: { common_name: string; party: string; state: string | null } | null
}

/**
 * Audit: statements that share a primary_source_url. Same video/article
 * captured twice is a common data-entry artifact worth consolidating.
 * Groups of size ≥ 2 are shown, with a quick-merge link that prefills
 * the first two IDs into /admin/merge?a=&b=.
 */
export default async function FontesDuplicadasPage({
  searchParams,
}: {
  searchParams: Promise<{ min?: string }>
}) {
  const { min } = await searchParams
  const minGroup = Math.max(2, Math.min(10, parseInt(min ?? '2', 10) || 2))

  const supabase = getSupabaseServiceClient()

  // Pull recent statements + source URL; group in memory. Bounded to
  // 10k most-recent so the page stays snappy.
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, primary_source_url, politicians(common_name, party, state)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .limit(10000)

  const rows = (data ?? []) as Row[]
  const groups = new Map<string, Row[]>()
  for (const r of rows) {
    const url = r.primary_source_url.trim()
    if (!url) continue
    const existing = groups.get(url) ?? []
    existing.push(r)
    groups.set(url, existing)
  }

  const dupeGroups = [...groups.entries()]
    .filter(([, rs]) => rs.length >= minGroup)
    .sort((a, b) => b[1].length - a[1].length)
    .slice(0, 200)

  const totalGroups = dupeGroups.length
  const totalAffected = dupeGroups.reduce((acc, [, rs]) => acc + rs.length, 0)

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Link2 className="w-5 h-5 text-blue-700" />
          Fontes duplicadas
        </h1>
      </div>

      <p className="text-sm text-gray-600 mb-5">
        Declarações que compartilham a mesma URL de fonte primária — forte sinal de duplicata
        editorial. Escaneia as 10 000 declarações mais recentes.
      </p>

      <div className="flex gap-2 mb-5 text-xs">
        {[2, 3, 5].map((n) => (
          <Link
            key={n}
            href={`/admin/fontes-duplicadas?min=${n}`}
            className={`px-3 py-1.5 rounded-full border ${
              minGroup === n ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'
            }`}
          >
            Grupos com {n}+
          </Link>
        ))}
      </div>

      <p className="text-xs text-gray-500 mb-5">
        <strong>{totalGroups}</strong> grupos · <strong>{totalAffected}</strong> declarações
        envolvidas.
      </p>

      {dupeGroups.length === 0 ? (
        <p className="text-sm text-gray-600 bg-green-50 border border-green-200 rounded p-4">
          Nenhuma duplicata de fonte acima do limiar.
        </p>
      ) : (
        <ul className="flex flex-col gap-4">
          {dupeGroups.map(([url, stmts]) => (
            <li key={url} className="bg-white border border-gray-200 rounded-lg p-4">
              <div className="flex items-center justify-between gap-3 mb-2 flex-wrap">
                <a href={url} target="_blank" rel="noopener noreferrer" className="text-xs text-blue-700 hover:underline truncate flex-1 min-w-0 font-mono">
                  {url}
                </a>
                <span className="text-xs font-semibold px-2 py-0.5 rounded bg-amber-100 text-amber-800">
                  {stmts.length} duplicatas
                </span>
              </div>

              <ul className="flex flex-col gap-1.5 mb-3">
                {stmts.map((s) => (
                  <li key={s.id} className="flex items-center gap-2 text-sm">
                    <span className="text-xs text-gray-500 whitespace-nowrap">{s.statement_date}</span>
                    <span className="text-xs text-gray-500 whitespace-nowrap">
                      {s.politicians?.common_name ?? '—'} ({s.politicians?.party ?? '—'})
                    </span>
                    <span className={`text-[10px] font-medium px-1.5 py-0.5 rounded ${
                      s.verification_status === 'verified' ? 'bg-green-100 text-green-800' :
                      s.verification_status === 'disputed' ? 'bg-amber-100 text-amber-800' :
                      'bg-gray-100 text-gray-700'
                    }`}>{s.verification_status}</span>
                    <span className="flex-1 text-gray-900 truncate">{s.summary}</span>
                    <Link href={`/admin/editar/${s.id}`} className="text-xs text-blue-700 hover:underline">Editar</Link>
                  </li>
                ))}
              </ul>

              {stmts.length === 2 && (
                <div className="flex justify-end">
                  <Link
                    href={`/admin/merge?a=${stmts[0].id}&b=${stmts[1].id}`}
                    className="inline-flex items-center gap-1 text-xs bg-purple-700 hover:bg-purple-800 text-white px-2.5 py-1 rounded font-medium"
                  >
                    <Merge className="w-3.5 h-3.5" aria-hidden="true" />
                    Mesclar par →
                  </Link>
                </div>
              )}
              {stmts.length > 2 && (
                <p className="text-xs text-gray-500 italic">
                  Grupo grande — mescle dois por vez via{' '}
                  <Link href={`/admin/merge?a=${stmts[0].id}&b=${stmts[1].id}`} className="underline">pares consecutivos</Link>.
                </p>
              )}
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
