import Link from 'next/link'
import { Clock, ArrowRight } from 'lucide-react'
import type { ReactNode } from 'react'

export interface QueueItem {
  key: string
  severity: 'critical' | 'warn' | 'info'
  icon: ReactNode
  title: string
  detail: string
  href: string
  age?: string
}

const TONE: Record<QueueItem['severity'], string> = {
  critical: 'bg-red-50 border-red-200 text-red-900 hover:bg-red-100',
  warn: 'bg-amber-50 border-amber-200 text-amber-900 hover:bg-amber-100',
  info: 'bg-blue-50 border-blue-200 text-blue-900 hover:bg-blue-100',
}

export function EditorialQueue({ items }: { items: QueueItem[] }) {
  if (items.length === 0) {
    return (
      <section className="bg-green-50 border border-green-200 rounded-xl p-4 text-sm text-green-900 mb-8">
        <p className="font-semibold">Sua fila está vazia.</p>
        <p className="text-xs opacity-80">
          Nenhuma submissão, retratação ou link quebrado exigindo atenção imediata. Aproveite
          para priorizar verificações pendentes.
        </p>
      </section>
    )
  }

  return (
    <section className="mb-8">
      <h2 className="text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">
        Sua fila do dia — top {items.length}
      </h2>
      <ol className="flex flex-col gap-2">
        {items.map((it) => (
          <li key={it.key}>
            <Link href={it.href} className={`flex items-start gap-3 p-3 border rounded-lg transition-colors ${TONE[it.severity]}`}>
              <span className="flex-shrink-0 mt-0.5">{it.icon}</span>
              <span className="flex-1 min-w-0">
                <span className="block font-semibold">{it.title}</span>
                <span className="block text-xs opacity-80">{it.detail}</span>
                {it.age && (
                  <span className="inline-flex items-center gap-1 text-[11px] opacity-70 mt-0.5">
                    <Clock className="w-3 h-3" aria-hidden="true" />
                    {it.age}
                  </span>
                )}
              </span>
              <ArrowRight className="w-4 h-4 flex-shrink-0 mt-1 opacity-60" aria-hidden="true" />
            </Link>
          </li>
        ))}
      </ol>
    </section>
  )
}
