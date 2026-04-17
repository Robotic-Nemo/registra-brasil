import { Suspense } from 'react'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { unifiedSearch } from '@/lib/search/unified'
import { SearchBar } from '@/components/search/SearchBar'
import { SearchFilters } from '@/components/search/SearchFilters'
import { CuratedResults } from '@/components/search/CuratedResults'
import { LiveResults } from '@/components/search/LiveResults'
import { StatementCardSkeleton } from '@/components/ui/Skeleton'
import { parseSearchParams } from '@/lib/utils/validate-search-params'
import type { Metadata } from 'next'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<Record<string, string | string[]>>
}

export async function generateMetadata({ searchParams }: PageProps): Promise<Metadata> {
  const sp = await searchParams
  // Trim and cap length so overlong queries can't bloat metadata.
  const rawQ = typeof sp.q === 'string' ? sp.q.trim() : ''
  const q = rawQ.length > 60 ? `${rawQ.slice(0, 57)}...` : rawQ
  const title = q ? `"${q}" — Buscar — Registra Brasil` : 'Buscar — Registra Brasil'
  const description = q
    ? `Resultados para "${q}" no Registra Brasil — arquivo de declarações de políticos brasileiros.`
    : 'Busque declarações de políticos brasileiros com filtros por categoria, partido, estado e período.'
  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: 'website',
      siteName: 'Registra Brasil',
    },
    twitter: {
      card: 'summary_large_image',
      title,
      description,
    },
    alternates: { canonical: '/buscar' },
    // Block indexing of specific query results (keep the /buscar root indexed).
    robots: q ? { index: false, follow: true } : undefined,
  }
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const SEARCH_JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'WebPage',
  name: 'Buscar — Registra Brasil',
  url: `${SITE_URL}/buscar`,
  inLanguage: 'pt-BR',
  isPartOf: { '@type': 'WebSite', name: 'Registra Brasil', url: SITE_URL },
  potentialAction: {
    '@type': 'SearchAction',
    target: { '@type': 'EntryPoint', urlTemplate: `${SITE_URL}/buscar?q={search_term_string}` },
    'query-input': 'required name=search_term_string',
  },
}

export default async function BuscarPage({ searchParams }: PageProps) {
  const sp = await searchParams
  const params = parseSearchParams(sp)

  const [supabase, searchResult] = await Promise.all([
    getSupabaseServerClient(),
    unifiedSearch(params),
  ])

  const categories = await getAllCategories(supabase)

  return (
    <main className="max-w-7xl mx-auto px-4 py-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(SEARCH_JSON_LD) }}
      />
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
            <CuratedResults result={searchResult.curated} durationMs={searchResult.meta.durationMs} />
          </Suspense>
          {params.q && (
            <Suspense fallback={<div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">{Array.from({length:3}).map((_,i)=><StatementCardSkeleton key={i}/>)}</div>}>
              <LiveResults result={searchResult.live} query={params.q} />
            </Suspense>
          )}
        </div>
      </div>
    </main>
  )
}
