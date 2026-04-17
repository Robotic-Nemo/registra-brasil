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
  const [shareUrl, setShareUrl] = useState(url ?? '')
  const [shareTitle, setShareTitle] = useState(title ?? '')
  const sheetRef = useRef<HTMLDivElement>(null)
  const copyTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null)
  const triggerRef = useRef<HTMLButtonElement>(null)
  const shareText = text ?? ''

  // Populate url/title from the browser context on mount (SSR-safe).
  useEffect(() => {
    if (typeof window === 'undefined') return
    if (!url) setShareUrl(window.location.href)
    if (!title) setShareTitle(document.title)
  }, [url, title])

  // Close on outside click + ESC; restore focus to trigger on close.
  useEffect(() => {
    if (!open) return
    function handleClick(e: MouseEvent) {
      if (sheetRef.current && !sheetRef.current.contains(e.target as Node)) {
        setOpen(false)
      }
    }
    function handleKey(e: KeyboardEvent) {
      if (e.key === 'Escape') {
        setOpen(false)
        triggerRef.current?.focus()
      }
    }
    document.addEventListener('mousedown', handleClick)
    document.addEventListener('keydown', handleKey)
    return () => {
      document.removeEventListener('mousedown', handleClick)
      document.removeEventListener('keydown', handleKey)
    }
  }, [open])

  // Cleanup copy timer on unmount.
  useEffect(() => {
    return () => {
      if (copyTimerRef.current) clearTimeout(copyTimerRef.current)
    }
  }, [])

  async function handleNativeShare() {
    if (typeof navigator.share === 'function') {
      try {
        await navigator.share({ url: shareUrl, title: shareTitle, text: shareText })
        setOpen(false)
      } catch {
        // User cancelled or not supported; fall back to the menu.
      }
    }
  }

  async function handleCopyLink() {
    const markCopied = () => {
      setCopied(true)
      if (copyTimerRef.current) clearTimeout(copyTimerRef.current)
      copyTimerRef.current = setTimeout(() => setCopied(false), 2000)
    }

    if (navigator.clipboard?.writeText) {
      try {
        await navigator.clipboard.writeText(shareUrl)
        markCopied()
        return
      } catch {
        // Fall through to legacy fallback.
      }
    }

    // Legacy fallback for insecure contexts / older browsers.
    const el = document.createElement('textarea')
    el.value = shareUrl
    el.setAttribute('readonly', '')
    el.style.position = 'absolute'
    el.style.left = '-9999px'
    document.body.appendChild(el)
    el.select()
    try {
      document.execCommand('copy')
      markCopied()
    } finally {
      document.body.removeChild(el)
    }
  }

  const whatsappUrl = `https://wa.me/?text=${encodeURIComponent(`${shareTitle} ${shareUrl}`)}`
  const emailUrl = `mailto:?subject=${encodeURIComponent(shareTitle)}&body=${encodeURIComponent(`${shareText}\n\n${shareUrl}`)}`

  return (
    <div className="relative">
      <button
        ref={triggerRef}
        type="button"
        onClick={() => {
          if (typeof navigator.share === 'function') {
            handleNativeShare()
          } else {
            setOpen(!open)
          }
        }}
        className="inline-flex items-center gap-1.5 px-3 py-1.5 text-sm rounded-lg border border-gray-200 bg-white text-gray-600 hover:border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        aria-label="Compartilhar"
        aria-expanded={open}
        aria-haspopup="dialog"
      >
        <Share2 className="h-4 w-4" aria-hidden="true" />
        Compartilhar
      </button>

      {open && (
        <div
          ref={sheetRef}
          className="absolute bottom-full right-0 mb-2 w-64 bg-white dark:bg-gray-800 rounded-xl shadow-xl border border-gray-200 dark:border-gray-700 p-3 space-y-1 z-50 animate-in fade-in slide-in-from-bottom-2"
          role="dialog"
          aria-modal="true"
          aria-label="Opções de compartilhamento"
        >
          <div className="flex items-center justify-between mb-2">
            <span className="text-sm font-medium text-gray-700 dark:text-gray-300">Compartilhar</span>
            <button
              type="button"
              onClick={() => {
                setOpen(false)
                triggerRef.current?.focus()
              }}
              className="p-1 text-gray-400 hover:text-gray-600 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 rounded"
              aria-label="Fechar"
            >
              <X className="h-4 w-4" aria-hidden="true" />
            </button>
          </div>
          <button
            type="button"
            onClick={handleCopyLink}
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            aria-live="polite"
          >
            <Link2 className="h-4 w-4" aria-hidden="true" />
            {copied ? 'Link copiado!' : 'Copiar link'}
          </button>
          <a
            href={whatsappUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          >
            <MessageCircle className="h-4 w-4" aria-hidden="true" />
            WhatsApp
          </a>
          <a
            href={emailUrl}
            className="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          >
            <Mail className="h-4 w-4" aria-hidden="true" />
            Email
          </a>
        </div>
      )}
    </div>
  )
}
