import Link from 'next/link'
import { ArrowLeft, ShieldCheck } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { FACT_CHECK_OUTLETS, RATING_LABELS } from '@/lib/fact-checks/outlets'
import { AddFactCheckForm } from './AddFactCheckForm'
import { FactCheckRow } from './FactCheckRow'

export const dynamic = 'force-dynamic'

export default async function AdminFactChecksPage() {
  const supabase = getSupabaseServiceClient()

  const { data: fcs } = await (supabase.from('statement_fact_checks') as any)
    .select('id, statement_id, outlet, outlet_label, url, title, rating, rating_label, published_at, created_at, statements(slug, summary, politicians(common_name, party))')
    .order('created_at', { ascending: false })
    .limit(200)

  const rows = (fcs ?? []) as Array<{
    id: string
    statement_id: string
    outlet: string
    outlet_label: string
    url: string
    title: string | null
    rating: string | null
    rating_label: string | null
    published_at: string | null
    created_at: string
    statements: { slug: string | null; summary: string; politicians: { common_name: string; party: string } | null } | null
  }>

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <ShieldCheck className="w-5 h-5 text-green-700" />
          Checagens externas
        </h1>
      </div>
      <p className="text-sm text-gray-600 mb-6">
        Cruze declarações do arquivo com checagens publicadas por Lupa, Aos Fatos, Estadão
        Verifica, G1 Fato ou Fake, Comprova e outros. Leitores veem os links inline na página da
        declaração.
      </p>

      <AddFactCheckForm outlets={FACT_CHECK_OUTLETS} ratings={RATING_LABELS} />

      <h2 className="text-sm font-semibold text-gray-900 mt-10 mb-3">
        Últimas {rows.length} checagens registradas
      </h2>

      {rows.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-4">
          Nenhuma checagem vinculada ainda.
        </p>
      ) : (
        <ul className="flex flex-col gap-2">
          {rows.map((r) => (
            <FactCheckRow key={r.id} fc={r} />
          ))}
        </ul>
      )}
    </main>
  )
}
