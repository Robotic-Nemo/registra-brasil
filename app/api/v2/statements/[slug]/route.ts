import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { parseFields, buildSelectString, projectFields } from '@/lib/utils/field-selection'
import { parseInclude } from '@/lib/utils/api-filters'
import type { V2StatementInclude, FieldSelectionConfig } from '@/types/api-v2'

export const runtime = 'edge'

const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

const FIELD_CONFIG: FieldSelectionConfig = {
  allowed: [
    'id', 'summary', 'full_quote', 'context', 'verification_status',
    'statement_date', 'primary_source_url', 'primary_source_type',
    'venue', 'event_name', 'slug', 'created_at', 'updated_at',
    'is_featured', 'politician_id', 'severity_score',
  ],
  defaults: [
    'id', 'slug', 'summary', 'full_quote', 'context', 'verification_status',
    'statement_date', 'severity_score', 'primary_source_url',
    'primary_source_type', 'venue', 'event_name', 'created_at', 'updated_at',
  ],
}

/**
 * GET /api/v2/statements/:idOrSlug — detail endpoint for a single
 * statement. Accepts either the canonical UUID or the human slug.
 * Supports `?fields=` and `?include=politician,categories`.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const { allowed, remaining, resetAt } = checkRateLimit(
    getRateLimitKey(request, 'api-v2-statement-detail'),
    { limit: 100, windowMs: 60_000 },
  )
  if (!allowed) {
    return NextResponse.json(
      { error: { code: 'RATE_LIMITED', message: 'Rate limit exceeded' } },
      { status: 429, headers: { 'Retry-After': String(Math.ceil((resetAt - Date.now()) / 1000)) } },
    )
  }

  const { slug } = await params
  const isUuid = UUID_RE.test(slug)
  if (!isUuid && !SLUG_RE.test(slug)) {
    return NextResponse.json(
      { error: { code: 'INVALID_PARAM', message: 'identificador inválido' } },
      { status: 400 },
    )
  }

  const sp = request.nextUrl.searchParams
  const fields = parseFields(sp.get('fields'), FIELD_CONFIG)
  const includes = parseInclude<V2StatementInclude>(sp.get('include'), ['politician', 'categories'])
  const selectStr = buildSelectString(fields, includes.length > 0 ? includes : undefined)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select(selectStr)
    .eq(isUuid ? 'id' : 'slug', slug)
    .neq('verification_status', 'removed')
    .maybeSingle()

  if (error) {
    console.error('[api/v2/statements/:slug] Error:', error)
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500 },
    )
  }
  if (!data) {
    return NextResponse.json(
      { error: { code: 'NOT_FOUND', message: 'Declaração não encontrada' } },
      { status: 404 },
    )
  }

  const projected = projectFields(data as Record<string, unknown>, fields, includes)

  // Weak ETag on updated_at so aggregators polling this route
  // pay bytes only when the record actually changes.
  const updated = (data as { updated_at?: string }).updated_at ?? ''
  const etag = updated ? `W/"v2-stmt-${String((data as { id: string }).id).slice(0, 8)}-${updated.replace(/[^0-9]/g, '').slice(0, 14)}"` : null
  if (etag && request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json(
    { data: projected },
    {
      headers: {
        'Cache-Control': 'public, s-maxage=600, stale-while-revalidate=1800',
        'X-RateLimit-Remaining': String(remaining),
        'X-API-Version': 'v2',
        ...(etag ? { ETag: etag } : {}),
      },
    },
  )
}
