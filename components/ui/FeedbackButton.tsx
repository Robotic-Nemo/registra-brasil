'use client'

import { useState } from 'react'
import { MessageSquare, X, Send } from 'lucide-react'

interface FeedbackButtonProps {
  onSubmit?: (feedback: { type: string; message: string }) => void | Promise<void>
}

const FEEDBACK_TYPES = [
  { value: 'bug', label: 'Problema' },
  { value: 'feature', label: 'Sugestao' },
  { value: 'correction', label: 'Correcao' },
  { value: 'other', label: 'Outro' },
] as const

export function FeedbackButton({ onSubmit }: FeedbackButtonProps) {
  const [open, setOpen] = useState(false)
  const [type, setType] = useState('bug')
  const [message, setMessage] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!message.trim()) return

    setSubmitting(true)
    try {
      await onSubmit?.({ type, message: message.trim() })
      setSubmitted(true)
      setTimeout(() => {
        setOpen(false)
        setSubmitted(false)
        setMessage('')
        setType('bug')
      }, 2000)
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <>
      <button
        type="button"
        onClick={() => setOpen(!open)}
        aria-label="Enviar feedback"
        className="fixed bottom-6 right-6 z-40 w-12 h-12 rounded-full bg-blue-600 text-white shadow-lg hover:bg-blue-700 transition-colors flex items-center justify-center"
      >
        {open ? <X className="w-5 h-5" /> : <MessageSquare className="w-5 h-5" />}
      </button>

      {open && (
        <div
          role="dialog"
          aria-label="Enviar feedback"
          className="fixed bottom-20 right-6 z-40 w-80 bg-white rounded-lg shadow-xl border border-gray-200 overflow-hidden"
        >
          <div className="p-4 border-b border-gray-100 bg-gray-50">
            <h3 className="font-semibold text-gray-900 text-sm">Enviar feedback</h3>
            <p className="text-xs text-gray-500 mt-0.5">Ajude-nos a melhorar o Registra Brasil</p>
          </div>

          {submitted ? (
            <div className="p-6 text-center">
              <p className="text-sm text-green-700 font-medium">Obrigado pelo seu feedback!</p>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="p-4 flex flex-col gap-3">
              <div className="flex flex-wrap gap-1.5">
                {FEEDBACK_TYPES.map((ft) => (
                  <button
                    key={ft.value}
                    type="button"
                    onClick={() => setType(ft.value)}
                    className={`text-xs px-2.5 py-1 rounded-full border transition-colors ${
                      type === ft.value
                        ? 'bg-blue-100 border-blue-300 text-blue-700'
                        : 'border-gray-200 text-gray-600 hover:bg-gray-50'
                    }`}
                  >
                    {ft.label}
                  </button>
                ))}
              </div>

              <textarea
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                placeholder="Descreva seu feedback..."
                rows={3}
                className="w-full text-sm border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 resize-none"
                required
              />

              <button
                type="submit"
                disabled={submitting || !message.trim()}
                className="flex items-center justify-center gap-2 bg-blue-600 text-white text-sm font-medium px-4 py-2 rounded-lg hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
              >
                <Send className="w-4 h-4" />
                {submitting ? 'Enviando...' : 'Enviar'}
              </button>
            </form>
          )}
        </div>
      )}
    </>
  )
}
