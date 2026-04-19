import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import EmbedStatement from '@/components/embed/EmbedStatement'

interface PageProps {
  params: Promise<{ id: string }>
  searchParams: Promise<Record<string, string | string[] | undefined>>
}

type Theme = 'light' | 'dark' | 'auto'
type Size = 'sm' | 'md' | 'lg'

function parseTheme(v: string | string[] | undefined): Theme {
  const s = Array.isArray(v) ? v[0] : v
  return s === 'light' || s === 'dark' ? s : 'auto'
}
function parseSize(v: string | string[] | undefined): Size {
  const s = Array.isArray(v) ? v[0] : v
  return s === 'sm' || s === 'lg' ? s : 'md'
}
function truthy(v: string | string[] | undefined): boolean {
  const s = Array.isArray(v) ? v[0] : v
  return s === '1' || s === 'true'
}

export default async function EmbedStatementPage({ params, searchParams }: PageProps) {
  const { id } = await params
  const sp = await searchParams
  const options = {
    theme: parseTheme(sp.theme),
    size: parseSize(sp.size),
    hidePhoto: truthy(sp.hide_photo),
    hideMeta: truthy(sp.hide_meta),
  }
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
        options={options}
      />
    </div>
  )
}
