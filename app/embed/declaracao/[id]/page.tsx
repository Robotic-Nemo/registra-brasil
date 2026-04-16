import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import EmbedStatement from '@/components/embed/EmbedStatement'

interface PageProps {
  params: Promise<{ id: string }>
}

export default async function EmbedStatementPage({ params }: PageProps) {
  const { id } = await params
  const supabase = getSupabaseServiceClient()

  const EMBED_SELECT = `
    id, summary, full_quote, statement_date, verification_status, slug,
    politicians (slug, common_name, party, state, photo_url),
    statement_categories (
      is_primary,
      categories (label_pt, color_hex)
    )
  `

  // Try by slug first, then by id
  const { data: bySlug } = await supabase
    .from('statements')
    .select(EMBED_SELECT)
    .eq('slug', id)
    .single()

  const matched = bySlug ?? (await supabase
    .from('statements')
    .select(EMBED_SELECT)
    .eq('id', id)
    .single()).data

  if (!matched) notFound()

  const data = matched as unknown as {
    id: string
    summary: string
    full_quote: string | null
    statement_date: string
    verification_status: string
    slug: string | null
    politicians: {
      slug: string
      common_name: string
      party: string
      state: string | null
      photo_url: string | null
    }
    statement_categories: {
      is_primary: boolean
      categories: { label_pt: string; color_hex: string }
    }[]
  }

  const categories = data.statement_categories
    ?.map(sc => sc.categories)
    .filter(Boolean) ?? []

  return (
    <div className="max-w-[600px] mx-auto">
      <EmbedStatement
        statement={data}
        politician={data.politicians}
        categories={categories}
      />
    </div>
  )
}
