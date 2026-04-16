/**
 * Anonymous usage telemetry (opt-in only).
 * Respects user consent preferences.
 */

interface TelemetryEvent {
  name: string
  properties?: Record<string, string | number | boolean>
  timestamp: string
}

const eventQueue: TelemetryEvent[] = []
let consentGiven = false

/** Check if user has given telemetry consent */
export function hasConsent(): boolean {
  if (typeof window === 'undefined') return false
  try {
    return localStorage.getItem('registra-brasil:telemetry-consent') === 'true'
  } catch {
    return false
  }
}

/** Set telemetry consent */
export function setConsent(consent: boolean): void {
  consentGiven = consent
  if (typeof window === 'undefined') return
  try {
    localStorage.setItem('registra-brasil:telemetry-consent', String(consent))
    if (!consent) {
      eventQueue.length = 0
    }
  } catch {
    // Storage unavailable
  }
}

/** Track a telemetry event (only if consent given) */
export function trackEvent(name: string, properties?: Record<string, string | number | boolean>): void {
  if (!consentGiven && !hasConsent()) return

  const event: TelemetryEvent = {
    name,
    properties,
    timestamp: new Date().toISOString(),
  }

  eventQueue.push(event)

  // In production, this would send to an analytics endpoint
  if (process.env.NODE_ENV === 'development') {
    console.debug('[telemetry]', name, properties)
  }
}

/** Flush queued events (for sending to server) */
export function flushEvents(): TelemetryEvent[] {
  const events = [...eventQueue]
  eventQueue.length = 0
  return events
}

/** Initialize telemetry — check consent state */
export function initTelemetry(): void {
  consentGiven = hasConsent()
}
