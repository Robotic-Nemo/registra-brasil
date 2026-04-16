/**
 * Web Vitals reporting handler.
 * Can be connected to analytics services (e.g., Google Analytics, Vercel Analytics).
 */

interface WebVitalMetric {
  id: string
  name: string
  value: number
  rating: 'good' | 'needs-improvement' | 'poor'
  delta: number
  navigationType: string
}

type ReportHandler = (metric: WebVitalMetric) => void

const VITALS_ENDPOINT = '/api/vitals'

/**
 * Default handler that logs metrics to the console in development
 * and can POST them to an analytics endpoint in production.
 */
export function reportWebVitals(metric: WebVitalMetric): void {
  if (process.env.NODE_ENV === 'development') {
    const color = metric.rating === 'good' ? '\x1b[32m' : metric.rating === 'poor' ? '\x1b[31m' : '\x1b[33m'
    console.log(`${color}[Web Vital] ${metric.name}: ${Math.round(metric.value)}ms (${metric.rating})\x1b[0m`)
    return
  }

  // In production, batch and send to analytics endpoint
  if (typeof navigator !== 'undefined' && 'sendBeacon' in navigator) {
    const body = JSON.stringify({
      name: metric.name,
      value: metric.value,
      rating: metric.rating,
      id: metric.id,
      delta: metric.delta,
      navigationType: metric.navigationType,
    })
    navigator.sendBeacon(VITALS_ENDPOINT, body)
  }
}

/**
 * Create a custom report handler that sends metrics to a specific URL.
 */
export function createVitalsReporter(endpoint: string): ReportHandler {
  return (metric: WebVitalMetric) => {
    if (typeof navigator !== 'undefined' && 'sendBeacon' in navigator) {
      navigator.sendBeacon(endpoint, JSON.stringify(metric))
    }
  }
}

/**
 * Threshold values for Core Web Vitals (in ms, except CLS which is unitless).
 */
export const VITALS_THRESHOLDS = {
  LCP: { good: 2500, poor: 4000 },
  FID: { good: 100, poor: 300 },
  CLS: { good: 0.1, poor: 0.25 },
  FCP: { good: 1800, poor: 3000 },
  TTFB: { good: 800, poor: 1800 },
  INP: { good: 200, poor: 500 },
} as const
