import { NextRequest, NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const maxDuration = 30

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const USER_AGENT = 'RegistraBrasilArchiver/1.0 (+https://registrabrasil.com.br)'

async function assertAdmin() {
  const secret = process.env.ADMIN_SECRET
  if (!secret) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  const expected = await deriveSessionToken(secret)
  if (!timingSafeEqual(t, expected)) throw new Error('Unauthorized')
}

/**
 * POST /api/admin/archive-source { statement_id }
 *
 * Triggers Internet Archive Save-Page-Now for the statement's primary
 * source URL. Anonymous SPN works but is rate-limited server-side by
 * Archive.org — we add our own per-admin limit to avoid scripts being
 * deployed against the endpoint.
 *
 * The SPN call is fire-and-follow-redirect: Archive returns a 302 to
 * the archived snapshot once it's captured. We poll for up to 20 s.
 */
export async function POST(request: NextRequest) {
  try { await assertAdmin() } catch {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const rl = checkRateLimit(getRateLimitKey(request, 'admin-archive'), {
    limit: 30, windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return NextResponse.json({ error: 'Rate limited' }, { status: 429 })
  }

  let body: { statement_id?: string }
  try { body = await request.json() } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }

  const id = body.statement_id ?? ''
  if (!UUID_RE.test(id)) {
    return NextResponse.json({ error: 'Invalid statement_id' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: stmt } = await (supabase.from('statements') as any)
    .select('id, primary_source_url')
    .eq('id', id)
    .maybeSingle()

  if (!stmt?.primary_source_url) {
    return NextResponse.json({ error: 'Statement not found' }, { status: 404 })
  }

  const target = stmt.primary_source_url as string
  const spn = `https://web.archive.org/save/${target}`

  let archivedUrl: string | null = null
  try {
    const res = await fetch(spn, {
      method: 'GET',
      headers: { 'User-Agent': USER_AGENT },
      redirect: 'follow',
      signal: AbortSignal.timeout(20_000),
    })
    // When SPN finishes, the final URL is the archived snapshot.
    if (res.url && res.url.includes('web.archive.org/web/')) {
      archivedUrl = res.url
    }
  } catch (err) {
    console.error('[archive-source] SPN error:', err)
  }

  const now = new Date().toISOString()
  await (supabase.from('statements') as any)
    .update({
      source_wayback_url: archivedUrl,
      source_wayback_checked_at: now,
    })
    .eq('id', id)

  return NextResponse.json({ ok: Boolean(archivedUrl), url: archivedUrl })
}
