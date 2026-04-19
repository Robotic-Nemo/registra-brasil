import { getSupabaseServiceClient } from '@/lib/supabase/server'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export function esc(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

export function isoMondayOf(d: Date): string {
  const copy = new Date(d)
  const day = copy.getUTCDay() || 7
  if (day !== 1) copy.setUTCDate(copy.getUTCDate() - (day - 1))
  return copy.toISOString().slice(0, 10)
}

export interface DigestBuild {
  weekOf: string
  subject: string
  preview: string
  html: string
  statementIds: string[]
  /** Top N statements included, useful for admin preview. */
  items: Array<{
    id: string
    slug: string | null
    summary: string
    statement_date: string
    severity_score: number | null
    score: number
    politician: { common_name: string; party: string | null; state: string | null } | null
  }>
}

/**
 * Builds the HTML + metadata for the weekly digest using the exact
 * same ranking as /api/maintenance/weekly-digest. Shared so the admin
 * preview and the cron produce identical output.
 */
export async function buildWeeklyDigest(opts: { topN?: number; forDate?: Date } = {}): Promise<DigestBuild> {
  const topN = opts.topN ?? 10
  const forDate = opts.forDate ?? new Date()
  const weekOf = isoMondayOf(forDate)

  const supabase = getSupabaseServiceClient()
  const weekAgoIso = new Date(forDate.getTime() - 7 * 86400_000).toISOString()

  const { data: candidates } = await (supabase.from('statements') as any)
    .select('id, slug, summary, statement_date, severity_score, verification_status, created_at, politicians(common_name, party, state)')
    .neq('verification_status', 'removed')
    .gt('created_at', weekAgoIso)
    .order('created_at', { ascending: false })
    .limit(100)

  type Raw = {
    id: string; slug: string | null; summary: string; statement_date: string
    severity_score: number | null; verification_status: string; created_at: string
    politicians: { common_name: string; party: string | null; state: string | null } | null
  }
  const scored = ((candidates ?? []) as Raw[])
    .map((s) => {
      const severity = s.severity_score ?? 3
      const ageDays = (forDate.getTime() - new Date(s.created_at).getTime()) / 86400_000
      const score = severity * Math.exp(-ageDays / 4)
      return { s, score }
    })
    .sort((a, b) => b.score - a.score)
    .slice(0, topN)

  const items = scored.map(({ s, score }) => ({
    id: s.id,
    slug: s.slug,
    summary: s.summary,
    statement_date: s.statement_date,
    severity_score: s.severity_score,
    score,
    politician: s.politicians,
  }))

  const itemsHtml = items.map((it) => {
    const pol = it.politician
      ? `<strong>${esc(it.politician.common_name)}</strong> (${esc(it.politician.party ?? '')}${it.politician.state ? '-' + esc(it.politician.state) : ''})`
      : ''
    return `<li style="margin:0 0 14px"><a href="${SITE_URL}/declaracao/${it.slug ?? it.id}" style="color:#1d4ed8;text-decoration:none"><span style="font-size:13px;color:#6b7280">${it.statement_date}${it.severity_score ? ` · severidade ${it.severity_score}` : ''}</span><br>${pol}${pol ? ' — ' : ''}${esc(it.summary)}</a></li>`
  }).join('\n')

  const subject = `Resumo da semana: ${items.length} declarações — Registra Brasil`
  const preview = `As ${items.length} declarações mais relevantes registradas no arquivo na semana que começou em ${weekOf}.`

  const html = `<!doctype html><html lang="pt-BR"><body style="font-family:system-ui,sans-serif;max-width:600px;margin:0 auto;padding:24px;color:#111;background:#fff">
    <p style="color:#6b7280;font-size:12px;margin:0 0 8px">Registra Brasil · semana de ${weekOf}</p>
    <h1 style="font-size:22px;margin:0 0 4px">Resumo editorial da semana</h1>
    <p style="color:#6b7280;font-size:14px;margin:0 0 20px">As ${items.length} declarações mais relevantes registradas no arquivo nos últimos 7 dias, ponderadas por severidade e recência.</p>
    <ol style="padding-left:18px">${itemsHtml}</ol>
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

  return {
    weekOf,
    subject,
    preview,
    html,
    statementIds: items.map((i) => i.id),
    items,
  }
}
