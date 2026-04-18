import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ExternalLink } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { CollectionEditor } from './CollectionEditor'

export const dynamic = 'force-dynamic'

interface PageProps {
  params: Promise<{ slug: string }>
}

export default async function AdminCollectionEdit({ params }: PageProps) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()
  const isNew = slug === 'nova'

  let collection: any = null
  let members: Array<{ statement_id: string; position: number; statement_slug: string | null; summary: string }> = []

  if (!isNew) {
    const { data } = await (supabase.from('collections') as any)
      .select('id, slug, title, subtitle, description, cover_image_url, is_published')
      .eq('slug', slug)
      .maybeSingle()
    if (!data) notFound()
    collection = data

    const { data: joinRows } = await (supabase.from('collection_statements') as any)
      .select('statement_id, position, statements(slug, summary)')
      .eq('collection_id', collection.id)
      .order('position', { ascending: true })
    members = ((joinRows ?? []) as Array<{ statement_id: string; position: number; statements: { slug: string | null; summary: string } | null }>)
      .map((r) => ({
        statement_id: r.statement_id,
        position: r.position,
        statement_slug: r.statements?.slug ?? null,
        summary: r.statements?.summary ?? '(declaração removida)',
      }))
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <Link href="/admin/colecoes" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
          <h1 className="text-xl font-bold text-gray-900">
            {isNew ? 'Nova coleção' : `Editar: ${collection.title}`}
          </h1>
        </div>
        {!isNew && collection.is_published && (
          <Link
            href={`/colecao/${collection.slug}`}
            target="_blank"
            className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline"
          >
            <ExternalLink className="w-4 h-4" /> Ver página
          </Link>
        )}
      </div>

      <CollectionEditor
        collection={collection}
        initialMembers={members}
      />
    </main>
  )
}
