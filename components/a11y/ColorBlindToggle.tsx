'use client'

import { useState, useEffect } from 'react'

type ColorBlindMode = 'none' | 'protanopia' | 'deuteranopia' | 'tritanopia' | 'achromatopsia'

const modes: { value: ColorBlindMode; label: string; filter: string }[] = [
  { value: 'none', label: 'Normal', filter: 'none' },
  { value: 'protanopia', label: 'Protanopia', filter: 'url(#protanopia)' },
  { value: 'deuteranopia', label: 'Deuteranopia', filter: 'url(#deuteranopia)' },
  { value: 'tritanopia', label: 'Tritanopia', filter: 'url(#tritanopia)' },
  { value: 'achromatopsia', label: 'Acromatopsia', filter: 'grayscale(100%)' },
]

/**
 * Dev-only tool to simulate color blindness modes.
 * Applies CSS filters to the page.
 */
export function ColorBlindToggle() {
  const [mode, setMode] = useState<ColorBlindMode>('none')

  useEffect(() => {
    const m = modes.find((m) => m.value === mode)
    if (m) {
      document.documentElement.style.filter = m.filter === 'none' ? '' : m.filter
    }
    return () => {
      document.documentElement.style.filter = ''
    }
  }, [mode])

  if (process.env.NODE_ENV !== 'development') return null

  return (
    <div className="space-y-1">
      <svg className="absolute w-0 h-0" aria-hidden="true">
        <defs>
          <filter id="protanopia">
            <feColorMatrix
              type="matrix"
              values="0.567 0.433 0 0 0
                      0.558 0.442 0 0 0
                      0     0.242 0.758 0 0
                      0     0     0     1 0"
            />
          </filter>
          <filter id="deuteranopia">
            <feColorMatrix
              type="matrix"
              values="0.625 0.375 0 0 0
                      0.7   0.3   0 0 0
                      0     0.3   0.7 0 0
                      0     0     0   1 0"
            />
          </filter>
          <filter id="tritanopia">
            <feColorMatrix
              type="matrix"
              values="0.95 0.05  0    0 0
                      0    0.433 0.567 0 0
                      0    0.475 0.525 0 0
                      0    0     0     1 0"
            />
          </filter>
        </defs>
      </svg>
      <label className="text-xs text-gray-500 dark:text-gray-400 block">Simular daltonismo</label>
      <select
        value={mode}
        onChange={(e) => setMode(e.target.value as ColorBlindMode)}
        className="text-xs bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded px-2 py-1 text-gray-700 dark:text-gray-300"
        aria-label="Modo de simulacao de daltonismo"
      >
        {modes.map((m) => (
          <option key={m.value} value={m.value}>
            {m.label}
          </option>
        ))}
      </select>
    </div>
  )
}
