import {
  LayoutDashboard, Plus, List, Inbox, Scale, Flag, Copy, Upload,
  FolderKanban, BookOpen, Search, Settings, Sparkles,
  AlertTriangle, ShieldCheck, History, Link2, Merge,
} from 'lucide-react'

export type BadgeKey = 'pending_submissions' | 'pending_retractions' | 'pending_review'

export interface SectionLink {
  href: string
  label: string
  Icon: typeof Plus
  badgeKey?: BadgeKey
}

export interface Section {
  title: string
  items: SectionLink[]
}

export const ADMIN_NAV: Section[] = [
  {
    title: 'Revisão',
    items: [
      { href: '/admin', label: 'Painel', Icon: LayoutDashboard },
      { href: '/admin/adicionar', label: 'Adicionar declaração', Icon: Plus },
      { href: '/admin/statements', label: 'Todas as declarações', Icon: List, badgeKey: 'pending_review' },
      { href: '/admin/submissions', label: 'Submissões públicas', Icon: Inbox, badgeKey: 'pending_submissions' },
      { href: '/admin/retratacoes', label: 'Pedidos de retificação', Icon: Scale, badgeKey: 'pending_retractions' },
      { href: '/admin/reacoes', label: 'Reações do público', Icon: Flag },
    ],
  },
  {
    title: 'Qualidade do acervo',
    items: [
      { href: '/admin/duplicatas', label: 'Duplicatas (trigram)', Icon: Copy },
      { href: '/admin/fontes-duplicadas', label: 'Fontes duplicadas', Icon: Link2 },
      { href: '/admin/links-quebrados', label: 'Links quebrados', Icon: AlertTriangle },
      { href: '/admin/merge', label: 'Mesclar declarações', Icon: Merge },
      { href: '/admin/categorizar', label: 'Categorizar em lote', Icon: Copy },
      { href: '/admin/fact-checks', label: 'Checagens externas', Icon: ShieldCheck },
    ],
  },
  {
    title: 'Curadoria',
    items: [
      { href: '/admin/colecoes', label: 'Coleções', Icon: FolderKanban },
      { href: '/admin/historias', label: 'Histórias', Icon: BookOpen },
      { href: '/admin/declaracao-do-dia', label: 'Declaração do dia', Icon: Sparkles },
    ],
  },
  {
    title: 'Operações',
    items: [
      { href: '/admin/importar', label: 'Importar CSV', Icon: Upload },
      { href: '/admin/buscas', label: 'Buscas dos leitores', Icon: Search },
      { href: '/admin/auditoria', label: 'Auditoria', Icon: History },
      { href: '/admin/configuracoes-site', label: 'Configurações', Icon: Settings },
      { href: '/api/admin/stats.csv', label: 'Exportar relatório CSV', Icon: History },
    ],
  },
]
