import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPartyStatements } from '@/lib/supabase/queries/parties'
import Link from 'next/link'
import Image from 'next/image'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { FollowButton } from '@/components/alerts/FollowButton'
import { ScopeDownloads } from '@/components/export/ScopeDownloads'

export const revalidate = 3600

interface Props {
  params: Promise<{ slug: string }>
}

export async function generateStaticParams() {
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY) return []
  const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('politicians')
    .select('party')
    .eq('is_active', true)

  const uniqueParties = [...new Set((data ?? []).map((p: { party: string }) => p.party))]
  return uniqueParties.map((party) => ({ slug: encodeURIComponent(party) }))
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params
  const party = decodeURIComponent(slug)
  return {
    title: `${party} — Partidos — Registra Brasil`,
    description: `Declaracoes de politicos do partido ${party} registradas no Registra Brasil.`,
    openGraph: {
      title: `${party} — Registra Brasil`,
      description: `Declaracoes de politicos do partido ${party}.`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
    alternates: {
      canonical: `/partidos/${encodeURIComponent(party)}`,
      types: {
        'application/rss+xml': `/partidos/${encodeURIComponent(party)}/feed.xml`,
        'application/feed+json': `/partidos/${encodeURIComponent(party)}/feed.json`,
      },
    },
  }
}

export default async function PartyDetailPage({ params }: Props) {
  const { slug } = await params
  const party = decodeURIComponent(slug)
  const supabase = await getSupabaseServerClient()

  const [statementsResult, politiciansWithCounts] = await Promise.all([
    getPartyStatements(supabase, party),
    supabase
      .from('politicians')
      .select('id, slug, common_name, full_name, party, state, photo_url, statements!inner(count)')
      .eq('is_active', true)
      .eq('party', party)
      .eq('statements.verification_status', 'verified'),
  ])

  const politicians = (politiciansWithCounts.data ?? []) as {
    id: string
    slug: string
    common_name: string
    full_name: string
    party: string
    state: string | null
    photo_url: string | null
    statements: { count: number }[]
  }[]

  if (politicians.length === 0) notFound()

  const countMap: Record<string, number> = {}
  for (const pol of politicians) {
    countMap[pol.id] = pol.statements[0]?.count ?? 0
  }

  const sortedPoliticians = [...politicians].sort(
    (a, b) => (countMap[b.id] ?? 0) - (countMap[a.id] ?? 0)
  )

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: `${party} — Registra Brasil`,
    description: `Politicos e declaracoes do partido ${party}.`,
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/partidos/${encodeURIComponent(party)}`,
    numberOfItems: politicians.length,
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <nav className="text-sm text-gray-500 mb-4" aria-label="Breadcrumb">
        <Link href="/partidos" className="hover:text-gray-900">Partidos</Link>
        <span className="mx-1">/</span>
        <span className="text-gray-900">{party}</span>
      </nav>

      <div className="flex items-center gap-3 mb-2">
        <h1 className="text-2xl font-bold text-gray-900">{party}</h1>
        <a
          href={`/partidos/${encodeURIComponent(party)}/feed.xml`}
          rel="alternate"
          type="application/rss+xml"
          aria-label={`Feed RSS: ${party}`}
          className="ml-auto inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
        >
          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M4 11a9 9 0 0 1 9 9"/><path d="M4 4a16 16 0 0 1 16 16"/><circle cx="5" cy="19" r="1"/></svg>
          RSS
        </a>
      </div>
      <div className="mb-4">
        <FollowButton scope={{ kind: 'partido', value: party, label: party }} />
      </div>
      <ScopeDownloads base={`/api/partidos/${encodeURIComponent(party)}/export`} label="Baixar arquivo do partido:" />
      <p className="text-gray-500 text-sm mb-8">
        {politicians.length} {politicians.length === 1 ? 'politico' : 'politicos'} ·{' '}
        {statementsResult.total} {statementsResult.total === 1 ? 'declaracao verificada' : 'declaracoes verificadas'}
      </p>

      <h2 className="text-lg font-semibold text-gray-900 mb-3">Politicos</h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 mb-10">
        {sortedPoliticians.map((pol) => (
          <Link
            key={pol.slug}
            href={`/politico/${pol.slug}`}
            className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg bg-white hover:bg-gray-50 hover:border-gray-300 transition-colors"
          >
            {pol.photo_url ? (
              <Image
                src={pol.photo_url}
                alt={pol.common_name}
                width={40}
                height={40}
                className="w-10 h-10 rounded-full object-cover"
              />
            ) : (
              <div className="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-sm font-medium">
                {pol.common_name.charAt(0)}
              </div>
            )}
            <div className="flex-1 min-w-0">
              <span className="font-medium text-gray-900 block truncate">{pol.common_name}</span>
              <span className="text-xs text-gray-500">
                {pol.state ?? 'Nacional'} · {countMap[pol.id] ?? 0} declaracoes
              </span>
            </div>
          </Link>
        ))}
      </div>
    </main>
  )
}
