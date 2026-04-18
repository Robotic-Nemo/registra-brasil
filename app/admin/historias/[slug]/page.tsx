import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ExternalLink } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { StoryEditor } from './StoryEditor'

export const dynamic = 'force-dynamic'

interface PageProps { params: Promise<{ slug: string }> }

export default async function AdminStoryEdit({ params }: PageProps) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()
  const isNew = slug === 'nova'

  let story: any = null
  if (!isNew) {
    const { data } = await (supabase.from('stories') as any)
      .select('id, slug, title, subtitle, author, body_markdown, hero_statement_id, cover_image_url, is_published')
      .eq('slug', slug)
      .maybeSingle()
    if (!data) notFound()
    story = data
  }

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <Link href="/admin/historias" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
          <h1 className="text-xl font-bold text-gray-900">
            {isNew ? 'Nova história' : `Editar: ${story.title}`}
          </h1>
        </div>
        {!isNew && story.is_published && (
          <Link href={`/historia/${story.slug}`} target="_blank" className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline">
            <ExternalLink className="w-4 h-4" /> Ver página
          </Link>
        )}
      </div>

      <StoryEditor story={story} />
    </main>
  )
}
