/**
 * Email template shared utilities and base layout.
 */

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * Base email HTML wrapper with consistent styling.
 */
export function emailLayout(content: string, options?: { preheader?: string }): string {
  const preheader = options?.preheader
    ? `<div style="display:none;max-height:0;overflow:hidden;">${escapeHtml(options.preheader)}</div>`
    : ''

  return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registra Brasil</title>
</head>
<body style="margin:0;padding:0;background-color:#f4f4f5;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;">
  ${preheader}
  <table width="100%" cellpadding="0" cellspacing="0" role="presentation" style="background-color:#f4f4f5;">
    <tr>
      <td align="center" style="padding:24px 16px;">
        <table width="600" cellpadding="0" cellspacing="0" role="presentation" style="max-width:600px;width:100%;background-color:#ffffff;border-radius:8px;overflow:hidden;">
          <!-- Header -->
          <tr>
            <td style="background-color:#1d4ed8;padding:20px 24px;">
              <a href="${SITE_URL}" style="color:#ffffff;font-size:20px;font-weight:700;text-decoration:none;">
                Registra Brasil
              </a>
            </td>
          </tr>
          <!-- Content -->
          <tr>
            <td style="padding:24px;">
              ${content}
            </td>
          </tr>
          <!-- Footer -->
          <tr>
            <td style="padding:16px 24px;background-color:#f9fafb;border-top:1px solid #e5e7eb;">
              <p style="margin:0;font-size:12px;color:#9ca3af;text-align:center;">
                Registra Brasil &mdash; Transparencia politica para todos<br>
                <a href="${SITE_URL}/newsletter/cancelar" style="color:#6b7280;text-decoration:underline;">Cancelar inscricao</a>
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>`
}

/**
 * Generate an email button.
 */
export function emailButton(text: string, href: string, color = '#1d4ed8'): string {
  return `<table cellpadding="0" cellspacing="0" role="presentation" style="margin:16px 0;">
  <tr>
    <td style="background-color:${color};border-radius:6px;padding:12px 24px;">
      <a href="${href}" style="color:#ffffff;font-size:14px;font-weight:600;text-decoration:none;display:inline-block;">
        ${escapeHtml(text)}
      </a>
    </td>
  </tr>
</table>`
}

/**
 * HTML-escape a string for safe inclusion in templates.
 */
export function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

export { SITE_URL }
