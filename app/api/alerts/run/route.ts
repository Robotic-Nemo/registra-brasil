import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { sendEmail } from '@/lib/email/sender'
import {
  describeQuery,
  runSavedSearchIncremental,
  queryToSearchString,
  type SavedSearchQuery,
} from '@/lib/utils/saved-searches'

export const runtime = 'nodejs'
export const maxDuration = 60

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const BATCH_SIZE = 50

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

/**
 * GET or POST /api/alerts/run — Notifier job.
 *
 * Accepts two auth patterns:
 *   - Vercel Cron: bearer token via `authorization: Bearer <CRON_SECRET>`
 *   - External (GitHub Actions, etc.): `x-cron-secret: <REVALIDATE_SECRET>`
 *
 * For every confirmed saved search, pulls new matching statements since
 * last_notified_at and sends one digest email.
 *
 * Safe to call more often than needed — only subscribers with ≥1 new
 * match receive an email, and last_notified_at advances to now().
 */
async function handle(request: NextRequest) {
  const revalidateSecret = process.env.REVALIDATE_SECRET
  const cronSecret = process.env.CRON_SECRET
  const headerSecret = request.headers.get('x-cron-secret') ?? ''
  const bearer = (request.headers.get('authorization') ?? '').replace(/^Bearer\s+/i, '')
  const ok =
    (revalidateSecret && headerSecret && timingSafeEq(headerSecret, revalidateSecret)) ||
    (cronSecret && bearer && timingSafeEq(bearer, cronSecret))
  if (!ok) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const supabase = getSupabaseServiceClient()
  const { data: subs, error } = await (supabase.from('saved_searches') as any)
    .select('id, email, label, query, query_hash, last_notified_at, confirmed_at')
    .eq('is_confirmed', true)
    .is('unsubscribed_at', null)
    .order('last_notified_at', { ascending: true, nullsFirst: true })
    .limit(BATCH_SIZE)

  if (error) {
    console.error('[alerts/run] list:', error)
    return NextResponse.json({ error: 'Failed to list' }, { status: 500 })
  }

  let sent = 0
  let skipped = 0
  const errors: string[] = []

  for (const sub of (subs ?? []) as Array<{
    id: string; email: string; label: string | null; query: SavedSearchQuery;
    query_hash: string; last_notified_at: string | null; confirmed_at: string;
  }>) {
    // Since marker: last successful delivery, or confirmation time on first run.
    const since = sub.last_notified_at ?? sub.confirmed_at
    try {
      const matches = await runSavedSearchIncremental(supabase, sub.query, since, 20)
      if (matches.length === 0) {
        // Still advance marker so we don't re-scan the same window forever.
        await (supabase.from('saved_searches') as any)
          .update({ last_notified_at: new Date().toISOString() })
          .eq('id', sub.id)
        skipped++
        continue
      }

      const desc = sub.label || describeQuery(sub.query)
      const unsubUrl = `${SITE_URL}/api/alerts/unsubscribe?email=${encodeURIComponent(sub.email)}&hash=${sub.query_hash}`
      const searchUrl = `${SITE_URL}/buscar?${queryToSearchString(sub.query)}`

      const items = matches.map((m) => {
        const polBits = m.politician ? `<strong>${m.politician.common_name}</strong> (${m.politician.party})` : ''
        return `<li style="margin:0 0 10px"><a href="${SITE_URL}/declaracao/${m.slug ?? m.id}" style="color:#1d4ed8">${polBits ? polBits + ' — ' : ''}${m.summary}</a><br><span style="color:#6b7280;font-size:12px">${m.statement_date}</span></li>`
      }).join('')

      await sendEmail({
        to: { email: sub.email },
        subject: `${matches.length} nova${matches.length === 1 ? '' : 's'} declaraç${matches.length === 1 ? 'ão' : 'ões'}: ${desc.slice(0, 60)}`,
        html: `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:560px;margin:0 auto;padding:24px;color:#111">
          <h1 style="font-size:18px;margin:0 0 8px">Novas declarações no seu alerta</h1>
          <p style="color:#6b7280;font-size:13px;margin:0 0 16px">Alerta: ${desc}</p>
          <ul style="padding-left:18px">${items}</ul>
          <p style="margin-top:20px"><a href="${searchUrl}" style="color:#1d4ed8">Ver todos os resultados</a></p>
          <hr style="border:none;border-top:1px solid #e5e7eb;margin:24px 0">
          <p style="font-size:11px;color:#9ca3af">Para cancelar este alerta: <a href="${unsubUrl}">${unsubUrl}</a></p>
        </body></html>`,
        text: `${matches.length} novas declarações no alerta "${desc}":\n\n${matches.map((m) => `- ${m.summary} (${m.statement_date})\n  ${SITE_URL}/declaracao/${m.slug ?? m.id}`).join('\n\n')}\n\nCancelar: ${unsubUrl}`,
        tags: ['alert-digest'],
      })

      await (supabase.from('saved_searches') as any)
        .update({ last_notified_at: new Date().toISOString() })
        .eq('id', sub.id)
      sent++
    } catch (err) {
      errors.push(sub.id + ': ' + (err instanceof Error ? err.message : 'unknown'))
    }
  }

  return NextResponse.json({ sent, skipped, errors: errors.length, detail: errors.slice(0, 5) })
}

export const GET = handle
export const POST = handle
