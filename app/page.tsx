import { Suspense } from 'react'
import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getFeaturedStatements } from '@/lib/supabase/queries/statements'
import { getAllCategories } from '@/lib/supabase/queries/categories'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { SearchBar } from '@/components/search/SearchBar'
import { CategoryTag } from '@/components/statements/CategoryTag'
import { StatementCardSkeleton } from '@/components/ui/Skeleton'
import { Archive, Search } from 'lucide-react'

export const revalidate = 3600

async function FeaturedStatements() {
  const supabase = await getSupabaseServerClient()
  const statements = await getFeaturedStatements(supabase, 6)
  return <StatementGrid statements={statements} />
}

export default async function HomePage() {
  const supabase = await getSupabaseServerClient()
  const categories = await getAllCategories(supabase)

  return (
    <main>
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
          <div className="flex gap-2 max-w-xl mx-auto">
            <Suspense fallback={<div className="h-11 w-full bg-blue-800 rounded-lg animate-pulse" />}>
              <SearchBar
                placeholder="Buscar por político, tema ou declaração..."
                autoFocus
              />
            </Suspense>
          </div>
        </div>
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

      {/* Featured */}
      <section className="max-w-7xl mx-auto px-4 pb-16">
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
    </main>
  )
}
