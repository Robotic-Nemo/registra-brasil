import type { SearchParams } from '@/types/search'

const VALID_STATUSES = new Set(['verified', 'unverified', 'disputed', 'removed'] as const)
const VALID_FONTES = new Set(['curado', 'ao-vivo', 'todos'] as const)
const DATE_RE = /^\d{4}-\d{2}-\d{2}$/

/**
 * Parse and validate search params from URL search params.
 * Returns a clean SearchParams object with defaults applied.
 */
const MAX_PAGE = 1000

export function parseSearchParams(sp: Record<string, string | string[]>): SearchParams {
  // Collapse whitespace-only query to undefined (empty search shouldn't trigger filtered view)
  const rawQ = typeof sp.q === 'string' ? sp.q.trim() : undefined
  const q = rawQ ? rawQ : undefined

  // Deduplicate and filter empties
  const rawCategoria = typeof sp.categoria === 'string'
    ? [sp.categoria]
    : Array.isArray(sp.categoria)
      ? sp.categoria
      : []
  const dedupedCategoria = Array.from(new Set(rawCategoria.filter(Boolean)))
  const categoria = dedupedCategoria.length > 0 ? dedupedCategoria : undefined

  const partido = typeof sp.partido === 'string' && sp.partido ? sp.partido : undefined
  const estado = typeof sp.estado === 'string' && sp.estado ? sp.estado : undefined
  const politico = typeof sp.politico === 'string' && sp.politico ? sp.politico : undefined

  const rawStatus = typeof sp.status === 'string' ? sp.status : ''
  const status = VALID_STATUSES.has(rawStatus as never) ? (rawStatus as SearchParams['status']) : undefined

  const rawFonte = typeof sp.fonte === 'string' ? sp.fonte : 'todos'
  const fonte = VALID_FONTES.has(rawFonte as never) ? (rawFonte as SearchParams['fonte']) : 'todos'

  const rawDe = typeof sp.de === 'string' ? sp.de : ''
  let de = DATE_RE.test(rawDe) ? rawDe : undefined

  const rawAte = typeof sp.ate === 'string' ? sp.ate : ''
  let ate = DATE_RE.test(rawAte) ? rawAte : undefined

  // If both provided and inverted, swap rather than silently filtering nothing
  if (de && ate && de > ate) {
    const tmp = de
    de = ate
    ate = tmp
  }

  // If page is an array (unexpected), take the first value
  const rawPage = typeof sp.page === 'string'
    ? sp.page
    : Array.isArray(sp.page)
      ? sp.page[0]
      : undefined
  const parsedPage = rawPage ? parseInt(rawPage, 10) : 1
  const page = Math.min(
    MAX_PAGE,
    Math.max(1, Number.isNaN(parsedPage) ? 1 : parsedPage),
  )
  const limit = 20

  return { q, categoria, partido, estado, politico, de, ate, status, fonte, page, limit }
}
