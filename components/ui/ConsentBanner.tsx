'use client'

import { useState, useEffect } from 'react'
import { Shield, X } from 'lucide-react'

const CONSENT_KEY = 'registra-brasil:lgpd-consent'

interface ConsentState {
  analytics: boolean
  functional: boolean
  timestamp: string
}

export function ConsentBanner() {
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    try {
      const stored = localStorage.getItem(CONSENT_KEY)
      if (!stored) setVisible(true)
    } catch {
      // Storage unavailable
    }
  }, [])

  function handleAcceptAll() {
    saveConsent({ analytics: true, functional: true })
  }

  function handleAcceptNecessary() {
    saveConsent({ analytics: false, functional: true })
  }

  function saveConsent(partial: Omit<ConsentState, 'timestamp'>) {
    const consent: ConsentState = { ...partial, timestamp: new Date().toISOString() }
    try {
      localStorage.setItem(CONSENT_KEY, JSON.stringify(consent))
    } catch {
      // Storage unavailable
    }
    setVisible(false)
  }

  if (!visible) return null

  return (
    <div
      className="fixed bottom-0 left-0 right-0 z-50 bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700 shadow-xl p-4 sm:p-6"
      role="dialog"
      aria-label="Consentimento de cookies e dados"
    >
      <div className="container mx-auto max-w-4xl flex flex-col sm:flex-row items-start sm:items-center gap-4">
        <Shield className="h-6 w-6 text-blue-600 dark:text-blue-400 shrink-0 mt-0.5" aria-hidden="true" />
        <div className="flex-1">
          <p className="text-sm text-gray-700 dark:text-gray-300">
            Utilizamos cookies e tecnologias semelhantes para melhorar sua experiencia.
            De acordo com a LGPD (Lei Geral de Protecao de Dados), solicitamos seu
            consentimento para coleta de dados analiticos.
          </p>
          <a href="/privacidade" className="text-sm text-blue-600 dark:text-blue-400 hover:underline mt-1 inline-block">
            Politica de privacidade
          </a>
        </div>
        <div className="flex items-center gap-2 shrink-0">
          <button
            onClick={handleAcceptNecessary}
            className="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 rounded-lg transition-colors"
          >
            Apenas necessarios
          </button>
          <button
            onClick={handleAcceptAll}
            className="px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors"
          >
            Aceitar todos
          </button>
        </div>
        <button
          onClick={handleAcceptNecessary}
          className="absolute top-2 right-2 sm:hidden p-1 text-gray-400"
          aria-label="Fechar"
        >
          <X className="h-4 w-4" />
        </button>
      </div>
    </div>
  )
}
