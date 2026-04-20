import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { countBySeverity } from '@/lib/severity/scoped-counts'

export const runtime = 'nodejs'
export const revalidate = 1800

/**
 * GET /api/severidade.json — counts per severity level with the
 * canonical label + description metadata. Reuses lib/severity/labels.
 */
export async function GET(request: NextRequest) {
  const supabase = getSupabaseServiceClient()

  const { buckets, total } = await countBySeverity(async (level) => {
    const { count } = await (supabase.from('statements') as any)
      .select('id', { count: 'exact', head: true })
      .eq('severity_score', level)
      .neq('verification_status', 'removed')
    return { count: count as number | null }
  })

  const etag = `W/"sev-global-${total}-${buckets.map(b => b.count).join('.')}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return NextResponse.json({
    total,
    buckets,
    generated_at: new Date().toISOString(),
  }, {
    headers: {
      'Cache-Control': 'public, max-age=900, s-maxage=1800, stale-while-revalidate=86400',
      ETag: etag,
    },
  })
}
