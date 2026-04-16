/**
 * New statement notification email template.
 */

import { emailLayout, emailButton, escapeHtml, SITE_URL } from '../templates'

interface NewStatementData {
  summary: string
  politician: string
  party: string
  state: string | null
  date: string
  url: string
  categories: string[]
}

export function newStatementTemplate(data: NewStatementData): string {
  const categoriesHtml = data.categories.length > 0
    ? `<p style="margin:8px 0 0;font-size:12px;color:#6b7280;">
        Categorias: ${data.categories.map(c => escapeHtml(c)).join(', ')}
      </p>`
    : ''

  const content = `
    <h1 style="margin:0 0 16px;font-size:20px;color:#111827;">Nova Declaracao Registrada</h1>

    <div style="background-color:#f9fafb;border-radius:6px;padding:16px;border-left:3px solid #1d4ed8;">
      <p style="margin:0 0 8px;font-size:14px;color:#374151;font-style:italic;">
        &ldquo;${escapeHtml(data.summary)}&rdquo;
      </p>
      <p style="margin:0;font-size:13px;color:#6b7280;">
        <strong>${escapeHtml(data.politician)}</strong> (${escapeHtml(data.party)}${data.state ? ` - ${escapeHtml(data.state)}` : ''})
      </p>
      <p style="margin:4px 0 0;font-size:12px;color:#9ca3af;">
        ${escapeHtml(data.date)}
      </p>
      ${categoriesHtml}
    </div>

    ${emailButton('Ver declaracao completa', data.url)}

    <p style="margin:16px 0 0;font-size:12px;color:#9ca3af;">
      Voce recebeu este email porque se inscreveu para notificacoes de novas declaracoes no Registra Brasil.
    </p>
  `

  return emailLayout(content, {
    preheader: `${data.politician}: "${data.summary.slice(0, 60)}..."`,
  })
}
