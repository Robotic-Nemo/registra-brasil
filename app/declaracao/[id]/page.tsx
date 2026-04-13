import { notFound } from 'next/navigation'
import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'
import { CategoryTag } from '@/components/statements/CategoryTag'
import { VerificationBadge } from '@/components/statements/VerificationBadge'
import { SourceLink } from '@/components/statements/SourceLink'
import { YouTubeEmbed } from '@/components/youtube/YouTubeEmbed'
import { formatDatePtBR } from '@/lib/utils/date'
import { OFFICIAL_CHANNELS } from '@/lib/youtube/constants'
import { ArrowLeft, MapPin, Building2 } from 'lucide-react'
import type { Metadata } from 'next'
import type { SecondarySource } from '@/types/database'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ id: string }>
}

const OFFICIAL_IDS = new Set(Object.values(OFFICIAL_CHANNELS))

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)
  if (!statement) return { title: 'Declaração não encontrada' }
  return {
    title: `${statement.politicians.common_name}: "${statement.summary.slice(0, 60)}..." — Registra Brasil`,
    description: statement.summary,
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

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Link href="/buscar" className="inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700 mb-6">
        <ArrowLeft className="w-4 h-4" />
        Voltar à busca
      </Link>

      <article className="bg-white border border-gray-200 rounded-xl p-6 flex flex-col gap-5">
        {/* Politician */}
        <div className="flex items-start justify-between gap-2 flex-wrap">
          <Link href={`/politico/${politician.slug}`} className="flex items-center gap-3 hover:underline">
            {politician.photo_url ? (
              <img src={politician.photo_url} alt={politician.common_name} className="w-12 h-12 rounded-full object-cover border border-gray-200" />
            ) : (
              <div className="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center text-lg font-bold text-gray-500">
                {politician.common_name[0]}
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
        </div>

        {/* Summary */}
        <p className="text-gray-800 text-base leading-relaxed">{statement.summary}</p>

        {/* Quote */}
        {statement.full_quote && (
          <blockquote className="border-l-4 border-blue-300 pl-4 text-gray-700 italic text-base leading-relaxed bg-blue-50 py-3 rounded-r-lg">
            "{statement.full_quote}"
          </blockquote>
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
      </article>
    </main>
  )
}
