import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const maxDuration = 60

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

/**
 * GET or POST /api/maintenance/refresh-scores
 *
 * Triggers `REFRESH MATERIALIZED VIEW CONCURRENTLY
 * politician_activity_scores`. Auth accepts either Vercel-cron
 * bearer (CRON_SECRET) or external x-cron-secret (REVALIDATE_SECRET).
 */
async function handle(request: NextRequest) {
  const cronSecret = process.env.CRON_SECRET
  const revalidateSecret = process.env.REVALIDATE_SECRET
  const headerSecret = request.headers.get('x-cron-secret') ?? ''
  const bearer = (request.headers.get('authorization') ?? '').replace(/^Bearer\s+/i, '')
  const ok =
    (revalidateSecret && headerSecret && timingSafeEq(headerSecret, revalidateSecret)) ||
    (cronSecret && bearer && timingSafeEq(bearer, cronSecret))
  if (!ok) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const supabase = getSupabaseServiceClient()
  const start = Date.now()
  const { error } = await (supabase as any).rpc('refresh_politician_activity_scores')
  if (error) {
    console.error('[refresh-scores]', error)
    return NextResponse.json({ error: error.message }, { status: 500 })
  }
  return NextResponse.json({ success: true, took_ms: Date.now() - start })
}

export const GET = handle
export const POST = handle
