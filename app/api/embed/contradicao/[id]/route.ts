import { NextRequest } from 'next/server'
import { getContradictionById } from '@/lib/contradictions/queries'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

function escapeHtml(s: string): string {
  return s
    .replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;').replace(/'/g, '&#39;')
}

/**
 * GET /api/embed/contradicao/:id — standalone HTML card for a
 * contradiction pair. Sized for `<iframe width=520 height=280>`.
 * Shows the headline, both statements side-by-side with dates,
 * and the politician attribution.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'embed-contradiction'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { id } = await params
  if (!UUID_RE.test(id)) return new Response('id inválido', { status: 400 })

  const c = await getContradictionById(id)
  if (!c) {
    return new Response('<!doctype html><body style="font-family:system-ui;padding:16px;color:#6b7280">Contradição não encontrada.</body>', {
      status: 404,
      headers: { 'Content-Type': 'text/html; charset=utf-8' },
    })
  }

  const fmt = (d: string) => new Date(d).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short', year: 'numeric' })
  const pairUrl = `${SITE_URL}/contradicoes/${c.id}`
  const partyState = [c.politician.party, c.politician.state].filter(Boolean).join('-')
  const loUrl = `${SITE_URL}/declaracao/${c.statement_low.slug ?? c.statement_low.id}`
  const hiUrl = `${SITE_URL}/declaracao/${c.statement_high.slug ?? c.statement_high.id}`

  const html = `<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>${escapeHtml(c.headline)} — Registra Brasil</title>
<style>
  html,body{margin:0;padding:0;font-family:system-ui,-apple-system,sans-serif;background:#fff;color:#111;}
  .rb-card{display:block;padding:14px;border:1px solid #e5e7eb;border-radius:8px;background:#fff;text-decoration:none;color:inherit;transition:border-color .15s;}
  .rb-card:hover{border-color:#dc2626;}
  .rb-head{font-size:11px;color:#dc2626;font-weight:600;text-transform:uppercase;letter-spacing:.5px;margin-bottom:4px;}
  .rb-headline{font-weight:600;font-size:14px;margin:0 0 8px;line-height:1.35;}
  .rb-author{font-size:12px;color:#6b7280;margin:0 0 10px;}
  .rb-stmts{display:flex;gap:8px;}
  .rb-stmt{flex:1;min-width:0;padding:8px;border-radius:6px;background:#f9fafb;font-size:12px;line-height:1.4;border-left:3px solid #d97706;}
  .rb-stmt + .rb-stmt{border-left-color:#059669;}
  .rb-date{font-size:10px;color:#9ca3af;margin-bottom:3px;font-weight:600;}
  .rb-summary{color:#111;}
  .rb-footer{margin-top:8px;font-size:11px;color:#9ca3af;text-align:right;}
</style>
</head>
<body>
<a class="rb-card" href="${escapeHtml(pairUrl)}" target="_top" rel="noopener">
  <div class="rb-head">⚠ Contradição</div>
  <p class="rb-headline">${escapeHtml(c.headline)}</p>
  <p class="rb-author">${escapeHtml(c.politician.common_name)}${partyState ? ` · ${escapeHtml(partyState)}` : ''}</p>
  <div class="rb-stmts">
    <div class="rb-stmt">
      <div class="rb-date">${escapeHtml(fmt(c.statement_low.statement_date))}</div>
      <div class="rb-summary">${escapeHtml(c.statement_low.summary.length > 140 ? c.statement_low.summary.slice(0, 140) + '…' : c.statement_low.summary)}</div>
    </div>
    <div class="rb-stmt">
      <div class="rb-date">${escapeHtml(fmt(c.statement_high.statement_date))}</div>
      <div class="rb-summary">${escapeHtml(c.statement_high.summary.length > 140 ? c.statement_high.summary.slice(0, 140) + '…' : c.statement_high.summary)}</div>
    </div>
  </div>
  <div class="rb-footer">Registra Brasil</div>
</a>
<!-- Direct links for accessibility: ${escapeHtml(loUrl)} · ${escapeHtml(hiUrl)} -->
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
