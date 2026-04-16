/**
 * Helpers to safely build and parse search URL parameters.
 */

export interface SearchFilterValues {
  q?: string
  categoria?: string[]
  partido?: string
  estado?: string
  status?: string
  fonte?: string
  de?: string
  ate?: string
  page?: number
}

const DATE_RE = /^\d{4}-\d{2}-\d{2}$/

/**
 * Build a URLSearchParams from filter values, omitting empty/default values.
 */
export function buildSearchParams(filters: SearchFilterValues): URLSearchParams {
  const params = new URLSearchParams()

  if (filters.q?.trim()) {
    params.set('q', filters.q.trim())
  }

  if (filters.categoria) {
    for (const cat of filters.categoria) {
      if (cat) params.append('categoria', cat)
    }
  }

  if (filters.partido) params.set('partido', filters.partido)
  if (filters.estado) params.set('estado', filters.estado)
  if (filters.status) params.set('status', filters.status)
  if (filters.fonte && filters.fonte !== 'todos') params.set('fonte', filters.fonte)
  if (filters.de && DATE_RE.test(filters.de)) params.set('de', filters.de)
  if (filters.ate && DATE_RE.test(filters.ate)) params.set('ate', filters.ate)
  if (filters.page && filters.page > 1) params.set('page', String(filters.page))

  return params
}

/**
 * Parse URLSearchParams into typed filter values.
 */
export function parseFilterParams(params: URLSearchParams): SearchFilterValues {
  const q = params.get('q')?.trim() || undefined
  const categoria = params.getAll('categoria').filter(Boolean)
  const partido = params.get('partido') || undefined
  const estado = params.get('estado') || undefined
  const status = params.get('status') || undefined
  const fonte = params.get('fonte') || undefined
  const rawDe = params.get('de') || ''
  const rawAte = params.get('ate') || ''
  const de = DATE_RE.test(rawDe) ? rawDe : undefined
  const ate = DATE_RE.test(rawAte) ? rawAte : undefined
  const rawPage = params.get('page')
  const page = rawPage ? Math.max(1, parseInt(rawPage, 10) || 1) : undefined

  return { q, categoria: categoria.length > 0 ? categoria : undefined, partido, estado, status, fonte, de, ate, page }
}

/**
 * Build a search URL string from filter values.
 */
export function buildSearchUrl(basePath: string, filters: SearchFilterValues): string {
  const params = buildSearchParams(filters)
  const qs = params.toString()
  return qs ? `${basePath}?${qs}` : basePath
}

/**
 * Merge new filters into existing URLSearchParams, resetting page to 1.
 */
export function mergeSearchParams(
  current: URLSearchParams,
  updates: Partial<SearchFilterValues>,
): URLSearchParams {
  const existing = parseFilterParams(current)
  const merged = { ...existing, ...updates, page: undefined }
  return buildSearchParams(merged)
}
