import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { listContradictionsForPolitician } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

/**
 * GET /api/politico/:slug/contradictions.csv — CSV export of every
 * published contradiction pair for a politician. One row per pair
 * with both statements inlined side-by-side, so researchers can
 * plot coincidence matrices without a second fetch.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'pol-contradictions-csv'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) return new Response('político não encontrado', { status: 404 })

  const pairs = await listContradictionsForPolitician(p.id, 500)

  const header = [
    'pair_id', 'politician_slug', 'politician_name',
    'headline', 'editor_note', 'severity',
    'low_id', 'low_slug', 'low_date', 'low_summary', 'low_url',
    'high_id', 'high_slug', 'high_date', 'high_summary', 'high_url',
    'created_at', 'updated_at',
  ]
  const lines = [header.join(',')]
  for (const c of pairs) {
    const lo = c.statement_low
    const hi = c.statement_high
    lines.push([
      csvEscape(c.id),
      csvEscape(p.slug),
      csvEscape(p.common_name),
      csvEscape(c.headline),
      csvEscape(c.editor_note ?? ''),
      csvEscape(c.severity ?? ''),
      csvEscape(lo.id),
      csvEscape(lo.slug ?? ''),
      csvEscape(lo.statement_date),
      csvEscape(lo.summary),
      csvEscape(`${SITE_URL}/declaracao/${lo.slug ?? lo.id}`),
      csvEscape(hi.id),
      csvEscape(hi.slug ?? ''),
      csvEscape(hi.statement_date),
      csvEscape(hi.summary),
      csvEscape(`${SITE_URL}/declaracao/${hi.slug ?? hi.id}`),
      csvEscape(c.created_at),
      csvEscape(c.updated_at),
    ].join(','))
  }

  const body = lines.join('\n') + '\n'
  return new Response(body, {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="contradicoes-${p.slug}.csv"`,
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
