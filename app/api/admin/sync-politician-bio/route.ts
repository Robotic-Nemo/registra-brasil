import { NextRequest, NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { fetchWikipediaSummary } from '@/lib/wikipedia/summary'

export const runtime = 'nodejs'
export const maxDuration = 30

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

async function assertAdmin() {
  const secret = process.env.ADMIN_SECRET
  if (!secret) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(secret))) throw new Error('Unauthorized')
}

/**
 * POST /api/admin/sync-politician-bio { politician_id }
 *
 * Pulls the current Wikipedia summary for the politician (using
 * `photo_source_url` or `wikipedia_url` to resolve the article title)
 * and stores it in `bio_excerpt` + `bio_source_url` + `bio_checked_at`.
 *
 * Admin-cookie-guarded; rate-limited 60/10min.
 */
export async function POST(request: NextRequest) {
  try { await assertAdmin() } catch {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }
  const rl = checkRateLimit(getRateLimitKey(request, 'sync-bio'), {
    limit: 60, windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) return NextResponse.json({ error: 'Rate limited' }, { status: 429 })

  let body: { politician_id?: string }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }
  const id = body.politician_id ?? ''
  if (!UUID_RE.test(id)) return NextResponse.json({ error: 'Invalid id' }, { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: pol } = await (supabase.from('politicians') as any)
    .select('id, common_name, photo_source_url, wikipedia_url')
    .eq('id', id)
    .maybeSingle()

  if (!pol) return NextResponse.json({ error: 'Not found' }, { status: 404 })

  // Prefer wikipedia_url if set; fall back to the (Wikimedia-derived)
  // photo_source_url; last resort, search by common_name.
  const summary = await fetchWikipediaSummary({
    articleUrl: pol.wikipedia_url ?? pol.photo_source_url,
    title: !pol.wikipedia_url && !pol.photo_source_url ? pol.common_name : undefined,
  })

  const now = new Date().toISOString()
  await (supabase.from('politicians') as any)
    .update({
      bio_excerpt: summary?.extract ?? null,
      bio_source_url: summary?.url ?? null,
      bio_checked_at: now,
    })
    .eq('id', id)

  return NextResponse.json({
    ok: Boolean(summary),
    excerpt_length: summary?.extract.length ?? 0,
    source_url: summary?.url ?? null,
  })
}
