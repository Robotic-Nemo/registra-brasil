import { BRAZIL_TILES, GRID_COLS, GRID_ROWS, type TileUF } from '@/lib/maps/brazil-tile'

interface Props {
  counts: Record<string, number>
  /**
   * Optional per-UF label (e.g. count formatted). Falls back to raw count.
   */
  labelFor?: (uf: TileUF, count: number) => string
  /**
   * Base color used for the choropleth ramp (0→white, max→this color).
   */
  rampColor?: string
  /**
   * Link template. `{uf}` is replaced with the UF code.
   */
  hrefTemplate?: string
  title?: string
}

const CELL = 78
const GAP = 6

function interpolate(baseHex: string, t: number): string {
  // Convert hex to rgb, mix toward white at low t (0→white, 1→base).
  const m = baseHex.match(/^#([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})$/i)
  if (!m) return baseHex
  const br = parseInt(m[1], 16)
  const bg = parseInt(m[2], 16)
  const bb = parseInt(m[3], 16)
  const r = Math.round(255 + (br - 255) * t)
  const g = Math.round(255 + (bg - 255) * t)
  const b = Math.round(255 + (bb - 255) * t)
  return `rgb(${r}, ${g}, ${b})`
}

export function BrazilTileMap({
  counts,
  labelFor,
  rampColor = '#4f46e5',
  hrefTemplate = '/estados/{uf}',
  title = 'Mapa em grade das unidades da federação',
}: Props) {
  const max = Math.max(1, ...Object.values(counts))
  const width = GRID_COLS * CELL + (GRID_COLS + 1) * GAP
  const height = GRID_ROWS * CELL + (GRID_ROWS + 1) * GAP

  return (
    <figure className="overflow-x-auto">
      <svg
        viewBox={`0 0 ${width} ${height}`}
        role="img"
        aria-label={title}
        className="mx-auto h-auto w-full max-w-3xl text-gray-800 dark:text-gray-100"
      >
        <title>{title}</title>
        {BRAZIL_TILES.map((tile) => {
          const count = counts[tile.uf] ?? 0
          const t = count === 0 ? 0 : 0.12 + 0.88 * (count / max)
          const fill = count === 0 ? '#f3f4f6' : interpolate(rampColor, t)
          const x = GAP + tile.col * (CELL + GAP)
          const y = GAP + tile.row * (CELL + GAP)
          const label = labelFor ? labelFor(tile, count) : count.toLocaleString('pt-BR')
          const href = hrefTemplate.replace('{uf}', tile.uf.toLowerCase())
          const textDark = count > 0 && t > 0.55
          return (
            <a key={tile.uf} href={href} aria-label={`${tile.name}: ${count} declarações`}>
              <g>
                <rect
                  x={x}
                  y={y}
                  width={CELL}
                  height={CELL}
                  rx={8}
                  fill={fill}
                  stroke="#9ca3af"
                  strokeWidth={0.5}
                  className="transition-[stroke] hover:stroke-gray-700 dark:hover:stroke-white"
                />
                <text
                  x={x + CELL / 2}
                  y={y + CELL / 2 - 4}
                  textAnchor="middle"
                  fontSize={20}
                  fontWeight={700}
                  fill={textDark ? 'white' : '#111827'}
                >
                  {tile.uf}
                </text>
                <text
                  x={x + CELL / 2}
                  y={y + CELL / 2 + 16}
                  textAnchor="middle"
                  fontSize={12}
                  fontWeight={500}
                  fill={textDark ? 'rgba(255,255,255,0.9)' : '#374151'}
                >
                  {label}
                </text>
              </g>
            </a>
          )
        })}
      </svg>
      <figcaption className="mt-3 flex items-center justify-center gap-4 text-xs text-gray-600 dark:text-gray-400">
        <span className="inline-flex items-center gap-1">
          <span className="inline-block h-3 w-3 rounded" style={{ backgroundColor: '#f3f4f6' }} />
          zero
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="inline-block h-3 w-3 rounded" style={{ backgroundColor: interpolate(rampColor, 0.3) }} />
          poucos
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="inline-block h-3 w-3 rounded" style={{ backgroundColor: interpolate(rampColor, 0.7) }} />
          muitos
        </span>
        <span className="inline-flex items-center gap-1">
          <span className="inline-block h-3 w-3 rounded" style={{ backgroundColor: rampColor }} />
          pico ({max.toLocaleString('pt-BR')})
        </span>
      </figcaption>
    </figure>
  )
}
