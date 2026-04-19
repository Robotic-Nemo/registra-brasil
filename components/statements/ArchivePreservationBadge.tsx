import { Archive } from 'lucide-react'

interface Props {
  waybackUrl: string | null
  checkedAt: string | null
}

function fmt(iso: string | null): string {
  if (!iso) return '—'
  return new Date(iso).toLocaleDateString('pt-BR', { year: 'numeric', month: 'short', day: '2-digit' })
}

/**
 * Always-visible preservation badge next to the primary source. Three
 * states: archived (green link), pending (amber "sem snapshot ainda"),
 * not-yet-checked (gray).
 */
export function ArchivePreservationBadge({ waybackUrl, checkedAt }: Props) {
  if (waybackUrl) {
    return (
      <a
        href={waybackUrl}
        target="_blank"
        rel="noopener noreferrer"
        className="inline-flex items-center gap-1 rounded-full border border-emerald-300 bg-emerald-50 px-2 py-0.5 text-[11px] font-medium text-emerald-900 hover:bg-emerald-100 dark:border-emerald-800 dark:bg-emerald-950/40 dark:text-emerald-200"
        title={`Snapshot no Internet Archive${checkedAt ? ` · verificado em ${fmt(checkedAt)}` : ''}`}
      >
        <Archive className="h-3 w-3" aria-hidden />
        Preservado
      </a>
    )
  }
  if (checkedAt) {
    return (
      <span
        className="inline-flex items-center gap-1 rounded-full border border-amber-300 bg-amber-50 px-2 py-0.5 text-[11px] font-medium text-amber-900 dark:border-amber-800 dark:bg-amber-950/40 dark:text-amber-200"
        title={`Nenhum snapshot encontrado no Internet Archive · última checagem ${fmt(checkedAt)}`}
      >
        <Archive className="h-3 w-3" aria-hidden />
        Sem snapshot
      </span>
    )
  }
  return (
    <span
      className="inline-flex items-center gap-1 rounded-full border border-gray-300 bg-gray-50 px-2 py-0.5 text-[11px] font-medium text-gray-700 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300"
      title="Aguardando próxima checagem do Internet Archive"
    >
      <Archive className="h-3 w-3" aria-hidden />
      Preservação pendente
    </span>
  )
}
