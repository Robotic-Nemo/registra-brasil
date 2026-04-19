import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/historias.json — published editorial stories with slug,
 * title/subtitle, author, reading time, and hero statement id.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('stories') as any)
    .select('slug, title, subtitle, author, reading_time_min, hero_statement_id, cover_image_url, published_at, updated_at')
    .eq('is_published', true)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(200)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = {
    slug: string; title: string; subtitle: string | null
    author: string | null; reading_time_min: number | null
    hero_statement_id: string | null; cover_image_url: string | null
    published_at: string | null; updated_at: string | null
  }
  const rows = (data ?? []) as Row[]

  return NextResponse.json({
    count: rows.length,
    stories: rows.map((r) => ({
      slug: r.slug,
      title: r.title,
      subtitle: r.subtitle,
      author: r.author,
      reading_time_min: r.reading_time_min,
      hero_statement_id: r.hero_statement_id,
      cover_image_url: r.cover_image_url,
      published_at: r.published_at,
      updated_at: r.updated_at,
      url: `${SITE_URL}/historia/${r.slug}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
