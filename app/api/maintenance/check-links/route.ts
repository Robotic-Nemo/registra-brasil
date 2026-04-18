import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'nodejs'
export const maxDuration = 60

const BATCH_SIZE = 50
const FETCH_TIMEOUT_MS = 8000
const USER_AGENT = 'RegistraBrasilLinkChecker/1.0 (+https://registrabrasil.com.br)'

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

async function checkUrl(url: string): Promise<{ status: number | null; error: string | null }> {
  try {
    const res = await fetch(url, {
      method: 'HEAD',
      redirect: 'follow',
      headers: { 'User-Agent': USER_AGENT, Accept: '*/*' },
      signal: AbortSignal.timeout(FETCH_TIMEOUT_MS),
    })
    // Some servers (YouTube, many news sites) 405 HEAD — fall back to GET with range.
    if (res.status === 405 || res.status === 403) {
      const res2 = await fetch(url, {
        method: 'GET',
        redirect: 'follow',
        headers: { 'User-Agent': USER_AGENT, Accept: '*/*', Range: 'bytes=0-1023' },
        signal: AbortSignal.timeout(FETCH_TIMEOUT_MS),
      })
      return { status: res2.status, error: null }
    }
    return { status: res.status, error: null }
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err)
    return { status: null, error: msg.slice(0, 200) }
  }
}

/**
 * GET|POST /api/maintenance/check-links
 *
 * Runs a batch of HEAD requests against `primary_source_url` for the
 * BATCH_SIZE statements with the oldest `source_last_checked_at` (null
 * first). Writes back status + error, advances timestamp. Safe to call
 * repeatedly; the partial index keeps the next-to-check query cheap.
 *
 * Auth: Vercel Cron bearer OR x-cron-secret.
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

  const { data: batch, error } = await (supabase.from('statements') as any)
    .select('id, primary_source_url')
    .neq('verification_status', 'removed')
    .order('source_last_checked_at', { ascending: true, nullsFirst: true })
    .limit(BATCH_SIZE)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  const start = Date.now()
  let ok2xx = 0
  let redirect3xx = 0
  let client4xx = 0
  let server5xx = 0
  let errored = 0

  // Process sequentially to be polite to upstream servers.
  for (const row of (batch ?? []) as Array<{ id: string; primary_source_url: string }>) {
    const { status, error: checkErr } = await checkUrl(row.primary_source_url)
    if (checkErr) errored++
    else if (status && status >= 200 && status < 300) ok2xx++
    else if (status && status >= 300 && status < 400) redirect3xx++
    else if (status && status >= 400 && status < 500) client4xx++
    else if (status && status >= 500) server5xx++

    await (supabase.from('statements') as any)
      .update({
        source_last_checked_at: new Date().toISOString(),
        source_http_status: status,
        source_check_error: checkErr,
      })
      .eq('id', row.id)
  }

  return NextResponse.json({
    checked: batch?.length ?? 0,
    took_ms: Date.now() - start,
    summary: { ok2xx, redirect3xx, client4xx, server5xx, errored },
  })
}

export const GET = handle
export const POST = handle
