const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export interface ShareLinks {
  twitter: string
  facebook: string
  whatsapp: string
  telegram: string
  linkedin: string
  email: string
  copy: string
}

/**
 * Generate social share links for a statement
 */
export function getStatementShareLinks(
  statementId: string,
  summary: string | null | undefined,
  politicianName: string | null | undefined
): ShareLinks {
  const url = `${SITE_URL}/declaracao/${statementId}`
  const safeSummary = (summary ?? '').trim()
  const safePolitician = (politicianName ?? '').trim()
  // Twitter limits share text — trim long summaries so the link is guaranteed to fit.
  const truncated = safeSummary.length > 180 ? `${safeSummary.slice(0, 177)}...` : safeSummary
  const text = truncated
    ? `"${truncated}" — ${safePolitician || 'Registra Brasil'} | Registra Brasil`
    : `Declaração no Registra Brasil`
  const encodedUrl = encodeURIComponent(url)
  const encodedText = encodeURIComponent(text)

  return {
    twitter: `https://twitter.com/intent/tweet?text=${encodedText}&url=${encodedUrl}`,
    facebook: `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`,
    whatsapp: `https://wa.me/?text=${encodeURIComponent(`${text}\n${url}`)}`,
    telegram: `https://t.me/share/url?url=${encodedUrl}&text=${encodedText}`,
    linkedin: `https://www.linkedin.com/sharing/share-offsite/?url=${encodedUrl}`,
    email: `mailto:?subject=${encodeURIComponent(`Declaração de ${safePolitician || 'político'}`)}&body=${encodeURIComponent(`${text}\n\n${url}`)}`,
    copy: url,
  }
}

/**
 * Generate share links for a politician profile
 */
export function getPoliticianShareLinks(
  slug: string,
  name: string,
  party: string
): ShareLinks {
  const url = `${SITE_URL}/politico/${slug}`
  const text = `Declarações de ${name} (${party}) no Registra Brasil`
  const encodedUrl = encodeURIComponent(url)
  const encodedText = encodeURIComponent(text)

  return {
    twitter: `https://twitter.com/intent/tweet?text=${encodedText}&url=${encodedUrl}`,
    facebook: `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`,
    whatsapp: `https://wa.me/?text=${encodeURIComponent(`${text}\n${url}`)}`,
    telegram: `https://t.me/share/url?url=${encodedUrl}&text=${encodedText}`,
    linkedin: `https://www.linkedin.com/sharing/share-offsite/?url=${encodedUrl}`,
    email: `mailto:?subject=${encodeURIComponent(`Perfil de ${name}`)}&body=${encodeURIComponent(`${text}\n\n${url}`)}`,
    copy: url,
  }
}

/**
 * Use Web Share API if available, fallback to clipboard
 */
export async function nativeShare(title: string, text: string, url: string): Promise<boolean> {
  if (typeof navigator !== 'undefined' && 'share' in navigator) {
    try {
      await navigator.share({ title, text, url })
      return true
    } catch {
      // User cancelled or not supported
      return false
    }
  }
  return false
}
