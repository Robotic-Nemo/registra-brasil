import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { parseInclude } from '@/lib/utils/api-filters'
import type { V2CategoryInclude } from '@/types/api-v2'

export const runtime = 'edge'

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/v2/categories/:slug — v2 detail endpoint for one
 * editorial category. Complements the v2 list. Supports
 * `?include=statement_count,children`.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { allowed, remaining, resetAt } = checkRateLimit(
    getRateLimitKey(request, 'api-v2-category-detail'),
    { limit: 100, windowMs: 60_000 },
  )
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } },
    )
  }

  const { slug } = await params
  if (!SLUG_RE.test(slug)) {
    return NextResponse.json(
      { error: { code: 'INVALID_PARAM', message: 'slug inválido' } },
      { status: 400 },
    )
  }

  const sp = request.nextUrl.searchParams
  const includes = parseInclude<V2CategoryInclude>(sp.get('include'), ['statement_count', 'children'])

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, label_en, description, color_hex, severity, sort_order, parent_id, created_at, updated_at')
    .eq('slug', slug)
    .maybeSingle()

  if (error) {
    console.error('[api/v2/categories/:slug] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 },
    )
  }
  if (!data) {
    return NextResponse.json(
      { error: { code: 'NOT_FOUND', message: 'Categoria não encontrada' } },
      { status: 404 },
    )
  }

  const cat = data as Record<string, unknown>
  const enriched: Record<string, unknown> = { ...cat }

  if (includes.includes('statement_count')) {
    // Count only primary-tagged non-removed statements so the
    // number matches the canonical category-page listing.
    const { count } = await (supabase.from('statement_categories') as any)
      .select('statement_id, statements!inner(verification_status)', { count: 'exact', head: true })
      .eq('category_id', cat.id)
      .eq('is_primary', true)
      .neq('statements.verification_status', 'removed')
    enriched.statement_count = count ?? 0
  }

  if (includes.includes('children')) {
    const { data: kids } = await (supabase.from('categories') as any)
      .select('id, slug, label_pt, color_hex, severity, sort_order')
      .eq('parent_id', cat.id)
      .order('sort_order', { ascending: true })
      .order('label_pt', { ascending: true })
    enriched.children = (kids ?? []) as Array<Record<string, unknown>>
  }

  return NextResponse.json(
    { data: enriched },
    {
      headers: {
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400',
        'X-RateLimit-Remaining': String(remaining),
        'X-API-Version': 'v2',
      },
    },
  )
}
