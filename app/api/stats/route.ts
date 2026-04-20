import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'
export const revalidate = 1800 // 30 minutes

const log = createLogger('api/stats')

export async function GET(request: NextRequest) {
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

    // Content-keyed ETag (exclude generatedAt since it changes every
    // call). Lets intermediaries and clients 304 on unchanged counts,
    // which is the typical steady state on this endpoint.
    const etag = `W/"stats-${stats.totalVerified}-${stats.totalPoliticians}-${stats.totalCategories}-${stats.totalDisputed}"`
    // SWR shorter than s-maxage made no sense — once the CDN entry
    // went stale clients got a cache miss well before the revalidate
    // window could cover them. Expand SWR to 1h so stale hits serve
    // instantly while we refresh in the background.
    const cacheControl = 'public, max-age=300, s-maxage=1800, stale-while-revalidate=3600'
    if (request.headers.get('if-none-match') === etag) {
      return new Response(null, {
        status: 304,
        headers: { ETag: etag, 'Cache-Control': cacheControl },
      })
    }
    return NextResponse.json(stats, {
      status: 200,
      headers: {
        'Cache-Control': cacheControl,
        Vary: 'Accept-Encoding',
        'X-Content-Type-Options': 'nosniff',
        ETag: etag,
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
