'use client'

import { useState } from 'react'
import { Download, Image as ImageIcon, ChevronDown } from 'lucide-react'

interface Props {
  statementId: string
  statementSlug: string | null
}

const THEMES = [
  { key: 'dark', label: 'Escuro' },
  { key: 'light', label: 'Claro' },
  { key: 'minimal', label: 'Minimalista' },
] as const

const SIZES = [
  { key: 'og', label: 'Twitter / Facebook (1200×630)', suffix: '' },
  { key: 'square', label: 'Instagram feed (1080×1080)', suffix: '-quadrado' },
  { key: 'portrait', label: 'Instagram stories (1080×1350)', suffix: '-retrato' },
] as const

/**
 * Client-side generator that surfaces the share-card URL with chosen
 * theme + size and a quick "baixar" link. No JS required to actually
 * download — the link opens the Edge-rendered PNG with
 * Content-Disposition not set (users save via right-click) + a
 * direct download attribute for one-click save.
 */
export function ShareCardMenu({ statementId, statementSlug }: Props) {
  const [open, setOpen] = useState(false)
  const [theme, setTheme] = useState<(typeof THEMES)[number]['key']>('dark')
  const [size, setSize] = useState<(typeof SIZES)[number]['key']>('og')

  const identifier = statementSlug ?? statementId
  const url = `/declaracao/${identifier}/share-card?theme=${theme}&size=${size}`
  const sizeObj = SIZES.find((s) => s.key === size)!
  const filename = `registra-brasil-${identifier.slice(0, 40)}${sizeObj.suffix}.png`

  if (!open) {
    return (
      <button
        type="button"
        onClick={() => setOpen(true)}
        className="inline-flex items-center gap-1.5 text-xs px-3 py-1.5 border border-gray-300 text-gray-700 hover:bg-gray-50 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
      >
        <ImageIcon className="w-3.5 h-3.5" aria-hidden="true" />
        Gerar imagem para compartilhar
        <ChevronDown className="w-3 h-3" aria-hidden="true" />
      </button>
    )
  }

  return (
    <div className="bg-white border border-gray-200 rounded-lg p-3 space-y-3 text-sm max-w-md">
      <div className="flex items-center justify-between">
        <p className="font-semibold text-gray-900">Imagem para compartilhar</p>
        <button type="button" onClick={() => setOpen(false)} className="text-xs text-gray-500 hover:text-gray-700">Fechar</button>
      </div>

      <div>
        <p className="text-xs font-medium text-gray-700 mb-1">Tema</p>
        <div className="flex gap-2 flex-wrap">
          {THEMES.map((t) => (
            <button
              key={t.key}
              type="button"
              onClick={() => setTheme(t.key)}
              className={`text-xs px-2.5 py-1 rounded-full border ${theme === t.key ? 'bg-blue-600 border-blue-600 text-white' : 'border-gray-300 text-gray-700 hover:bg-gray-50'}`}
            >
              {t.label}
            </button>
          ))}
        </div>
      </div>

      <div>
        <p className="text-xs font-medium text-gray-700 mb-1">Formato</p>
        <div className="flex flex-col gap-1.5">
          {SIZES.map((s) => (
            <label key={s.key} className="text-xs inline-flex items-center gap-2 cursor-pointer">
              <input
                type="radio"
                name="size"
                value={s.key}
                checked={size === s.key}
                onChange={() => setSize(s.key)}
                className="accent-blue-600"
              />
              {s.label}
            </label>
          ))}
        </div>
      </div>

      <div className="bg-gray-50 border border-gray-200 rounded p-1 flex items-center justify-center aspect-[1200/630]" style={{ aspectRatio: size === 'square' ? '1 / 1' : size === 'portrait' ? '1080 / 1350' : '1200 / 630' }}>
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img src={url} alt="Pré-visualização" className="w-full h-auto object-contain max-h-64" />
      </div>

      <div className="flex gap-2">
        <a
          href={url}
          download={filename}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-medium rounded"
        >
          <Download className="w-3.5 h-3.5" aria-hidden="true" />
          Baixar PNG
        </a>
        <a
          href={url}
          target="_blank"
          rel="noopener noreferrer"
          className="px-3 py-1.5 border border-gray-300 text-gray-700 hover:bg-gray-50 text-xs font-medium rounded"
        >
          Abrir em nova aba
        </a>
      </div>
      <p className="text-[11px] text-gray-500">
        Imagens são geradas sob demanda e liberadas sob CC BY 4.0: cite &ldquo;Registra Brasil&rdquo;
        ao compartilhar.
      </p>
    </div>
  )
}
