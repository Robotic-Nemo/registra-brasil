'use client'

import { useState } from 'react'
import Link from 'next/link'

interface StateMapProps {
  /** Map of UF code to politician count */
  stateCounts: Record<string, number>
}

/**
 * Interactive SVG map of Brazil with clickable states showing politician counts.
 * Uses simplified SVG paths for each Brazilian state.
 */
export function StateMap({ stateCounts }: StateMapProps) {
  const [hovered, setHovered] = useState<string | null>(null)
  const hoveredCount = hovered ? (stateCounts[hovered] ?? 0) : 0
  const maxCount = Math.max(1, ...Object.values(stateCounts))

  function getOpacity(uf: string): number {
    const count = stateCounts[uf] ?? 0
    if (count === 0) return 0.1
    return 0.2 + (count / maxCount) * 0.8
  }

  return (
    <div className="relative">
      {hovered && (
        <div className="absolute top-2 right-2 bg-white border border-gray-200 rounded-lg px-3 py-2 shadow-sm z-10 text-sm">
          <span className="font-semibold">{hovered}</span>:{' '}
          <span className="tabular-nums">{hoveredCount}</span>{' '}
          {hoveredCount === 1 ? 'politico' : 'politicos'}
        </div>
      )}
      <svg
        viewBox="0 0 600 560"
        className="w-full max-w-md mx-auto"
        role="img"
        aria-label="Mapa do Brasil com contagem de politicos por estado"
      >
        {STATE_PATHS.map(({ uf, d }) => (
          <Link key={uf} href={`/politicos/por-estado?uf=${uf}`}>
            <path
              d={d}
              fill="#1d4ed8"
              fillOpacity={getOpacity(uf)}
              stroke="#fff"
              strokeWidth={1.5}
              className="cursor-pointer transition-all duration-150 hover:stroke-blue-700 hover:stroke-2"
              onMouseEnter={() => setHovered(uf)}
              onMouseLeave={() => setHovered(null)}
            >
              <title>{`${uf}: ${stateCounts[uf] ?? 0} politico(s)`}</title>
            </path>
          </Link>
        ))}
      </svg>
    </div>
  )
}

/**
 * Simplified SVG paths for Brazilian states.
 * These are approximate representations for visual display.
 */
const STATE_PATHS: { uf: string; d: string }[] = [
  { uf: 'AC', d: 'M45,310 L95,305 L100,330 L50,335 Z' },
  { uf: 'AM', d: 'M95,220 L230,215 L235,295 L100,300 Z' },
  { uf: 'RR', d: 'M150,140 L200,135 L205,210 L155,215 Z' },
  { uf: 'AP', d: 'M280,155 L320,150 L325,210 L285,215 Z' },
  { uf: 'PA', d: 'M230,195 L370,190 L375,270 L235,275 Z' },
  { uf: 'MA', d: 'M370,215 L430,210 L435,275 L375,280 Z' },
  { uf: 'PI', d: 'M420,255 L465,250 L470,330 L425,335 Z' },
  { uf: 'CE', d: 'M465,230 L520,225 L525,280 L470,285 Z' },
  { uf: 'RN', d: 'M520,250 L565,247 L567,275 L522,278 Z' },
  { uf: 'PB', d: 'M510,280 L565,277 L567,300 L512,303 Z' },
  { uf: 'PE', d: 'M470,300 L565,295 L567,320 L472,325 Z' },
  { uf: 'AL', d: 'M520,320 L560,318 L562,340 L522,342 Z' },
  { uf: 'SE', d: 'M510,340 L545,338 L547,358 L512,360 Z' },
  { uf: 'BA', d: 'M410,310 L510,305 L515,415 L415,420 Z' },
  { uf: 'TO', d: 'M340,275 L400,270 L405,360 L345,365 Z' },
  { uf: 'GO', d: 'M310,365 L400,360 L405,430 L315,435 Z' },
  { uf: 'DF', d: 'M370,385 L395,383 L397,400 L372,402 Z' },
  { uf: 'MT', d: 'M195,310 L310,305 L315,410 L200,415 Z' },
  { uf: 'MS', d: 'M230,415 L315,410 L320,480 L235,485 Z' },
  { uf: 'MG', d: 'M370,400 L490,395 L495,475 L375,480 Z' },
  { uf: 'ES', d: 'M495,430 L540,428 L542,470 L497,472 Z' },
  { uf: 'RJ', d: 'M450,475 L530,472 L532,500 L452,503 Z' },
  { uf: 'SP', d: 'M330,455 L450,450 L455,510 L335,515 Z' },
  { uf: 'PR', d: 'M290,495 L380,490 L385,535 L295,540 Z' },
  { uf: 'SC', d: 'M310,535 L385,530 L388,560 L313,563 Z' },
  { uf: 'RS', d: 'M270,545 L360,540 L365,600 L275,605 Z' },
  { uf: 'RO', d: 'M120,310 L200,305 L205,370 L125,375 Z' },
]
