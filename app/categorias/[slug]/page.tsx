import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getCategoryBySlug, getAllCategories } from '@/lib/supabase/queries/categories'
import { getStatementsByCategory } from '@/lib/supabase/queries/statements'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Pagination } from '@/components/ui/Pagination'
import { breadcrumbListJsonLd } from '@/lib/utils/structured-data'
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
  if (!cat) {
    return {
      title: 'Categoria não encontrada',
      robots: { index: false, follow: true },
    }
  }
  const title = `${cat.label_pt} — Registra Brasil`
  const description = cat.description ?? `Declarações classificadas como ${cat.label_pt}`
  return {
    title,
    description,
    keywords: [cat.label_pt, cat.label_en, 'declarações', 'políticos', 'brasil'].filter(Boolean) as string[],
    openGraph: {
      title,
      description,
      type: 'website',
      siteName: 'Registra Brasil',
    },
    twitter: {
      card: 'summary',
      title,
      description,
    },
    alternates: {
      canonical: `/categorias/${slug}`,
      languages: { 'pt-BR': `/categorias/${slug}` },
      types: { 'application/rss+xml': `/categorias/${slug}/feed.xml` },
    },
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
    inLanguage: 'pt-BR',
    publisher: { '@type': 'Organization', name: 'Registra Brasil', url: siteUrl },
  }

  const breadcrumbLd = breadcrumbListJsonLd([
    { name: 'Início', url: '/' },
    { name: 'Categorias', url: '/categorias' },
    { name: category.label_pt, url: `/categorias/${slug}` },
  ])

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbLd) }} />
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
          <a
            href={`/categorias/${category.slug}/feed.xml`}
            rel="alternate"
            type="application/rss+xml"
            aria-label={`Feed RSS: ${category.label_pt}`}
            className="ml-auto inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M4 11a9 9 0 0 1 9 9"/><path d="M4 4a16 16 0 0 1 16 16"/><circle cx="5" cy="19" r="1"/></svg>
            RSS
          </a>
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
