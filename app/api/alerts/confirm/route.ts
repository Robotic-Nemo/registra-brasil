import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { isValidEmail } from '@/lib/utils/newsletter'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function page(title: string, body: string, status: number) {
  const html = `<!doctype html><html lang="pt-BR"><head>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="robots" content="noindex,nofollow">
    <title>${title} — Registra Brasil</title>
    <style>body{font-family:system-ui,sans-serif;max-width:520px;margin:10vh auto;padding:24px;color:#111;text-align:center}
    .card{border:1px solid #e5e7eb;border-radius:12px;padding:32px}a{color:#1d4ed8}</style>
    </head><body><div class="card"><h1 style="font-size:20px;margin:0 0 12px">${title}</h1>${body}<p style="margin-top:24px"><a href="${SITE_URL}">Voltar ao início</a></p></div></body></html>`
  return new NextResponse(html, {
    status,
    headers: { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' },
  })
}

export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'alerts-confirm'), { limit: 30, windowMs: 10 * 60 * 1000 })
  if (!rl.allowed) return page('Muitas tentativas', '<p>Tente novamente em alguns minutos.</p>', 429)

  const email = request.nextUrl.searchParams.get('email')
  const token = request.nextUrl.searchParams.get('token')
  if (!email || !token || !isValidEmail(email) || token.length < 32) {
    return page('Link inválido', '<p>Link incompleto ou mal-formado.</p>', 400)
  }

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('saved_searches') as any)
    .select('id, confirmation_token')
    .eq('email', email.toLowerCase())
    .eq('confirmation_token', token)
    .maybeSingle()

  if (!data?.id) return page('Link expirado', '<p>O link expirou ou já foi usado.</p>', 400)

  const { error } = await (supabase.from('saved_searches') as any)
    .update({
      is_confirmed: true,
      confirmed_at: new Date().toISOString(),
      confirmation_token: null,
      updated_at: new Date().toISOString(),
    })
    .eq('id', data.id)

  if (error) return page('Erro', '<p>Não foi possível confirmar. Tente novamente mais tarde.</p>', 500)

  return page('Alerta confirmado', '<p>Pronto! Você será avisado quando novas declarações corresponderem à sua busca.</p>', 200)
}
