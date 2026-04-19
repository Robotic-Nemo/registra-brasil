import Link from 'next/link'
import Image from 'next/image'
import type { SimilarPolitician } from '@/lib/politicians/similar'

export function SimilarPoliticians({
  politicians,
  targetName,
}: {
  politicians: SimilarPolitician[]
  targetName: string
}) {
  if (politicians.length === 0) return null
  return (
    <section aria-label={`Políticos parecidos com ${targetName}`}>
      <h2 className="mb-1 text-lg font-semibold text-gray-900 dark:text-gray-100">
        Perfil temático parecido
      </h2>
      <p className="mb-3 text-sm text-gray-600 dark:text-gray-400">
        Políticos cuja distribuição de categorias de declarações mais se
        aproxima da de {targetName}. Partidos diferentes podem aparecer —
        o critério é o padrão de temas, não a legenda.
      </p>
      <ul className="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {politicians.map((p) => {
          const sim = Math.max(0, Math.min(1, p.similarity))
          return (
            <li key={p.id}>
              <Link
                href={`/politico/${p.slug}`}
                className="group flex items-center gap-3 rounded-xl border border-gray-200 bg-white p-3 transition hover:border-indigo-400 hover:shadow-sm dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-600"
              >
                {p.photo_url ? (
                  <Image
                    src={p.photo_url}
                    alt=""
                    width={48}
                    height={48}
                    unoptimized
                    className="h-12 w-12 shrink-0 rounded-full object-cover"
                  />
                ) : (
                  <div className="h-12 w-12 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />
                )}
                <div className="min-w-0 flex-1">
                  <div className="truncate font-medium text-gray-900 group-hover:text-indigo-700 dark:text-gray-100 dark:group-hover:text-indigo-300">
                    {p.common_name}
                  </div>
                  <div className="truncate text-xs text-gray-500 dark:text-gray-400">
                    {p.party}
                    {p.state ? `-${p.state}` : ''} · {p.shared_categories} cat. em comum
                  </div>
                  <div
                    className="mt-1 h-1 w-full rounded bg-gray-100 dark:bg-gray-800"
                    role="meter"
                    aria-valuemin={0}
                    aria-valuemax={100}
                    aria-valuenow={Math.round(sim * 100)}
                    aria-label={`${Math.round(sim * 100)}% de similaridade temática`}
                  >
                    <div
                      className="h-1 rounded bg-indigo-500"
                      style={{ width: `${sim * 100}%` }}
                    />
                  </div>
                </div>
                <span className="shrink-0 text-right text-xs tabular-nums text-gray-600 dark:text-gray-400">
                  {(sim * 100).toFixed(0)}%
                </span>
              </Link>
            </li>
          )
        })}
      </ul>
    </section>
  )
}
