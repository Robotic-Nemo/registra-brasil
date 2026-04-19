import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

interface Params { params: Promise<{ slug: string }> }

/**
 * GET /api/politico/[slug]/categorias.json — per-politician category
 * breakdown: counts of verified statements grouped by their primary
 * category, sorted descending. Answers "what does this person talk
 * about most?" without re-running the full scorecard.
 */
export async function GET(request: NextRequest, { params }: Params) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-cats-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: polRow } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state')
    .eq('slug', slug).maybeSingle()
  if (!polRow) {
    return NextResponse.json({ error: 'not_found', slug }, { status: 404 })
  }
  const pol = polRow as { id: string; slug: string; common_name: string; party: string | null; state: string | null }

  const { data: scData, error } = await (supabase.from('statement_categories') as any)
    .select('is_primary, categories(slug, label_pt, color_hex), statements!inner(politician_id, verification_status)')
    .eq('statements.politician_id', pol.id)
    .neq('statements.verification_status', 'removed')
    .limit(20000)
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
      ex.count++
      primary.set(c.slug, ex)
    }
    const exa = all.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
    exa.count++
    all.set(c.slug, exa)
  }

  const totalPrimary = [...primary.values()].reduce((s, c) => s + c.count, 0)
  const sorted = (m: typeof primary) => [...m.values()].sort((a, b) => b.count - a.count)

  return NextResponse.json({
    politician: pol,
    total_primary_statements: totalPrimary,
    primary: sorted(primary),
    all: sorted(all),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=7200',
    },
  })
}
