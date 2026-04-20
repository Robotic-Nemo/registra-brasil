import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

function esc(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

/**
 * GET /sitemap-news.xml — Google News sitemap. Includes only
 * verified statements whose `created_at` is within the last 2
 * days (Google News indexing window). Separate from the main
 * sitemap so the News bot doesn't have to wade through 2000+
 * general URLs.
 *
 * Spec: https://developers.google.com/search/docs/crawling-indexing/sitemaps/news-sitemap
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'sitemap-news'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const twoDaysAgo = new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString()
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, created_at, politicians!inner(common_name)')
    .eq('verification_status', 'verified')
    .gte('created_at', twoDaysAgo)
    .order('created_at', { ascending: false })
    .limit(1000)

  if (error) return new Response(`error: ${error.message}`, { status: 500 })

  type Row = {
    id: string; slug: string | null; summary: string
    statement_date: string; created_at: string
    politicians: { common_name: string }
  }
  const rows = (data ?? []) as Row[]

  const items = rows.map((r) => {
    const loc = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
    const title = `${r.politicians.common_name}: ${r.summary}`.slice(0, 250)
    return [
      '  <url>',
      `    <loc>${esc(loc)}</loc>`,
      '    <news:news>',
      '      <news:publication>',
      `        <news:name>${esc(SITE_NAME)}</news:name>`,
      '        <news:language>pt</news:language>',
      '      </news:publication>',
      `      <news:publication_date>${esc(r.created_at)}</news:publication_date>`,
      `      <news:title>${esc(title)}</news:title>`,
      '    </news:news>',
      '  </url>',
    ].join('\n')
  })

  const xml = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<urlset',
    '  xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"',
    '  xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">',
    ...items,
    '</urlset>',
  ].join('\n')

  const etag = `W/"sitemap-news-${rows.length}-${(rows[0]?.created_at ?? 'empty').replace(/\D/g, '')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(xml, {
    headers: {
      'Content-Type': 'application/xml; charset=utf-8',
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=1800',
      ETag: etag,
    },
  })
}
