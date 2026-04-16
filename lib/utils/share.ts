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
  summary: string,
  politicianName: string
): ShareLinks {
  const url = `${SITE_URL}/declaracao/${statementId}`
  const text = `"${summary}" — ${politicianName} | Registra Brasil`
  const encodedUrl = encodeURIComponent(url)
  const encodedText = encodeURIComponent(text)

  return {
    twitter: `https://twitter.com/intent/tweet?text=${encodedText}&url=${encodedUrl}`,
    facebook: `https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`,
    whatsapp: `https://wa.me/?text=${encodeURIComponent(`${text}\n${url}`)}`,
    telegram: `https://t.me/share/url?url=${encodedUrl}&text=${encodedText}`,
    linkedin: `https://www.linkedin.com/sharing/share-offsite/?url=${encodedUrl}`,
    email: `mailto:?subject=${encodeURIComponent(`Declaração de ${politicianName}`)}&body=${encodeURIComponent(`${text}\n\n${url}`)}`,
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
