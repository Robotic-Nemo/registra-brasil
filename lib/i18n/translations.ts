/**
 * Translation structure and Portuguese strings.
 * Base for future internationalization.
 */

export type TranslationKey = keyof typeof ptBR

export const ptBR = {
  // Common
  'common.loading': 'Carregando...',
  'common.error': 'Erro',
  'common.retry': 'Tentar novamente',
  'common.close': 'Fechar',
  'common.save': 'Salvar',
  'common.cancel': 'Cancelar',
  'common.search': 'Buscar',
  'common.back': 'Voltar',
  'common.next': 'Proximo',
  'common.previous': 'Anterior',
  'common.share': 'Compartilhar',
  'common.print': 'Imprimir',
  'common.copy': 'Copiar',
  'common.copied': 'Copiado!',
  'common.seeMore': 'Ver mais',
  'common.seeLess': 'Ver menos',
  'common.noResults': 'Nenhum resultado encontrado.',
  'common.showAll': 'Mostrar tudo',

  // Navigation
  'nav.home': 'Inicio',
  'nav.politicians': 'Politicos',
  'nav.statements': 'Declaracoes',
  'nav.categories': 'Categorias',
  'nav.search': 'Buscar',
  'nav.about': 'Sobre',
  'nav.contact': 'Contato',
  'nav.favorites': 'Favoritos',
  'nav.stats': 'Estatisticas',

  // Statements
  'statements.recent': 'Declaracoes recentes',
  'statements.all': 'Todas as declaracoes',
  'statements.byPolitician': 'Declaracoes de {name}',
  'statements.noStatements': 'Nenhuma declaracao encontrada.',
  'statements.source': 'Fonte',
  'statements.date': 'Data',
  'statements.category': 'Categoria',

  // Politicians
  'politicians.all': 'Todos os politicos',
  'politicians.profile': 'Perfil',
  'politicians.party': 'Partido',
  'politicians.state': 'Estado',
  'politicians.role': 'Cargo',

  // Bookmarks
  'bookmarks.title': 'Favoritos',
  'bookmarks.add': 'Salvar',
  'bookmarks.remove': 'Remover dos favoritos',
  'bookmarks.empty': 'Nenhum favorito salvo ainda.',
  'bookmarks.clearAll': 'Limpar tudo',

  // Accessibility
  'a11y.skipToContent': 'Pular para o conteudo principal',
  'a11y.skipToSearch': 'Pular para a busca',
  'a11y.textSize': 'Tamanho do texto',
  'a11y.highContrast': 'Alto contraste',
  'a11y.readingProgress': 'Progresso de leitura',

  // Status
  'status.operational': 'Operacional',
  'status.degraded': 'Degradado',
  'status.outage': 'Fora do ar',
  'status.maintenance': 'Em manutencao',

  // Footer
  'footer.copyright': '2026 Registra Brasil. Todos os direitos reservados.',
  'footer.privacy': 'Privacidade',
  'footer.terms': 'Termos de uso',
  'footer.accessibility': 'Acessibilidade',
} as const

export const translations: Record<string, Record<string, string>> = {
  pt: ptBR,
}

/** Get a translation string by key and locale */
export function t(key: string, locale = 'pt', params?: Record<string, string>): string {
  const strings = translations[locale] ?? translations.pt
  let value = (strings as Record<string, string>)[key] ?? key

  if (params) {
    Object.entries(params).forEach(([k, v]) => {
      value = value.replace(`{${k}}`, v)
    })
  }

  return value
}
