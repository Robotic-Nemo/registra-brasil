import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getClosestSnapshot, submitSavePageNow } from '@/lib/wayback/client'

export const runtime = 'nodejs'
export const maxDuration = 60

const BATCH_SIZE = 40
const SPN_PER_RUN = 8 // Save-Page-Now has strict rate limits; cap submissions
const SLEEP_BETWEEN_MS = 200

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

/**
 * Populates source_wayback_url for statements that are missing one.
 *
 * 1. Picks the 40 oldest-unchecked statements still lacking a snapshot.
 * 2. Queries the Wayback availability API. On a hit, writes the URL
 *    and stamps source_wayback_checked_at.
 * 3. On a miss, fires a best-effort Save Page Now submission for up to
 *    `SPN_PER_RUN` entries so the next run can pick them up. Still
 *    stamps checked_at so we don't re-check immediately.
 *
 * Auth: Vercel Cron bearer OR x-cron-secret header.
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
    .select('id, primary_source_url, source_wayback_url, source_wayback_checked_at')
    .neq('verification_status', 'removed')
    .is('source_wayback_url', null)
    .order('source_wayback_checked_at', { ascending: true, nullsFirst: true })
    .limit(BATCH_SIZE)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  const start = Date.now()
  const rows = (batch ?? []) as Array<{
    id: string
    primary_source_url: string
  }>

  let hits = 0
  let misses = 0
  let spnSubmissions = 0
  let spnFailures = 0
  const errors: string[] = []

  for (const row of rows) {
    const now = new Date().toISOString()
    try {
      const snap = await getClosestSnapshot(row.primary_source_url)
      if (snap?.url) {
        const { error: upErr } = await (supabase.from('statements') as any)
          .update({
            source_wayback_url: snap.url,
            source_wayback_checked_at: now,
          })
          .eq('id', row.id)
        if (upErr) errors.push(upErr.message)
        else hits++
      } else {
        // Miss: still stamp checked_at, and optionally submit to SPN.
        const { error: upErr } = await (supabase.from('statements') as any)
          .update({ source_wayback_checked_at: now })
          .eq('id', row.id)
        if (upErr) errors.push(upErr.message)
        misses++

        if (spnSubmissions < SPN_PER_RUN) {
          const ok = await submitSavePageNow(row.primary_source_url)
          if (ok) spnSubmissions++
          else spnFailures++
        }
      }
    } catch (err) {
      errors.push(err instanceof Error ? err.message : String(err))
    }
    await sleep(SLEEP_BETWEEN_MS)
  }

  return NextResponse.json({
    ok: true,
    scanned: rows.length,
    durationMs: Date.now() - start,
    summary: { hits, misses, spnSubmissions, spnFailures },
    errors: errors.slice(0, 5),
  })
}

export const GET = handle
export const POST = handle
