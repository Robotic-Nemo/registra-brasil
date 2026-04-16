/**
 * Pagination utilities
 */

export interface PaginationMeta {
  page: number
  perPage: number
  total: number
  totalPages: number
  hasNext: boolean
  hasPrev: boolean
}

export function getPaginationMeta(page: number, perPage: number, total: number): PaginationMeta {
  const totalPages = Math.ceil(total / perPage)
  return {
    page,
    perPage,
    total,
    totalPages,
    hasNext: page < totalPages,
    hasPrev: page > 1,
  }
}

/**
 * Generate page numbers for pagination display
 * Returns array like [1, '...', 4, 5, 6, '...', 20]
 */
export function getPageNumbers(
  currentPage: number,
  totalPages: number,
  maxVisible = 7
): (number | '...')[] {
  if (totalPages <= maxVisible) {
    return Array.from({ length: totalPages }, (_, i) => i + 1)
  }

  const pages: (number | '...')[] = [1]
  const halfWindow = Math.floor((maxVisible - 3) / 2)
  let start = Math.max(2, currentPage - halfWindow)
  let end = Math.min(totalPages - 1, currentPage + halfWindow)

  // Adjust window if near edges
  if (start <= 2) {
    end = Math.min(maxVisible - 2, totalPages - 1)
    start = 2
  }
  if (end >= totalPages - 1) {
    start = Math.max(2, totalPages - maxVisible + 3)
    end = totalPages - 1
  }

  if (start > 2) pages.push('...')
  for (let i = start; i <= end; i++) pages.push(i)
  if (end < totalPages - 1) pages.push('...')
  if (totalPages > 1) pages.push(totalPages)

  return pages
}

/**
 * Calculate offset from page number
 */
export function getOffset(page: number, perPage: number): number {
  return (Math.max(1, page) - 1) * perPage
}

/**
 * Parse page from search params with validation
 */
export function parsePageParam(value: string | null | undefined, max = 1000): number {
  const page = parseInt(value ?? '1', 10)
  return Number.isNaN(page) || page < 1 ? 1 : Math.min(page, max)
}
