/**
 * Tiny dependency-free sparkline/area chart generator, returns an inline
 * SVG string suitable for direct embedding from a React Server Component.
 */

export interface SparklineOptions {
  width?: number
  height?: number
  padding?: number
  color?: string
  fill?: boolean
  ariaLabel?: string
}

export function sparklineSvg(values: number[], opts: SparklineOptions = {}): string {
  const {
    width = 160,
    height = 36,
    padding = 2,
    color = '#4f46e5',
    fill = true,
    ariaLabel = 'tendência',
  } = opts
  if (values.length === 0) {
    return `<svg width="${width}" height="${height}" aria-hidden="true"></svg>`
  }

  const max = Math.max(1, ...values)
  const n = values.length
  const innerW = width - padding * 2
  const innerH = height - padding * 2
  const step = n > 1 ? innerW / (n - 1) : innerW

  const pts = values.map((v, i) => {
    const x = padding + step * i
    const y = padding + innerH - (v / max) * innerH
    return `${x.toFixed(1)},${y.toFixed(1)}`
  })

  const linePath = `M ${pts.join(' L ')}`
  const firstX = padding.toFixed(1)
  const lastX = (padding + step * (n - 1)).toFixed(1)
  const bottomY = (padding + innerH).toFixed(1)
  const fillPath = `M ${firstX},${bottomY} L ${pts.join(' L ')} L ${lastX},${bottomY} Z`

  return [
    `<svg width="${width}" height="${height}" viewBox="0 0 ${width} ${height}" role="img" aria-label="${escapeAttr(ariaLabel)}">`,
    fill ? `<path d="${fillPath}" fill="${color}" fill-opacity="0.15" />` : '',
    `<path d="${linePath}" fill="none" stroke="${color}" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />`,
    `</svg>`,
  ].join('')
}

/**
 * Area chart with axis labels — used on the hero of /tendencias.
 */
export function areaChartSvg(
  values: number[],
  months: string[],
  opts: { width?: number; height?: number; color?: string } = {},
): string {
  const { width = 720, height = 200, color = '#4f46e5' } = opts
  if (values.length === 0) return `<svg width="${width}" height="${height}"></svg>`

  const padL = 36
  const padR = 10
  const padT = 12
  const padB = 24
  const innerW = width - padL - padR
  const innerH = height - padT - padB

  const max = Math.max(1, ...values)
  const n = values.length
  const step = n > 1 ? innerW / (n - 1) : innerW

  const pts = values.map((v, i) => {
    const x = padL + step * i
    const y = padT + innerH - (v / max) * innerH
    return `${x.toFixed(1)},${y.toFixed(1)}`
  })

  const ticksY = [0, 0.5, 1].map((frac) => {
    const y = padT + innerH - frac * innerH
    const label = Math.round(max * frac).toLocaleString('pt-BR')
    return `
      <line x1="${padL}" x2="${padL + innerW}" y1="${y}" y2="${y}" stroke="currentColor" stroke-opacity="0.08" />
      <text x="${padL - 6}" y="${y + 3}" text-anchor="end" font-size="10" fill="currentColor" fill-opacity="0.55">${label}</text>
    `
  }).join('')

  const step_x = Math.max(1, Math.ceil(n / 6))
  const ticksX = months.map((m, i) => {
    if (i % step_x !== 0 && i !== n - 1) return ''
    const x = padL + step * i
    const label = m.slice(0, 7)
    return `
      <text x="${x}" y="${height - 6}" text-anchor="middle" font-size="10" fill="currentColor" fill-opacity="0.55">${label}</text>
    `
  }).join('')

  const fillPath = `M ${padL},${padT + innerH} L ${pts.join(' L ')} L ${padL + step * (n - 1)},${padT + innerH} Z`
  const linePath = `M ${pts.join(' L ')}`

  return `
    <svg width="100%" viewBox="0 0 ${width} ${height}" preserveAspectRatio="none" role="img" aria-label="Total de declarações por mês">
      ${ticksY}
      <path d="${fillPath}" fill="${color}" fill-opacity="0.18" />
      <path d="${linePath}" fill="none" stroke="${color}" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" />
      ${ticksX}
    </svg>
  `
}

function escapeAttr(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({
    '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;',
  })[c] ?? c)
}
