import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

function escapeHtml(s: string): string {
  return s
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&#39;')
}

const STATUS_LABEL: Record<string, string> = {
  verified: 'verificada', disputed: 'contestada', unverified: 'não verificada',
}
const STATUS_COLOR: Record<string, string> = {
  verified: '#059669', disputed: '#dc2626', unverified: '#6b7280',
}

/**
 * GET /api/embed/declaracao/:idOrSlug — standalone HTML card for
 * one statement, sized to embed as `<iframe width=420 height=240>`.
 * Matches the /api/embed/politico/:slug pattern but scoped to a
 * single declaration (quote + politician attribution + source).
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'embed-decl'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { id: raw } = await params
  const isUuid = UUID_RE.test(raw)
  if (!isUuid && !SLUG_RE.test(raw)) {
    return new Response('id inválido', { status: 400 })
  }

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, statement_date, verification_status, severity_score, primary_source_url, politicians!inner(slug, common_name, party, state)')
    .eq(isUuid ? 'id' : 'slug', raw)
    .neq('verification_status', 'removed')
    .maybeSingle()

  if (!data) {
    return new Response('<!doctype html><body style="font-family:system-ui;padding:16px;color:#6b7280">Declaração não encontrada.</body>', {
      status: 404,
      headers: { 'Content-Type': 'text/html; charset=utf-8' },
    })
  }

  const s = data as {
    id: string; slug: string | null; summary: string; full_quote: string | null
    statement_date: string; verification_status: string; severity_score: number | null
    primary_source_url: string | null
    politicians: { slug: string; common_name: string; party: string | null; state: string | null }
  }

  const url = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
  const quote = s.full_quote ?? s.summary
  const statusLabel = STATUS_LABEL[s.verification_status] ?? s.verification_status
  const statusColor = STATUS_COLOR[s.verification_status] ?? '#6b7280'
  const partyState = [s.politicians.party, s.politicians.state].filter(Boolean).join('-')
  const date = new Date(s.statement_date).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short', year: 'numeric' })

  const html = `<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>${escapeHtml(s.politicians.common_name)} — Registra Brasil</title>
<style>
  html,body{margin:0;padding:0;font-family:system-ui,-apple-system,sans-serif;background:#fff;color:#111;}
  a.rb-stmt{display:block;padding:14px;border:1px solid #e5e7eb;border-radius:8px;text-decoration:none;color:inherit;background:#fff;transition:border-color .15s;}
  a.rb-stmt:hover{border-color:#d97706;}
  .rb-head{display:flex;justify-content:space-between;align-items:center;font-size:12px;margin-bottom:8px;}
  .rb-author{font-weight:600;color:#111;}
  .rb-meta{color:#6b7280;}
  .rb-status{display:inline-block;padding:2px 8px;border-radius:10px;font-size:11px;font-weight:600;color:#fff;}
  blockquote.rb-quote{margin:0 0 8px;padding:0 0 0 10px;border-left:3px solid #d97706;font-size:14px;line-height:1.45;color:#111;}
  .rb-footer{font-size:11px;color:#9ca3af;display:flex;justify-content:space-between;}
  .rb-footer a{color:#9ca3af;text-decoration:none;}
</style>
</head>
<body>
<a class="rb-stmt" href="${escapeHtml(url)}" target="_top" rel="noopener">
  <div class="rb-head">
    <span><span class="rb-author">${escapeHtml(s.politicians.common_name)}</span>${partyState ? ` <span class="rb-meta">(${escapeHtml(partyState)})</span>` : ''}</span>
    <span class="rb-status" style="background:${statusColor}">${escapeHtml(statusLabel)}</span>
  </div>
  <blockquote class="rb-quote">${escapeHtml(quote.length > 220 ? quote.slice(0, 220) + '…' : quote)}</blockquote>
  <div class="rb-footer">
    <span>${escapeHtml(date)}</span>
    <span>Registra Brasil</span>
  </div>
</a>
</body>
</html>`

  return new Response(html, {
    headers: {
      'Content-Type': 'text/html; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      'X-Frame-Options': 'ALLOWALL',
      'Content-Security-Policy': "frame-ancestors *",
    },
  })
}
