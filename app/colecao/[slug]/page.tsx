import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { StatementGrid } from '@/components/statements/StatementGrid'
import { Rss, FolderKanban } from 'lucide-react'
import { CollectionDownloads } from '@/components/collections/CollectionDownloads'
import { collectionPageJsonLd, breadcrumbListJsonLd } from '@/lib/utils/structured-data'

export const revalidate = 300

interface PageProps {
  params: Promise<{ slug: string }>
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('collections') as any)
    .select('title, subtitle, description, cover_image_url')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  if (!data) return { title: 'Coleção não encontrada' }

  const desc = data.subtitle ?? (data.description ? data.description.slice(0, 200) : 'Coleção editorial — Registra Brasil')

  return {
    title: `${data.title} — Registra Brasil`,
    description: desc,
    alternates: {
      canonical: `/colecao/${slug}`,
      types: { 'application/rss+xml': `/colecao/${slug}/feed.xml` },
    },
    openGraph: {
      title: data.title,
      description: desc,
      type: 'website',
      url: `${SITE_URL}/colecao/${slug}`,
      ...(data.cover_image_url ? { images: [{ url: data.cover_image_url }] } : {}),
    },
  }
}

export default async function CollectionDetailPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const { data: collection } = await (supabase.from('collections') as any)
    .select('id, slug, title, subtitle, description, cover_image_url, published_at')
    .eq('slug', slug)
    .eq('is_published', true)
    .maybeSingle()

  if (!collection) notFound()

  const { data: joinRows } = await (supabase.from('collection_statements') as any)
    .select('position, editor_note, statement_id, statements(id, slug, summary, full_quote, statement_date, venue, event_name, verification_status, severity_score, primary_source_url, primary_source_type, youtube_video_id, youtube_timestamp_sec, secondary_sources, politicians(id, slug, common_name, full_name, party, state, photo_url), statement_categories(is_primary, categories(slug, label_pt, color_hex)))')
    .eq('collection_id', collection.id)
    .order('position', { ascending: true })

  const statements = ((joinRows ?? []) as Array<{ statements: unknown; position: number; editor_note: string | null }>)
    .map((r) => r.statements)
    .filter(Boolean) as any[]

  const jsonLd = collectionPageJsonLd({
    name: collection.title,
    description: collection.subtitle ?? collection.description ?? '',
    url: `/colecao/${collection.slug}`,
  })
  const breadcrumbLd = breadcrumbListJsonLd([
    { name: 'Início', url: '/' },
    { name: 'Coleções', url: '/colecoes' },
    { name: collection.title, url: `/colecao/${collection.slug}` },
  ])

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbLd) }} />

      <Breadcrumbs
        items={[
          { label: 'Coleções', href: '/colecoes' },
          { label: collection.title },
        ]}
      />

      <header className="mb-8">
        {collection.cover_image_url && (
          <Image
            src={collection.cover_image_url}
            alt=""
            width={960}
            height={360}
            unoptimized
            className="w-full h-48 object-cover rounded-xl bg-gray-100 mb-4"
          />
        )}
        <div className="flex items-center gap-2 mb-2 text-xs text-blue-700 font-semibold uppercase tracking-wider">
          <FolderKanban className="w-4 h-4" aria-hidden="true" />
          Coleção editorial
        </div>
        <h1 className="text-3xl font-bold text-gray-900 mb-2">{collection.title}</h1>
        {collection.subtitle && (
          <p className="text-gray-700 text-lg leading-relaxed mb-3">{collection.subtitle}</p>
        )}
        {collection.description && (
          <p className="text-gray-700 leading-relaxed whitespace-pre-line">{collection.description}</p>
        )}
        <div className="flex items-center gap-4 mt-4 text-xs text-gray-500">
          <span>{statements.length} declaraç{statements.length === 1 ? 'ão' : 'ões'}</span>
          {collection.published_at && (
            <time dateTime={collection.published_at}>
              Publicado em {new Date(collection.published_at).toLocaleDateString('pt-BR')}
            </time>
          )}
          <a
            href={`/colecao/${collection.slug}/feed.xml`}
            rel="alternate"
            type="application/rss+xml"
            className="inline-flex items-center gap-1 text-orange-600 hover:underline"
          >
            <Rss className="w-3.5 h-3.5" aria-hidden="true" />
            RSS
          </a>
        </div>
        <CollectionDownloads slug={collection.slug} />
      </header>

      {statements.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Ainda sem declarações nesta coleção.
        </p>
      ) : (
        <StatementGrid statements={statements} />
      )}

      <footer className="mt-10 text-xs text-gray-500 border-t border-gray-200 pt-4">
        <Link href="/colecoes" className="underline hover:text-gray-700">← Todas as coleções</Link>
      </footer>
    </main>
  )
}
