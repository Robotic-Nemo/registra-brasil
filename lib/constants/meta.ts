/**
 * Centralized meta templates and constants for SEO across the site.
 */

export const SITE_NAME = 'Registra Brasil'
export const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
export const SITE_LOCALE = 'pt_BR'
export const SITE_LANGUAGE = 'pt-BR'

export const DEFAULT_META = {
  title: 'Registra Brasil — Declaracoes de politicos brasileiros',
  description:
    'Arquivo publico de declaracoes de politicos brasileiros com fontes primarias verificaveis. Pesquise, compare e acompanhe o que seus representantes dizem.',
  keywords: [
    'politica brasileira',
    'declaracoes',
    'politicos',
    'verificacao',
    'transparencia',
    'congresso',
    'senado',
    'camara',
  ],
} as const

export const META_TEMPLATES = {
  politician: (name: string, party: string) => ({
    title: `${name} (${party}) — Declaracoes | ${SITE_NAME}`,
    description: `Arquivo completo de declaracoes de ${name} (${party}) com fontes primarias verificaveis.`,
  }),
  category: (label: string) => ({
    title: `${label} — Categorias | ${SITE_NAME}`,
    description: `Declaracoes classificadas na categoria "${label}". Veja todas as declaracoes verificadas.`,
  }),
  statement: (politicianName: string, summary: string) => ({
    title: `${politicianName}: "${summary.slice(0, 60)}${summary.length > 60 ? '...' : ''}" — ${SITE_NAME}`,
    description: summary.slice(0, 160),
  }),
  search: (query?: string) => ({
    title: query ? `"${query}" — Busca | ${SITE_NAME}` : `Buscar declaracoes | ${SITE_NAME}`,
    description: query
      ? `Resultados da busca por "${query}" no Registra Brasil.`
      : 'Pesquise declaracoes de politicos brasileiros com fontes verificaveis.',
  }),
  statistics: () => ({
    title: `Estatisticas | ${SITE_NAME}`,
    description: 'Panorama geral das declaracoes registradas: totais, tendencias e dados por partido e estado.',
  }),
} as const

export const OG_DEFAULTS = {
  type: 'website' as const,
  locale: SITE_LOCALE,
  siteName: SITE_NAME,
} as const

export const TWITTER_DEFAULTS = {
  card: 'summary_large_image' as const,
  site: '@registrabrasil',
} as const
