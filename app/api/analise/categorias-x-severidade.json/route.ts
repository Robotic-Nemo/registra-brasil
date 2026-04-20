import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildScopeSeverityMatrix } from '@/lib/stats/scope-severity-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/analise/categorias-x-severidade.json — top-N primary
 * categories × severity level (1..5) matrix. Primary tags only.
 *   ?categorias=5..30 (default 15)
 *   ?meses=6..60 (default 24)
 *   ?normalizar=1
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'analise-cs-json'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const catLimit = Math.max(5, Math.min(30, Number(request.nextUrl.searchParams.get('categorias')) || 15))
  const meses = Math.max(6, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))
  const normalize = request.nextUrl.searchParams.get('normalizar') === '1'

  const now = new Date()
  const startMs = Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1)
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statement_categories') as any)
    .select('category_id, is_primary, statements!inner(severity_score, statement_date, verification_status)')
    .eq('is_primary', true)
    .neq('statements.verification_status', 'removed')
    .gte('statements.statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Pivot = {
    category_id: string | null
    statements: { severity_score: number | null } | null
  }
  const { rows, total, max } = buildScopeSeverityMatrix(
    (data ?? []) as Pivot[],
    (r) => r.category_id ?? null,
    (r) => r.statements?.severity_score ?? null,
    catLimit,
  )

  const topIds = rows.map((r) => r.key)
  const { data: cats } = topIds.length
    ? await (supabase.from('categories') as any)
        .select('id, slug, label_pt, color_hex')
        .in('id', topIds)
    : { data: [] }
  type Cat = { id: string; slug: string; label_pt: string | null; color_hex: string | null }
  const byId = new Map<string, Cat>(((cats ?? []) as Cat[]).map((c) => [c.id, c]))

  const shaped = rows.map((r) => {
    const c = byId.get(r.key)
    const levels = r.levels
    const pct = normalize && r.total > 0
      ? {
          1: +(levels[1] / r.total * 100).toFixed(1),
          2: +(levels[2] / r.total * 100).toFixed(1),
          3: +(levels[3] / r.total * 100).toFixed(1),
          4: +(levels[4] / r.total * 100).toFixed(1),
          5: +(levels[5] / r.total * 100).toFixed(1),
        }
      : null
    return {
      category_id: r.key,
      slug: c?.slug ?? null,
      label: c?.label_pt ?? null,
      color: c?.color_hex ?? null,
      total: r.total,
      levels,
      pct,
      avg_severity: r.avg_severity,
      url: c ? `${SITE_URL}/categorias/${c.slug}` : null,
    }
  })

  const etag = `W/"cs-${catLimit}-${meses}-${total}-${normalize ? 1 : 0}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    categorias: catLimit, meses, normalize, total, max, rows: shaped,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
