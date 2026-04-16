import EmbedFooter from './EmbedFooter'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface EmbedPoliticianProps {
  politician: {
    slug: string
    common_name: string
    full_name: string
    party: string
    state: string | null
    role: string | null
    photo_url: string | null
  }
  statementCount?: number
}

/**
 * Embeddable politician card component.
 */
export default function EmbedPolitician({ politician, statementCount }: EmbedPoliticianProps) {
  const polLink = `${SITE_URL}/politico/${politician.slug}`

  return (
    <div className="p-4 font-sans text-sm">
      <div className="flex items-center gap-4">
        {politician.photo_url ? (
          <img
            src={politician.photo_url}
            alt={politician.common_name}
            className="h-16 w-16 rounded-full object-cover border-2 border-zinc-200 dark:border-zinc-700"
            loading="lazy"
          />
        ) : (
          <div className="h-16 w-16 rounded-full bg-zinc-200 dark:bg-zinc-700 flex items-center justify-center text-xl font-bold text-zinc-500">
            {politician.common_name.charAt(0)}
          </div>
        )}

        <div className="min-w-0 flex-1">
          <a
            href={polLink}
            target="_blank"
            rel="noopener noreferrer"
            className="font-bold text-lg text-zinc-900 hover:underline dark:text-zinc-100 truncate block"
          >
            {politician.common_name}
          </a>
          <p className="text-zinc-500 dark:text-zinc-400">
            {politician.party}{politician.state ? ` - ${politician.state}` : ''}
          </p>
          {politician.role && (
            <p className="text-xs text-zinc-400 dark:text-zinc-500">{politician.role}</p>
          )}
        </div>
      </div>

      {statementCount !== undefined && (
        <div className="mt-3 flex items-center gap-2">
          <div className="rounded-lg bg-blue-50 px-3 py-1.5 text-center dark:bg-blue-900/20">
            <span className="block text-lg font-bold text-blue-600 dark:text-blue-400">{statementCount}</span>
            <span className="text-xs text-blue-500 dark:text-blue-300">declaracoes</span>
          </div>
          <a
            href={polLink}
            target="_blank"
            rel="noopener noreferrer"
            className="ml-auto rounded-lg bg-blue-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-blue-700"
          >
            Ver perfil completo
          </a>
        </div>
      )}

      <EmbedFooter />
    </div>
  )
}
