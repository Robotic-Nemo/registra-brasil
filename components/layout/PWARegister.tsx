'use client'

import { useEffect, useState } from 'react'
import { Download, X } from 'lucide-react'

type BeforeInstallPromptEvent = Event & {
  prompt: () => Promise<void>
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>
}

const DISMISS_KEY = 'rb:pwa-install-dismissed'

/**
 * Registers the service worker on mount and surfaces the soft install
 * prompt when the browser fires `beforeinstallprompt`. The prompt is
 * dismissible and the dismissal is sticky (localStorage) so we don't
 * nag on every page view.
 */
export function PWARegister() {
  const [deferredPrompt, setDeferredPrompt] = useState<BeforeInstallPromptEvent | null>(null)
  const [dismissed, setDismissed] = useState(false)

  useEffect(() => {
    // Check if user already dismissed
    try {
      if (localStorage.getItem(DISMISS_KEY)) setDismissed(true)
    } catch { /* storage blocked */ }

    // Register the service worker
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker
        .register('/sw.js', { scope: '/' })
        .catch((err) => console.warn('[pwa] SW register failed:', err))
    }

    // Capture install prompt
    const handler = (e: Event) => {
      e.preventDefault()
      setDeferredPrompt(e as BeforeInstallPromptEvent)
    }
    window.addEventListener('beforeinstallprompt', handler)

    return () => window.removeEventListener('beforeinstallprompt', handler)
  }, [])

  async function onInstall() {
    if (!deferredPrompt) return
    await deferredPrompt.prompt()
    try { await deferredPrompt.userChoice } catch { /* ignore */ }
    setDeferredPrompt(null)
  }

  function onDismiss() {
    setDismissed(true)
    try { localStorage.setItem(DISMISS_KEY, '1') } catch { /* ignore */ }
    setDeferredPrompt(null)
  }

  if (!deferredPrompt || dismissed) return null

  return (
    <div
      role="complementary"
      aria-label="Instalar aplicativo"
      className="fixed bottom-4 right-4 z-40 bg-white border border-blue-200 shadow-lg rounded-xl p-3 max-w-xs text-sm"
    >
      <div className="flex items-start gap-2">
        <Download className="w-5 h-5 text-blue-700 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div className="flex-1">
          <p className="font-semibold text-gray-900 mb-1">Instalar Registra Brasil</p>
          <p className="text-xs text-gray-600 mb-2">
            Abra como aplicativo, sem barra do navegador, com cache offline.
          </p>
          <div className="flex gap-2">
            <button
              type="button"
              onClick={onInstall}
              className="px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium rounded"
            >
              Instalar
            </button>
            <button
              type="button"
              onClick={onDismiss}
              className="px-3 py-1.5 border border-gray-300 text-gray-600 hover:bg-gray-50 text-xs font-medium rounded"
            >
              Agora não
            </button>
          </div>
        </div>
        <button
          type="button"
          onClick={onDismiss}
          aria-label="Fechar"
          className="text-gray-400 hover:text-gray-600 p-1 -m-1"
        >
          <X className="w-4 h-4" aria-hidden="true" />
        </button>
      </div>
    </div>
  )
}
