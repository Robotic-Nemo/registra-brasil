/**
 * Lightweight parser for search-query operators. Matches the syntax
 * that Postgres `websearch_to_tsquery` already understands plus a few
 * simple field selectors the Supabase query layer respects.
 *
 * Supported:
 *   "frase entre aspas"       → phrase token
 *   -negacao                   → negation token (stripped '-')
 *   palavra                    → plain term
 *   OR                         → boolean alt (case-insensitive 'or')
 *   politico:<slug>            → scope (politico, partido, estado, status, categoria)
 */

export type Token =
  | { kind: 'phrase'; value: string }
  | { kind: 'term'; value: string }
  | { kind: 'negation'; value: string }
  | { kind: 'or' }
  | { kind: 'field'; key: string; value: string }

const FIELD_KEYS = new Set(['politico', 'partido', 'estado', 'status', 'categoria'])

export function parseSearchQuery(raw: string): Token[] {
  const out: Token[] = []
  let i = 0
  const s = raw

  while (i < s.length) {
    // skip whitespace
    while (i < s.length && /\s/.test(s[i])) i++
    if (i >= s.length) break

    // Quoted phrase
    if (s[i] === '"') {
      const end = s.indexOf('"', i + 1)
      if (end > i) {
        const value = s.slice(i + 1, end).trim()
        if (value) out.push({ kind: 'phrase', value })
        i = end + 1
        continue
      }
      i++
      continue
    }

    // Collect a word token up to next whitespace
    let j = i
    while (j < s.length && !/\s/.test(s[j])) j++
    const raw = s.slice(i, j)
    i = j

    if (!raw) continue

    const upper = raw.toUpperCase()
    if (upper === 'OR') { out.push({ kind: 'or' }); continue }

    // Field: key:value (key must be known)
    const colon = raw.indexOf(':')
    if (colon > 0 && colon < raw.length - 1) {
      const key = raw.slice(0, colon).toLowerCase()
      const value = raw.slice(colon + 1)
      if (FIELD_KEYS.has(key)) {
        out.push({ kind: 'field', key, value })
        continue
      }
    }

    if (raw.startsWith('-') && raw.length > 1) {
      out.push({ kind: 'negation', value: raw.slice(1) })
      continue
    }

    out.push({ kind: 'term', value: raw })
  }

  return out
}

/**
 * Rebuild a URL-safe version of the query after the user removes one
 * chip. Preserves order.
 */
export function tokensToQueryString(tokens: Token[]): string {
  return tokens
    .map((t) => {
      if (t.kind === 'phrase') return `"${t.value}"`
      if (t.kind === 'negation') return `-${t.value}`
      if (t.kind === 'or') return 'OR'
      if (t.kind === 'field') return `${t.key}:${t.value}`
      return t.value
    })
    .join(' ')
}
