'use client'

import { formatDistanceToNow } from 'date-fns'
import { ptBR } from 'date-fns/locale'
import {
  Plus,
  Pencil,
  Trash2,
  ShieldCheck,
  AlertTriangle,
  CheckCircle,
  XCircle,
  LogIn,
  LogOut,
  Download,
  Upload,
  GitMerge,
  RotateCcw,
} from 'lucide-react'
import type { AuditEntry } from '@/types/audit'
import { AuditAction } from '@/types/audit'
import { Badge } from '@/components/ui/Badge'

const actionConfig: Record<AuditAction, { icon: React.ElementType; label: string; color: string }> = {
  [AuditAction.CREATE]: { icon: Plus, label: 'Criação', color: 'text-green-600' },
  [AuditAction.UPDATE]: { icon: Pencil, label: 'Atualização', color: 'text-blue-600' },
  [AuditAction.DELETE]: { icon: Trash2, label: 'Exclusão', color: 'text-red-600' },
  [AuditAction.VERIFY]: { icon: ShieldCheck, label: 'Verificação', color: 'text-emerald-600' },
  [AuditAction.DISPUTE]: { icon: AlertTriangle, label: 'Disputa', color: 'text-amber-600' },
  [AuditAction.APPROVE]: { icon: CheckCircle, label: 'Aprovação', color: 'text-green-600' },
  [AuditAction.REJECT]: { icon: XCircle, label: 'Rejeição', color: 'text-red-600' },
  [AuditAction.LOGIN]: { icon: LogIn, label: 'Login', color: 'text-gray-600' },
  [AuditAction.LOGOUT]: { icon: LogOut, label: 'Logout', color: 'text-gray-600' },
  [AuditAction.EXPORT]: { icon: Download, label: 'Exportação', color: 'text-purple-600' },
  [AuditAction.IMPORT]: { icon: Upload, label: 'Importação', color: 'text-purple-600' },
  [AuditAction.MERGE]: { icon: GitMerge, label: 'Merge', color: 'text-indigo-600' },
  [AuditAction.RESTORE]: { icon: RotateCcw, label: 'Restauração', color: 'text-teal-600' },
}

const entityLabels: Record<string, string> = {
  statement: 'Declaração',
  politician: 'Político',
  category: 'Categoria',
  source: 'Fonte',
  user: 'Usuário',
  setting: 'Configuração',
}

interface Props {
  entries: AuditEntry[]
}

export function AuditLog({ entries }: Props) {
  if (entries.length === 0) {
    return (
      <p className="text-sm text-gray-500 py-8 text-center">
        Nenhuma entrada de auditoria encontrada.
      </p>
    )
  }

  return (
    <div className="relative">
      {/* Timeline line */}
      <div className="absolute left-5 top-0 bottom-0 w-px bg-gray-200" aria-hidden="true" />

      <ol className="space-y-4" aria-label="Log de auditoria">
        {entries.map((entry) => {
          const config = actionConfig[entry.action] ?? actionConfig[AuditAction.UPDATE]
          const Icon = config.icon
          const entityLabel = entityLabels[entry.entity_type] ?? entry.entity_type

          return (
            <li key={entry.id} className="relative pl-12">
              {/* Icon dot */}
              <div
                className={`absolute left-3 top-1 flex items-center justify-center w-5 h-5 rounded-full bg-white border-2 border-gray-200 ${config.color}`}
                aria-hidden="true"
              >
                <Icon className="w-3 h-3" />
              </div>

              <div className="bg-white border border-gray-200 rounded-lg p-3 shadow-sm">
                <div className="flex items-center gap-2 flex-wrap">
                  <Badge variant="default">
                    {config.label}
                  </Badge>
                  <span className="text-xs text-gray-500">
                    {entityLabel} &middot; <code className="text-[10px]">{entry.entity_id.slice(0, 8)}</code>
                  </span>
                  <span className="text-xs text-gray-400 ml-auto">
                    {formatDistanceToNow(new Date(entry.created_at), {
                      addSuffix: true,
                      locale: ptBR,
                    })}
                  </span>
                </div>

                {entry.actor_label && (
                  <p className="text-xs text-gray-600 mt-1">
                    Por: <span className="font-medium">{entry.actor_label}</span>
                  </p>
                )}

                {entry.details && Object.keys(entry.details).length > 0 && (
                  <details className="mt-2">
                    <summary className="text-xs text-gray-500 cursor-pointer hover:text-gray-700">
                      Detalhes
                    </summary>
                    <pre className="mt-1 text-[11px] bg-gray-50 rounded p-2 overflow-x-auto text-gray-700">
                      {JSON.stringify(entry.details, null, 2)}
                    </pre>
                  </details>
                )}
              </div>
            </li>
          )
        })}
      </ol>
    </div>
  )
}
