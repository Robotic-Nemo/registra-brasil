import { Suspense } from 'react'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { unifiedSearch } from '@/lib/search/unified'
import { SearchBar } from '@/components/search/SearchBar'
import { SearchFilters } from '@/components/search/SearchFilters'
import { CuratedResults } from '@/components/search/CuratedResults'
import { LiveResults } from '@/components/search/LiveResults'
import { StatementCardSkeleton } from '@/components/ui/Skeleton'
import type { SearchParams } from '@/types/search'
import type { Metadata } from 'next'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<Record<string, string | string[]>>
}

export async function generateMetadata({ searchParams }: PageProps): Promise<Metadata> {
  const sp = await searchParams
  const q = typeof sp.q === 'string' ? sp.q : ''
  return {
    title: q ? `"${q}" — Registra Brasil` : 'Buscar — Registra Brasil',
  }
}

export default async function BuscarPage({ searchParams }: PageProps) {
  const sp = await searchParams

  const params: SearchParams = {
    q: typeof sp.q === 'string' ? sp.q : undefined,
    categoria: typeof sp.categoria === 'string' ? [sp.categoria] : (sp.categoria as string[] | undefined),
    partido: typeof sp.partido === 'string' ? sp.partido : undefined,
    estado: typeof sp.estado === 'string' ? sp.estado : undefined,
    politico: typeof sp.politico === 'string' ? sp.politico : undefined,
    de: typeof sp.de === 'string' ? sp.de : undefined,
    ate: typeof sp.ate === 'string' ? sp.ate : undefined,
    status: typeof sp.status === 'string' ? (sp.status as SearchParams['status']) : undefined,
    fonte: typeof sp.fonte === 'string' ? (sp.fonte as SearchParams['fonte']) : 'todos',
    page: typeof sp.page === 'string' ? Number(sp.page) : 1,
    limit: 20,
  }

  const [supabase, searchResult] = await Promise.all([
    getSupabaseServerClient(),
    unifiedSearch(params),
  ])

  const categories = await getAllCategories(supabase)

  return (
    <main className="max-w-7xl mx-auto px-4 py-6">
      <div className="mb-6 flex items-center gap-3">
        <Suspense fallback={<div className="h-10 flex-1 bg-gray-100 rounded-lg animate-pulse" />}>
          <SearchBar initialValue={params.q ?? ''} autoFocus />
        </Suspense>
      </div>

      <div className="flex gap-8">
        <Suspense fallback={null}>
          <SearchFilters categories={categories} />
        </Suspense>

        <div className="flex-1 min-w-0 flex flex-col gap-10">
          <Suspense fallback={<div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">{Array.from({length:6}).map((_,i)=><StatementCardSkeleton key={i}/>)}</div>}>
            <CuratedResults result={searchResult.curated} />
          </Suspense>
          {params.q && <LiveResults result={searchResult.live} query={params.q} />}
        </div>
      </div>
    </main>
  )
}
