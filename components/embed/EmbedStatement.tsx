import EmbedFooter from './EmbedFooter'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface EmbedStatementProps {
  statement: {
    id: string
    summary: string
    full_quote: string | null
    statement_date: string
    verification_status: string
    slug: string | null
  }
  politician: {
    slug: string
    common_name: string
    party: string
    state: string | null
    photo_url: string | null
  }
  categories?: { label_pt: string; color_hex: string }[]
}

const STATUS_LABELS: Record<string, { label: string; color: string }> = {
  verified: { label: 'Verificado', color: 'bg-green-100 text-green-700' },
  disputed: { label: 'Contestado', color: 'bg-red-100 text-red-700' },
  unverified: { label: 'Nao verificado', color: 'bg-yellow-100 text-yellow-700' },
}

/**
 * Embeddable statement card component.
 */
export default function EmbedStatement({ statement, politician, categories }: EmbedStatementProps) {
  const permalink = `${SITE_URL}/declaracao/${statement.slug ?? statement.id}`
  const polLink = `${SITE_URL}/politico/${politician.slug}`
  const statusInfo = STATUS_LABELS[statement.verification_status] ?? STATUS_LABELS.unverified

  return (
    <div className="p-4 font-sans text-sm">
      {/* Header: politician */}
      <div className="flex items-center gap-3">
        {politician.photo_url && (
          <img
            src={politician.photo_url}
            alt={politician.common_name}
            className="h-10 w-10 rounded-full object-cover"
            loading="lazy"
          />
        )}
        <div className="min-w-0">
          <a
            href={polLink}
            target="_blank"
            rel="noopener noreferrer"
            className="font-semibold text-zinc-900 hover:underline dark:text-zinc-100 truncate block"
          >
            {politician.common_name}
          </a>
          <span className="text-xs text-zinc-500 dark:text-zinc-400">
            {politician.party}{politician.state ? ` - ${politician.state}` : ''}
          </span>
        </div>
        <span className={`ml-auto shrink-0 rounded-full px-2 py-0.5 text-xs font-medium ${statusInfo.color}`}>
          {statusInfo.label}
        </span>
      </div>

      {/* Quote */}
      <blockquote className="mt-3 border-l-2 border-zinc-300 pl-3 text-zinc-700 dark:border-zinc-600 dark:text-zinc-300">
        <a href={permalink} target="_blank" rel="noopener noreferrer" className="hover:underline">
          &ldquo;{statement.full_quote ?? statement.summary}&rdquo;
        </a>
      </blockquote>

      {/* Meta */}
      <div className="mt-2 flex items-center justify-between text-xs text-zinc-400">
        <time dateTime={statement.statement_date}>
          {new Date(statement.statement_date).toLocaleDateString('pt-BR')}
        </time>
        {categories && categories.length > 0 && (
          <div className="flex gap-1">
            {categories.slice(0, 3).map(c => (
              <span key={c.label_pt} className="rounded px-1.5 py-0.5" style={{ backgroundColor: c.color_hex + '20', color: c.color_hex }}>
                {c.label_pt}
              </span>
            ))}
          </div>
        )}
      </div>

      <EmbedFooter />
    </div>
  )
}
