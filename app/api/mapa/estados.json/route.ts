import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { buildScopeSeverityMatrix } from '@/lib/stats/scope-severity-matrix'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const ALL_UFS = [
  'AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT',
  'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO',
]

/**
 * GET /api/mapa/estados.json — ready-to-overlay per-UF stats for
 * choropleth maps. All 27 UFs always present (zero-filled), ordered
 * alphabetically. Per UF: total, verified, disputed, severity avg
 * and levels (1..5).
 *   ?meses=3..60 (default 24)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'mapa-uf'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const meses = Math.max(3, Math.min(60, Number(request.nextUrl.searchParams.get('meses')) || 24))
  const now = new Date()
  const startMs = Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (meses - 1), 1)
  const startStr = new Date(startMs).toISOString().slice(0, 10)

  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('statements') as any)
    .select('severity_score, verification_status, politicians!inner(state)')
    .neq('verification_status', 'removed')
    .gte('statement_date', startStr)
    .limit(60000)
  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  type Row = { severity_score: number | null; verification_status: string; politicians: { state: string | null } | null }
  const rows = (data ?? []) as Row[]

  // Reuse the top-N scope aggregator with limit=27 to get
  // levels + avg_severity per UF, then fill missing UFs with zeros.
  const { rows: matrix } = buildScopeSeverityMatrix(
    rows,
    (r) => r.politicians?.state ?? null,
    (r) => r.severity_score,
    27,
  )
  const byUf = new Map(matrix.map((m) => [m.key, m]))

  // Status split needs a second pass (scope-severity helper doesn't
  // track status) — cheap in-memory loop over already-fetched rows.
  const statusByUf = new Map<string, { verified: number; disputed: number; unverified: number }>()
  for (const r of rows) {
    const uf = r.politicians?.state
    if (!uf) continue
    let s = statusByUf.get(uf)
    if (!s) { s = { verified: 0, disputed: 0, unverified: 0 }; statusByUf.set(uf, s) }
    if (r.verification_status === 'verified') s.verified++
    else if (r.verification_status === 'disputed') s.disputed++
    else if (r.verification_status === 'unverified') s.unverified++
  }

  const features = ALL_UFS.map((uf) => {
    const m = byUf.get(uf)
    const s = statusByUf.get(uf) ?? { verified: 0, disputed: 0, unverified: 0 }
    return {
      uf,
      total: m?.total ?? 0,
      verified: s.verified,
      disputed: s.disputed,
      unverified: s.unverified,
      levels: m?.levels ?? { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 },
      avg_severity: m?.avg_severity ?? null,
      url: `${SITE_URL}/estados/${uf}`,
    }
  })

  const maxTotal = features.reduce((m, f) => Math.max(m, f.total), 0)
  const grandTotal = features.reduce((s, f) => s + f.total, 0)
  const etag = `W/"mapa-uf-${meses}-${grandTotal}-${maxTotal}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    meses,
    total: grandTotal,
    max_total: maxTotal,
    features,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
