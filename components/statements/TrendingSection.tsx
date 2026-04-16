import Link from 'next/link'
import Image from 'next/image'
import type { TrendingPolitician, TrendingCategory } from '@/lib/supabase/queries/trending'

interface TrendingSectionProps {
  politicians: TrendingPolitician[]
  categories: TrendingCategory[]
}

export function TrendingSection({ politicians, categories }: TrendingSectionProps) {
  if (politicians.length === 0 && categories.length === 0) return null

  return (
    <section className="py-8">
      <h2 className="text-xl font-bold text-zinc-900 mb-6">Em Alta</h2>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {politicians.length > 0 && (
          <div>
            <h3 className="text-sm font-semibold text-zinc-500 uppercase tracking-wide mb-3">
              Políticos
            </h3>
            <div className="space-y-2">
              {politicians.slice(0, 5).map((pol, i) => (
                <Link
                  key={pol.slug}
                  href={`/politico/${pol.slug}`}
                  className="flex items-center gap-3 p-2 rounded-lg hover:bg-zinc-50 transition-colors"
                >
                  <span className="text-lg font-bold text-zinc-300 w-6 text-right">
                    {i + 1}
                  </span>
                  {pol.photo_url ? (
                    <Image
                      src={pol.photo_url}
                      alt=""
                      width={32}
                      height={32}
                      className="w-8 h-8 rounded-full object-cover"
                      referrerPolicy="no-referrer"
                    />
                  ) : (
                    <div className="w-8 h-8 rounded-full bg-zinc-200 flex items-center justify-center text-xs font-bold text-zinc-500">
                      {pol.common_name[0]}
                    </div>
                  )}
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-zinc-800 truncate">
                      {pol.common_name}
                    </p>
                    <p className="text-xs text-zinc-500">{pol.party}</p>
                  </div>
                  <span className="text-xs font-semibold text-blue-600 tabular-nums">
                    {pol.recentCount} declarações
                  </span>
                </Link>
              ))}
            </div>
          </div>
        )}

        {categories.length > 0 && (
          <div>
            <h3 className="text-sm font-semibold text-zinc-500 uppercase tracking-wide mb-3">
              Categorias
            </h3>
            <div className="space-y-2">
              {categories.slice(0, 5).map((cat) => (
                <Link
                  key={cat.slug}
                  href={`/categorias/${cat.slug}`}
                  className="flex items-center gap-3 p-2 rounded-lg hover:bg-zinc-50 transition-colors"
                >
                  <div
                    className="w-3 h-3 rounded-full flex-shrink-0"
                    style={{ backgroundColor: cat.color_hex }}
                  />
                  <span className="text-sm font-medium text-zinc-800 flex-1">
                    {cat.label_pt}
                  </span>
                  <span className="text-xs font-semibold text-blue-600 tabular-nums">
                    {cat.recentCount}
                  </span>
                </Link>
              ))}
            </div>
          </div>
        )}
      </div>
    </section>
  )
}
