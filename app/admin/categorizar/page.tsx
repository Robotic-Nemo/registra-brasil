import Link from 'next/link'
import { ArrowLeft, Tag } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { CategorizeForm } from './CategorizeForm'

export const dynamic = 'force-dynamic'

export default async function AdminCategorizePage() {
  const supabase = getSupabaseServiceClient()
  const { data: categories } = await (supabase.from('categories') as any)
    .select('id, slug, label_pt, color_hex')
    .order('label_pt')

  const cats = (categories ?? []) as Array<{ id: string; slug: string; label_pt: string; color_hex: string }>

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Tag className="w-5 h-5 text-blue-700" />
          Categorizar em lote
        </h1>
      </div>

      <p className="text-sm text-gray-600 mb-6 max-w-2xl">
        Cole IDs ou slugs de declarações (um por linha), escolha a categoria, e adicione ou
        remova em lote. A categoria primária não é removida automaticamente — reatribua primeiro
        se necessário.
      </p>

      <CategorizeForm categories={cats} />
    </main>
  )
}
