import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { CategoryGrid } from '@/components/categories/CategoryGrid'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Categorias — Registra Brasil',
  description: 'Explore declarações de políticos brasileiros organizadas por categoria.',
  openGraph: {
    title: 'Categorias — Registra Brasil',
    description: 'Explore declarações de políticos brasileiros organizadas por categoria.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Categorias — Registra Brasil',
    description: 'Explore declarações de políticos brasileiros organizadas por categoria.',
  },
  alternates: { canonical: '/categorias' },
}

export default async function CategoriesPage() {
  const supabase = await getSupabaseServerClient()
  const [categories, { data: countRows }] = await Promise.all([
    getAllCategories(supabase),
    supabase
      .from('statement_categories')
      .select('category_id, statements!inner(verification_status)')
      .eq('statements.verification_status', 'verified'),
  ])

  // Build count map
  const countMap: Record<string, number> = {}
  for (const row of (countRows ?? []) as { category_id: string }[]) {
    countMap[row.category_id] = (countMap[row.category_id] ?? 0) + 1
  }

  const totalStatements = Object.values(countMap).reduce((a, b) => a + b, 0)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: 'Categorias — Registra Brasil',
    description: 'Explore declarações de políticos brasileiros organizadas por categoria.',
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/categorias`,
    numberOfItems: categories.length,
    hasPart: categories.map((cat) => ({
      '@type': 'WebPage',
      name: cat.label_pt,
      url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/categorias/${cat.slug}`,
    })),
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Categorias</h1>
      <p className="text-gray-500 text-sm mb-2">
        Explore declaracoes organizadas por tema.
      </p>
      <div className="flex gap-4 text-sm text-gray-400 mb-8">
        <span>{categories.length} categorias</span>
        <span>{totalStatements} declaracoes verificadas</span>
      </div>

      <CategoryGrid categories={categories} countMap={countMap} />
    </main>
  )
}
