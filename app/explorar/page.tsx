import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { StatementWithRelations } from '@/types/database'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { ExploreClient } from './ExploreClient'
import type { Metadata } from 'next'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Explorar Declaracoes — Registra Brasil',
  description: 'Explore e filtre declaracoes de politicos brasileiros por partido, estado, categoria e periodo.',
  alternates: { canonical: '/explorar' },
}

interface PageProps {
  searchParams: Promise<Record<string, string | string[] | undefined>>
}

export default async function ExplorarPage({ searchParams }: PageProps) {
  const params = await searchParams
  const supabase = getSupabaseServiceClient()

  // Fetch filter options
  const [{ data: partyRows }, { data: categories }] = await Promise.all([
    supabase.from('politicians').select('party').eq('is_active', true),
    supabase.from('categories').select('slug, label_pt').order('sort_order'),
  ])

  const parties = [...new Set((partyRows ?? []).map((r) => (r as { party: string }).party))].sort()
  const categoryOptions = (categories ?? []).map((c) => {
    const cat = c as unknown as { slug: string; label_pt: string }
    return { slug: cat.slug, label: cat.label_pt }
  })

  // Build query
  const rawPagina = typeof params.pagina === 'string' ? params.pagina : Array.isArray(params.pagina) ? params.pagina[0] : undefined
  const parsedPage = rawPagina ? parseInt(rawPagina, 10) : 1
  const page = Math.min(1000, Math.max(1, Number.isFinite(parsedPage) ? parsedPage : 1))
  const limit = 20
  const offset = (page - 1) * limit

  let query = supabase
    .from('statements')
    .select(
      '*, politicians(id, slug, common_name, full_name, party, state, photo_url), statement_categories(is_primary, categories(*))',
      { count: 'exact' }
    )
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: params.ordem === 'data-asc' })
    .range(offset, offset + limit - 1)

  const status = typeof params.status === 'string' ? params.status : undefined
  if (status) {
    query = query.eq('verification_status', status)
  } else {
    query = query.eq('verification_status', 'verified')
  }

  if (typeof params.q === 'string' && params.q.trim()) {
    query = query.textSearch('search_vector', params.q.trim(), { type: 'websearch', config: 'portuguese' })
  }
  const DATE_RE = /^\d{4}-\d{2}-\d{2}$/
  let deParam = typeof params.de === 'string' && DATE_RE.test(params.de) ? params.de : undefined
  let ateParam = typeof params.ate === 'string' && DATE_RE.test(params.ate) ? params.ate : undefined
  // Swap if user inverted the range
  if (deParam && ateParam && deParam > ateParam) {
    const tmp = deParam
    deParam = ateParam
    ateParam = tmp
  }
  if (deParam) query = query.gte('statement_date', deParam)
  if (ateParam) query = query.lte('statement_date', ateParam)

  // Party/state filter via politician
  if (typeof params.partido === 'string' || typeof params.estado === 'string') {
    // Get matching politician IDs
    let polQuery = supabase.from('politicians').select('id')
    if (typeof params.partido === 'string') polQuery = polQuery.eq('party', params.partido)
    if (typeof params.estado === 'string') polQuery = polQuery.eq('state', params.estado)
    const { data: polRows } = await polQuery
    const polIds = (polRows ?? []).map((r) => (r as { id: string }).id)
    if (polIds.length > 0) {
      query = query.in('politician_id', polIds)
    } else {
      // No matching politicians: return empty
      return (
        <main className="max-w-5xl mx-auto px-4 py-8">
          <Breadcrumbs items={[{ label: 'Explorar' }]} />
          <ExploreClient
            statements={[]}
            total={0}
            parties={parties}
            categories={categoryOptions}
          />
        </main>
      )
    }
  }

  const { data, count } = await query
  const statements = (data ?? []) as unknown as StatementWithRelations[]

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <Breadcrumbs items={[{ label: 'Explorar' }]} />
      <ExploreClient
        statements={statements}
        total={count ?? 0}
        parties={parties}
        categories={categoryOptions}
      />
    </main>
  )
}
