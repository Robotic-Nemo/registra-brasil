/**
 * Verification complete notification email template.
 */

import { emailLayout, emailButton, escapeHtml, SITE_URL } from '../templates'

interface VerificationData {
  summary: string
  politician: string
  party: string
  status: 'verified' | 'disputed' | 'removed'
  date: string
  url: string
  editorNotes?: string
}

const STATUS_MAP = {
  verified: { label: 'Verificada', color: '#16a34a', bg: '#f0fdf4' },
  disputed: { label: 'Contestada', color: '#dc2626', bg: '#fef2f2' },
  removed: { label: 'Removida', color: '#6b7280', bg: '#f9fafb' },
}

export function verificationCompleteTemplate(data: VerificationData): string {
  const statusInfo = STATUS_MAP[data.status]

  const content = `
    <h1 style="margin:0 0 16px;font-size:20px;color:#111827;">Verificacao Concluida</h1>

    <div style="background-color:${statusInfo.bg};border-radius:6px;padding:16px;border-left:3px solid ${statusInfo.color};">
      <div style="margin:0 0 8px;">
        <span style="display:inline-block;padding:2px 8px;border-radius:12px;font-size:12px;font-weight:600;color:${statusInfo.color};background-color:${statusInfo.color}15;">
          ${statusInfo.label}
        </span>
      </div>
      <p style="margin:0 0 8px;font-size:14px;color:#374151;font-style:italic;">
        &ldquo;${escapeHtml(data.summary)}&rdquo;
      </p>
      <p style="margin:0;font-size:13px;color:#6b7280;">
        <strong>${escapeHtml(data.politician)}</strong> (${escapeHtml(data.party)})
      </p>
    </div>

    ${data.editorNotes ? `
      <div style="margin:16px 0;padding:12px;background-color:#f9fafb;border-radius:6px;">
        <p style="margin:0 0 4px;font-size:12px;font-weight:600;color:#374151;">Notas do editor:</p>
        <p style="margin:0;font-size:13px;color:#6b7280;">${escapeHtml(data.editorNotes)}</p>
      </div>
    ` : ''}

    ${emailButton('Ver declaracao', data.url)}

    <p style="margin:16px 0 0;font-size:12px;color:#9ca3af;">
      Voce recebeu este email porque acompanha verificacoes no Registra Brasil.
    </p>
  `

  return emailLayout(content, {
    preheader: `Declaracao ${statusInfo.label.toLowerCase()}: ${data.summary.slice(0, 50)}...`,
  })
}
