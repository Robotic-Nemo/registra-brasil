'use client'

import { useState, useEffect } from 'react'
import { getMetrics, observeWebVitals } from '@/lib/utils/performance-monitor'

export function PerformanceOverlay() {
  const [visible, setVisible] = useState(false)
  const [data, setData] = useState<ReturnType<typeof getMetrics>>([])

  useEffect(() => {
    if (process.env.NODE_ENV !== 'development') return
    observeWebVitals()
    const interval = setInterval(() => setData(getMetrics()), 2000)
    return () => clearInterval(interval)
  }, [])

  if (process.env.NODE_ENV !== 'development') return null

  const latestByName = new Map<string, (typeof data)[number]>()
  for (const m of data) {
    latestByName.set(m.name, m)
  }

  const ratingColor = (r: string) =>
    r === 'good' ? 'text-green-400' : r === 'needs-improvement' ? 'text-yellow-400' : 'text-red-400'

  return (
    <>
      <button
        onClick={() => setVisible(!visible)}
        className="fixed bottom-4 right-4 z-[9999] bg-gray-900 text-white text-xs px-2 py-1 rounded-md opacity-60 hover:opacity-100 transition-opacity"
        aria-label="Toggle performance overlay"
      >
        Perf
      </button>
      {visible && (
        <div className="fixed bottom-12 right-4 z-[9999] bg-gray-900/95 text-white text-xs rounded-lg p-3 min-w-[180px] font-mono shadow-xl">
          <h4 className="font-bold mb-2 text-gray-300">Web Vitals</h4>
          {latestByName.size === 0 && <p className="text-gray-500">Coletando metricas...</p>}
          {Array.from(latestByName.entries()).map(([name, metric]) => (
            <div key={name} className="flex justify-between gap-4 py-0.5">
              <span className="text-gray-400">{name}</span>
              <span className={ratingColor(metric.rating)}>
                {name === 'CLS' ? metric.value.toFixed(3) : `${metric.value.toFixed(0)}ms`}
              </span>
            </div>
          ))}
        </div>
      )}
    </>
  )
}
