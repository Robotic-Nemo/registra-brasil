import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'
export const revalidate = 1800 // 30 minutes

const log = createLogger('api/stats')

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()

    const [verifiedResult, politiciansResult, categoriesResult, disputedResult] = await Promise.all([
      supabase
        .from('statements')
        .select('id', { count: 'exact', head: true })
        .eq('verification_status', 'verified'),
      supabase
        .from('politicians')
        .select('id', { count: 'exact', head: true })
        .eq('is_active', true),
      supabase
        .from('categories')
        .select('id', { count: 'exact', head: true }),
      supabase
        .from('statements')
        .select('id', { count: 'exact', head: true })
        .eq('verification_status', 'disputed'),
    ])

    const stats = {
      totalVerified: verifiedResult.count ?? 0,
      totalPoliticians: politiciansResult.count ?? 0,
      totalCategories: categoriesResult.count ?? 0,
      totalDisputed: disputedResult.count ?? 0,
      generatedAt: new Date().toISOString(),
    }

    return NextResponse.json(stats, {
      headers: {
        'Cache-Control': 'public, max-age=300, s-maxage=1800, stale-while-revalidate=300',
        Vary: 'Accept-Encoding',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  } catch (err) {
    log.error('stats query failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500, headers: { 'X-Content-Type-Options': 'nosniff' } }
    )
  }
}
