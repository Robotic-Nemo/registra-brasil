import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildCompareEntities, compareStartStr } from '@/lib/stats/compare-scope'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UF_RE = /^[A-Z]{2}$/

/**
 * GET /api/comparar/estados.json?ufs=SP,RJ,MG — dense compare for
 * 2..6 UFs (totals, status, severity, monthly series).
 *   ?meses=3..24 (default 12)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'compare-uf'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const raw = (request.nextUrl.searchParams.get('ufs') ?? '').trim()
  if (!raw) return NextResponse.json({ error: 'missing_ufs' }, { status: 400 })
  const ufs = [...new Set(raw.split(',').map((s) => s.trim().toUpperCase()).filter(Boolean))]
  if (ufs.length < 2 || ufs.length > 6) {
    return NextResponse.json({ error: 'ufs_must_be_2_to_6' }, { status: 400 })
  }
  if (!ufs.every((u) => UF_RE.test(u))) {
    return NextResponse.json({ error: 'UF inválida' }, { status: 400 })
  }

  const meses = Math.max(3, Math.min(24, Number(request.nextUrl.searchParams.get('meses')) || 12))
  const startStr = compareStartStr(meses)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('statement_date, severity_score, verification_status, politicians!inner(state)')
    .in('politicians.state', ufs)
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { statement_date: string; severity_score: number | null; verification_status: string; politicians: { state: string | null } | null }
  const mapped = ((data ?? []) as Row[])
    .filter((r) => r.politicians?.state)
    .map((r) => ({
      key: r.politicians!.state as string,
      statement_date: r.statement_date,
      severity_score: r.severity_score,
      verification_status: r.verification_status,
    }))

  const entities = buildCompareEntities(mapped, ufs, meses).map((e) => ({
    ...e,
    uf: e.key,
    url: `${SITE_URL}/estados/${e.key}`,
  }))

  const total = entities.reduce((s, e) => s + e.total, 0)
  const etag = `W/"cmp-uf-${ufs.join('.')}-${meses}-${total}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    scope: 'estados',
    meses,
    entities,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
