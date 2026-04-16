/**
 * Field selection / projection utility.
 *
 * Allows API consumers to request only specific fields via `?fields=id,summary,date`.
 * Validates requested fields against an allow-list and returns the Supabase select string.
 */

import type { FieldSelectionConfig } from '@/types/api-v2'

/**
 * Parse and validate the `fields` query parameter.
 *
 * @param raw - Comma-separated field names from the query string
 * @param config - Allowed and default fields
 * @returns Array of validated field names
 */
export function parseFields(raw: string | null, config: FieldSelectionConfig): string[] {
  if (!raw || raw.trim() === '') return config.defaults

  const requested = raw
    .split(',')
    .map(f => f.trim())
    .filter(Boolean)

  const valid = requested.filter(f => config.allowed.includes(f))
  return valid.length > 0 ? valid : config.defaults
}

/**
 * Build a Supabase `.select()` string from validated fields.
 *
 * Always includes `id` for cursor pagination.
 */
export function buildSelectString(fields: string[], includeRelations?: string[]): string {
  // Always include id
  const fieldSet = new Set(fields)
  fieldSet.add('id')

  const selectParts = [Array.from(fieldSet).join(', ')]

  if (includeRelations) {
    for (const rel of includeRelations) {
      switch (rel) {
        case 'politician':
          selectParts.push('politicians (id, slug, common_name, full_name, party, state, photo_url)')
          break
        case 'categories':
          selectParts.push('statement_categories (is_primary, categories (id, slug, label_pt, color_hex))')
          break
        case 'statement_count':
          // Handled separately
          break
        case 'children':
          // Handled separately
          break
      }
    }
  }

  return selectParts.join(', ')
}

/**
 * Project an object to include only selected fields.
 * Useful for post-query field filtering (e.g. when joins return extra columns).
 */
export function projectFields<T extends Record<string, unknown>>(
  obj: T,
  fields: string[],
  keepRelations?: string[]
): Partial<T> {
  const result: Record<string, unknown> = {}
  const allowedKeys = new Set([...fields, ...(keepRelations ?? [])])

  // Always include id
  allowedKeys.add('id')

  for (const key of Object.keys(obj)) {
    if (allowedKeys.has(key)) {
      result[key] = obj[key]
    }
    // Keep joined relation objects (e.g. politicians, statement_categories)
    if (key === 'politicians' && keepRelations?.includes('politician')) {
      result[key] = obj[key]
    }
    if (key === 'statement_categories' && keepRelations?.includes('categories')) {
      result[key] = obj[key]
    }
  }

  return result as Partial<T>
}
