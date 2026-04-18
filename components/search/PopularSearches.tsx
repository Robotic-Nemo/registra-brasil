import Link from 'next/link'
import { Search, TrendingUp } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getPopularSearches } from '@/lib/supabase/queries/popular-searches'

/**
 * Homepage widget listing the top ~8 popular searches from the last
 * 7 days. Rendered as a server component so the data is evaluated at
 * ISR time, not per request.
 */
export async function PopularSearches({ limit = 8 }: { limit?: number } = {}) {
  const supabase = getSupabaseServiceClient()
  const popular = await getPopularSearches(supabase, { days: 7, limit })

  if (popular.length === 0) return null

  return (
    <section className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-sm font-semibold text-gray-900 flex items-center gap-1.5">
          <TrendingUp className="w-4 h-4 text-blue-700" aria-hidden="true" />
          Buscas populares
        </h2>
        <Link href="/buscas-populares" className="text-xs text-blue-700 hover:underline">
          Ver todas →
        </Link>
      </div>
      <ul className="flex flex-wrap gap-2">
        {popular.map((p) => (
          <li key={p.q}>
            <Link
              href={`/buscar?q=${encodeURIComponent(p.q)}`}
              className="inline-flex items-center gap-1.5 px-2.5 py-1 text-xs bg-gray-50 border border-gray-200 hover:border-blue-400 hover:bg-blue-50 rounded-full text-gray-800 hover:text-blue-800 transition-colors"
            >
              <Search className="w-3 h-3 text-gray-400" aria-hidden="true" />
              {p.q}
            </Link>
          </li>
        ))}
      </ul>
    </section>
  )
}
