import Link from 'next/link'
import { ArrowLeft, Scale } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { RetractionItem } from './RetractionItem'

export const dynamic = 'force-dynamic'

const STATUSES = ['pending', 'in_review', 'accepted', 'replied', 'rejected', 'withdrawn'] as const
type Status = (typeof STATUSES)[number]

interface PageProps {
  searchParams: Promise<{ status?: string }>
}

export default async function AdminRetracoesPage({ searchParams }: PageProps) {
  const { status } = await searchParams
  const filter: Status = (STATUSES as readonly string[]).includes(status ?? '') ? (status as Status) : 'pending'

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('retraction_requests') as any)
    .select('id, statement_id, statement_url, kind, status, petitioner_name, petitioner_email, petitioner_role, represents_politician_id, claim, desired_remedy, evidence_urls, reviewer_notes, reviewed_at, public_reply, created_at, statements(id, slug, summary), represents:represents_politician_id(common_name, slug)')
    .eq('status', filter)
    .order('created_at', { ascending: false })
    .limit(100)

  const { data: counts } = await (supabase.from('retraction_requests') as any).select('status')
  const countMap = new Map<string, number>()
  for (const row of (counts ?? []) as { status: string }[]) {
    countMap.set(row.status, (countMap.get(row.status) ?? 0) + 1)
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Scale className="w-5 h-5 text-blue-700" />
          Pedidos de retificação
        </h1>
      </div>

      <div className="flex gap-2 border-b border-gray-200 mb-5 text-sm flex-wrap">
        {STATUSES.map((s) => {
          const active = s === filter
          const n = countMap.get(s) ?? 0
          return (
            <Link
              key={s}
              href={`/admin/retratacoes?status=${s}`}
              className={`px-3 py-2 -mb-px border-b-2 ${active ? 'border-blue-600 text-blue-700 font-medium' : 'border-transparent text-gray-600 hover:text-gray-900'}`}
            >
              {s} <span className="ml-1 text-xs text-gray-500">({n})</span>
            </Link>
          )
        })}
      </div>

      {(!data || data.length === 0) && (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">Nada nesta fila.</p>
      )}

      <ul className="flex flex-col gap-4">
        {(data ?? []).map((r: any) => (
          <RetractionItem key={r.id} req={r} />
        ))}
      </ul>
    </main>
  )
}
