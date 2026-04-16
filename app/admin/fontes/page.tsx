import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getAllSources, getSourceStats, getSourceUrls } from '@/lib/supabase/queries/sources'
import { SourceList } from '@/components/admin/SourceList'
import { SourceVerifier } from '@/components/admin/SourceVerifier'

export const dynamic = 'force-dynamic'

export default async function FontesPage() {
  const supabase = getSupabaseServiceClient()

  const [{ sources, total }, stats, urls] = await Promise.all([
    getAllSources(supabase, { limit: 50 }),
    getSourceStats(supabase),
    getSourceUrls(supabase, 50),
  ])

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900">Gerenciamento de Fontes</h1>
          <p className="text-sm text-gray-500">{total} fontes registradas</p>
        </div>
      </div>

      {/* Source type breakdown */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
        {stats.slice(0, 8).map((s) => (
          <div key={s.type} className="bg-white border border-gray-200 rounded-lg p-3 text-center">
            <p className="text-lg font-bold tabular-nums text-gray-900">{s.count}</p>
            <p className="text-xs text-gray-500 mt-0.5">{s.type.replace(/_/g, ' ')}</p>
          </div>
        ))}
      </div>

      {/* Verifier */}
      <section className="mb-6">
        <SourceVerifier sources={urls} />
      </section>

      {/* Source list */}
      <section>
        <SourceList sources={sources} total={total} />
      </section>
    </main>
  )
}
