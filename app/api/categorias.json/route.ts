import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/categorias.json — directory of editorial categories with
 * slug, label, color, description. Rarely changes — cached a full day
 * at the CDN.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('categories') as any)
    .select('slug, label_pt, label_en, color_hex, description, severity, sort_order')
    .order('sort_order', { ascending: true })
    .order('label_pt', { ascending: true })
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  type Row = {
    slug: string; label_pt: string; label_en: string | null;
    color_hex: string | null; description: string | null;
    severity: number | null; sort_order: number | null
  }
  const rows = (data ?? []) as Row[]
  return NextResponse.json({
    count: rows.length,
    categories: rows.map((r) => ({
      slug: r.slug,
      label_pt: r.label_pt,
      label_en: r.label_en,
      color: r.color_hex,
      description: r.description,
      severity_tier: r.severity,
      sort_order: r.sort_order,
      url: `${SITE_URL}/categorias/${r.slug}`,
    })),
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=3600, s-maxage=86400, stale-while-revalidate=172800',
    },
  })
}
