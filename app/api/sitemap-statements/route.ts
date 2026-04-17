import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { NextRequest } from 'next/server'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const PAGE_SIZE = 1000
const MAX_PAGE = 1000

const log = createLogger('api/sitemap-statements')

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

export async function GET(request: NextRequest) {
  const { searchParams } = request.nextUrl
  const rawPage = parseInt(searchParams.get('page') ?? '1', 10)
  const page = Number.isFinite(rawPage) ? Math.min(Math.max(1, rawPage), MAX_PAGE) : 1
  const offset = (page - 1) * PAGE_SIZE

  try {
    const supabase = getSupabaseServiceClient()

    const { data: statements, count } = await supabase
      .from('statements')
      .select('slug, id, updated_at, statement_date', { count: 'exact' })
      .eq('verification_status', 'verified')
      .not('slug', 'is', null)
      .order('statement_date', { ascending: false })
      .range(offset, offset + PAGE_SIZE - 1)

    const total = count ?? 0
    const totalPages = Math.ceil(total / PAGE_SIZE)

    const urls = (statements ?? []).map(
      (s: { slug: string | null; id: string; updated_at: string }) => `  <url>
    <loc>${escapeXml(`${SITE_URL}/declaracao/${s.slug ?? s.id}`)}</loc>
    <lastmod>${new Date(s.updated_at).toISOString().slice(0, 10)}</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>`
    )

    const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <!-- Page ${page} of ${totalPages} | Total: ${total} statements -->
${urls.join('\n')}
</urlset>`

    return new Response(xml, {
      headers: {
        'Content-Type': 'application/xml; charset=utf-8',
        'Cache-Control': 'public, s-maxage=86400, stale-while-revalidate=3600',
        'X-Total-Pages': String(totalPages),
        'X-Total-Count': String(total),
      },
    })
  } catch (err) {
    log.error('sitemap query failed', { err: err instanceof Error ? err.message : String(err) })
    return new Response(
      `<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"></urlset>`,
      {
        status: 200,
        headers: { 'Content-Type': 'application/xml; charset=utf-8', 'Cache-Control': 'no-store' },
      }
    )
  }
}
