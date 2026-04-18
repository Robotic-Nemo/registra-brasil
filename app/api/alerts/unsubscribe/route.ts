import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { isValidEmail } from '@/lib/utils/newsletter'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function page(title: string, body: string, status: number) {
  const html = `<!doctype html><html lang="pt-BR"><head>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="robots" content="noindex,nofollow">
    <title>${title} — Registra Brasil</title>
    <style>body{font-family:system-ui,sans-serif;max-width:520px;margin:10vh auto;padding:24px;color:#111;text-align:center}
    .card{border:1px solid #e5e7eb;border-radius:12px;padding:32px}a{color:#1d4ed8}</style></head>
    <body><div class="card"><h1 style="font-size:20px;margin:0 0 12px">${title}</h1>${body}<p style="margin-top:24px"><a href="${SITE_URL}">Voltar ao início</a></p></div></body></html>`
  return new NextResponse(html, {
    status,
    headers: { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' },
  })
}

export async function GET(request: NextRequest) {
  const email = request.nextUrl.searchParams.get('email')
  const hash = request.nextUrl.searchParams.get('hash')
  if (!email || !isValidEmail(email)) return page('Link inválido', '<p>Link incompleto.</p>', 400)

  const supabase = getSupabaseServiceClient()
  let q = (supabase.from('saved_searches') as any)
    .update({
      unsubscribed_at: new Date().toISOString(),
      is_confirmed: false,
      updated_at: new Date().toISOString(),
    })
    .eq('email', email.toLowerCase())
  if (hash) q = q.eq('query_hash', hash)

  const { error } = await q
  if (error) return page('Erro', '<p>Não foi possível cancelar. Tente novamente mais tarde.</p>', 500)

  return page(
    'Alerta cancelado',
    hash
      ? '<p>Este alerta foi removido. Seus outros alertas permanecem ativos.</p>'
      : '<p>Todos os seus alertas foram cancelados.</p>',
    200,
  )
}
