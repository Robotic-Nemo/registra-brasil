/**
 * Converts text to a URL-safe slug.
 * Handles common Portuguese characters (ã, ç, é, õ, etc.) via Unicode NFD normalization,
 * which decomposes them into base letters + combining marks before stripping accents.
 * Examples: "ação" → "acao", "saúde" → "saude", "coração" → "coracao"
 */
export function slugify(text: string | null | undefined): string {
  if (!text) return 'sem-titulo'
  const slug = String(text)
    .toLowerCase()
    // NFD decomposes accented chars into base letter + combining diacritic:
    // ã → a + ̃, ç → c + ̧, é → e + ́, etc.
    .normalize('NFD')
    // Strip all combining diacritical marks (U+0300–U+036F)
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')
    .trim()

  return slug || 'sem-titulo'
}
