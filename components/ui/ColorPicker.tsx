'use client'

import { useState } from 'react'

interface ColorPickerProps {
  value: string
  onChange: (color: string) => void
  label?: string
  presets?: string[]
}

const DEFAULT_PRESETS = [
  '#ef4444', '#f97316', '#eab308', '#22c55e', '#14b8a6',
  '#3b82f6', '#6366f1', '#a855f7', '#ec4899', '#6b7280',
  '#1d4ed8', '#059669', '#d97706', '#dc2626', '#7c3aed',
]

export function ColorPicker({
  value,
  onChange,
  label = 'Cor',
  presets = DEFAULT_PRESETS,
}: ColorPickerProps) {
  const [showInput, setShowInput] = useState(false)

  return (
    <div>
      {label && <label className="text-sm font-medium text-zinc-700 block mb-1">{label}</label>}
      <div className="flex flex-wrap items-center gap-2">
        {presets.map(color => (
          <button
            key={color}
            type="button"
            className={`w-7 h-7 rounded-full border-2 transition-transform hover:scale-110 ${
              value === color ? 'border-zinc-800 scale-110' : 'border-transparent'
            }`}
            style={{ backgroundColor: color }}
            onClick={() => onChange(color)}
            title={color}
            aria-label={`Selecionar cor ${color}`}
          />
        ))}
        <button
          type="button"
          onClick={() => setShowInput(!showInput)}
          className="w-7 h-7 rounded-full border-2 border-dashed border-zinc-300 flex items-center justify-center text-xs text-zinc-400 hover:border-zinc-400"
          title="Cor personalizada"
          aria-label="Cor personalizada"
        >
          #
        </button>
      </div>
      {showInput && (
        <div className="flex items-center gap-2 mt-2">
          <input
            type="color"
            value={value}
            onChange={(e) => onChange(e.target.value)}
            className="w-8 h-8 cursor-pointer rounded border border-zinc-300"
          />
          <input
            type="text"
            value={value}
            onChange={(e) => {
              if (/^#[0-9a-fA-F]{0,6}$/.test(e.target.value)) {
                onChange(e.target.value)
              }
            }}
            className="px-2 py-1 text-sm border border-zinc-300 rounded w-24 font-mono"
            placeholder="#000000"
            maxLength={7}
          />
        </div>
      )}
    </div>
  )
}
