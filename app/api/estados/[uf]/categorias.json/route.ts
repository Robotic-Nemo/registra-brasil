import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Za-z]{2}$/

/**
 * GET /api/estados/:uf/categorias.json — category breakdown for a
 * UF: primary / all tally over non-removed statements by politicians
 * of the UF.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ uf: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'uf-cats'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { uf: raw } = await params
  if (!UF_RE.test(raw)) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }
  const uf = raw.toUpperCase()

  const supabase = getSupabaseServiceClient()
  const { data: scData, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, categories(slug, label_pt, color_hex), statements!inner(verification_status, politicians!inner(state))')
    .eq('statements.politicians.state', uf)
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

  const etag = `W/"uf-cats-${uf}-${rows.length}-${primary.size}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    uf,
    url: `${SITE_URL}/estados/${uf.toLowerCase()}`,
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
