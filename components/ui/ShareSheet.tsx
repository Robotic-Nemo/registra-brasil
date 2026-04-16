'use client'

import { useState, useRef, useEffect } from 'react'
import { Share2, X, Link2, MessageCircle, Mail } from 'lucide-react'

interface ShareSheetProps {
  url?: string
  title?: string
  text?: string
}

export function ShareSheet({ url, title, text }: ShareSheetProps) {
  const [open, setOpen] = useState(false)
  const [copied, setCopied] = useState(false)
  const sheetRef = useRef<HTMLDivElement>(null)

  const shareUrl = typeof window !== 'undefined' ? (url ?? window.location.href) : ''
  const shareTitle = typeof window !== 'undefined' ? (title ?? document.title) : ''
  const shareText = text ?? ''

  useEffect(() => {
    if (!open) return
    function handleClick(e: MouseEvent) {
      if (sheetRef.current && !sheetRef.current.contains(e.target as Node)) {
        setOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClick)
    return () => document.removeEventListener('mousedown', handleClick)
  }, [open])

  async function handleNativeShare() {
    if (typeof navigator.share === 'function') {
      try {
        await navigator.share({ url: shareUrl, title: shareTitle, text: shareText })
        setOpen(false)
      } catch {
        // User cancelled or not supported
      }
    }
  }

  async function handleCopyLink() {
    try {
      await navigator.clipboard.writeText(shareUrl)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Clipboard not available
    }
  }

  const whatsappUrl = `https://wa.me/?text=${encodeURIComponent(`${shareTitle} ${shareUrl}`)}`
  const emailUrl = `mailto:?subject=${encodeURIComponent(shareTitle)}&body=${encodeURIComponent(`${shareText}\n\n${shareUrl}`)}`

  return (
    <div className="relative">
      <button
        onClick={() => {
          if (typeof navigator.share === 'function') {
            handleNativeShare()
          } else {
            setOpen(!open)
          }
        }}
        className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border border-gray-200 bg-white text-gray-600 hover:border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 transition-colors"
        aria-label="Compartilhar"
        aria-expanded={open}
      >
        <Share2 className="h-4 w-4" aria-hidden="true" />
        Compartilhar
      </button>

      {open && (
        <div
          ref={sheetRef}
          className="absolute bottom-full right-0 mb-2 w-64 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-200 dark:border-gray-700 p-3 space-y-1 z-50 animate-in fade-in slide-in-from-bottom-2"
          role="dialog"
          aria-label="Opcoes de compartilhamento"
        >
          <div className="flex items-center justify-between mb-2">
            <span className="text-sm font-medium text-gray-700 dark:text-gray-300">Compartilhar</span>
            <button onClick={() => setOpen(false)} className="p-1 text-gray-400 hover:text-gray-600" aria-label="Fechar">
              <X className="h-4 w-4" />
            </button>
          </div>
          <button
            onClick={handleCopyLink}
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
          >
            <Link2 className="h-4 w-4" aria-hidden="true" />
            {copied ? 'Link copiado!' : 'Copiar link'}
          </button>
          <a
            href={whatsappUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
          >
            <MessageCircle className="h-4 w-4" aria-hidden="true" />
            WhatsApp
          </a>
          <a
            href={emailUrl}
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors"
          >
            <Mail className="h-4 w-4" aria-hidden="true" />
            Email
          </a>
        </div>
      )}
    </div>
  )
}
