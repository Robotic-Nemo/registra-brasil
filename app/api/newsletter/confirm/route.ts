import { NextRequest, NextResponse } from 'next/server'
import { confirmSubscription, isValidEmail } from '@/lib/utils/newsletter'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'

export const runtime = 'nodejs'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function htmlPage(title: string, body: string, status: number) {
  const html = `<!doctype html><html lang="pt-BR"><head>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="robots" content="noindex,nofollow">
    <title>${title} — Registra Brasil</title>
    <style>body{font-family:system-ui,sans-serif;max-width:520px;margin:10vh auto;padding:24px;color:#111;text-align:center}
    a{color:#1d4ed8}.card{border:1px solid #e5e7eb;border-radius:12px;padding:32px}</style>
  </head><body><div class="card"><h1 style="margin:0 0 12px;font-size:20px">${title}</h1>${body}<p style="margin-top:24px"><a href="${SITE_URL}">Voltar ao início</a></p></div></body></html>`
  return new NextResponse(html, {
    status,
    headers: { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' },
  })
}

/**
 * GET /api/newsletter/confirm?email=&token= — Finalize double-opt-in.
 * Returns a small HTML page (users land here from their email client).
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'newsletter-confirm'), {
    limit: 30,
    windowMs: 10 * 60 * 1000,
  })
  if (!rl.allowed) {
    return htmlPage('Muitas tentativas', '<p>Tente novamente em alguns minutos.</p>', 429)
  }

  const email = request.nextUrl.searchParams.get('email')
  const token = request.nextUrl.searchParams.get('token')

  if (!email || !token || !isValidEmail(email) || token.length < 32) {
    return htmlPage('Link inválido', '<p>O link de confirmação está incompleto ou inválido.</p>', 400)
  }

  const result = await confirmSubscription(email, token)
  if (!result.success) {
    return htmlPage(
      'Não foi possível confirmar',
      '<p>O link expirou ou já foi usado. Faça uma nova inscrição se desejar.</p>',
      400,
    )
  }

  return htmlPage(
    'Inscrição confirmada',
    '<p>Obrigado! Você começará a receber o boletim do Registra Brasil.</p><p style="font-size:12px;color:#6b7280">Para cancelar a qualquer momento, use o link no rodapé de qualquer e-mail.</p>',
    200,
  )
}
