import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildTransparencyReport } from '@/lib/utils/transparency'

export const runtime = 'nodejs'
export const revalidate = 1800

export async function GET(_request: NextRequest) {
  const supabase = getSupabaseServiceClient()
  const report = await buildTransparencyReport(supabase)

  const body = JSON.stringify(
    {
      license: 'CC BY 4.0 — attribute "Registra Brasil"',
      source_url: 'https://registrabrasil.com.br',
      ...report,
    },
    null,
    2,
  )

  return new Response(body, {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Cache-Control': 'public, s-maxage=1800, stale-while-revalidate=3600',
      'X-Robots-Tag': 'noindex',
    },
  })
}
