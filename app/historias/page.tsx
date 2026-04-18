import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { BookOpen, Clock } from 'lucide-react'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Histórias — Registra Brasil',
  description: 'Artigos editoriais que conectam múltiplas declarações em uma narrativa com comentários da equipe.',
  alternates: { canonical: '/historias' },
}

export default async function StoriesIndexPage() {
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('stories') as any)
    .select('slug, title, subtitle, author, cover_image_url, reading_time_min, published_at')
    .eq('is_published', true)
    .order('published_at', { ascending: false })
    .limit(50)

  const stories = (data ?? []) as Array<{
    slug: string
    title: string
    subtitle: string | null
    author: string | null
    cover_image_url: string | null
    reading_time_min: number | null
    published_at: string | null
  }>

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Histórias' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <BookOpen className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Histórias</h1>
        </div>
        <p className="text-sm text-gray-600 max-w-2xl">
          Artigos editoriais que conectam múltiplas declarações em uma narrativa — contradições ao
          longo do tempo, mudanças de posição, contextos históricos.
        </p>
      </header>

      {stories.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded-lg p-4">
          Nenhuma história publicada ainda.
        </p>
      ) : (
        <ul className="grid grid-cols-1 md:grid-cols-2 gap-5">
          {stories.map((s) => (
            <li key={s.slug}>
              <Link
                href={`/historia/${s.slug}`}
                className="block bg-white border border-gray-200 rounded-xl overflow-hidden hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              >
                {s.cover_image_url ? (
                  <Image
                    src={s.cover_image_url}
                    alt=""
                    width={720}
                    height={360}
                    unoptimized
                    className="w-full h-40 object-cover bg-gray-100"
                  />
                ) : (
                  <div className="w-full h-40 bg-gradient-to-br from-blue-50 to-blue-100 flex items-center justify-center">
                    <BookOpen className="w-10 h-10 text-blue-400" aria-hidden="true" />
                  </div>
                )}
                <div className="p-5">
                  <h2 className="font-semibold text-gray-900 mb-1">{s.title}</h2>
                  {s.subtitle && <p className="text-sm text-gray-600 mb-2 line-clamp-2">{s.subtitle}</p>}
                  <div className="flex items-center gap-3 text-xs text-gray-500">
                    {s.author && <span>por {s.author}</span>}
                    {s.published_at && <time dateTime={s.published_at}>{new Date(s.published_at).toLocaleDateString('pt-BR')}</time>}
                    {s.reading_time_min && (
                      <span className="inline-flex items-center gap-1">
                        <Clock className="w-3 h-3" aria-hidden="true" />
                        {s.reading_time_min} min
                      </span>
                    )}
                  </div>
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}
