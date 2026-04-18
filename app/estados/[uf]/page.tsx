import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStateStatements, BRAZILIAN_STATES } from '@/lib/supabase/queries/states'
import Link from 'next/link'
import Image from 'next/image'
import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { FollowButton } from '@/components/alerts/FollowButton'

export const revalidate = 3600

interface Props {
  params: Promise<{ uf: string }>
}

export async function generateStaticParams() {
  const { BRAZILIAN_STATES } = await import('@/lib/supabase/queries/states')
  return Object.keys(BRAZILIAN_STATES).map((uf) => ({ uf: uf.toLowerCase() }))
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { uf } = await params
  const stateCode = uf.toUpperCase()
  const stateName = BRAZILIAN_STATES[stateCode] ?? stateCode
  return {
    title: `${stateName} (${stateCode}) — Estados — Registra Brasil`,
    description: `Declaracoes de politicos do estado ${stateName} registradas no Registra Brasil.`,
    openGraph: {
      title: `${stateName} — Registra Brasil`,
      description: `Declaracoes de politicos de ${stateName}.`,
      type: 'website',
      siteName: 'Registra Brasil',
    },
    alternates: {
      canonical: `/estados/${uf.toLowerCase()}`,
      types: { 'application/rss+xml': `/estados/${uf.toUpperCase()}/feed.xml` },
    },
  }
}

export default async function StateDetailPage({ params }: Props) {
  const { uf } = await params
  const stateCode = uf.toUpperCase()
  const stateName = BRAZILIAN_STATES[stateCode]

  if (!stateName) notFound()

  const supabase = await getSupabaseServerClient()

  const [statementsResult, politiciansWithCounts] = await Promise.all([
    getStateStatements(supabase, stateCode),
    supabase
      .from('politicians')
      .select('id, slug, common_name, full_name, party, state, photo_url, statements!inner(count)')
      .eq('is_active', true)
      .eq('state', stateCode)
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
    name: `${stateName} — Registra Brasil`,
    description: `Politicos e declaracoes do estado ${stateName}.`,
    url: `${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/estados/${uf.toLowerCase()}`,
    numberOfItems: politicians.length,
  }

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />

      <nav className="text-sm text-gray-500 mb-4" aria-label="Breadcrumb">
        <Link href="/estados" className="hover:text-gray-900">Estados</Link>
        <span className="mx-1">/</span>
        <span className="text-gray-900">{stateCode}</span>
      </nav>

      <div className="flex items-center gap-3 mb-2">
        <h1 className="text-2xl font-bold text-gray-900">
          {stateName} <span className="text-gray-400 font-normal">({stateCode})</span>
        </h1>
        <a
          href={`/estados/${stateCode}/feed.xml`}
          rel="alternate"
          type="application/rss+xml"
          aria-label={`Feed RSS: ${stateName}`}
          className="ml-auto inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
        >
          <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M4 11a9 9 0 0 1 9 9"/><path d="M4 4a16 16 0 0 1 16 16"/><circle cx="5" cy="19" r="1"/></svg>
          RSS
        </a>
      </div>
      <p className="text-gray-500 text-sm mb-3">
        {politicians.length} {politicians.length === 1 ? 'politico' : 'politicos'} ·{' '}
        {statementsResult.total} {statementsResult.total === 1 ? 'declaracao verificada' : 'declaracoes verificadas'}
      </p>
      <div className="mb-8">
        <FollowButton scope={{ kind: 'estado', value: stateCode, label: `${stateName} (${stateCode})` }} />
      </div>

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
                {pol.party} · {countMap[pol.id] ?? 0} declaracoes
              </span>
            </div>
          </Link>
        ))}
      </div>

      {politicians.length === 0 && (
        <p className="text-gray-400 text-center py-12">Nenhum politico encontrado neste estado.</p>
      )}
    </main>
  )
}
