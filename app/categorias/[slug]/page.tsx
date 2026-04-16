import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getCategoryBySlug, getAllCategories } from '@/lib/supabase/queries/categories'
import { getStatementsByCategory } from '@/lib/supabase/queries/statements'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
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
  const categories = await getAllCategories(supabase)
  return categories.map((c) => ({ slug: c.slug }))
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const cat = await getCategoryBySlug(supabase, slug)
  if (!cat) return { title: 'Categoria não encontrada' }
  const title = `${cat.label_pt} — Registra Brasil`
  const description = cat.description ?? `Declarações classificadas como ${cat.label_pt}`
  return {
    title,
    description,
    openGraph: { title, description },
    alternates: { canonical: `/categorias/${slug}` },
  }
}

export default async function CategoryPage({ params, searchParams }: PageProps) {
  const { slug } = await params
  const { page: pageStr } = await searchParams
  const page = Math.max(1, parseInt(pageStr ?? '1', 10) || 1)

  const supabase = await getSupabaseServerClient()
  const [category, result] = await Promise.all([
    getCategoryBySlug(supabase, slug),
    getStatementsByCategory(supabase, slug, page),
  ])

  if (!category) notFound()

  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: category.label_pt,
    description: category.description ?? `Declarações classificadas como ${category.label_pt}`,
    url: `${siteUrl}/categorias/${slug}`,
    numberOfItems: result.total,
    publisher: { '@type': 'Organization', name: 'Registra Brasil' },
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <Breadcrumbs items={[
        { label: 'Categorias', href: '/categorias' },
        { label: category.label_pt },
      ]} />
      <div className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <span
            className="w-4 h-4 rounded-full"
            style={{ backgroundColor: category.color_hex }}
          />
          <h1 className="text-2xl font-bold text-gray-900">{category.label_pt}</h1>
        </div>
        {category.description && (
          <p className="text-gray-600 text-sm">{category.description}</p>
        )}
        <p className="text-sm text-gray-500 mt-1">{result.total} declaração{result.total !== 1 ? 'ões' : ''} registrada{result.total !== 1 ? 's' : ''}</p>
      </div>

      <StatementGrid statements={result.results} />

      {(page > 1 || result.hasMore) && (
        <Suspense fallback={null}>
          <Pagination page={page} hasMore={result.hasMore} total={result.total} totalPages={Math.ceil(result.total / 20)} />
        </Suspense>
      )}
    </main>
  )
}
