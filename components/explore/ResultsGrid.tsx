import Link from 'next/link'
import type { StatementWithRelations } from '@/types/database'
import { VerificationBadge } from '@/components/statements/VerificationBadge'

interface Props {
  statements: StatementWithRelations[]
}

export function ResultsGrid({ statements }: Props) {
  if (statements.length === 0) {
    return (
      <div className="text-center py-12 text-gray-500">
        Nenhuma declaracao encontrada com os filtros selecionados.
      </div>
    )
  }

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
      {statements.map((s) => {
        const politician = s.politicians as unknown as {
          slug: string
          common_name: string
          party: string
          state: string | null
          photo_url: string | null
        }
        const primaryCat = (s.statement_categories as unknown as { is_primary: boolean; categories: { label_pt: string; color_hex: string } }[])
          ?.find((sc) => sc.is_primary)

        return (
          <Link
            key={s.id}
            href={`/declaracao/${s.id}`}
            className="block bg-white border border-gray-200 rounded-xl p-4 hover:border-blue-300 hover:shadow-sm transition-all"
          >
            <div className="flex items-center gap-2 mb-2">
              {politician.photo_url && (
                <img
                  src={politician.photo_url}
                  alt=""
                  className="w-8 h-8 rounded-full object-cover bg-gray-100"
                />
              )}
              <div className="min-w-0">
                <div className="text-sm font-medium text-gray-900 truncate">
                  {politician.common_name}
                </div>
                <div className="text-xs text-gray-500">
                  {politician.party}
                  {politician.state ? ` - ${politician.state}` : ''}
                </div>
              </div>
            </div>
            <p className="text-sm text-gray-700 line-clamp-3 mb-2">{s.summary}</p>
            <div className="flex items-center justify-between">
              <time className="text-xs text-gray-400 tabular-nums">{s.statement_date}</time>
              <div className="flex items-center gap-2">
                {primaryCat && (
                  <span
                    className="text-[10px] font-medium px-1.5 py-0.5 rounded-full"
                    style={{ backgroundColor: primaryCat.categories.color_hex + '20', color: primaryCat.categories.color_hex }}
                  >
                    {primaryCat.categories.label_pt}
                  </span>
                )}
                <VerificationBadge status={s.verification_status} />
              </div>
            </div>
          </Link>
        )
      })}
    </div>
  )
}
