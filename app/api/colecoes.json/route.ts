import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/colecoes.json — published editorial collections with slug,
 * titles, cover image, published_at, and counts of statements per
 * collection (via embedded count).
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('collections') as any)
    .select('slug, title, subtitle, description, cover_image_url, published_at, collection_statements(count)')
    .eq('is_published', true)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(200)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = {
    slug: string; title: string; subtitle: string | null; description: string | null
    cover_image_url: string | null; published_at: string | null
    collection_statements: Array<{ count: number }> | { count: number } | null
  }
  const rows = (data ?? []) as Row[]

  return NextResponse.json({
    count: rows.length,
    collections: rows.map((r) => {
      const cs = r.collection_statements
      const statementCount = Array.isArray(cs)
        ? (cs[0]?.count ?? 0)
        : (cs?.count ?? 0)
      return {
        slug: r.slug,
        title: r.title,
        subtitle: r.subtitle,
        description: r.description,
        cover_image_url: r.cover_image_url,
        published_at: r.published_at,
        statement_count: statementCount,
        url: `${SITE_URL}/colecao/${r.slug}`,
        feed_url: `${SITE_URL}/colecao/${r.slug}/feed.xml`,
        export_url: `${SITE_URL}/api/colecao/${r.slug}/export`,
      }
    }),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
