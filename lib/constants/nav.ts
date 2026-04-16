export interface NavLink {
  href: string
  label: string
  description?: string
}

/** Main navigation links used in header and keyboard shortcuts */
export const MAIN_NAV: NavLink[] = [
  { href: '/buscar', label: 'Buscar', description: 'Pesquisar declarações' },
  { href: '/politicos', label: 'Políticos', description: 'Lista de políticos monitorados' },
  { href: '/categorias', label: 'Categorias', description: 'Categorias temáticas' },
  { href: '/estatisticas', label: 'Estatísticas', description: 'Dados do acervo' },
  { href: '/comparar', label: 'Comparar', description: 'Comparar políticos' },
  { href: '/declaracoes-recentes', label: 'Recentes', description: 'Declarações mais recentes' },
]

/** Footer-only links */
export const FOOTER_NAV: NavLink[] = [
  { href: '/sobre', label: 'Sobre', description: 'Metodologia e fontes' },
  { href: '/sobre#fontes', label: 'Fontes aceitas' },
  { href: '/sobre#acessibilidade', label: 'Acessibilidade' },
]

/** Admin navigation */
export const ADMIN_NAV: NavLink[] = [
  { href: '/admin', label: 'Painel' },
  { href: '/admin/adicionar', label: 'Adicionar' },
]
