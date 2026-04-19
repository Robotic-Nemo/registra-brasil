'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useState } from 'react'
import {
  LayoutDashboard, Plus, List, Inbox, Scale, Flag, Copy, Upload,
  FolderKanban, BookOpen, Shield, Search, Settings, Sparkles,
  AlertTriangle, ShieldCheck, History, Link2, Merge,
} from 'lucide-react'

interface SectionLink {
  href: string
  label: string
  Icon: typeof Plus
  badgeKey?: BadgeKey
}

type BadgeKey = 'pending_submissions' | 'pending_retractions' | 'pending_review'

interface Section {
  title: string
  items: SectionLink[]
}

const NAV: Section[] = [
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
    ],
  },
]

interface BadgeCounts {
  pending_submissions: number
  pending_retractions: number
  pending_review: number
}

export function AdminSidebar() {
  const pathname = usePathname()
  const [counts, setCounts] = useState<Partial<BadgeCounts>>({})

  useEffect(() => {
    fetch('/api/admin/sidebar-counts', { cache: 'no-store' })
      .then((r) => r.ok ? r.json() : null)
      .then((j) => { if (j && typeof j === 'object') setCounts(j) })
      .catch(() => {})
  }, [pathname])

  return (
    <aside
      className="hidden lg:block lg:w-60 flex-shrink-0 border-r border-gray-200 bg-white min-h-[calc(100vh-3.5rem)] sticky top-14 self-start overflow-y-auto"
      aria-label="Navegação administrativa"
    >
      <nav className="p-3 text-sm flex flex-col gap-4">
        <div className="flex items-center gap-2 px-2 py-1 text-xs font-semibold uppercase tracking-wider text-gray-500">
          <Shield className="w-3.5 h-3.5" aria-hidden="true" />
          Admin
        </div>
        {NAV.map((section) => (
          <div key={section.title}>
            <p className="text-[10px] font-semibold uppercase tracking-wider text-gray-400 mb-1 px-2">
              {section.title}
            </p>
            <ul className="flex flex-col gap-0.5">
              {section.items.map((item) => {
                const active = pathname === item.href || (item.href !== '/admin' && pathname.startsWith(item.href))
                const badge = item.badgeKey ? counts[item.badgeKey] : undefined
                return (
                  <li key={item.href}>
                    <Link
                      href={item.href}
                      className={`flex items-center gap-2 px-2 py-1.5 rounded text-xs transition-colors ${
                        active ? 'bg-blue-50 text-blue-800 font-medium' : 'text-gray-700 hover:bg-gray-50'
                      }`}
                    >
                      <item.Icon className="w-3.5 h-3.5 flex-shrink-0" aria-hidden="true" />
                      <span className="flex-1 truncate">{item.label}</span>
                      {typeof badge === 'number' && badge > 0 && (
                        <span className="ml-auto text-[10px] tabular-nums px-1.5 py-0.5 rounded-full bg-red-500 text-white font-semibold">
                          {badge}
                        </span>
                      )}
                    </Link>
                  </li>
                )
              })}
            </ul>
          </div>
        ))}
      </nav>
    </aside>
  )
}
