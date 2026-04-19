import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getPoliticianCompareData, computeComparisonSummary } from '@/lib/supabase/queries/compare'
import { buildCategoryComparison } from '@/lib/utils/compare'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/comparar.json?a=<id|slug>&b=<id|slug> — JSON version of the
 * /comparar/resultado page. Accepts either politician UUIDs or slugs
 * (slug → id resolve transparent). Returns summary counts, per-category
 * comparison rows, monthly series for both politicians, and the same
 * "category overlap" stats produced by computeComparisonSummary.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'comparar-json'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const a = request.nextUrl.searchParams.get('a')?.trim()
  const b = request.nextUrl.searchParams.get('b')?.trim()
  if (!a || !b) {
    return NextResponse.json({ error: 'missing_a_or_b' }, { status: 400 })
  }
  if (a === b) {
    return NextResponse.json({ error: 'same_politician' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()

  // Resolve slugs → ids if needed (UUID regex quick test).
  const isUuid = (v: string) => /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(v)
  async function resolve(v: string): Promise<string | null> {
    if (isUuid(v)) return v
    const { data } = await (supabase.from('politicians') as any)
      .select('id').eq('slug', v).maybeSingle()
    return (data as { id: string } | null)?.id ?? null
  }
  const [idA, idB] = await Promise.all([resolve(a), resolve(b)])
  if (!idA || !idB) {
    return NextResponse.json({ error: 'not_found', a: idA ? null : a, b: idB ? null : b }, { status: 404 })
  }

  const [dataA, dataB] = await Promise.all([
    getPoliticianCompareData(supabase, idA),
    getPoliticianCompareData(supabase, idB),
  ])
  if (!dataA || !dataB) {
    return NextResponse.json({ error: 'compare_data_missing' }, { status: 404 })
  }

  const categories = buildCategoryComparison(dataA, dataB)
  const summary = computeComparisonSummary(dataA, dataB)

  const toPublic = (d: typeof dataA) => ({
    id: d.id,
    slug: d.slug,
    name: d.name,
    party: d.party,
    state: d.state,
    photo_url: d.photo_url,
    total_statements: d.totalStatements,
    categories: d.categories,
    monthly: d.monthlyData,
    permalink: `${SITE_URL}/politico/${d.slug}`,
  })

  return NextResponse.json({
    a: toPublic(dataA),
    b: toPublic(dataB),
    categories,
    summary,
    permalink: `${SITE_URL}/comparar/resultado?a=${idA}&b=${idB}`,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=7200',
    },
  })
}
