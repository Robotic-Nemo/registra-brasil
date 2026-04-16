/**
 * Format file sizes into human-readable strings.
 */

const UNITS = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'] as const

/**
 * Format bytes into a human-readable file size string.
 *
 * @example
 * formatBytes(0)           // "0 B"
 * formatBytes(1024)        // "1 KB"
 * formatBytes(1536)        // "1.5 KB"
 * formatBytes(1048576)     // "1 MB"
 * formatBytes(1073741824)  // "1 GB"
 */
export function formatBytes(bytes: number, decimals = 1): string {
  if (!Number.isFinite(bytes)) return `${bytes}`
  if (bytes === 0) return '0 B'
  if (bytes < 0) return '-' + formatBytes(-bytes, decimals)

  const k = 1024
  const i = Math.min(Math.floor(Math.log(bytes) / Math.log(k)), UNITS.length - 1)
  const value = bytes / Math.pow(k, i)

  // Avoid showing trailing zeros
  const formatted = value % 1 === 0
    ? value.toFixed(0)
    : value.toFixed(decimals)

  return `${formatted} ${UNITS[i]}`
}

/**
 * Parse a human-readable file size string back to bytes.
 *
 * @example
 * parseBytes("1 KB")   // 1024
 * parseBytes("1.5 MB") // 1572864
 */
export function parseBytes(str: string): number | null {
  const match = str.trim().match(/^([\d.]+)\s*(B|KB|MB|GB|TB|PB)$/i)
  if (!match) return null

  const value = parseFloat(match[1])
  const unit = match[2].toUpperCase()
  const index = UNITS.indexOf(unit as (typeof UNITS)[number])
  if (index === -1 || isNaN(value)) return null

  return Math.round(value * Math.pow(1024, index))
}
