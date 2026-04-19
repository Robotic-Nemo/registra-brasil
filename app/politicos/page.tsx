import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { PoliticianFilter } from '@/components/politicians/PoliticianFilter'
import type { Politician } from '@/types/database'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Políticos — Registra Brasil',
  description: 'Lista de políticos brasileiros monitorados pelo Registra Brasil.',
  openGraph: {
    title: 'Políticos — Registra Brasil',
    description: 'Lista de políticos brasileiros monitorados pelo Registra Brasil.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Políticos — Registra Brasil',
    description: 'Lista de políticos brasileiros monitorados pelo Registra Brasil.',
  },
  alternates: { canonical: '/politicos' },
}

export default async function PoliticosPage() {
  const supabase = await getSupabaseServerClient()

  const [{ data: politicians }, { data: countRows }] = await Promise.all([
    supabase
      .from('politicians')
      .select('id, slug, common_name, full_name, party, state, photo_url')
      .eq('is_active', true)
      .order('common_name', { ascending: true }),
    supabase
      .from('statements')
      .select('politician_id')
      .eq('verification_status', 'verified'),
  ])

  const countMap: Record<string, number> = {}
  for (const row of (countRows ?? []) as { politician_id: string }[]) {
    countMap[row.politician_id] = (countMap[row.politician_id] ?? 0) + 1
  }

  const sortedPoliticians = ((politicians ?? []) as Pick<Politician, 'id' | 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[])
    .sort((a, b) => (countMap[b.id] ?? 0) - (countMap[a.id] ?? 0))

  const total = sortedPoliticians.length
  const withStatements = sortedPoliticians.filter((p) => (countMap[p.id] ?? 0) > 0).length

  const collectionJsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: 'Políticos monitorados — Registra Brasil',
    description: `${total} políticos brasileiros monitorados pelo Registra Brasil.`,
    numberOfItems: total,
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/politicos`,
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionJsonLd) }} />
      <div className="flex items-center justify-between mb-2 gap-3 flex-wrap">
        <h1 className="text-2xl font-bold text-gray-900">Políticos</h1>
        <div className="flex gap-3 text-sm">
          <Link href="/politicos/a-z" className="text-blue-700 hover:underline">A-Z</Link>
          <Link href="/politicos/por-partido" className="text-blue-700 hover:underline">Por partido</Link>
          <Link href="/politicos/por-estado" className="text-blue-700 hover:underline">Por estado</Link>
        </div>
      </div>
      <p className="text-gray-500 text-sm mb-6">
        {total} políticos monitorados, {withStatements} com declarações registradas. Ordenados por quantidade.
      </p>

      <PoliticianFilter politicians={sortedPoliticians} countMap={countMap} />
    </main>
  )
}
