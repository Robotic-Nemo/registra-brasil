import type { SearchParams } from '@/types/search'

const VALID_STATUSES = new Set(['verified', 'unverified', 'disputed', 'removed'] as const)
const VALID_FONTES = new Set(['curado', 'ao-vivo', 'todos'] as const)
const DATE_RE = /^\d{4}-\d{2}-\d{2}$/

/**
 * Parse and validate search params from URL search params.
 * Returns a clean SearchParams object with defaults applied.
 */
export function parseSearchParams(sp: Record<string, string | string[]>): SearchParams {
  const q = typeof sp.q === 'string' ? sp.q.trim() : undefined
  const categoria = typeof sp.categoria === 'string' ? [sp.categoria] : Array.isArray(sp.categoria) ? sp.categoria : undefined
  const partido = typeof sp.partido === 'string' ? sp.partido : undefined
  const estado = typeof sp.estado === 'string' ? sp.estado : undefined
  const politico = typeof sp.politico === 'string' ? sp.politico : undefined

  const rawStatus = typeof sp.status === 'string' ? sp.status : ''
  const status = VALID_STATUSES.has(rawStatus as never) ? (rawStatus as SearchParams['status']) : undefined

  const rawFonte = typeof sp.fonte === 'string' ? sp.fonte : 'todos'
  const fonte = VALID_FONTES.has(rawFonte as never) ? (rawFonte as SearchParams['fonte']) : 'todos'

  const rawDe = typeof sp.de === 'string' ? sp.de : ''
  const de = DATE_RE.test(rawDe) ? rawDe : undefined

  const rawAte = typeof sp.ate === 'string' ? sp.ate : ''
  const ate = DATE_RE.test(rawAte) ? rawAte : undefined

  const page = typeof sp.page === 'string' ? Math.max(1, parseInt(sp.page, 10) || 1) : 1
  const limit = 20

  return { q, categoria, partido, estado, politico, de, ate, status, fonte, page, limit }
}
