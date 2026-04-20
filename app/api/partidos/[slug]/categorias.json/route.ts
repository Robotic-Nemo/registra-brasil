import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/partidos/:slug/categorias.json — category breakdown for
 * a party: counts of non-removed statements by members grouped by
 * primary category, plus an "all" tally that counts secondary tags.
 * Answers "what does this party talk about most?".
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'party-cats'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  if (!/^[a-z0-9%A-Z.-]{1,100}$/.test(slug)) {
    return NextResponse.json({ error: 'partido inválido' }, { status: 400 })
  }
  const party = decodeURIComponent(slug).toUpperCase()

  const supabase = getSupabaseServiceClient()

  const { data: scData, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, categories(slug, label_pt, color_hex), statements!inner(verification_status, politicians!inner(party))')
    .eq('statements.politicians.party', party)
    .neq('statements.verification_status', 'removed')
    .limit(30000)
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }

  type Row = {
    is_primary: boolean
    categories: { slug: string; label_pt: string; color_hex: string } | null
  }
  const rows = (scData ?? []) as Row[]

  const primary = new Map<string, { slug: string; label: string; color: string; count: number }>()
  const all = new Map<string, { slug: string; label: string; color: string; count: number }>()
  for (const r of rows) {
    if (!r.categories) continue
    const c = r.categories
    if (r.is_primary) {
      const ex = primary.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
      ex.count++; primary.set(c.slug, ex)
    }
    const exa = all.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
    exa.count++; all.set(c.slug, exa)
  }
  const totalPrimary = [...primary.values()].reduce((s, c) => s + c.count, 0)
  const sorted = (m: typeof primary) => [...m.values()].sort((a, b) => b.count - a.count)

  const etag = `W/"pt-cats-${party}-${rows.length}-${primary.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    party,
    url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
    total_primary_statements: totalPrimary,
    primary: sorted(primary),
    all: sorted(all),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
