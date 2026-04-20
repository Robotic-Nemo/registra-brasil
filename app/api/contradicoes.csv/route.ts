import { NextRequest } from 'next/server'
import { listPublishedContradictions } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/contradicoes.csv — bulk CSV dump of every published
 * contradiction pair across all politicians. One row per pair
 * with both statements inlined side-by-side. Capped at 2000.
 *   ?limite=1..2000 (padrão 500)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'contra-csv'), {
    limit: 20, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const lim = Math.max(1, Math.min(2000, Number(request.nextUrl.searchParams.get('limite')) || 500))
  const pairs = await listPublishedContradictions(lim)

  const header = [
    'pair_id', 'headline', 'editor_note', 'severity',
    'politician_slug', 'politician_name', 'party', 'state',
    'low_id', 'low_slug', 'low_date', 'low_summary', 'low_source', 'low_url',
    'high_id', 'high_slug', 'high_date', 'high_summary', 'high_source', 'high_url',
    'created_at', 'updated_at', 'pair_url',
  ]
  const lines = [header.join(',')]
  for (const c of pairs) {
    const p = c.politician
    const lo = c.statement_low
    const hi = c.statement_high
    lines.push([
      csvEscape(c.id),
      csvEscape(c.headline),
      csvEscape(c.editor_note ?? ''),
      csvEscape(c.severity ?? ''),
      csvEscape(p.slug),
      csvEscape(p.common_name),
      csvEscape(p.party ?? ''),
      csvEscape(p.state ?? ''),
      csvEscape(lo.id),
      csvEscape(lo.slug ?? ''),
      csvEscape(lo.statement_date),
      csvEscape(lo.summary),
      csvEscape(lo.primary_source_url ?? ''),
      csvEscape(`${SITE_URL}/declaracao/${lo.slug ?? lo.id}`),
      csvEscape(hi.id),
      csvEscape(hi.slug ?? ''),
      csvEscape(hi.statement_date),
      csvEscape(hi.summary),
      csvEscape(hi.primary_source_url ?? ''),
      csvEscape(`${SITE_URL}/declaracao/${hi.slug ?? hi.id}`),
      csvEscape(c.created_at),
      csvEscape(c.updated_at),
      csvEscape(`${SITE_URL}/contradicoes/${c.id}`),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="contradicoes.csv"',
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
