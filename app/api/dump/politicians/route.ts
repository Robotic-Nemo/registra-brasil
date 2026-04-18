import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const revalidate = 3600

export async function GET(_request: NextRequest) {
  const supabase = getSupabaseServiceClient()
  const { data, error } = await (supabase.from('politicians') as any)
    .select('id, slug, full_name, common_name, party, state, role, photo_url, photo_source_url, photo_license, tse_id, camara_id, senado_id, wikipedia_url, is_active, updated_at')
    .eq('is_active', true)
    .order('common_name')

  if (error) {
    return new Response(JSON.stringify({ error: 'Dump failed' }), { status: 500, headers: { 'Content-Type': 'application/json' } })
  }

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
      'Content-Disposition': `inline; filename="registra-brasil-politicians-${new Date().toISOString().slice(0, 10)}.json"`,
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400, max-age=86400',
      'X-Robots-Tag': 'noindex',
    },
  })
}
