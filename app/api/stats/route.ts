import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 1800 // 30 minutes

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()

    const [verifiedResult, politiciansResult, categoriesResult] = await Promise.all([
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
    ])

    const stats = {
      totalVerified: verifiedResult.count ?? 0,
      totalPoliticians: politiciansResult.count ?? 0,
      totalCategories: categoriesResult.count ?? 0,
    }

    return NextResponse.json(stats, {
      headers: {
        'Cache-Control': 'public, max-age=300, s-maxage=1800, stale-while-revalidate=300',
        'Vary': 'Accept-Encoding',
      },
    })
  } catch (err) {
    console.error('[api/stats] Error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
