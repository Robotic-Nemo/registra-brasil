import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/timeline.json — scoped chronological feed. One of the
 * scope parameters must be set; each one filters the underlying
 * statements query differently:
 *   ?categoria=<slug>  join through statement_categories
 *   ?partido=<slug>    politicians.party eq, embedded !inner
 *   ?estado=<uf>       politicians.state eq, embedded !inner
 *   (omit all three)   global feed (same shape as /api/linha-do-tempo.json
 *                       but flat, no month grouping)
 * ?limite=N (1..200, default 50).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'timeline-scoped'), {
    limit: 60, windowMs: 60_000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: { code: 'RATE_LIMITED' } }, { status: 429 })
  }

  const sp = request.nextUrl.searchParams
  const categoria = sp.get('categoria')?.trim() || null
  const partido = sp.get('partido')?.trim() || null
  const estado = sp.get('estado')?.trim()?.toUpperCase() || null
  const limit = Math.max(1, Math.min(200, Number(sp.get('limite')) || 50))

  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, politicians!inner(slug, common_name, party, state), statement_categories(is_primary, categories(slug, label_pt, color_hex))')
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(limit)

  if (partido) q = q.eq('politicians.party', partido.toUpperCase())
  if (estado) q = q.eq('politicians.state', estado)
  if (categoria) {
    // Resolve category slug → id, then filter via statement_categories
    const { data: cat } = await (supabase.from('categories') as any)
      .select('id').eq('slug', categoria).maybeSingle()
    if (!cat) {
      return NextResponse.json({ error: 'category_not_found', categoria }, { status: 404 })
    }
    const { data: scRows } = await (supabase.from('statement_categories') as any)
      .select('statement_id').eq('category_id', (cat as { id: string }).id).limit(limit * 3)
    const stmtIds = [...new Set(((scRows ?? []) as Array<{ statement_id: string }>).map((r) => r.statement_id))]
    if (stmtIds.length === 0) {
      return NextResponse.json({ scope: { categoria }, count: 0, events: [], generated_at: new Date().toISOString() })
    }
    q = q.in('id', stmtIds)
  }

  const { data, error } = await q
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  type Row = {
    id: string; slug: string | null; summary: string; statement_date: string
    severity_score: number | null; verification_status: string
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
    statement_categories: Array<{ is_primary: boolean; categories: { slug: string; label_pt: string; color_hex: string } | null }>
  }
  const rows = (data ?? []) as Row[]

  return NextResponse.json({
    scope: { categoria, partido, estado },
    count: rows.length,
    limit,
    events: rows.map((r) => {
      const primary = r.statement_categories.find((sc) => sc.is_primary && sc.categories)?.categories ?? null
      return {
        id: r.id,
        slug: r.slug,
        date: r.statement_date,
        summary: r.summary,
        severity_score: r.severity_score,
        verification_status: r.verification_status,
        permalink: `${SITE_URL}/declaracao/${r.slug ?? r.id}`,
        politician: r.politicians,
        primary_category: primary ? { slug: primary.slug, label: primary.label_pt, color: primary.color_hex } : null,
      }
    }),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=300, s-maxage=600, stale-while-revalidate=3600',
    },
  })
}
