import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 86400

export async function GET(_request: NextRequest) {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, description_pt, color_hex, severity_weight, sort_order')
    .order('sort_order')

  const body = JSON.stringify({
    license: 'CC BY 4.0 — attribute "Registra Brasil"',
    source_url: 'https://registrabrasil.com.br',
    generated_at: new Date().toISOString(),
    total: (data ?? []).length,
    data,
  })

  return new Response(body, {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Content-Disposition': `inline; filename="registra-brasil-categories-${new Date().toISOString().slice(0, 10)}.json"`,
      'Cache-Control': 'public, s-maxage=86400, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
    },
  })
}
