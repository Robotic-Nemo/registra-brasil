/**
 * Shared SVG mini bar-chart renderer. Used by /severity.svg style
 * endpoints. Caller supplies already-computed bucket counts and
 * labels.
 */

export interface HistogramBucket {
  label: string
  count: number
  color?: string
}

export interface HistogramOptions {
  buckets: HistogramBucket[]
  width: number
  height: number
  ariaLabel: string
  showLabels?: boolean
  defaultColor?: string
}

export function renderHistogramSvg({
  buckets,
  width: W,
  height: H,
  ariaLabel,
  showLabels = true,
  defaultColor = '#d97706',
}: HistogramOptions): string {
  const peak = Math.max(1, ...buckets.map((b) => b.count))
  const pad = 2
  const labelH = showLabels ? 10 : 0
  const innerW = W - pad * 2
  const innerH = H - pad * 2 - labelH
  const n = buckets.length || 1
  const gap = 2
  const barW = (innerW - gap * (n - 1)) / n

  const bars = buckets.map((b, i) => {
    const h = (b.count / peak) * innerH
    const x = pad + i * (barW + gap)
    const y = pad + (innerH - h)
    const fill = b.color ?? defaultColor
    return `<rect x="${x.toFixed(2)}" y="${y.toFixed(2)}" width="${barW.toFixed(2)}" height="${h.toFixed(2)}" fill="${fill}" rx="1"/>`
  }).join('')

  const labels = showLabels
    ? buckets.map((b, i) => {
        const x = pad + i * (barW + gap) + barW / 2
        return `<text x="${x.toFixed(2)}" y="${H - 1}" text-anchor="middle" font-size="7" font-family="system-ui, sans-serif" fill="#6b7280">${b.label}</text>`
      }).join('')
    : ''

  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${ariaLabel.replace(/"/g, '&quot;')}">${bars}${labels}</svg>`
}

export const HISTOGRAM_HEADERS = {
  'Content-Type': 'image/svg+xml; charset=utf-8',
  'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
  'X-Robots-Tag': 'noindex',
}

export function histogramEtag(prefix: string, buckets: HistogramBucket[]): string {
  return `W/"${prefix}-${buckets.map((b) => b.count).join('.')}"`
}

// Color ramp by severity (1 low .. 5 critical).
export const SEVERITY_COLORS: Record<number, string> = {
  1: '#a3a3a3', // gray
  2: '#facc15', // yellow
  3: '#fb923c', // orange
  4: '#ef4444', // red
  5: '#7f1d1d', // dark red
}
