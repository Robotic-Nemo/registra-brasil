/**
 * Shared sparkline SVG renderer. Pure formatting — the caller
 * supplies already-bucketed counts. Used by all /sparkline.svg
 * endpoints (politico, partidos, categorias, estados).
 */

export interface SparklineBucket {
  label: string
  count: number
}

export interface SparklineOptions {
  buckets: SparklineBucket[]
  width: number
  height: number
  color: string
  ariaLabel: string
}

export function renderSparklineSvg({
  buckets,
  width: W,
  height: H,
  color,
  ariaLabel,
}: SparklineOptions): string {
  if (buckets.length === 0) {
    return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="sem dados"><rect width="${W}" height="${H}" fill="transparent"/></svg>`
  }
  const peak = Math.max(1, ...buckets.map((b) => b.count))
  const pad = 1.5
  const innerW = W - pad * 2
  const innerH = H - pad * 2
  const step = buckets.length === 1 ? 0 : innerW / (buckets.length - 1)

  const points = buckets.map((b, i) => {
    const x = pad + i * step
    const y = pad + innerH - (b.count / peak) * innerH
    return `${x.toFixed(2)},${y.toFixed(2)}`
  })
  const path = `M ${points.join(' L ')}`
  const area = `M ${pad},${(pad + innerH).toFixed(2)} L ${points.join(' L ')} L ${(pad + innerW).toFixed(2)},${(pad + innerH).toFixed(2)} Z`
  const label = ariaLabel.replace(/"/g, '&quot;')
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${label}"><path d="${area}" fill="${color}" fill-opacity="0.15" stroke="none"/><path d="${path}" fill="none" stroke="${color}" stroke-width="1.5" stroke-linejoin="round" stroke-linecap="round"/></svg>`
}

/**
 * Build an N-bucket monthly template ending with the current UTC
 * month, then map a list of row-dates into the buckets.
 */
export function bucketByMonthUtc(
  months: number,
  dates: string[],
): SparklineBucket[] {
  const now = new Date()
  const start = new Date(Date.UTC(now.getUTCFullYear(), now.getUTCMonth() - (months - 1), 1))
  const buckets: SparklineBucket[] = []
  for (let i = 0; i < months; i++) {
    const d = new Date(Date.UTC(start.getUTCFullYear(), start.getUTCMonth() + i, 1))
    buckets.push({
      label: `${d.getUTCFullYear()}-${String(d.getUTCMonth() + 1).padStart(2, '0')}`,
      count: 0,
    })
  }
  const byLabel = new Map(buckets.map((b) => [b.label, b]))
  for (const dt of dates) {
    const b = byLabel.get(dt.slice(0, 7))
    if (b) b.count++
  }
  return buckets
}

export function parseSparklineParams(
  search: URLSearchParams,
  defaults: { months?: number; w?: number; h?: number; color?: string } = {},
) {
  const months = Math.max(3, Math.min(24, Number(search.get('meses')) || (defaults.months ?? 12)))
  const W = Math.max(60, Math.min(480, Number(search.get('w')) || (defaults.w ?? 160)))
  const H = Math.max(16, Math.min(80, Number(search.get('h')) || (defaults.h ?? 32)))
  const rawColor = search.get('cor') ?? defaults.color ?? '#d97706'
  const color = /^#[0-9a-fA-F]{3,8}$/.test(rawColor) ? rawColor : (defaults.color ?? '#d97706')
  return { months, W, H, color }
}

export const SPARKLINE_HEADERS = {
  'Content-Type': 'image/svg+xml; charset=utf-8',
  'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
  'X-Robots-Tag': 'noindex',
}

export function sparklineEtag(prefix: string, buckets: SparklineBucket[]): string {
  const peak = Math.max(0, ...buckets.map((b) => b.count))
  return `W/"${prefix}-${buckets.length}-${peak}-${buckets.map((b) => b.count).join('.')}"`
}
