import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SubmissionsQueue } from './SubmissionsQueue'
import Link from 'next/link'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ status?: string }>
}

export default async function AdminSubmissionsPage({ searchParams }: PageProps) {
  const { status = 'pending' } = await searchParams
  const allowed = ['pending', 'approved', 'rejected', 'duplicate'] as const
  type Status = (typeof allowed)[number]
  const filterStatus: Status = (allowed as readonly string[]).includes(status) ? (status as Status) : 'pending'

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_submissions') as any)
    .select('id, politician_id, politician_name_raw, summary, full_quote, statement_date, venue, primary_source_url, context, submitter_email, submitter_name, submitter_notes, status, reviewer_notes, reviewed_at, created_at, politicians(slug, common_name, party, state)')
    .eq('status', filterStatus)
    .order('created_at', { ascending: false })
    .limit(100)

  const submissions = (error ? [] : data ?? []) as Array<{
    id: string
    politician_id: string | null
    politician_name_raw: string | null
    summary: string
    full_quote: string | null
    statement_date: string | null
    venue: string | null
    primary_source_url: string
    context: string | null
    submitter_email: string | null
    submitter_name: string | null
    submitter_notes: string | null
    status: string
    reviewer_notes: string | null
    reviewed_at: string | null
    created_at: string
    politicians: { slug: string; common_name: string; party: string; state: string | null } | null
  }>

  // Count per status for the tab bar.
  const { data: counts } = await (supabase.from('statement_submissions') as any)
    .select('status')
  const countMap = new Map<string, number>()
  for (const row of (counts ?? []) as { status: string }[]) {
    countMap.set(row.status, (countMap.get(row.status) ?? 0) + 1)
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-xl font-bold text-gray-900">Submissões públicas</h1>
        <Link href="/admin" className="text-sm text-blue-700 hover:underline">← Admin</Link>
      </div>

      <div className="flex gap-2 border-b border-gray-200 mb-5 text-sm">
        {allowed.map((s) => {
          const active = s === filterStatus
          const count = countMap.get(s) ?? 0
          return (
            <Link
              key={s}
              href={`/admin/submissions?status=${s}`}
              className={`px-3 py-2 -mb-px border-b-2 ${active ? 'border-blue-600 text-blue-700 font-medium' : 'border-transparent text-gray-600 hover:text-gray-900'}`}
            >
              {s} <span className="ml-1 text-xs text-gray-500">({count})</span>
            </Link>
          )
        })}
      </div>

      {error && (
        <p className="text-sm text-red-700">Erro ao carregar submissões.</p>
      )}

      <SubmissionsQueue submissions={submissions} />
    </main>
  )
}
