import { Suspense } from 'react'
import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getFeaturedStatements, getRecentStatements, getSiteStats } from '@/lib/supabase/queries/statements'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { SearchBar } from '@/components/search/SearchBar'
import { CategoryTag } from '@/components/statements/CategoryTag'
import { StatsBar } from '@/components/ui/StatsBar'
import { StatementCardSkeleton } from '@/components/ui/Skeleton'
import { PopularSearches } from '@/components/search/PopularSearches'
import { DailyPick } from '@/components/home/DailyPick'
import { WeeklySpotlight } from '@/components/home/WeeklySpotlight'
import { PoliticianCard } from '@/components/politicians/PoliticianCard'
import { Archive, Search, Clock, Users } from 'lucide-react'

export const revalidate = 3600

async function FeaturedStatements() {
  const supabase = await getSupabaseServerClient()
  const statements = await getFeaturedStatements(supabase, 6)
  if (statements.length === 0) return null
  return <StatementGrid statements={statements} />
}

async function RecentStatements() {
  const supabase = await getSupabaseServerClient()
  const statements = await getRecentStatements(supabase, 6)
  return <StatementGrid statements={statements} />
}

async function SiteStats({ totalCategories }: { totalCategories: number }) {
  const supabase = await getSupabaseServerClient()
  const { totalVerified, totalPoliticians } = await getSiteStats(supabase)
  return <StatsBar totalVerified={totalVerified} totalPoliticians={totalPoliticians} totalCategories={totalCategories} />
}

type PoliticianRow = {
  id: string
  slug: string
  common_name: string
  full_name: string
  party: string
  state: string
  photo_url: string | null
  statements: { count: number }[]
}

async function TopPoliticians() {
  const supabase = await getSupabaseServerClient()

  const { data } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state, photo_url, statements!inner(count)')
    .eq('is_active', true)
    .eq('statements.verification_status', 'verified')
    .limit(50)

  const politicians = (data ?? []) as PoliticianRow[]

  const sorted = politicians
    .sort((a, b) => (b.statements[0]?.count ?? 0) - (a.statements[0]?.count ?? 0))
    .slice(0, 6)

  if (sorted.length === 0) return null

  return (
    <section className="max-w-7xl mx-auto px-4 pb-8">
      <div className="flex items-center justify-between mb-6">
        <h2 className="font-semibold text-gray-900 text-lg flex items-center gap-2">
          <Users className="w-5 h-5 text-gray-400" />
          Políticos mais registrados
        </h2>
        <Link href="/politicos" className="text-sm text-blue-700 hover:underline">
          Ver todos
        </Link>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
        {sorted.map((p) => (
          <PoliticianCard key={p.slug} politician={p} statementCount={p.statements[0]?.count ?? 0} />
        ))}
      </div>
    </section>
  )
}

export default async function HomePage() {
  const supabase = await getSupabaseServerClient()
  const categories = await getAllCategories(supabase)

  return (
    <main>
      {/* Organization structured data */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'WebSite',
          name: 'Registra Brasil',
          url: process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br',
          description: 'Arquivo público de declarações de políticos brasileiros com ligação obrigatória a fontes primárias.',
          potentialAction: {
            '@type': 'SearchAction',
            target: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/buscar?q={search_term_string}`,
            'query-input': 'required name=search_term_string',
          },
          inLanguage: 'pt-BR',
        }) }}
      />

      {/* Hero */}
      <section className="bg-gradient-to-b from-blue-950 to-blue-900 text-white py-16 px-4">
        <div className="max-w-3xl mx-auto text-center">
          <div className="flex items-center justify-center gap-2 mb-4">
            <Archive className="w-8 h-8 text-blue-300" />
            <h1 className="text-3xl font-bold">Registra Brasil</h1>
          </div>
          <p className="text-blue-200 mb-8 text-lg">
            Arquivo de declarações de políticos brasileiros.<br />
            Toda afirmação ligada à fonte primária.
          </p>
          <div className="flex gap-2 max-w-xl mx-auto mb-6">
            <Suspense fallback={<div className="h-11 w-full bg-blue-800 rounded-lg animate-pulse" />}>
              <SearchBar
                placeholder="Buscar por político, tema ou declaração... (pressione /)"
                autoFocus
              />
            </Suspense>
          </div>
          <Suspense fallback={<div className="h-12" />}>
            <SiteStats totalCategories={categories.length} />
          </Suspense>
        </div>
      </section>

      <section className="max-w-4xl mx-auto px-4 pt-8">
        <Suspense fallback={null}>
          <DailyPick />
        </Suspense>
      </section>

      {/* Categories */}
      <section className="max-w-7xl mx-auto px-4 py-8">
        <h2 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">
          Categorias
        </h2>
        <div className="flex flex-wrap gap-2">
          {categories.map((cat) => (
            <Link key={cat.slug} href={`/categorias/${cat.slug}`}>
              <CategoryTag category={cat} />
            </Link>
          ))}
        </div>
      </section>

      {/* Weekly spotlight */}
      <Suspense fallback={null}>
        <WeeklySpotlight />
      </Suspense>

      {/* Featured */}
      <section className="max-w-7xl mx-auto px-4 pb-8">
        <div className="flex items-center justify-between mb-6">
          <h2 className="font-semibold text-gray-900 text-lg">Declarações em destaque</h2>
          <Link
            href="/buscar"
            className="text-sm text-blue-700 hover:underline flex items-center gap-1"
          >
            <Search className="w-4 h-4" />
            Ver todas
          </Link>
        </div>
        <Suspense
          fallback={
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
              {Array.from({ length: 6 }).map((_, i) => <StatementCardSkeleton key={i} />)}
            </div>
          }
        >
          <FeaturedStatements />
        </Suspense>
      </section>

      {/* Top politicians */}
      <Suspense fallback={null}>
        <TopPoliticians />
      </Suspense>

      {/* Recent additions */}
      <section className="max-w-7xl mx-auto px-4 pb-16">
        <div className="flex items-center justify-between mb-6">
          <h2 className="font-semibold text-gray-900 text-lg flex items-center gap-2">
            <Clock className="w-5 h-5 text-gray-400" />
            Adicionadas recentemente
          </h2>
        </div>
        <Suspense
          fallback={
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
              {Array.from({ length: 6 }).map((_, i) => <StatementCardSkeleton key={i} />)}
            </div>
          }
        >
          <RecentStatements />
        </Suspense>
      </section>

      <section className="max-w-7xl mx-auto px-4 pb-16">
        <Suspense fallback={null}>
          <PopularSearches />
        </Suspense>
      </section>
    </main>
  )
}
