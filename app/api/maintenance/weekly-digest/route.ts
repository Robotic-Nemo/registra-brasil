import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { sendBulkEmail } from '@/lib/email/sender'
import { generateUnsubscribeToken } from '@/lib/utils/newsletter'

export const runtime = 'nodejs'
export const maxDuration = 60

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const TOP_N = 10
const BATCH_SIZE = 50

function timingSafeEq(a: string, b: string): boolean {
  if (a.length !== b.length) return false
  let r = 0
  for (let i = 0; i < a.length; i++) r |= a.charCodeAt(i) ^ b.charCodeAt(i)
  return r === 0
}

function isoMondayOf(d: Date): string {
  const copy = new Date(d)
  const day = copy.getUTCDay() || 7 // Sunday = 7
  if (day !== 1) copy.setUTCDate(copy.getUTCDate() - (day - 1))
  return copy.toISOString().slice(0, 10)
}

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
}

/**
 * GET|POST /api/maintenance/weekly-digest — Pick the top N statements
 * from the last 7 days (severity × recency), render a digest email,
 * and send to every confirmed newsletter subscriber.
 *
 * Idempotent: refuses to resend if a digest already exists for this
 * week's Monday (UNIQUE week_of constraint).
 *
 * Auth: Vercel Cron bearer or x-cron-secret.
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

  // Allow ?force=1 to regenerate the current week (for testing). Default
  // behavior is idempotent by week_of.
  const force = request.nextUrl.searchParams.get('force') === '1'
  const week_of = isoMondayOf(new Date())

  const supabase = getSupabaseServiceClient()

  if (!force) {
    const { data: existing } = await (supabase.from('newsletter_digests') as any)
      .select('id, sent_at')
      .eq('week_of', week_of)
      .maybeSingle()
    if (existing?.sent_at) {
      return NextResponse.json({ skipped: true, reason: 'already_sent', week_of })
    }
  }

  const weekAgoIso = new Date(Date.now() - 7 * 86400_000).toISOString()

  // Top statements: created in the last 7 days, ranked by severity × days-old-decay.
  const { data: candidates } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, created_at, politicians(common_name, party, state)')
    .neq('verification_status', 'removed')
    .gt('created_at', weekAgoIso)
    .order('created_at', { ascending: false })
    .limit(100)

  const scored = ((candidates ?? []) as any[])
    .map((s) => {
      const severity = s.severity_score ?? 3
      const ageDays = (Date.now() - new Date(s.created_at).getTime()) / 86400_000
      const score = severity * Math.exp(-ageDays / 4) // steep intra-week decay
      return { s, score }
    })
    .sort((a, b) => b.score - a.score)
    .slice(0, TOP_N)

  if (scored.length === 0) {
    return NextResponse.json({ skipped: true, reason: 'no_statements_this_week', week_of })
  }

  const items = scored.map(({ s }) => {
    const pol = s.politicians ? `<strong>${esc(s.politicians.common_name)}</strong> (${esc(s.politicians.party)}${s.politicians.state ? '-' + esc(s.politicians.state) : ''})` : ''
    return `<li style="margin:0 0 14px"><a href="${SITE_URL}/declaracao/${s.slug ?? s.id}" style="color:#1d4ed8;text-decoration:none"><span style="font-size:13px;color:#6b7280">${s.statement_date}${s.severity_score ? ` · severidade ${s.severity_score}` : ''}</span><br>${pol}${pol ? ' — ' : ''}${esc(s.summary)}</a></li>`
  }).join('\n')

  const subject = `Resumo da semana: ${scored.length} declarações — Registra Brasil`
  const preview = `As ${scored.length} declarações mais relevantes registradas no arquivo na semana que começou em ${week_of}.`

  const html = `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:600px;margin:0 auto;padding:24px;color:#111;background:#fff">
    <p style="color:#6b7280;font-size:12px;margin:0 0 8px">Registra Brasil · semana de ${week_of}</p>
    <h1 style="font-size:22px;margin:0 0 4px">Resumo editorial da semana</h1>
    <p style="color:#6b7280;font-size:14px;margin:0 0 20px">As ${scored.length} declarações mais relevantes registradas no arquivo nos últimos 7 dias, ponderadas por severidade e recência.</p>
    <ol style="padding-left:18px">${items}</ol>
    <hr style="border:none;border-top:1px solid #e5e7eb;margin:28px 0">
    <p style="font-size:13px;color:#4b5563">
      Ajude a manter o arquivo vivo: <a href="${SITE_URL}/sugerir" style="color:#1d4ed8">sugira uma declaração</a>,
      acompanhe por <a href="${SITE_URL}/feed.xml" style="color:#1d4ed8">RSS</a>, ou veja o
      <a href="${SITE_URL}/ranking" style="color:#1d4ed8">ranking de políticos</a>.
    </p>
    <p style="font-size:11px;color:#9ca3af;margin-top:20px">
      Você recebeu este e-mail por ser assinante do boletim. Para cancelar, use o link no rodapé de qualquer mensagem futura.
    </p>
  </body></html>`

  // Record the digest first so partial failures don't lose the content.
  const { data: digestRow, error: insErr } = await (supabase.from('newsletter_digests') as any)
    .upsert({
      week_of,
      statement_ids: scored.map(({ s }) => s.id),
      subject,
      preview_text: preview,
      html,
      recipient_count: 0,
      sent_at: null,
    }, { onConflict: 'week_of' })
    .select('id')
    .single()
  if (insErr || !digestRow) {
    return NextResponse.json({ error: insErr?.message ?? 'Failed to record digest' }, { status: 500 })
  }

  // Fetch active confirmed subscribers.
  const { data: subs } = await (supabase.from('newsletter_subscribers') as any)
    .select('email, name')
    .eq('is_active', true)
    .not('confirmed_at', 'is', null)

  const recipients = ((subs ?? []) as Array<{ email: string; name: string | null }>).map((s) => ({ email: s.email, name: s.name ?? undefined }))

  if (recipients.length === 0) {
    await (supabase.from('newsletter_digests') as any)
      .update({ sent_at: new Date().toISOString(), recipient_count: 0 })
      .eq('id', digestRow.id)
    return NextResponse.json({ sent: 0, skipped: 'no_subscribers', week_of })
  }

  // Personalize per-recipient: inject unsubscribe link token.
  let sent = 0
  let failed = 0
  for (let i = 0; i < recipients.length; i += BATCH_SIZE) {
    const batch = recipients.slice(i, i + BATCH_SIZE)
    const results = await Promise.allSettled(batch.map(async (r) => {
      const unsubToken = await generateUnsubscribeToken(r.email)
      const unsubUrl = `${SITE_URL}/api/newsletter/unsubscribe?email=${encodeURIComponent(r.email)}&token=${unsubToken}`
      const finalHtml = html.replace(
        'For a cancelar, use o link no rodapé de qualquer mensagem futura.',
        `Cancelar: <a href="${unsubUrl}" style="color:#6b7280">${unsubUrl}</a>`,
      ) + `<!-- unsub:${unsubUrl} -->`
      const { sendEmail } = await import('@/lib/email/sender')
      return sendEmail({
        to: { email: r.email, name: r.name },
        subject,
        html: finalHtml + `<p style="font-size:11px;color:#9ca3af;margin-top:8px">Cancelar: <a href="${unsubUrl}" style="color:#9ca3af">${unsubUrl}</a></p>`,
        tags: ['weekly-digest'],
      })
    }))
    for (const r of results) {
      if (r.status === 'fulfilled' && r.value.success) sent++
      else failed++
    }
  }
  // Silence unused warning; the helper is available if a future iteration wants bulk-send with the default template.
  void sendBulkEmail

  await (supabase.from('newsletter_digests') as any)
    .update({ sent_at: new Date().toISOString(), recipient_count: sent })
    .eq('id', digestRow.id)

  return NextResponse.json({ sent, failed, week_of, digest_id: digestRow.id, statements: scored.length })
}

export const GET = handle
export const POST = handle
