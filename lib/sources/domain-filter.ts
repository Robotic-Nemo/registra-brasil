/**
 * Shared PostgREST `.or(...)` chunk for matching
 * `statements.primary_source_url` against a bare domain.
 *
 * `primary_source_url` is a free-form string, so we approximate host
 * match by looking for `//<domain>/` (path) and `//www.<domain>/` and
 * bare-root `//<domain>` variants. Keeps the grammar safe by only
 * accepting pre-validated [a-z0-9.-] domains at the call site.
 *
 * Accepts an already-lowercased, stripped-of-`www.` domain. Returns
 * the raw `.or()` argument string.
 */
export function sourceUrlOrFilter(domain: string): string {
  return [
    `primary_source_url.ilike.%//${domain}/%`,
    `primary_source_url.ilike.%//www.${domain}/%`,
    `primary_source_url.ilike.%//${domain}`,
  ].join(',')
}

/** Post-decode regex gate — shared by every /api/fontes/:domain route. */
export const DOMAIN_RE_STRICT = /^[a-z0-9.-]{3,253}$/i
