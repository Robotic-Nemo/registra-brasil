import type { MetadataRoute } from 'next'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const STATIC_DATE = new Date('2026-04-01')

  // Static pages
  const staticPages: MetadataRoute.Sitemap = [
    { url: SITE_URL, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 1.0 },
    { url: `${SITE_URL}/buscar`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.9 },
    { url: `${SITE_URL}/politicos`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.7 },
    { url: `${SITE_URL}/politicos/por-estado`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/politicos/por-partido`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/categorias`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.7 },
    { url: `${SITE_URL}/comparar`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/sobre`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/estatisticas`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/declaracoes-recentes`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.8 },
    { url: `${SITE_URL}/acessibilidade`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.2 },
    { url: `${SITE_URL}/privacidade`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.2 },
    { url: `${SITE_URL}/termos`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.2 },
    { url: `${SITE_URL}/contato`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/linha-do-tempo`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.7 },
    { url: `${SITE_URL}/api-docs`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.4 },
    { url: `${SITE_URL}/partidos`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/estados`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/faq`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.5 },
    { url: `${SITE_URL}/changelog`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.4 },
    { url: `${SITE_URL}/mapa`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/nuvem-de-palavras`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/narrativas`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/glossario`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.4 },
    { url: `${SITE_URL}/explorar`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.7 },
    { url: `${SITE_URL}/metodologia`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/estatisticas/categorias`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/estatisticas/estados`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/estatisticas/partidos`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/estatisticas/tendencias`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.5 },
    { url: `${SITE_URL}/status`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.3 },
    { url: `${SITE_URL}/ranking`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.6 },
    { url: `${SITE_URL}/dados`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.4 },
    { url: `${SITE_URL}/fontes`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/tendencias`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.5 },
    { url: `${SITE_URL}/contradicoes`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/desenvolvedores`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.4 },
    { url: `${SITE_URL}/imprensa`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/retratacoes`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.4 },
    { url: `${SITE_URL}/equipe`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/parceiros`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/financiamento`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.3 },
    { url: `${SITE_URL}/colecoes`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.7 },
    { url: `${SITE_URL}/sugerir`, lastModified: STATIC_DATE, changeFrequency: 'monthly', priority: 0.5 },
    { url: `${SITE_URL}/atualizacoes`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.5 },
    { url: `${SITE_URL}/boletim`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/transparencia`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/historias`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.7 },
    { url: `${SITE_URL}/analise`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
    { url: `${SITE_URL}/offline`, lastModified: STATIC_DATE, changeFrequency: 'yearly', priority: 0.1 },
    { url: `${SITE_URL}/retrospectiva`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.6 },
    { url: `${SITE_URL}/buscas-populares`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.4 },
    { url: `${SITE_URL}/declaracao-do-dia`, lastModified: STATIC_DATE, changeFrequency: 'daily', priority: 0.6 },
    { url: `${SITE_URL}/politicos/a-z`, lastModified: STATIC_DATE, changeFrequency: 'weekly', priority: 0.5 },
  ]

  // Dynamic pages from Supabase
  try {
    const { getSupabaseServiceClient } = await import('@/lib/supabase/server')
    const supabase = getSupabaseServiceClient()

    // Politicians
    const { data: politicians } = await supabase
      .from('politicians')
      .select('slug, updated_at')
      .eq('is_active', true)

    const politicianPages: MetadataRoute.Sitemap = (politicians ?? []).flatMap((p: { slug: string; updated_at: string }) => [
      {
        url: `${SITE_URL}/politico/${p.slug}`,
        lastModified: new Date(p.updated_at),
        changeFrequency: 'weekly' as const,
        priority: 0.8,
      },
      {
        url: `${SITE_URL}/politico/${p.slug}/dossie`,
        lastModified: new Date(p.updated_at),
        changeFrequency: 'weekly' as const,
        priority: 0.5,
      },
    ])

    // Categories
    const { data: categories } = await supabase
      .from('categories')
      .select('slug')

    const categoryPages: MetadataRoute.Sitemap = (categories ?? []).map((c: { slug: string }) => ({
      url: `${SITE_URL}/categorias/${c.slug}`,
      lastModified: STATIC_DATE,
      changeFrequency: 'weekly' as const,
      priority: 0.6,
    }))

    // Statements (verified only, most recent 2000)
    const { data: statements } = await supabase
      .from('statements')
      .select('slug, id, updated_at')
      .eq('verification_status', 'verified')
      .not('slug', 'is', null)
      .order('statement_date', { ascending: false })
      .limit(2000)

    const statementPages: MetadataRoute.Sitemap = (statements ?? []).map((s: { slug: string | null; id: string; updated_at: string }) => ({
      url: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
      lastModified: new Date(s.updated_at),
      changeFrequency: 'monthly' as const,
      priority: 0.7,
    }))

    // Published collections
    const { data: collections } = await supabase
      .from('collections')
      .select('slug, updated_at')
      .eq('is_published', true)
    const collectionPages: MetadataRoute.Sitemap = (collections ?? []).map((c: { slug: string; updated_at: string }) => ({
      url: `${SITE_URL}/colecao/${c.slug}`,
      lastModified: new Date(c.updated_at),
      changeFrequency: 'weekly' as const,
      priority: 0.7,
    }))

    // Parties
    const { data: partyRows } = await supabase
      .from('politicians')
      .select('party')
      .eq('is_active', true)

    const uniqueParties = [...new Set((partyRows ?? []).map((p: { party: string }) => p.party))]
    const partyPages: MetadataRoute.Sitemap = uniqueParties.map((party) => ({
      url: `${SITE_URL}/partidos/${encodeURIComponent(party)}`,
      lastModified: STATIC_DATE,
      changeFrequency: 'weekly' as const,
      priority: 0.5,
    }))

    // States
    const { data: stateRows } = await supabase
      .from('politicians')
      .select('state')
      .eq('is_active', true)
      .not('state', 'is', null)

    const uniqueStates = [...new Set((stateRows ?? []).map((p: { state: string }) => p.state))]
    const statePages: MetadataRoute.Sitemap = uniqueStates.map((state) => ({
      url: `${SITE_URL}/estados/${state.toLowerCase()}`,
      lastModified: STATIC_DATE,
      changeFrequency: 'weekly' as const,
      priority: 0.5,
    }))

    // Timeline year archives — from earliest statement year to current year.
    const { data: earliestRow } = await supabase
      .from('statements')
      .select('statement_date')
      .eq('verification_status', 'verified')
      .order('statement_date', { ascending: true })
      .limit(1)
      .maybeSingle()

    const earliestDate = (earliestRow as unknown as { statement_date?: string } | null)?.statement_date
    const earliestYear = earliestDate
      ? new Date(earliestDate).getUTCFullYear()
      : new Date().getUTCFullYear() - 10
    const currentYear = new Date().getUTCFullYear()
    const yearPages: MetadataRoute.Sitemap = []
    for (let y = earliestYear; y <= currentYear; y++) {
      yearPages.push({
        url: `${SITE_URL}/linha-do-tempo/${y}`,
        lastModified: STATIC_DATE,
        changeFrequency: 'weekly',
        priority: 0.4,
      })
    }

    return [
      ...staticPages,
      ...politicianPages,
      ...categoryPages,
      ...statementPages,
      ...collectionPages,
      ...partyPages,
      ...statePages,
      ...yearPages,
    ]
  } catch {
    // Fallback if DB is unavailable
    return staticPages
  }
}
