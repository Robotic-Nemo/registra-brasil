/**
 * Cursor-based pagination utilities.
 *
 * Cursors encode the sort column value + row ID for deterministic keyset
 * pagination. This avoids the performance problems of OFFSET-based pagination
 * on large tables.
 */

export interface CursorData {
  /** Primary sort value (e.g. a date string or name) */
  v: string
  /** Row ID for tie-breaking */
  id: string
}

/** Encode a cursor from value + id */
export function encodeCursor(value: string, id: string): string {
  const payload: CursorData = { v: value, id }
  // Use base64url encoding (no padding) to make it URL-safe
  if (typeof btoa === 'function') {
    return btoa(JSON.stringify(payload)).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')
  }
  return Buffer.from(JSON.stringify(payload)).toString('base64url')
}

/** Decode a cursor string back to value + id */
export function decodeCursor(cursor: string): CursorData | null {
  try {
    // Restore base64 padding
    const padded = cursor.replace(/-/g, '+').replace(/_/g, '/')
    let json: string
    if (typeof atob === 'function') {
      json = atob(padded)
    } else {
      json = Buffer.from(padded, 'base64').toString('utf-8')
    }
    const parsed = JSON.parse(json)
    if (parsed && typeof parsed.v === 'string' && typeof parsed.id === 'string') {
      return parsed as CursorData
    }
    return null
  } catch {
    return null
  }
}

/** Clamp and parse the limit parameter */
export function parseLimit(raw: string | null | undefined, defaultLimit = 20, maxLimit = 100): number {
  if (!raw) return defaultLimit
  const n = parseInt(raw, 10)
  if (!Number.isFinite(n) || n < 1) return defaultLimit
  return Math.min(Math.floor(n), maxLimit)
}

/**
 * Build cursor pagination info for a response.
 *
 * @param rows - The fetched rows (must include the sort field and `id`)
 * @param sortField - The name of the column used for sorting
 * @param limit - The requested limit
 * @param hasMore - Whether there are more rows after this page
 */
export function buildCursorPagination<T extends Record<string, unknown>>(
  rows: T[],
  sortField: string,
  limit: number,
  hasMore: boolean
): { nextCursor: string | null; prevCursor: string | null; limit: number; hasMore: boolean } {
  const first = rows[0]
  const last = rows[rows.length - 1]

  return {
    nextCursor: hasMore && last ? encodeCursor(String(last[sortField] ?? ''), String(last['id'] ?? '')) : null,
    prevCursor: first ? encodeCursor(String(first[sortField] ?? ''), String(first['id'] ?? '')) : null,
    limit,
    hasMore,
  }
}
