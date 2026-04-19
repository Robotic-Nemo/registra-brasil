import Link from 'next/link'
import Image from 'next/image'
import type { SearchSuggestions } from '@/lib/search/suggestions'

interface Props {
  suggestions: SearchSuggestions
  query: string
}

export function DidYouMean({ suggestions, query }: Props) {
  const { politicians, categories } = suggestions
  if (politicians.length === 0 && categories.length === 0) return null

  return (
    <section
      className="mt-4 rounded-xl border border-amber-200 bg-amber-50/60 p-5 dark:border-amber-900/40 dark:bg-amber-950/20"
      aria-label={`Sugestões para "${query}"`}
    >
      <h2 className="text-sm font-semibold text-amber-900 dark:text-amber-200">
        Você quis dizer…
      </h2>
      <p className="mt-1 text-xs text-amber-800/80 dark:text-amber-300/70">
        Nenhum resultado exato para <span className="font-medium">“{query}”</span>. Talvez um destes:
      </p>

      {politicians.length > 0 && (
        <div className="mt-4">
          <h3 className="text-xs uppercase tracking-wider text-amber-800/70 dark:text-amber-300/60">
            Políticos parecidos
          </h3>
          <ul className="mt-2 flex flex-wrap gap-2">
            {politicians.map((p) => (
              <li key={p.slug}>
                <Link
                  href={`/politico/${p.slug}`}
                  className="group inline-flex items-center gap-2 rounded-full border border-gray-200 bg-white pl-1 pr-3 py-1 text-sm text-gray-800 hover:border-amber-400 hover:bg-amber-50 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-200 dark:hover:border-amber-600 dark:hover:bg-amber-950/40"
                >
                  {p.photo_url ? (
                    <Image
                      src={p.photo_url}
                      alt=""
                      width={24}
                      height={24}
                      className="h-6 w-6 rounded-full object-cover"
                      unoptimized
                    />
                  ) : (
                    <span className="flex h-6 w-6 items-center justify-center rounded-full bg-gray-200 text-[10px] font-semibold text-gray-600 dark:bg-gray-700 dark:text-gray-300">
                      {p.common_name.slice(0, 1).toUpperCase()}
                    </span>
                  )}
                  <span className="font-medium">{p.common_name}</span>
                  {(p.party || p.state) && (
                    <span className="text-xs text-gray-500 dark:text-gray-400">
                      {[p.party, p.state].filter(Boolean).join(' · ')}
                    </span>
                  )}
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}

      {categories.length > 0 && (
        <div className="mt-4">
          <h3 className="text-xs uppercase tracking-wider text-amber-800/70 dark:text-amber-300/60">
            Categorias parecidas
          </h3>
          <ul className="mt-2 flex flex-wrap gap-2">
            {categories.map((c) => (
              <li key={c.slug}>
                <Link
                  href={`/categorias/${c.slug}`}
                  className="inline-flex items-center gap-2 rounded-full border border-gray-200 bg-white px-3 py-1 text-sm text-gray-800 hover:border-amber-400 hover:bg-amber-50 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-200 dark:hover:border-amber-600 dark:hover:bg-amber-950/40"
                >
                  <span
                    className="inline-block h-2.5 w-2.5 rounded-full"
                    style={{ backgroundColor: c.color_hex ?? '#9ca3af' }}
                    aria-hidden
                  />
                  {c.label_pt}
                </Link>
              </li>
            ))}
          </ul>
        </div>
      )}
    </section>
  )
}
