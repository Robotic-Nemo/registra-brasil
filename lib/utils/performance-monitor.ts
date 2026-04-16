'use client'

/**
 * Client-side performance monitoring utility.
 * Collects Web Vitals and custom metrics.
 */

interface PerformanceMetric {
  name: string
  value: number
  rating: 'good' | 'needs-improvement' | 'poor'
  timestamp: number
}

const metrics: PerformanceMetric[] = []

function getRating(name: string, value: number): PerformanceMetric['rating'] {
  const thresholds: Record<string, [number, number]> = {
    FCP: [1800, 3000],
    LCP: [2500, 4000],
    CLS: [0.1, 0.25],
    FID: [100, 300],
    TTFB: [800, 1800],
    INP: [200, 500],
  }
  const [good, poor] = thresholds[name] ?? [1000, 3000]
  if (value <= good) return 'good'
  if (value <= poor) return 'needs-improvement'
  return 'poor'
}

export function recordMetric(name: string, value: number): void {
  const metric: PerformanceMetric = {
    name,
    value,
    rating: getRating(name, value),
    timestamp: Date.now(),
  }
  metrics.push(metric)

  if (process.env.NODE_ENV === 'development') {
    const color = metric.rating === 'good' ? '#22c55e' : metric.rating === 'needs-improvement' ? '#f59e0b' : '#ef4444'
    console.debug(`%c[perf] ${name}: ${value.toFixed(1)}ms (${metric.rating})`, `color: ${color}; font-weight: bold`)
  }
}

export function getMetrics(): PerformanceMetric[] {
  return [...metrics]
}

export function observeWebVitals(): void {
  if (typeof window === 'undefined' || typeof PerformanceObserver === 'undefined') return

  try {
    // LCP
    const lcpObserver = new PerformanceObserver((list) => {
      const entries = list.getEntries()
      const last = entries[entries.length - 1]
      if (last) recordMetric('LCP', last.startTime)
    })
    lcpObserver.observe({ type: 'largest-contentful-paint', buffered: true })

    // FCP
    const fcpObserver = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        if (entry.name === 'first-contentful-paint') {
          recordMetric('FCP', entry.startTime)
        }
      }
    })
    fcpObserver.observe({ type: 'paint', buffered: true })

    // CLS
    let clsValue = 0
    const clsObserver = new PerformanceObserver((list) => {
      for (const entry of list.getEntries()) {
        const layoutShift = entry as PerformanceEntry & { hadRecentInput?: boolean; value?: number }
        if (!layoutShift.hadRecentInput && layoutShift.value) {
          clsValue += layoutShift.value
          recordMetric('CLS', clsValue)
        }
      }
    })
    clsObserver.observe({ type: 'layout-shift', buffered: true })
  } catch {
    // PerformanceObserver not supported for some entry types
  }
}
