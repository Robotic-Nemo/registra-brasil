import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { RATING_LABELS } from '@/lib/fact-checks/outlets'

export const runtime = 'nodejs'
export const revalidate = 900

/**
 * GET /api/declaracao/[id]/fact-checks.json — external fact-checks
 * indexed for one declaration. Lookup by UUID or slug. Weak ETag.
 */
interface Params { params: Promise<{ id: string }> }

export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'stmt-fc'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { id: raw } = await params
  const isUuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(raw)
  const supabase = getSupabaseServiceClient()

  const { data: stmt } = isUuid
    ? await (supabase.from('statements') as any).select('id, slug').eq('id', raw).maybeSingle()
    : await (supabase.from('statements') as any).select('id, slug').eq('slug', raw).maybeSingle()
  if (!stmt) {
    return NextResponse.json({ error: 'not_found', id: raw }, { status: 404 })
  }
  const statementId = (stmt as { id: string }).id
  const statementSlug = (stmt as { slug: string | null }).slug

  const { data, error } = await (supabase.from('statement_fact_checks') as any)
    .select('id, outlet, outlet_label, url, title, rating, rating_label, published_at, created_at')
    .eq('statement_id', statementId)
    .order('published_at', { ascending: false, nullsFirst: false })
    .limit(100)

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  type Fc = {
    id: string; outlet: string; outlet_label: string | null; url: string
    title: string | null; rating: string | null; rating_label: string | null
    published_at: string | null; created_at: string
  }
  const fcs = (data ?? []) as Fc[]

  const latest = fcs.length ? (fcs[0].published_at ?? fcs[0].created_at) : '0'
  const etag = `W/"sfc-${statementId.slice(0, 8)}-${fcs.length}-${latest.replace(/[^0-9]/g, '').slice(0, 14)}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    statement_id: statementId,
    statement_slug: statementSlug,
    total: fcs.length,
    fact_checks: fcs.map((r) => ({
      id: r.id,
      outlet: r.outlet,
      outlet_label: r.outlet_label,
      title: r.title,
      url: r.url,
      rating: r.rating,
      rating_label: r.rating_label ?? (r.rating ? RATING_LABELS[r.rating] : null),
      published_at: r.published_at,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=600, s-maxage=1800, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
