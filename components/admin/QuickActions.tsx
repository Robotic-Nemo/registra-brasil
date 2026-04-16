import Link from 'next/link'

const ACTIONS = [
  { label: 'Adicionar declaração', href: '/admin/adicionar', icon: '📝' },
  { label: 'Fila de revisão', href: '/admin/review', icon: '✅' },
  { label: 'Gerenciar declarações', href: '/admin/statements', icon: '📋' },
  { label: 'Gerenciar políticos', href: '/admin/politicos', icon: '👤' },
  { label: 'Gerenciar categorias', href: '/admin/categorias', icon: '🏷️' },
  { label: 'Log de auditoria', href: '/admin/audit', icon: '📊' },
  { label: 'Executar scanner', href: '/admin/scanner', icon: '🔍' },
] as const

export function QuickActions() {
  return (
    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3">
      {ACTIONS.map(({ label, href, icon }) => (
        <Link
          key={href}
          href={href}
          className="flex items-center gap-3 p-3 border border-zinc-200 rounded-lg hover:bg-zinc-50 hover:border-zinc-300 transition-colors"
        >
          <span className="text-xl" aria-hidden="true">{icon}</span>
          <span className="text-sm font-medium text-zinc-700">{label}</span>
        </Link>
      ))}
    </div>
  )
}
