import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { csvEscape } from '@/lib/export/statement-formats'

export const runtime = 'nodejs'
export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/categorias.csv — CSV directory of editorial categories.
 * Sibling to /api/categorias.json.
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'categorias-csv'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('categories') as any)
    .select('slug, label_pt, label_en, color_hex, description, severity, sort_order')
    .order('sort_order', { ascending: true })
    .order('label_pt', { ascending: true })

  type Row = {
    slug: string; label_pt: string; label_en: string | null
    color_hex: string | null; description: string | null
    severity: number | null; sort_order: number | null
  }
  const rows = (data ?? []) as Row[]

  const header = ['slug', 'label_pt', 'label_en', 'color_hex', 'severity_tier', 'sort_order', 'description', 'url']
  const lines = [header.join(',')]
  for (const r of rows) {
    lines.push([
      csvEscape(r.slug),
      csvEscape(r.label_pt),
      csvEscape(r.label_en ?? ''),
      csvEscape(r.color_hex ?? ''),
      csvEscape(r.severity ?? ''),
      csvEscape(r.sort_order ?? ''),
      csvEscape(r.description ?? ''),
      csvEscape(`${SITE_URL}/categorias/${r.slug}`),
    ].join(','))
  }

  return new Response(lines.join('\n') + '\n', {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': 'attachment; filename="categorias.csv"',
      'Cache-Control': 'public, max-age=3600, s-maxage=86400, stale-while-revalidate=86400',
    },
  })
}
