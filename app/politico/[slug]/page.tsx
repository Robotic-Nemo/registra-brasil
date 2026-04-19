import { Suspense } from 'react'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug, getPoliticianCategoryStats, getPoliticianActivityByMonth, getPoliticianActivityByDay, getAllPoliticianSlugs, getRelatedPoliticians } from '@/lib/supabase/queries/politicians'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { PoliticianHeader } from '@/components/politicians/PoliticianHeader'
import { PoliticianWikipediaBio } from '@/components/politicians/PoliticianWikipediaBio'
import { PoliticianStats } from '@/components/politicians/PoliticianStats'
import { PoliticianStatements } from '@/components/politicians/PoliticianStatements'
import { Pagination } from '@/components/ui/Pagination'
import { RelatedPoliticians } from '@/components/politicians/RelatedPoliticians'
import { SimilarPoliticians } from '@/components/politicians/SimilarPoliticians'
import { getSimilarPoliticians } from '@/lib/politicians/similar'
import { computeBadges } from '@/lib/politicians/badges'
import { PoliticianBadges } from '@/components/politicians/PoliticianBadges'
import { PoliticianDownloads } from '@/components/politicians/PoliticianDownloads'
import { PoliticianActivityChart } from '@/components/politicians/PoliticianActivityChart'
import { ActivityCalendar } from '@/components/politicians/ActivityCalendar'
import { breadcrumbListJsonLd, personJsonLd, itemListJsonLd } from '@/lib/utils/structured-data'
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
  const title = `${politician.common_name} (${politician.party}) — Registra Brasil`
  const description = `Declarações registradas de ${politician.common_name}, ${politician.party}${politician.state ? `/${politician.state}` : ''}.`
  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: 'profile',
      siteName: 'Registra Brasil',
      ...(politician.photo_url ? { images: [{ url: politician.photo_url }] } : {}),
    },
    twitter: {
      card: 'summary',
      title,
      description,
      ...(politician.photo_url ? { images: [politician.photo_url] } : {}),
    },
    alternates: { canonical: `/politico/${slug}` },
  }
}

export default async function PoliticianPage({ params, searchParams }: PageProps) {
  const { slug } = await params
  const { page: pageStr } = await searchParams
  const page = Math.max(1, parseInt(pageStr ?? '1', 10) || 1)

  const supabase = await getSupabaseServerClient()

  const [politician, statementsResult] = await Promise.all([
    getPoliticianBySlug(supabase, slug),
    searchStatements(supabase, { politico: slug, page, limit: 20, status: 'verified' }).catch(() => ({
      results: [], total: 0, page, hasMore: false,
    })),
  ])

  if (!politician) notFound()

  // Load category stats and related politicians after confirming politician exists
  const [categoryStats, relatedPoliticians, activityData, dailyActivity, similarPoliticians, badges] = await Promise.all([
    getPoliticianCategoryStats(supabase, politician.id).catch(() => []),
    getRelatedPoliticians(supabase, politician.slug, politician.party, politician.state, 4).catch(() => []),
    getPoliticianActivityByMonth(supabase, politician.id, 12).catch(() => []),
    getPoliticianActivityByDay(supabase, politician.id, 52).catch(() => []),
    getSimilarPoliticians(politician.id, 6).catch(() => []),
    computeBadges({
      politicianId: politician.id,
      partyHistory: (politician as unknown as { party_history?: Array<{ party?: string; from?: string; to?: string }> }).party_history ?? null,
      roleHistory: (politician as unknown as { role_history?: Array<{ role?: string; from?: string; to?: string }> }).role_history ?? null,
    }).catch(() => []),
  ])

  const personLd = personJsonLd({
    name: politician.full_name,
    slug: politician.slug,
    party: politician.party,
    state: politician.state,
    role: politician.role,
    photoUrl: politician.photo_url,
  })

  const breadcrumbLd = breadcrumbListJsonLd([
    { name: 'Inicio', url: '/' },
    { name: 'Politicos', url: '/politicos' },
    { name: politician.common_name, url: `/politico/${politician.slug}` },
  ])

  // ItemList of this politician's recent verified statements.
  const statementsListLd =
    statementsResult.results.length > 0
      ? itemListJsonLd(
          statementsResult.results.slice(0, 10).map((s) => ({
            name: s.summary.slice(0, 100),
            url: `/declaracao/${s.slug ?? s.id}`,
          })),
          `Declarações de ${politician.common_name}`,
        )
      : null

  return (
    <main className="max-w-5xl mx-auto px-4 py-8 flex flex-col gap-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(personLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbLd) }}
      />
      {statementsListLd && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(statementsListLd) }}
        />
      )}
      <Breadcrumbs items={[
        { label: 'Políticos', href: '/politicos' },
        { label: politician.common_name },
      ]} />
      <PoliticianHeader politician={politician} statementCount={statementsResult.total} />
      <PoliticianBadges badges={badges} />
      <PoliticianDownloads slug={politician.slug} />

      {politician.bio_excerpt && (
        <PoliticianWikipediaBio excerpt={politician.bio_excerpt} sourceUrl={politician.bio_source_url} />
      )}

      {categoryStats.length > 0 && <PoliticianStats stats={categoryStats} />}

      {activityData.length > 0 && (
        <PoliticianActivityChart data={activityData} className="bg-white border border-gray-200 rounded-xl p-4" />
      )}

      {dailyActivity.length > 0 && (
        <section className="bg-white border border-gray-200 rounded-xl p-4">
          <ActivityCalendar
            days={dailyActivity}
            title={`Atividade em 52 semanas — ${politician.common_name}`}
            hrefFor={(date) => `/buscar?politico=${politician.slug}&de=${date}&ate=${date}`}
          />
        </section>
      )}

      <section>
        <PoliticianStatements statements={statementsResult.results} />
        {(page > 1 || statementsResult.hasMore) && (
          <Suspense fallback={null}>
            <Pagination page={page} hasMore={statementsResult.hasMore} total={statementsResult.total} totalPages={Math.ceil(statementsResult.total / 20)} />
          </Suspense>
        )}
      </section>

      {similarPoliticians.length > 0 && (
        <SimilarPoliticians politicians={similarPoliticians} targetName={politician.common_name} />
      )}

      {relatedPoliticians.length > 0 && (
        <RelatedPoliticians
          politicians={relatedPoliticians}
          label={`Outros políticos do ${politician.party}`}
        />
      )}
    </main>
  )
}
