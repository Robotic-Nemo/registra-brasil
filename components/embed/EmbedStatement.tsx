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
  options?: {
    theme?: 'light' | 'dark' | 'auto'
    size?: 'sm' | 'md' | 'lg'
    hidePhoto?: boolean
    hideMeta?: boolean
  }
}

const STATUS_LABELS: Record<string, { label: string; light: string; dark: string }> = {
  verified: { label: 'Verificado', light: 'bg-green-100 text-green-800', dark: 'bg-green-900/50 text-green-200' },
  disputed: { label: 'Contestado', light: 'bg-red-100 text-red-800', dark: 'bg-red-900/50 text-red-200' },
  unverified: { label: 'Nao verificado', light: 'bg-yellow-100 text-yellow-800', dark: 'bg-yellow-900/50 text-yellow-200' },
}

const SIZE_CLASS = {
  sm: { padding: 'p-3', text: 'text-xs', photo: 'h-8 w-8', quote: 'text-xs' },
  md: { padding: 'p-4', text: 'text-sm', photo: 'h-10 w-10', quote: 'text-sm' },
  lg: { padding: 'p-5', text: 'text-base', photo: 'h-12 w-12', quote: 'text-base' },
}

/**
 * Embeddable statement card. Supports light/dark/auto theme, three sizes,
 * and optional hiding of photo or meta row.
 */
export default function EmbedStatement({
  statement, politician, categories, options = {},
}: EmbedStatementProps) {
  const theme = options.theme ?? 'auto'
  const size = options.size ?? 'md'
  const sizeCls = SIZE_CLASS[size]

  const permalink = `${SITE_URL}/declaracao/${statement.slug ?? statement.id}`
  const polLink = `${SITE_URL}/politico/${politician.slug}`
  const statusInfo = STATUS_LABELS[statement.verification_status] ?? STATUS_LABELS.unverified

  const themeRoot =
    theme === 'light' ? 'bg-white text-zinc-900' :
    theme === 'dark' ? 'bg-zinc-950 text-zinc-100' :
    'bg-white text-zinc-900 dark:bg-zinc-950 dark:text-zinc-100'
  const subColor =
    theme === 'light' ? 'text-zinc-500' :
    theme === 'dark' ? 'text-zinc-400' :
    'text-zinc-500 dark:text-zinc-400'
  const statusCls =
    theme === 'dark' ? statusInfo.dark :
    theme === 'light' ? statusInfo.light :
    `${statusInfo.light} dark:${statusInfo.dark.split(' ').join(' dark:')}`
  const quoteCls =
    theme === 'light' ? 'border-l-2 border-zinc-300 text-zinc-700' :
    theme === 'dark' ? 'border-l-2 border-zinc-700 text-zinc-300' :
    'border-l-2 border-zinc-300 text-zinc-700 dark:border-zinc-700 dark:text-zinc-300'

  return (
    <div className={`font-sans ${sizeCls.padding} ${sizeCls.text} ${themeRoot}`}>
      <div className="flex items-center gap-3">
        {!options.hidePhoto && politician.photo_url && (
          <img
            src={politician.photo_url}
            alt={politician.common_name}
            className={`${sizeCls.photo} rounded-full object-cover`}
            loading="lazy"
          />
        )}
        <div className="min-w-0">
          <a
            href={polLink}
            target="_blank"
            rel="noopener noreferrer"
            className={`block truncate font-semibold hover:underline`}
          >
            {politician.common_name}
          </a>
          <span className={`text-[11px] ${subColor}`}>
            {politician.party}{politician.state ? ` - ${politician.state}` : ''}
          </span>
        </div>
        <span className={`ml-auto shrink-0 rounded-full px-2 py-0.5 text-[10px] font-medium ${statusCls}`}>
          {statusInfo.label}
        </span>
      </div>

      <blockquote className={`mt-3 pl-3 ${quoteCls} ${sizeCls.quote}`}>
        <a href={permalink} target="_blank" rel="noopener noreferrer" className="hover:underline">
          &ldquo;{statement.full_quote ?? statement.summary}&rdquo;
        </a>
      </blockquote>

      {!options.hideMeta && (
        <div className={`mt-2 flex items-center justify-between text-[10px] ${subColor}`}>
          <time dateTime={statement.statement_date}>
            {new Date(statement.statement_date).toLocaleDateString('pt-BR')}
          </time>
          {categories && categories.length > 0 && (
            <div className="flex gap-1">
              {categories.slice(0, 3).map((c) => (
                <span
                  key={c.label_pt}
                  className="rounded px-1.5 py-0.5"
                  style={{ backgroundColor: c.color_hex + '22', color: c.color_hex }}
                >
                  {c.label_pt}
                </span>
              ))}
            </div>
          )}
        </div>
      )}

      <EmbedFooter />
    </div>
  )
}
