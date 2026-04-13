import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug, getPoliticianCategoryStats, getAllPoliticianSlugs } from '@/lib/supabase/queries/politicians'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { PoliticianHeader } from '@/components/politicians/PoliticianHeader'
import { PoliticianStats } from '@/components/politicians/PoliticianStats'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Pagination } from '@/components/ui/Pagination'
import type { Metadata } from 'next'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ slug: string }>
  searchParams: Promise<{ page?: string }>
}

export async function generateStaticParams() {
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_URL?.startsWith('your_')) {
    return []
  }
  const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
  const supabase = getSupabaseServiceClient()
  const slugs = await getAllPoliticianSlugs(supabase)
  return slugs.map((slug) => ({ slug }))
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const politician = await getPoliticianBySlug(supabase, slug)
  if (!politician) return { title: 'Político não encontrado' }
  return {
    title: `${politician.common_name} (${politician.party}) — Registra Brasil`,
    description: `Declarações registradas de ${politician.common_name}, ${politician.party}${politician.state ? `/${politician.state}` : ''}.`,
  }
}

export default async function PoliticianPage({ params, searchParams }: PageProps) {
  const { slug } = await params
  const { page: pageStr } = await searchParams
  const page = pageStr ? Number(pageStr) : 1

  const supabase = await getSupabaseServerClient()

  const [politician, statementsResult, categoryStats] = await Promise.all([
    getPoliticianBySlug(supabase, slug),
    searchStatements(supabase, { politico: slug, page, limit: 20, status: 'verified' }),
    (async () => {
      const p = await getPoliticianBySlug(supabase, slug)
      if (!p) return []
      return getPoliticianCategoryStats(supabase, p.id)
    })(),
  ])

  if (!politician) notFound()

  return (
    <main className="max-w-5xl mx-auto px-4 py-8 flex flex-col gap-6">
      <PoliticianHeader politician={politician} statementCount={statementsResult.total} />

      {categoryStats.length > 0 && <PoliticianStats stats={categoryStats} />}

      <section>
        <h2 className="font-semibold text-gray-900 mb-4">Declarações registradas</h2>
        <StatementGrid statements={statementsResult.results} />
        {(page > 1 || statementsResult.hasMore) && (
          <Suspense fallback={null}>
            <Pagination page={page} hasMore={statementsResult.hasMore} total={statementsResult.total} />
          </Suspense>
        )}
      </section>
    </main>
  )
}
