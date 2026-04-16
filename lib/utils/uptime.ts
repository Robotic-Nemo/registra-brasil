/**
 * Uptime tracking utility.
 * In a production app, this would integrate with a monitoring service.
 */

export interface UptimeRecord {
  date: string
  uptimePercent: number
  incidents: number
}

export interface SystemStatus {
  status: 'operational' | 'degraded' | 'outage' | 'maintenance'
  lastChecked: string
  message?: string
}

/** Calculate average uptime from records */
export function calculateAverageUptime(records: UptimeRecord[]): number {
  if (records.length === 0) return 100
  const total = records.reduce((sum, r) => sum + r.uptimePercent, 0)
  return total / records.length
}

/** Get uptime status label */
export function getUptimeLabel(percent: number): string {
  if (percent >= 99.9) return 'Excelente'
  if (percent >= 99.0) return 'Bom'
  if (percent >= 95.0) return 'Aceitavel'
  return 'Problematico'
}

/** Format uptime percentage for display */
export function formatUptime(percent: number): string {
  return `${percent.toFixed(2)}%`
}

/** Calculate downtime in minutes from uptime percentage (for 24h period) */
export function downtimeMinutes(uptimePercent: number): number {
  return Math.round((1 - uptimePercent / 100) * 1440)
}
