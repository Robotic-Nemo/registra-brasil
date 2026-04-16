import { notFound } from 'next/navigation'
import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById, getRelatedStatements, getAdjacentStatements } from '@/lib/supabase/queries/statements'
import { CategoryTag } from '@/components/statements/CategoryTag'
import { VerificationBadge } from '@/components/statements/VerificationBadge'
import { SourceLink } from '@/components/statements/SourceLink'
import { YouTubeEmbed } from '@/components/youtube/YouTubeEmbed'
import { ShareButton } from '@/components/ui/ShareButton'
import { CopyButton } from '@/components/ui/CopyButton'
import { ShareCard } from '@/components/statements/ShareCard'
import { StatementCard } from '@/components/statements/StatementCard'
import { StatementNav } from '@/components/statements/StatementNav'
import { formatDatePtBR } from '@/lib/utils/date'
import { OFFICIAL_CHANNELS } from '@/lib/youtube/constants'
import Image from 'next/image'
import { MapPin, Building2, Clock } from 'lucide-react'
import { readingTime, wordCount } from '@/lib/utils/text'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { AdminEditLink } from '@/components/ui/AdminEditLink'
import { EmbedCode } from '@/components/statements/EmbedCode'
import { StatementMeta } from '@/components/statements/StatementMeta'
import { claimReviewJsonLd, breadcrumbListJsonLd } from '@/lib/utils/structured-data'
import type { Metadata } from 'next'
import type { SecondarySource } from '@/types/database'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ id: string }>
}

const OFFICIAL_IDS = new Set(Object.values(OFFICIAL_CHANNELS))

export async function generateStaticParams() {
  if (!process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_URL?.startsWith('your_')) {
    return []
  }
  const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
  const supabase = getSupabaseServiceClient()
  const { data } = await supabase
    .from('statements')
    .select('slug, id')
    .eq('verification_status', 'verified')
    .not('slug', 'is', null)
    .order('statement_date', { ascending: false })
    .limit(100)

  return (data ?? []).map((s: { slug: string | null; id: string }) => ({
    id: s.slug ?? s.id,
  }))
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)
  if (!statement) return { title: 'Declaração não encontrada' }

  const description = statement.summary
  const title = `${statement.politicians.common_name}: "${statement.summary.slice(0, 60)}..." — Registra Brasil`

  return {
    title,
    description,
    openGraph: {
      title,
      description,
      type: 'article',
      publishedTime: statement.statement_date,
      authors: [statement.politicians.common_name],
      siteName: 'Registra Brasil',
    },
    twitter: {
      card: 'summary',
      title,
      description,
    },
    alternates: {
      canonical: `/declaracao/${id}`,
      types: {
        'application/json+oembed': `/api/embed?url=${encodeURIComponent(`${process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'}/declaracao/${id}`)}`,
      },
    },
  }
}

export default async function StatementPage({ params }: PageProps) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()

  // Try slug first, then UUID
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)
  if (!statement) notFound()

  const { politicians: politician, statement_categories } = statement
  const isOfficial = statement.youtube_channel_id
    ? OFFICIAL_IDS.has(statement.youtube_channel_id)
    : false

  const [related, adjacent] = await Promise.all([
    getRelatedStatements(supabase, statement.id, politician.id, 4),
    getAdjacentStatements(supabase, politician.id, statement.statement_date, statement.id),
  ])

  const permalink = statement.slug
    ? `/declaracao/${statement.slug}`
    : `/declaracao/${statement.id}`

  // JSON-LD structured data
  const claimLd = claimReviewJsonLd({
    id: statement.id,
    slug: statement.slug,
    summary: statement.summary,
    politicianName: politician.full_name,
    politicianSlug: politician.slug,
    datePublished: statement.statement_date,
    verificationStatus: statement.verification_status,
    sourceUrl: statement.primary_source_url,
  })

  const breadcrumbLd = breadcrumbListJsonLd([
    { name: 'Inicio', url: '/' },
    { name: 'Buscar', url: '/buscar' },
    { name: politician.common_name, url: `/politico/${politician.slug}` },
    { name: statement.summary.slice(0, 40) + (statement.summary.length > 40 ? '...' : ''), url: permalink },
  ])

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      {/* JSON-LD */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(claimLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbLd) }}
      />

      <div className="flex items-center justify-between mb-6">
        <Breadcrumbs items={[
          { label: 'Buscar', href: '/buscar' },
          { label: politician.common_name, href: `/politico/${politician.slug}` },
          { label: statement.summary.slice(0, 40) + (statement.summary.length > 40 ? '...' : '') },
        ]} />
        <div className="flex items-center gap-2">
          <AdminEditLink statementId={statement.id} />
          <ShareButton />
        </div>
      </div>

      <article className="bg-white border border-gray-200 rounded-xl p-6 flex flex-col gap-5">
        {/* Politician */}
        <div className="flex items-start justify-between gap-2 flex-wrap">
          <Link href={`/politico/${politician.slug}`} className="flex items-center gap-3 hover:underline">
            {politician.photo_url ? (
              <Image src={politician.photo_url} alt={politician.common_name} width={48} height={48} className="w-12 h-12 rounded-full object-cover border border-gray-200" referrerPolicy="no-referrer" priority />
            ) : (
              <div className="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center text-lg font-bold text-gray-500">
                {politician.common_name?.[0] ?? '?'}
              </div>
            )}
            <div>
              <p className="font-semibold text-gray-900">{politician.common_name}</p>
              <p className="text-sm text-gray-500">{politician.full_name}</p>
              <div className="flex items-center gap-1.5 text-xs text-gray-500 mt-0.5">
                <span className="bg-gray-100 px-1.5 py-0.5 rounded font-mono">{politician.party}</span>
                {politician.state && (
                  <>
                    <MapPin className="w-3 h-3" />
                    <span>{politician.state}</span>
                  </>
                )}
              </div>
            </div>
          </Link>
          <VerificationBadge status={statement.verification_status} showLabel />
        </div>

        {/* Date & venue */}
        <div className="text-sm text-gray-500 flex flex-wrap gap-3">
          <time dateTime={statement.statement_date}>
            {formatDatePtBR(statement.statement_date, statement.statement_date_approx)}
          </time>
          {statement.venue && (
            <span className="flex items-center gap-1">
              <Building2 className="w-3.5 h-3.5" />
              {statement.venue}
              {statement.event_name && ` — ${statement.event_name}`}
            </span>
          )}
          {(() => {
            const fullText = [statement.summary, statement.full_quote, statement.context].filter(Boolean).join(' ')
            const words = wordCount(fullText)
            const minutes = readingTime(fullText)
            return (
              <span className="flex items-center gap-1">
                <Clock className="w-3.5 h-3.5" />
                {words} palavras &middot; {minutes} min de leitura
              </span>
            )
          })()}
        </div>

        {/* Summary */}
        <p className="text-gray-800 text-base leading-relaxed">{statement.summary}</p>

        {/* Quote */}
        {statement.full_quote && (
          <div>
            <blockquote className="border-l-4 border-blue-300 pl-4 text-gray-700 italic text-base leading-relaxed bg-blue-50 py-3 rounded-r-lg">
              &ldquo;{statement.full_quote}&rdquo;
            </blockquote>
            <div className="mt-1.5 pl-4">
              <CopyButton
                text={`"${statement.full_quote}" — ${politician.common_name}, ${statement.statement_date}`}
                label="Copiar citação"
              />
            </div>
          </div>
        )}

        {/* Context */}
        {statement.context && (
          <div className="bg-gray-50 rounded-lg p-4 text-sm text-gray-700">
            <p className="font-semibold text-gray-900 mb-1">Contexto</p>
            <p>{statement.context}</p>
          </div>
        )}

        {/* Transcript excerpt */}
        {statement.transcript_excerpt && (
          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-sm">
            <p className="font-semibold text-yellow-900 mb-1">Trecho da transcrição oficial</p>
            <p className="font-mono text-yellow-800 whitespace-pre-wrap">{statement.transcript_excerpt}</p>
          </div>
        )}

        {/* YouTube embed */}
        {statement.youtube_video_id && (
          <div>
            <p className="text-sm font-semibold text-gray-700 mb-2">Vídeo da declaração</p>
            <YouTubeEmbed
              videoId={statement.youtube_video_id}
              timestampSec={statement.youtube_timestamp_sec}
              title={statement.summary}
            />
          </div>
        )}

        {/* Categories */}
        <div className="flex flex-wrap gap-2">
          {statement_categories.map((sc) => (
            <Link key={sc.categories.slug} href={`/categorias/${sc.categories.slug}`}>
              <CategoryTag category={sc.categories} />
            </Link>
          ))}
        </div>

        {/* Primary source */}
        <div className="border-t border-gray-100 pt-4">
          <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Fonte primária</p>
          <SourceLink
            url={statement.primary_source_url}
            type={statement.primary_source_type}
            videoId={statement.youtube_video_id}
            timestampSec={statement.youtube_timestamp_sec}
            isOfficial={isOfficial}
          />
        </div>

        {/* Secondary sources */}
        {(statement.secondary_sources as SecondarySource[])?.length > 0 && (
          <div className="border-t border-gray-100 pt-4">
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Fontes secundárias</p>
            <div className="flex flex-col gap-2">
              {(statement.secondary_sources as SecondarySource[]).map((src, i) => (
                <div key={i} className="flex items-start gap-2">
                  {src.outlet && <span className="text-xs text-gray-500 font-medium mt-0.5">{src.outlet}</span>}
                  <SourceLink url={src.url} type={src.type} label={src.title} />
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Editor notes */}
        {statement.editor_notes && (
          <div className="border-t border-gray-100 pt-4">
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">Notas editoriais</p>
            <p className="text-sm text-gray-600">{statement.editor_notes}</p>
          </div>
        )}

        {/* Share & Embed */}
        <div className="border-t border-gray-100 pt-4 flex flex-col gap-3">
          <div className="flex items-center justify-between">
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider">Compartilhar</p>
            <ShareCard
              url={permalink}
              text={`${politician.common_name}: "${statement.summary.slice(0, 100)}..." — Registra Brasil`}
            />
          </div>
          <EmbedCode
            statementUrl={permalink}
            summary={statement.summary}
            politicianName={politician.common_name}
          />
        </div>
      </article>

      {/* Prev/Next navigation */}
      <StatementNav prev={adjacent.prev} next={adjacent.next} />

      {/* Related statements */}
      {related.length > 0 && (
        <section className="mt-10">
          <h2 className="font-semibold text-gray-900 mb-4">
            Outras declarações de {politician.common_name}
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {related.map((s) => (
              <StatementCard key={s.id} statement={s} />
            ))}
          </div>
        </section>
      )}
    </main>
  )
}
