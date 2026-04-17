// Pure render — server component, ships no JS.
type ChartType = 'line' | 'bar' | 'area'

interface MiniChartProps {
  data: number[]
  type?: ChartType
  width?: number
  height?: number
  color?: string
  className?: string
}

/**
 * Tiny inline chart for embedding in table cells or stat labels.
 * Simpler and smaller than Sparkline, designed for inline use.
 */
export function MiniChart({
  data,
  type = 'line',
  width = 64,
  height = 20,
  color = '#3b82f6',
  className = '',
}: MiniChartProps) {
  if (data.length < 2) return null

  const min = Math.min(...data)
  const max = Math.max(...data)
  const range = max - min || 1
  const pad = 1

  const iw = width - pad * 2
  const ih = height - pad * 2

  if (type === 'bar') {
    const barWidth = Math.max(2, (iw - (data.length - 1)) / data.length)
    const gap = 1

    return (
      <svg width={width} height={height} className={`inline-block align-middle ${className}`} role="img" aria-hidden="true">
        {data.map((v, i) => {
          const barH = Math.max(1, ((v - min) / range) * ih)
          const x = pad + i * (barWidth + gap)
          const y = pad + ih - barH
          return <rect key={i} x={x} y={y} width={barWidth} height={barH} rx={0.5} fill={color} opacity={0.7 + 0.3 * (i / (data.length - 1))} />
        })}
      </svg>
    )
  }

  // Line or area
  const points = data.map((v, i) => ({
    x: pad + (i / (data.length - 1)) * iw,
    y: pad + ih - ((v - min) / range) * ih,
  }))

  const linePath = points.map((p, i) => `${i === 0 ? 'M' : 'L'}${p.x},${p.y}`).join(' ')

  return (
    <svg width={width} height={height} className={`inline-block align-middle ${className}`} role="img" aria-hidden="true">
      {type === 'area' && (
        <path
          d={`${linePath} L${points[points.length - 1].x},${height} L${points[0].x},${height} Z`}
          fill={color}
          opacity={0.1}
        />
      )}
      <path d={linePath} fill="none" stroke={color} strokeWidth={1.5} strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  )
}
