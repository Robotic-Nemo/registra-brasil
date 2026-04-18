import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { FolderKanban } from 'lucide-react'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Coleções editoriais — Registra Brasil',
  description:
    'Agrupamentos temáticos curados pela equipe editorial: promessas, contradições, declarações por contexto.',
  alternates: { canonical: '/colecoes' },
}

export default async function ColecoesPage() {
  const supabase = await getSupabaseServerClient()
  const { data: rows } = await (supabase.from('collections') as any)
    .select('slug, title, subtitle, cover_image_url, published_at, id')
    .eq('is_published', true)
    .order('published_at', { ascending: false })
    .limit(50)

  // Pull item counts in one round trip.
  const ids = ((rows ?? []) as Array<{ id: string }>).map((r) => r.id)
  let countMap = new Map<string, number>()
  if (ids.length) {
    const { data: counts } = await (supabase.from('collection_statements') as any)
      .select('collection_id')
      .in('collection_id', ids)
    for (const row of (counts ?? []) as { collection_id: string }[]) {
      countMap.set(row.collection_id, (countMap.get(row.collection_id) ?? 0) + 1)
    }
  }

  const collections = (rows ?? []) as Array<{
    id: string
    slug: string
    title: string
    subtitle: string | null
    cover_image_url: string | null
    published_at: string | null
  }>

  return (
    <main className="max-w-5xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Coleções' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <FolderKanban className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Coleções editoriais</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Agrupamentos temáticos curados: promessas de campanha, contradições ao longo do tempo,
          declarações sobre temas específicos. Cada coleção tem feed RSS próprio.
        </p>
      </header>

      {collections.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-5">
          Ainda não há coleções publicadas. Volte em breve.
        </p>
      ) : (
        <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {collections.map((c) => (
            <li key={c.slug}>
              <Link
                href={`/colecao/${c.slug}`}
                className="block bg-white border border-gray-200 rounded-xl overflow-hidden hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
              >
                {c.cover_image_url ? (
                  <Image
                    src={c.cover_image_url}
                    alt=""
                    width={480}
                    height={240}
                    unoptimized
                    className="w-full h-32 object-cover bg-gray-100"
                  />
                ) : (
                  <div className="w-full h-32 bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center">
                    <FolderKanban className="w-8 h-8 text-blue-400" aria-hidden="true" />
                  </div>
                )}
                <div className="p-4">
                  <h2 className="font-semibold text-gray-900 mb-1">{c.title}</h2>
                  {c.subtitle && <p className="text-xs text-gray-600 mb-2 line-clamp-2">{c.subtitle}</p>}
                  <p className="text-xs text-gray-500">
                    {countMap.get(c.id) ?? 0} declaraç{countMap.get(c.id) === 1 ? 'ão' : 'ões'}
                  </p>
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
