import { notFound } from 'next/navigation'
import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Clock, BookOpen } from 'lucide-react'
import { parseStoryBody, referencedStatementIds, type Block, type Inline } from '@/lib/stories/render'
import { articleJsonLd, breadcrumbListJsonLd } from '@/lib/utils/structured-data'

export const revalidate = 300

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps {
  params: Promise<{ slug: string }>
}

interface StatementLite {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  statement_date: string
  verification_status: string
  primary_source_url: string
  politicians: { common_name: string; slug: string; party: string } | null
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('stories') as any)
    .select('title, subtitle, cover_image_url')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()
  if (!data) return { title: 'História não encontrada' }
  return {
    title: `${data.title} — Registra Brasil`,
    description: data.subtitle ?? 'História editorial no Registra Brasil.',
    alternates: { canonical: `/historia/${slug}` },
    openGraph: {
      title: data.title,
      description: data.subtitle ?? '',
      type: 'article',
      url: `${SITE_URL}/historia/${slug}`,
      ...(data.cover_image_url ? { images: [{ url: data.cover_image_url }] } : {}),
    },
  }
}

function renderInline(ins: Inline[], keyPrefix: string): React.ReactNode[] {
  return ins.map((inline, i) => {
    const key = `${keyPrefix}-${i}`
    switch (inline.t) {
      case 'text': return inline.value
      case 'bold': return <strong key={key}>{inline.value}</strong>
      case 'italic': return <em key={key}>{inline.value}</em>
      case 'link': return (
        <a key={key} href={inline.href} target="_blank" rel="noopener noreferrer" className="text-blue-700 underline">
          {inline.value}
        </a>
      )
    }
  })
}

export default async function StoryPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const { data: story } = await (supabase.from('stories') as any)
    .select('id, slug, title, subtitle, author, body_markdown, hero_statement_id, cover_image_url, reading_time_min, published_at, updated_at')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  if (!story) notFound()

  const blocks = parseStoryBody(story.body_markdown ?? '')
  const referencedIds = referencedStatementIds(story.body_markdown ?? '')
  const idsToFetch = [...new Set([...(story.hero_statement_id ? [story.hero_statement_id] : []), ...referencedIds])]

  const { data: stmts } = idsToFetch.length
    ? await (supabase.from('statements') as any)
        .select('id, slug, summary, full_quote, statement_date, verification_status, primary_source_url, politicians(common_name, slug, party)')
        .in('id', idsToFetch)
    : { data: [] as StatementLite[] }

  const stmtById = new Map<string, StatementLite>((stmts ?? []).map((s: any) => [s.id, s]))

  const heroStatement = story.hero_statement_id ? stmtById.get(story.hero_statement_id) : undefined

  // Per-statement editor commentary (if authored in story_statements).
  const { data: commentaryRows } = await (supabase.from('story_statements') as any)
    .select('statement_id, commentary')
    .eq('story_id', story.id)
  const commentaryByStmt = new Map<string, string>(
    ((commentaryRows ?? []) as Array<{ statement_id: string; commentary: string | null }>)
      .filter((r) => r.commentary)
      .map((r) => [r.statement_id, r.commentary as string]),
  )

  const jsonLd = articleJsonLd({
    headline: story.title,
    description: story.subtitle ?? '',
    datePublished: story.published_at ?? story.updated_at,
    dateModified: story.updated_at,
    authorName: story.author ?? 'Registra Brasil',
    url: `/historia/${story.slug}`,
    imageUrl: story.cover_image_url ?? undefined,
  })
  const breadcrumbLd = breadcrumbListJsonLd([
    { name: 'Início', url: '/' },
    { name: 'Histórias', url: '/historias' },
    { name: story.title, url: `/historia/${story.slug}` },
  ])

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbLd) }} />

      <Breadcrumbs items={[
        { label: 'Histórias', href: '/historias' },
        { label: story.title },
      ]} />

      <header className="mb-8">
        {story.cover_image_url && (
          <Image
            src={story.cover_image_url}
            alt=""
            width={900}
            height={450}
            unoptimized
            className="w-full h-56 object-cover rounded-xl bg-gray-100 mb-5"
          />
        )}
        <div className="flex items-center gap-2 mb-2 text-xs text-blue-700 font-semibold uppercase tracking-wider">
          <BookOpen className="w-4 h-4" aria-hidden="true" />
          História editorial
        </div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">{story.title}</h1>
        {story.subtitle && <p className="text-gray-700 text-lg leading-relaxed mb-3">{story.subtitle}</p>}
        <div className="flex items-center gap-4 text-xs text-gray-500">
          {story.author && <span>por <strong>{story.author}</strong></span>}
          {story.published_at && <time dateTime={story.published_at}>{new Date(story.published_at).toLocaleDateString('pt-BR')}</time>}
          {story.reading_time_min && (
            <span className="inline-flex items-center gap-1">
              <Clock className="w-3 h-3" aria-hidden="true" />
              {story.reading_time_min} min de leitura
            </span>
          )}
        </div>
      </header>

      {heroStatement && (
        <StatementEmbed statement={heroStatement} hero />
      )}

      <article className="prose-like">
        {blocks.map((b, i) => {
          const key = `b-${i}`
          switch (b.kind) {
            case 'h2': return <h2 key={key} className="text-2xl font-bold text-gray-900 mt-8 mb-3">{b.text}</h2>
            case 'h3': return <h3 key={key} className="text-xl font-semibold text-gray-900 mt-6 mb-2">{b.text}</h3>
            case 'p': return <p key={key} className="text-gray-800 leading-relaxed mb-4">{renderInline(b.inlines, key)}</p>
            case 'quote': return (
              <blockquote key={key} className="border-l-4 border-gray-300 pl-4 italic text-gray-700 mb-4">
                {renderInline(b.inlines, key)}
              </blockquote>
            )
            case 'hr': return <hr key={key} className="my-8 border-gray-200" />
            case 'statement': {
              const s = stmtById.get(b.id)
              if (!s) return null
              const commentary = commentaryByStmt.get(s.id)
              return <StatementEmbed key={key} statement={s} commentary={commentary} />
            }
          }
        })}
      </article>

      <footer className="mt-10 text-xs text-gray-500 border-t border-gray-200 pt-4">
        <Link href="/historias" className="underline hover:text-gray-700">← Todas as histórias</Link>
      </footer>
    </main>
  )
}

function StatementEmbed({
  statement,
  commentary,
  hero,
}: {
  statement: StatementLite
  commentary?: string
  hero?: boolean
}) {
  const href = `/declaracao/${statement.slug ?? statement.id}`
  const pol = statement.politicians
  return (
    <aside className={`${hero ? 'mb-8' : 'my-6'} bg-blue-50 border border-blue-200 rounded-xl p-5`}>
      {commentary && <p className="text-sm text-blue-900 italic mb-3">{commentary}</p>}
      <blockquote className="text-gray-900 text-base leading-relaxed mb-3">
        “{statement.full_quote ?? statement.summary}”
      </blockquote>
      <footer className="text-xs text-gray-600 flex items-center gap-2 flex-wrap">
        {pol && (
          <Link href={`/politico/${pol.slug}`} className="font-semibold text-blue-800 hover:underline">
            {pol.common_name}
          </Link>
        )}
        {pol && <span>· {pol.party}</span>}
        <span>· {statement.statement_date}</span>
        <Link href={href} className="ml-auto text-blue-700 hover:underline">Ver declaração completa →</Link>
      </footer>
    </aside>
  )
}
