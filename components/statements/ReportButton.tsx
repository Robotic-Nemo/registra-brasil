'use client'

import { useState } from 'react'

interface ReportButtonProps {
  statementId: string
}

const REASONS = [
  'Informação incorreta',
  'Citação fora de contexto',
  'Fonte inválida ou expirada',
  'Atribuição incorreta (político errado)',
  'Conteúdo duplicado',
  'Outro motivo',
] as const

export function ReportButton({ statementId }: ReportButtonProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [selectedReason, setSelectedReason] = useState('')
  const [details, setDetails] = useState('')
  const [submitted, setSubmitted] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!selectedReason) return

    setSubmitting(true)

    // In a real app, this would POST to an API
    // For now, log and show success
    console.info('[Report]', {
      statementId,
      reason: selectedReason,
      details: details.trim() || undefined,
      timestamp: new Date().toISOString(),
    })

    // Simulate API call
    await new Promise(r => setTimeout(r, 500))

    setSubmitted(true)
    setSubmitting(false)
  }

  if (submitted) {
    return (
      <div className="text-sm text-green-700 bg-green-50 border border-green-200 rounded-lg p-3">
        ✓ Relatório enviado. Obrigado pela contribuição!
      </div>
    )
  }

  if (!isOpen) {
    return (
      <button
        onClick={() => setIsOpen(true)}
        className="text-xs text-zinc-400 hover:text-zinc-600 transition-colors"
        aria-label="Reportar problema com esta declaração"
      >
        ⚑ Reportar problema
      </button>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="border border-zinc-200 rounded-lg p-4 space-y-3">
      <div className="flex items-center justify-between">
        <h3 className="text-sm font-semibold text-zinc-800">Reportar problema</h3>
        <button
          type="button"
          onClick={() => setIsOpen(false)}
          className="text-zinc-400 hover:text-zinc-600 text-sm"
          aria-label="Fechar"
        >
          ×
        </button>
      </div>

      <fieldset>
        <legend className="text-xs text-zinc-500 mb-2">Motivo:</legend>
        <div className="space-y-1">
          {REASONS.map((reason) => (
            <label key={reason} className="flex items-center gap-2 text-sm cursor-pointer">
              <input
                type="radio"
                name="reason"
                value={reason}
                checked={selectedReason === reason}
                onChange={(e) => setSelectedReason(e.target.value)}
                className="text-blue-600"
              />
              <span className="text-zinc-700">{reason}</span>
            </label>
          ))}
        </div>
      </fieldset>

      <div>
        <label htmlFor="report-details" className="text-xs text-zinc-500 block mb-1">
          Detalhes (opcional):
        </label>
        <textarea
          id="report-details"
          value={details}
          onChange={(e) => setDetails(e.target.value)}
          className="w-full text-sm border border-zinc-300 rounded px-3 py-2 resize-none h-16"
          placeholder="Descreva o problema em mais detalhes..."
          maxLength={500}
        />
      </div>

      <div className="flex items-center gap-2">
        <button
          type="submit"
          disabled={!selectedReason || submitting}
          className="px-3 py-1.5 bg-red-600 text-white text-sm rounded hover:bg-red-700 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {submitting ? 'Enviando...' : 'Enviar relatório'}
        </button>
        <button
          type="button"
          onClick={() => setIsOpen(false)}
          className="px-3 py-1.5 text-sm text-zinc-600 hover:text-zinc-800"
        >
          Cancelar
        </button>
      </div>
    </form>
  )
}
