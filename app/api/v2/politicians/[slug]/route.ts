import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { parseFields } from '@/lib/utils/field-selection'
import { parseInclude } from '@/lib/utils/api-filters'
import type { V2PoliticianInclude, FieldSelectionConfig } from '@/types/api-v2'

export const runtime = 'edge'

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

const FIELD_CONFIG: FieldSelectionConfig = {
  allowed: [
    'id', 'slug', 'full_name', 'common_name', 'party', 'state',
    'role', 'photo_url', 'is_active', 'tse_id', 'camara_id',
    'senado_id', 'wikipedia_url', 'created_at', 'updated_at',
  ],
  defaults: [
    'id', 'slug', 'common_name', 'full_name', 'party', 'state',
    'role', 'photo_url', 'is_active', 'wikipedia_url',
    'created_at', 'updated_at',
  ],
}

/**
 * GET /api/v2/politicians/:slug — detail endpoint for one
 * politician. Supports `?fields` selection and
 * `?include=statement_count,categories` for opt-in relations.
 * Complements the list endpoint at /api/v2/politicians.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { allowed, remaining, resetAt } = checkRateLimit(
    getRateLimitKey(request, 'api-v2-politician-detail'),
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
  const fields = parseFields(sp.get('fields'), FIELD_CONFIG)
  const includes = parseInclude<V2PoliticianInclude>(sp.get('include'), ['statement_count', 'categories'])

  const fieldSet = new Set(fields)
  fieldSet.add('id')
  fieldSet.add('slug')
  const selectStr = Array.from(fieldSet).join(', ')

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('politicians') as any)
    .select(selectStr)
    .eq('slug', slug)
    .maybeSingle()

  if (error) {
    console.error('[api/v2/politicians/:slug] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 },
    )
  }
  if (!data) {
    return NextResponse.json(
      { error: { code: 'NOT_FOUND', message: 'Político não encontrado' } },
      { status: 404 },
    )
  }

  const pol = data as Record<string, unknown>
  const enriched: Record<string, unknown> = { ...pol }

  // Include: statement_count — total verified + disputed.
  if (includes.includes('statement_count')) {
    const { data: statusRows } = await (supabase.from('statements') as any)
      .select('verification_status')
      .eq('politician_id', pol['id'])
      .neq('verification_status', 'removed')
      .limit(20000)
    const counts = { verified: 0, disputed: 0, unverified: 0, total: 0 }
    for (const r of ((statusRows ?? []) as Array<{ verification_status: string }>)) {
      counts.total++
      if (r.verification_status === 'verified') counts.verified++
      else if (r.verification_status === 'disputed') counts.disputed++
      else counts.unverified++
    }
    enriched.statement_count = counts
  }

  // Include: categories — primary category breakdown (top 10).
  if (includes.includes('categories')) {
    const { data: scRows } = await (supabase.from('statement_categories') as any)
      .select('is_primary, categories(slug, label_pt, color_hex), statements!inner(politician_id, verification_status)')
      .eq('statements.politician_id', pol['id'])
      .eq('is_primary', true)
      .neq('statements.verification_status', 'removed')
      .limit(5000)
    type Row = {
      is_primary: boolean
      categories: { slug: string; label_pt: string; color_hex: string } | null
    }
    const tally = new Map<string, { slug: string; label: string; color: string; count: number }>()
    for (const r of ((scRows ?? []) as Row[])) {
      const c = r.categories
      if (!c) continue
      const e = tally.get(c.slug) ?? { slug: c.slug, label: c.label_pt, color: c.color_hex, count: 0 }
      e.count++
      tally.set(c.slug, e)
    }
    enriched.categories = [...tally.values()].sort((a, b) => b.count - a.count).slice(0, 10)
  }

  return NextResponse.json(
    { data: enriched },
    {
      headers: {
        'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=1800',
        'X-RateLimit-Remaining': String(remaining),
        'X-API-Version': 'v2',
      },
    },
  )
}
