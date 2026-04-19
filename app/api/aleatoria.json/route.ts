import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/aleatoria.json — pick one random verified (or disputed, if
 * `?inclui_contestadas=1`) statement and return its full metadata as
 * JSON. Same "moderate pool + uniform pick" trick as /aleatoria, so
 * no TABLESAMPLE cost.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'aleatoria-json'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const includeDisputed = request.nextUrl.searchParams.get('inclui_contestadas') === '1'
  const statuses = includeDisputed ? ['verified', 'disputed'] : ['verified']

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, verification_status, severity_score, politicians!inner(slug, common_name, party, state)')
    .in('verification_status', statuses)
    .order('created_at', { ascending: false })
    .limit(120)

  type Row = {
    id: string; slug: string | null; summary: string; statement_date: string
    verification_status: string; severity_score: number | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }
  const rows = (data ?? []) as Row[]
  if (rows.length === 0) {
    return NextResponse.json({ error: 'empty' }, { status: 404 })
  }
  const pick = rows[Math.floor(Math.random() * rows.length)]

  return NextResponse.json({
    id: pick.id,
    slug: pick.slug,
    summary: pick.summary,
    statement_date: pick.statement_date,
    verification_status: pick.verification_status,
    severity_score: pick.severity_score,
    permalink: `${SITE_URL}/declaracao/${pick.slug ?? pick.id}`,
    politician: pick.politicians,
    pool_size: rows.length,
    generated_at: new Date().toISOString(),
  }, {
    headers: { 'Cache-Control': 'no-store' },
  })
}
