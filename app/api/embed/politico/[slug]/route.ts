import { NextRequest } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'edge'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const SLUG_RE = /^[a-z0-9](?:[a-z0-9-]{0,98}[a-z0-9])?$/

function escapeHtml(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
}

/**
 * GET /api/embed/politico/:slug.html — standalone HTML card for a
 * politician, sized to embed as `<iframe width=360 height=180>`.
 * Self-contained inline CSS (no external assets) so cross-site
 * embeds don't hit CSP issues. Clicking the card links back to the
 * canonical politician page.
 */
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> },
) {
  const rl = checkRateLimit(getRateLimitKey(request, 'embed-politico'), {
    limit: 120, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const { slug } = await params
  if (!SLUG_RE.test(slug)) return new Response('slug inválido', { status: 400 })

  const supabase = getSupabaseServiceClient()
  const { data: p } = await (supabase.from('politicians') as any)
    .select('id, slug, common_name, party, state, role, photo_url')
    .eq('slug', slug)
    .maybeSingle()
  if (!p) {
    return new Response(notFoundHtml(slug), {
      status: 404,
      headers: { 'Content-Type': 'text/html; charset=utf-8' },
    })
  }

  const { count } = await (supabase.from('statements') as any)
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', p.id)
    .eq('verification_status', 'verified')

  const url = `${SITE_URL}/politico/${p.slug}`
  const total = count ?? 0
  const partyState = [p.party, p.state].filter(Boolean).join(' · ')
  const photo = p.photo_url
    ? `<img src="${escapeHtml(p.photo_url)}" alt="" class="rb-avatar"/>`
    : '<div class="rb-avatar rb-avatar-fallback"></div>'

  const html = `<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>${escapeHtml(p.common_name)} — Registra Brasil</title>
<style>
  html,body{margin:0;padding:0;font-family:system-ui,-apple-system,sans-serif;background:#fff;color:#111;}
  a.rb-card{display:flex;gap:12px;padding:12px;border:1px solid #e5e7eb;border-radius:8px;text-decoration:none;color:inherit;align-items:center;transition:border-color .15s;background:#fff;}
  a.rb-card:hover{border-color:#d97706;}
  .rb-avatar{width:64px;height:64px;border-radius:50%;object-fit:cover;flex:none;background:#f3f4f6;}
  .rb-avatar-fallback{background:#e5e7eb;}
  .rb-body{min-width:0;flex:1;}
  .rb-name{font-weight:600;font-size:15px;margin:0 0 2px;}
  .rb-meta{font-size:12px;color:#6b7280;margin:0 0 6px;}
  .rb-stat{font-size:13px;color:#111;}
  .rb-stat strong{color:#d97706;font-weight:600;}
  .rb-footer{margin-top:6px;font-size:11px;color:#9ca3af;}
</style>
</head>
<body>
<a class="rb-card" href="${escapeHtml(url)}" target="_top" rel="noopener">
  ${photo}
  <div class="rb-body">
    <p class="rb-name">${escapeHtml(p.common_name)}</p>
    <p class="rb-meta">${escapeHtml(partyState || p.role || '')}</p>
    <p class="rb-stat"><strong>${total}</strong> declarações verificadas</p>
    <p class="rb-footer">Registra Brasil · registrabrasil.com.br</p>
  </div>
</a>
</body>
</html>`

  return new Response(html, {
    headers: {
      'Content-Type': 'text/html; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
      // Allow cross-site framing — embed is the whole point.
      'X-Frame-Options': 'ALLOWALL',
      'Content-Security-Policy': "frame-ancestors *",
    },
  })
}

function notFoundHtml(slug: string): string {
  return `<!doctype html><html><body style="font-family:system-ui;padding:16px;color:#6b7280">Político "${escapeHtml(slug)}" não encontrado.</body></html>`
}
