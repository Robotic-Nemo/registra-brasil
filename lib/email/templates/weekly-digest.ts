/**
 * Weekly digest email template.
 */

import { emailLayout, emailButton, escapeHtml, SITE_URL } from '../templates'
import type { DigestData } from '@/types/email'

export function weeklyDigestTemplate(data: DigestData): string {
  const statementsHtml = data.topStatements
    .map(s => `
      <tr>
        <td style="padding:12px 0;border-bottom:1px solid #f3f4f6;">
          <p style="margin:0 0 4px;font-size:14px;color:#111827;font-weight:500;">
            &ldquo;${escapeHtml(s.summary.slice(0, 100))}${s.summary.length > 100 ? '...' : ''}&rdquo;
          </p>
          <p style="margin:0;font-size:12px;color:#6b7280;">
            ${escapeHtml(s.politician)} (${escapeHtml(s.party)}) &mdash; ${s.date}
          </p>
        </td>
      </tr>
    `)
    .join('')

  const content = `
    <h1 style="margin:0 0 8px;font-size:22px;color:#111827;">Resumo Semanal</h1>
    <p style="margin:0 0 16px;font-size:14px;color:#6b7280;">${escapeHtml(data.period)}</p>

    <table cellpadding="0" cellspacing="0" role="presentation" style="width:100%;margin-bottom:20px;">
      <tr>
        <td style="padding:12px;background-color:#eff6ff;border-radius:6px;text-align:center;width:50%;">
          <span style="display:block;font-size:24px;font-weight:700;color:#1d4ed8;">${data.totalNew}</span>
          <span style="font-size:12px;color:#3b82f6;">novas declaracoes</span>
        </td>
        <td style="width:12px;"></td>
        <td style="padding:12px;background-color:#f0fdf4;border-radius:6px;text-align:center;width:50%;">
          <span style="display:block;font-size:24px;font-weight:700;color:#16a34a;">${data.totalVerified}</span>
          <span style="font-size:12px;color:#22c55e;">verificadas</span>
        </td>
      </tr>
    </table>

    ${data.topStatements.length > 0 ? `
      <h2 style="margin:0 0 12px;font-size:16px;color:#111827;">Destaques</h2>
      <table cellpadding="0" cellspacing="0" role="presentation" style="width:100%;">
        ${statementsHtml}
      </table>
    ` : ''}

    ${emailButton('Ver todas as declaracoes', `${SITE_URL}/declaracoes`)}
  `

  return emailLayout(content, {
    preheader: `${data.totalNew} novas declaracoes esta semana`,
  })
}
