import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { createLogger } from '@/lib/utils/logger'

export const runtime = 'edge'
export const revalidate = 3600 // 1 hour

const log = createLogger('api/categories')

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()
    const { data, error } = await supabase
      .from('categories')
      .select('slug, label_pt, color_hex, severity, icon')
      .order('sort_order')

    if (error) throw error

    return NextResponse.json(data ?? [], {
      headers: {
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=86400',
        Vary: 'Accept-Encoding',
        'X-Content-Type-Options': 'nosniff',
      },
    })
  } catch (err) {
    log.error('query failed', { err: err instanceof Error ? err.message : String(err) })
    return NextResponse.json(
      { error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
      { status: 500, headers: { 'X-Content-Type-Options': 'nosniff' } }
    )
  }
}
