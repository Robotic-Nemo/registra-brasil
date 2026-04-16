'use client'

import { useState } from 'react'
import type { ShareLinks } from '@/lib/utils/share'

interface SocialShareButtonsProps {
  links: ShareLinks
  title: string
  compact?: boolean
}

const PLATFORMS = [
  { key: 'twitter' as const, label: 'X (Twitter)', icon: '𝕏', color: 'hover:bg-black hover:text-white' },
  { key: 'whatsapp' as const, label: 'WhatsApp', icon: '💬', color: 'hover:bg-green-500 hover:text-white' },
  { key: 'telegram' as const, label: 'Telegram', icon: '✈️', color: 'hover:bg-blue-500 hover:text-white' },
  { key: 'facebook' as const, label: 'Facebook', icon: 'f', color: 'hover:bg-blue-600 hover:text-white' },
  { key: 'linkedin' as const, label: 'LinkedIn', icon: 'in', color: 'hover:bg-blue-700 hover:text-white' },
  { key: 'email' as const, label: 'E-mail', icon: '✉', color: 'hover:bg-zinc-700 hover:text-white' },
] as const

export function SocialShareButtons({ links, title, compact = false }: SocialShareButtonsProps) {
  const [copied, setCopied] = useState(false)

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(links.copy)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      // Fallback
      const input = document.createElement('input')
      input.value = links.copy
      document.body.appendChild(input)
      input.select()
      document.execCommand('copy')
      document.body.removeChild(input)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    }
  }

  return (
    <div className="flex flex-wrap items-center gap-2">
      {!compact && (
        <span className="text-xs text-zinc-500 mr-1">Compartilhar:</span>
      )}
      {PLATFORMS.map(({ key, label, icon, color }) => (
        <a
          key={key}
          href={links[key]}
          target="_blank"
          rel="noopener noreferrer"
          className={`inline-flex items-center justify-center w-8 h-8 rounded-full border border-zinc-200 text-zinc-600 text-xs font-bold transition-colors ${color}`}
          title={`Compartilhar no ${label}`}
          aria-label={`Compartilhar "${title}" no ${label}`}
        >
          {icon}
        </a>
      ))}
      <button
        onClick={handleCopy}
        className="inline-flex items-center justify-center w-8 h-8 rounded-full border border-zinc-200 text-zinc-600 text-xs transition-colors hover:bg-zinc-100"
        title={copied ? 'Link copiado!' : 'Copiar link'}
        aria-label="Copiar link"
      >
        {copied ? '✓' : '🔗'}
      </button>
    </div>
  )
}
