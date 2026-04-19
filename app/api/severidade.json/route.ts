import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SEVERITIES } from '@/lib/severity/labels'

export const runtime = 'nodejs'
export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * GET /api/severidade.json — counts per severity level with the
 * canonical label + description metadata. Reuses lib/severity/labels.
 */
export async function GET() {
  const supabase = getSupabaseServiceClient()

  const results = await Promise.all(
    SEVERITIES.map(async (def) => {
      const { count } = await (supabase.from('statements') as any)
        .select('id', { count: 'exact', head: true })
        .eq('severity_score', def.level)
        .neq('verification_status', 'removed')
      return {
        level: def.level,
        label: def.label,
        short: def.short,
        description: def.description,
        count: Number(count ?? 0),
        url: `${SITE_URL}/severidade/${def.level}`,
      }
    }),
  )

  const total = results.reduce((a, r) => a + r.count, 0)

  return NextResponse.json({
    total,
    buckets: results,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=3600',
    },
  })
}
