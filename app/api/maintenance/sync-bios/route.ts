import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { fetchWikipediaSummary } from '@/lib/wikipedia/summary'

export const runtime = 'nodejs'
export const maxDuration = 60

const BATCH_SIZE = 15
const DELAY_MS = 500

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

function sleep(ms: number): Promise<void> {
  return new Promise((r) => setTimeout(r, ms))
}

/**
 * GET|POST /api/maintenance/sync-bios
 *
 * Processes BATCH_SIZE politicians with the oldest (or null)
 * `bio_checked_at` on each invocation. Respectful 500ms pacing
 * between Wikipedia calls. Dual auth: Vercel Cron bearer or
 * x-cron-secret (REVALIDATE_SECRET).
 *
 * Complements the per-politician admin endpoint (run 46) with an
 * LRU-scheduled backfill so the full active roster gets a bio
 * without editor effort.
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

  const { data: batch, error } = await (supabase.from('politicians') as any)
    .select('id, common_name, wikipedia_url, photo_source_url')
    .eq('is_active', true)
    .order('bio_checked_at', { ascending: true, nullsFirst: true })
    .limit(BATCH_SIZE)

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })

  const start = Date.now()
  let filled = 0
  let missed = 0

  for (const row of (batch ?? []) as Array<{ id: string; common_name: string; wikipedia_url: string | null; photo_source_url: string | null }>) {
    const summary = await fetchWikipediaSummary({
      articleUrl: row.wikipedia_url ?? row.photo_source_url,
      title: !row.wikipedia_url && !row.photo_source_url ? row.common_name : undefined,
    })
    if (summary) filled++
    else missed++

    await (supabase.from('politicians') as any)
      .update({
        bio_excerpt: summary?.extract ?? null,
        bio_source_url: summary?.url ?? null,
        bio_checked_at: new Date().toISOString(),
      })
      .eq('id', row.id)

    await sleep(DELAY_MS)
  }

  return NextResponse.json({
    processed: batch?.length ?? 0,
    filled,
    missed,
    took_ms: Date.now() - start,
  })
}

export const GET = handle
export const POST = handle
