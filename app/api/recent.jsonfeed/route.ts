import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SITE_NAME = 'Registra Brasil'

/**
 * GET /api/recent.jsonfeed — JSON Feed 1.1 of the 30 most recent
 * non-removed statements. Parallel surface to /feed.xml (RSS) and
 * /feed.atom for readers that prefer the JSON Feed spec.
 *
 * Spec: https://www.jsonfeed.org/version/1.1/
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'recent-jsonfeed'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const lim = Math.max(1, Math.min(100, Number(request.nextUrl.searchParams.get('limite')) || 30))

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, created_at, updated_at, verification_status, primary_source_url, politicians!inner(slug, common_name, party, state)')
    .neq('verification_status', 'removed')
    .order('created_at', { ascending: false })
    .limit(lim)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = {
    id: string; slug: string | null; summary: string; full_quote: string | null
    statement_date: string; created_at: string; updated_at: string | null
    verification_status: string; primary_source_url: string | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const rows = (data ?? []) as Row[]

  const feed = {
    version: 'https://jsonfeed.org/version/1.1',
    title: `${SITE_NAME} — Declarações recentes`,
    home_page_url: SITE_URL,
    feed_url: `${SITE_URL}/api/recent.jsonfeed`,
    description: 'As declarações mais recentes registradas no Registra Brasil.',
    language: 'pt-BR',
    items: rows.map((r) => {
      const url = `${SITE_URL}/declaracao/${r.slug ?? r.id}`
      const who = [r.politicians.common_name, r.politicians.party, r.politicians.state]
        .filter(Boolean).join(' · ')
      return {
        id: url,
        url,
        title: r.summary,
        content_text: r.full_quote ?? r.summary,
        date_published: new Date(r.created_at).toISOString(),
        date_modified: r.updated_at ? new Date(r.updated_at).toISOString() : undefined,
        authors: [{ name: r.politicians.common_name, url: `${SITE_URL}/politico/${r.politicians.slug}` }],
        tags: [r.verification_status, r.politicians.party, r.politicians.state].filter(Boolean) as string[],
        external_url: r.primary_source_url ?? undefined,
        _registra_brasil: {
          statement_date: r.statement_date,
          verification_status: r.verification_status,
          politician: {
            slug: r.politicians.slug,
            common_name: r.politicians.common_name,
            party: r.politicians.party,
            state: r.politicians.state,
          },
          byline: who,
        },
      }
    }),
  }

  // ETag keyed on the newest timestamp + row count — so a mirror
  // polling us pays a 304 when no new statement has landed since
  // last poll.
  const newest = rows[0]?.created_at ?? 'empty'
  const etag = `W/"jsonfeed-${rows.length}-${newest.replace(/\D/g, '')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(feed, {
    headers: {
      'Content-Type': 'application/feed+json; charset=utf-8',
      'Cache-Control': 'public, max-age=60, s-maxage=180, stale-while-revalidate=600',
      ETag: etag,
    },
  })
}
