import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'
import { RATING_LABELS } from '@/lib/fact-checks/outlets'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/fact-checks.csv — CSV sibling to fact-checks.json.
 *   ?rating=<id> optional filter
 *   ?limite=1..2000 (padrão 500)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'fc-csv'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const rating = request.nextUrl.searchParams.get('rating') ?? undefined
  const lim = Math.max(1, Math.min(2000, Number(request.nextUrl.searchParams.get('limite')) || 500))

  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('statement_fact_checks') as any)
    .select('id, outlet, outlet_label, url, title, rating, rating_label, published_at, created_at, statements!inner(id, slug, summary, statement_date, politicians(slug, common_name, party, state))')
    .order('created_at', { ascending: false })
    .limit(lim)
  if (rating) q = q.eq('rating', rating)

  const { data, error } = await q
  if (error) return new Response(`error: ${error.message}`, { status: 500 })

  type Row = {
    id: string; outlet: string; outlet_label: string | null; url: string
    title: string | null; rating: string | null; rating_label: string | null
    published_at: string | null; created_at: string
    statements: {
      id: string; slug: string | null; summary: string; statement_date: string
      politicians: { slug: string; common_name: string; party: string | null; state: string | null } | null
    } | null
  }
  const rows = ((data ?? []) as Row[]).filter((r) => r.statements)

  const header = [
    'fact_check_id', 'outlet', 'outlet_label', 'fact_check_url', 'title',
    'rating', 'rating_label', 'published_at',
    'statement_id', 'statement_slug', 'statement_date', 'statement_summary',
    'politician_slug', 'politician_name', 'party', 'state',
    'statement_permalink',
  ]
  const lines = [header.join(',')]
  for (const r of rows) {
    const s = r.statements!
    const p = s.politicians
    lines.push([
      csvEscape(r.id),
      csvEscape(r.outlet),
      csvEscape(r.outlet_label ?? ''),
      csvEscape(r.url),
      csvEscape(r.title ?? ''),
      csvEscape(r.rating ?? ''),
      csvEscape(r.rating_label ?? (r.rating ? RATING_LABELS[r.rating] ?? '' : '')),
      csvEscape(r.published_at ?? ''),
      csvEscape(s.id),
      csvEscape(s.slug ?? ''),
      csvEscape(s.statement_date),
      csvEscape(s.summary),
      csvEscape(p?.slug ?? ''),
      csvEscape(p?.common_name ?? ''),
      csvEscape(p?.party ?? ''),
      csvEscape(p?.state ?? ''),
      csvEscape(`${SITE_URL}/declaracao/${s.slug ?? s.id}`),
    ].join(','))
  }

  return new Response(lines.join('\n') + '\n', {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="fact-checks.csv"',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
