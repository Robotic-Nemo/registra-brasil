'use client'

import { Link2, Check, ExternalLink } from 'lucide-react'
import { useState } from 'react'

interface Props {
  url: string
  text: string
}

export function ShareCard({ url, text }: Props) {
  const [copied, setCopied] = useState(false)
  const fullUrl = typeof window !== 'undefined' ? `${window.location.origin}${url}` : url
  const encodedUrl = encodeURIComponent(fullUrl)
  const encodedText = encodeURIComponent(text)

  async function copyLink() {
    try {
      await navigator.clipboard.writeText(fullUrl)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch { /* ignore */ }
  }

  return (
    <div className="flex items-center gap-2">
      <a
        href={`https://twitter.com/intent/tweet?text=${encodedText}&url=${encodedUrl}`}
        target="_blank"
        rel="noopener noreferrer"
        className="p-2 rounded-lg hover:bg-gray-100 text-gray-500 hover:text-blue-500 transition-colors text-xs font-bold"
        aria-label="Compartilhar no Twitter/X"
      >
        𝕏
      </a>
      <a
        href={`https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`}
        target="_blank"
        rel="noopener noreferrer"
        className="p-2 rounded-lg hover:bg-gray-100 text-gray-500 hover:text-blue-700 transition-colors"
        aria-label="Compartilhar no Facebook"
      >
        <ExternalLink className="w-4 h-4" />
      </a>
      <a
        href={`https://api.whatsapp.com/send?text=${encodedText}%20${encodedUrl}`}
        target="_blank"
        rel="noopener noreferrer"
        className="p-2 rounded-lg hover:bg-gray-100 text-gray-500 hover:text-green-600 transition-colors text-xs font-bold"
        aria-label="Compartilhar no WhatsApp"
      >
        WA
      </a>
      <button
        onClick={copyLink}
        className="p-2 rounded-lg hover:bg-gray-100 text-gray-500 hover:text-gray-700 transition-colors"
        aria-label={copied ? 'Link copiado!' : 'Copiar link'}
      >
        {copied ? <Check className="w-4 h-4 text-green-600" /> : <Link2 className="w-4 h-4" />}
      </button>
    </div>
  )
}
