/**
 * Shared helper: GitHub-style calendar heatmap SVG renderer.
 *
 * Used by `/api/estatisticas/calendario.svg` and the scope
 * variants (politico / partido / estado / categoria / fonte).
 * Centralising the layout + scale logic keeps tooltip, padding and
 * color ramp identical across every scope — drift here produces
 * misleading visuals across a dashboard.
 */

export interface CalendarHeatmapOptions {
  counts: Map<string, number> // YYYY-MM-DD → count
  startMs: number // UTC midnight of first in-window day
  endMs: number // UTC midnight of last in-window day
  titleYear: number
  titlePrefix?: string // e.g. "Câmara do Deputado — "
  color: string // #RRGGBB
}

export function renderCalendarHeatmapSvg(opt: CalendarHeatmapOptions): { svg: string; maxCount: number; daysWithData: number } {
  const { counts, startMs, endMs, titleYear, titlePrefix = '', color } = opt

  // Align grid to Sunday-start columns.
  const startDow = new Date(startMs).getUTCDay()
  const gridStartMs = startMs - startDow * 86400_000
  const totalDays = Math.round((endMs - gridStartMs) / 86400_000) + 1
  const weeks = Math.ceil(totalDays / 7)

  const cell = 11
  const gap = 2
  const padL = 24
  const padT = 18
  const width = padL + weeks * (cell + gap) + 8
  const height = padT + 7 * (cell + gap) + 20

  const maxCount = [...counts.values()].reduce((m, v) => Math.max(m, v), 0)
  const daysWithData = counts.size

  const scale = (n: number): string => {
    if (n <= 0) return '#e5e7eb'
    const t = Math.log1p(n) / Math.log1p(Math.max(maxCount, 1))
    const alpha = Math.max(0.15, Math.min(1, t))
    return `${color}${Math.round(alpha * 255).toString(16).padStart(2, '0').toUpperCase()}`
  }

  const cells: string[] = []
  for (let i = 0; i < totalDays; i++) {
    const dayMs = gridStartMs + i * 86400_000
    if (dayMs < startMs || dayMs > endMs) continue
    const key = new Date(dayMs).toISOString().slice(0, 10)
    const col = Math.floor(i / 7)
    const row = i % 7
    const x = padL + col * (cell + gap)
    const y = padT + row * (cell + gap)
    const n = counts.get(key) ?? 0
    cells.push(
      `<rect x="${x}" y="${y}" width="${cell}" height="${cell}" rx="2" fill="${scale(n)}"><title>${key}: ${n}</title></rect>`,
    )
  }

  const dowLabels = ['Seg', 'Qua', 'Sex']
    .map((lbl, i) => {
      const row = i * 2 + 1
      const y = padT + row * (cell + gap) + cell - 2
      return `<text x="0" y="${y}" font-size="9" font-family="system-ui,sans-serif" fill="#6b7280">${lbl}</text>`
    })
    .join('')

  const svg =
    `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${width} ${height}" width="${width}" height="${height}" role="img" aria-label="Calendário de declarações ${titleYear}">` +
    `<text x="${padL}" y="12" font-size="11" font-family="system-ui,sans-serif" fill="#111827" font-weight="600">${titlePrefix}${titleYear} — ${daysWithData} dias c/ declarações (máx/dia: ${maxCount})</text>` +
    dowLabels +
    cells.join('') +
    `</svg>`

  return { svg, maxCount, daysWithData }
}

/** Compute default 53-week window ending today UTC. Or a full
 *  calendar year if `yearParam` is in [2000 .. current year]. */
export function resolveCalendarWindow(
  yearParam: number | null,
  now: Date = new Date(),
): { startMs: number; endMs: number; titleYear: number } {
  const currentYear = now.getUTCFullYear()
  if (yearParam && yearParam >= 2000 && yearParam <= currentYear) {
    return {
      startMs: Date.UTC(yearParam, 0, 1),
      endMs: Date.UTC(yearParam, 11, 31),
      titleYear: yearParam,
    }
  }
  const todayUtc = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate())
  return {
    startMs: todayUtc - 371 * 86400_000,
    endMs: todayUtc,
    titleYear: currentYear,
  }
}
