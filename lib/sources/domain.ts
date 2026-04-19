/**
 * Host → display name / canonical domain helpers used by /fontes.
 * Kept framework-free so route handlers, server components, and tests
 * can share one implementation.
 */

export function extractDomain(url: string | null | undefined): string | null {
  if (!url) return null
  try {
    const u = url.startsWith('http') ? url : `https://${url}`
    const host = new URL(u).hostname.toLowerCase()
    return host.replace(/^www\./, '')
  } catch {
    return null
  }
}

const DISPLAY_OVERRIDES: Record<string, string> = {
  'g1.globo.com': 'G1 (Globo)',
  'folha.uol.com.br': 'Folha de S.Paulo',
  'www1.folha.uol.com.br': 'Folha de S.Paulo',
  'oglobo.globo.com': 'O Globo',
  'valor.globo.com': 'Valor Econômico',
  'estadao.com.br': 'Estadão',
  'www.estadao.com.br': 'Estadão',
  'cnnbrasil.com.br': 'CNN Brasil',
  'uol.com.br': 'UOL',
  'poder360.com.br': 'Poder360',
  'congressoemfoco.uol.com.br': 'Congresso em Foco',
  'camara.leg.br': 'Câmara dos Deputados',
  'www.camara.leg.br': 'Câmara dos Deputados',
  'senado.leg.br': 'Senado Federal',
  'www12.senado.leg.br': 'Senado Federal',
  'gov.br': 'gov.br',
  'planalto.gov.br': 'Planalto',
  'tse.jus.br': 'TSE',
  'www.tse.jus.br': 'TSE',
  'agenciabrasil.ebc.com.br': 'Agência Brasil',
  'bbc.com': 'BBC',
  'youtube.com': 'YouTube',
  'www.youtube.com': 'YouTube',
  'twitter.com': 'Twitter / X',
  'x.com': 'X (Twitter)',
  'instagram.com': 'Instagram',
  'facebook.com': 'Facebook',
}

export function displaySourceName(domain: string): string {
  const d = domain.toLowerCase()
  return DISPLAY_OVERRIDES[d] ?? d
}

/**
 * Broad buckets shown as pill badges on /fontes — helps readers orient
 * among a long list of domains.
 */
export type SourceCategory =
  | 'imprensa'
  | 'oficial'
  | 'video'
  | 'social'
  | 'outro'

export function classifySource(domain: string): SourceCategory {
  const d = domain.toLowerCase()
  if (/\.(gov|leg|jus|mp)\.br$/.test(d) || d.endsWith('gov.br')) return 'oficial'
  if (d.includes('youtube.') || d.includes('youtu.be')) return 'video'
  if (
    d.endsWith('twitter.com') ||
    d.endsWith('x.com') ||
    d.endsWith('instagram.com') ||
    d.endsWith('facebook.com') ||
    d.endsWith('tiktok.com')
  ) {
    return 'social'
  }
  if (
    /\b(folha|globo|estadao|uol|terra|cnn|bbc|poder360|carta|veja|istoe|bandnews|band\.uol|r7|metropoles|exame|jovempan|valor|brasil247|intercept)\b/.test(d)
  ) {
    return 'imprensa'
  }
  return 'outro'
}

export const CATEGORY_LABEL: Record<SourceCategory, string> = {
  imprensa: 'Imprensa',
  oficial: 'Oficial',
  video: 'Vídeo',
  social: 'Rede social',
  outro: 'Outro',
}

export const CATEGORY_COLOR: Record<SourceCategory, string> = {
  imprensa: 'bg-blue-100 text-blue-800 dark:bg-blue-950/50 dark:text-blue-300',
  oficial: 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950/50 dark:text-emerald-300',
  video: 'bg-rose-100 text-rose-800 dark:bg-rose-950/50 dark:text-rose-300',
  social: 'bg-amber-100 text-amber-800 dark:bg-amber-950/50 dark:text-amber-300',
  outro: 'bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-300',
}
