import { Fragment, type ReactNode } from 'react'

interface DayBucket {
  date: string // YYYY-MM-DD
  count: number
}

interface Props {
  /**
   * Raw daily buckets. Missing days are treated as zero. Ordered
   * newest-first or oldest-first is fine — the component normalizes.
   */
  days: DayBucket[]
  /** End date of the window; defaults to today. */
  endDate?: string
  /** How many weeks to render. Default 52 = ~1 year. */
  weeks?: number
  /** Optional link-builder: given YYYY-MM-DD, return URL or null. */
  hrefFor?: (date: string) => string | null
  /** Optional title for the overall `<figure>`. */
  title?: string
}

const DAY_LABELS = ['D', '', 'T', '', 'Q', '', 'S'] as const // Sparse so only alternate weekdays label
const MONTH_LABELS = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez']

function isoDay(d: Date): string {
  const y = d.getUTCFullYear()
  const m = String(d.getUTCMonth() + 1).padStart(2, '0')
  const day = String(d.getUTCDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

function bucketClass(count: number, max: number): string {
  if (count === 0) return 'bg-gray-100'
  const ratio = count / max
  if (ratio > 0.75) return 'bg-blue-700'
  if (ratio > 0.5) return 'bg-blue-500'
  if (ratio > 0.25) return 'bg-blue-400'
  return 'bg-blue-200'
}

/**
 * Compact ~GitHub-style activity calendar — last N weeks of daily
 * statement counts rendered as a 7-row CSS grid. Accessible: each
 * cell gets a `title` and aria-label with the date + count.
 */
export function ActivityCalendar({ days, endDate, weeks = 52, hrefFor, title }: Props): ReactNode {
  const countByDate = new Map<string, number>()
  for (const d of days) {
    countByDate.set(d.date, (countByDate.get(d.date) ?? 0) + d.count)
  }

  // Find Sunday that starts the grid.
  const end = endDate ? new Date(endDate + 'T00:00:00Z') : new Date()
  const endUtc = new Date(Date.UTC(end.getUTCFullYear(), end.getUTCMonth(), end.getUTCDate()))
  // Move end to the following Saturday so the last column is the current week.
  const dayOfWeek = endUtc.getUTCDay() // 0=Sun
  const saturday = new Date(endUtc)
  saturday.setUTCDate(saturday.getUTCDate() + (6 - dayOfWeek))
  // Start = Sunday of (weeks) ago
  const start = new Date(saturday)
  start.setUTCDate(start.getUTCDate() - (weeks * 7 - 1))

  const columns: Array<Array<{ date: string; count: number }>> = []
  let max = 0
  for (let w = 0; w < weeks; w++) {
    const col: Array<{ date: string; count: number }> = []
    for (let d = 0; d < 7; d++) {
      const dt = new Date(start)
      dt.setUTCDate(dt.getUTCDate() + w * 7 + d)
      const iso = isoDay(dt)
      const c = countByDate.get(iso) ?? 0
      if (c > max) max = c
      col.push({ date: iso, count: c })
    }
    columns.push(col)
  }
  if (max === 0) max = 1

  // Month labels: show at column where month changes on the Sunday row.
  const monthMarkers: Array<{ col: number; label: string }> = []
  let lastMonth = -1
  for (let i = 0; i < columns.length; i++) {
    const dt = new Date(columns[i][0].date + 'T00:00:00Z')
    const m = dt.getUTCMonth()
    if (m !== lastMonth) {
      monthMarkers.push({ col: i, label: MONTH_LABELS[m] })
      lastMonth = m
    }
  }

  const total = columns.reduce((acc, col) => acc + col.reduce((a, d) => a + d.count, 0), 0)

  return (
    <figure className="text-xs">
      {title && <figcaption className="text-sm font-semibold text-gray-900 mb-2">{title}</figcaption>}
      <div className="inline-block overflow-x-auto max-w-full">
        <div
          className="grid grid-rows-[auto_repeat(7,0.9rem)] grid-flow-col gap-0.5"
          style={{ gridTemplateColumns: `repeat(${columns.length + 1}, 0.9rem)` }}
          role="grid"
          aria-label={title ?? 'Calendário de atividade'}
        >
          {/* Top row: month labels */}
          <div aria-hidden="true" />
          {columns.map((_, i) => {
            const marker = monthMarkers.find((m) => m.col === i)
            return (
              <div key={`m-${i}`} className="text-[9px] text-gray-500 self-end overflow-visible whitespace-nowrap pr-1" aria-hidden="true">
                {marker?.label ?? ''}
              </div>
            )
          })}

          {/* 7 weekday rows × columns cells, plus first-column labels */}
          {Array.from({ length: 7 }).map((_, row) => (
            <Fragment key={`row-${row}`}>
              <div className="text-[9px] text-gray-400 text-right pr-1" aria-hidden="true">
                {DAY_LABELS[row]}
              </div>
              {columns.map((col, colIdx) => {
                const cell = col[row]
                const href = hrefFor ? hrefFor(cell.date) : null
                const cls = bucketClass(cell.count, max)
                const label = `${cell.date}: ${cell.count} declaraç${cell.count === 1 ? 'ão' : 'ões'}`
                const body = (
                  <span
                    className={`block w-[0.75rem] h-[0.75rem] rounded-sm ${cls}`}
                    title={label}
                    aria-label={label}
                    role="gridcell"
                  />
                )
                return (
                  <div key={`c-${colIdx}-${row}`} className="flex items-center justify-center">
                    {href ? <a href={href} className="focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 rounded-sm">{body}</a> : body}
                  </div>
                )
              })}
            </Fragment>
          ))}
        </div>
      </div>
      <div className="flex items-center gap-2 mt-2 text-[11px] text-gray-500">
        <span>Menos</span>
        {['bg-gray-100', 'bg-blue-200', 'bg-blue-400', 'bg-blue-500', 'bg-blue-700'].map((c) => (
          <span key={c} className={`inline-block w-2.5 h-2.5 rounded-sm ${c}`} aria-hidden="true" />
        ))}
        <span>Mais</span>
        <span className="ml-auto tabular-nums">
          {total.toLocaleString('pt-BR')} declaraç{total === 1 ? 'ão' : 'ões'} no período
        </span>
      </div>
    </figure>
  )
}
