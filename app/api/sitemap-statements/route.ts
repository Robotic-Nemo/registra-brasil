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

    // Use 'estimated' count — comes from Postgres table stats, not
    // a full index scan. For a sitemap we only need the total
    // accurate within a few percent to set the right number of
    // pages; crawlers don't care about exactness. Previously
    // 'exact' ran a full aggregate on every page of every
    // crawler run — multi-second on a large table.
    const { data: statements, count } = await supabase
      .from('statements')
      .select('slug, id, updated_at, statement_date', { count: 'estimated' })
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
        // SWR shorter than s-maxage is a footgun — stale entries bypass
// the background refresh and hit the DB cold. Sitemap is the hot
// path for crawlers, so widen SWR well past s-maxage.
'Cache-Control': 'public, s-maxage=86400, stale-while-revalidate=604800',
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
