'use client'

import { useEffect, useRef, useState } from 'react'
import { Share2, Check } from 'lucide-react'

interface ShareButtonProps {
  url?: string
  title?: string
}

export function ShareButton({ url, title }: ShareButtonProps) {
  const [copied, setCopied] = useState(false)
  const timeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null)

  // Clean up timeout on unmount to avoid state updates after unmount.
  useEffect(() => {
    return () => {
      if (timeoutRef.current) clearTimeout(timeoutRef.current)
    }
  }, [])

  function markCopied() {
    setCopied(true)
    if (timeoutRef.current) clearTimeout(timeoutRef.current)
    timeoutRef.current = setTimeout(() => setCopied(false), 2000)
  }

  async function handleShare() {
    const shareUrl = url ?? window.location.href
    const shareTitle = title ?? document.title

    // Use native share on mobile if available.
    if (typeof navigator.share === 'function') {
      try {
        await navigator.share({ title: shareTitle, url: shareUrl })
        return
      } catch {
        // User cancelled or API error — fall through to clipboard.
      }
    }

    try {
      await navigator.clipboard.writeText(shareUrl)
      markCopied()
    } catch {
      // Fallback: select-and-copy.
      const input = document.createElement('input')
      input.value = shareUrl
      // Prevent iOS zoom / layout shift.
      input.setAttribute('readonly', '')
      input.style.position = 'absolute'
      input.style.left = '-9999px'
      document.body.appendChild(input)
      input.select()
      try {
        document.execCommand('copy')
        markCopied()
      } finally {
        document.body.removeChild(input)
      }
    }
  }

  return (
    <button
      type="button"
      onClick={handleShare}
      aria-label={copied ? 'Link copiado para a área de transferência' : 'Compartilhar esta página'}
      aria-live="polite"
      className="flex items-center gap-1.5 text-xs text-gray-500 hover:text-blue-600 transition-colors px-2.5 py-1.5 rounded-lg hover:bg-blue-50 border border-gray-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
    >
      {copied ? (
        <>
          <Check className="w-3.5 h-3.5 text-green-600" aria-hidden="true" />
          <span className="text-green-600 font-medium">Copiado!</span>
        </>
      ) : (
        <>
          <Share2 className="w-3.5 h-3.5" aria-hidden="true" />
          Compartilhar
        </>
      )}
    </button>
  )
}
