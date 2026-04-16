import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildRssFeed, rssHeaders } from '@/lib/utils/rss-builder'

export const runtime = 'edge'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

const UF_NAMES: Record<string, string> = {
  AC: 'Acre', AL: 'Alagoas', AP: 'Amapa', AM: 'Amazonas',
  BA: 'Bahia', CE: 'Ceara', DF: 'Distrito Federal', ES: 'Espirito Santo',
  GO: 'Goias', MA: 'Maranhao', MT: 'Mato Grosso', MS: 'Mato Grosso do Sul',
  MG: 'Minas Gerais', PA: 'Para', PB: 'Paraiba', PR: 'Parana',
  PE: 'Pernambuco', PI: 'Piaui', RJ: 'Rio de Janeiro', RN: 'Rio Grande do Norte',
  RS: 'Rio Grande do Sul', RO: 'Rondonia', RR: 'Roraima', SC: 'Santa Catarina',
  SP: 'Sao Paulo', SE: 'Sergipe', TO: 'Tocantins',
}

/**
 * GET /feed/estado/[uf] — RSS feed for a specific state.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ uf: string }> }
) {
  const { uf: rawUf } = await params
  const uf = rawUf.toUpperCase()

  if (!UF_NAMES[uf]) {
    return NextResponse.json({ error: 'Invalid state code' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()

  const { data: pols } = await supabase
    .from('politicians')
    .select('id, common_name')
    .eq('state', uf)
    .eq('is_active', true)

  if (!pols || pols.length === 0) {
    const xml = buildRssFeed(
      {
        title: `${UF_NAMES[uf]} - Registra Brasil`,
        description: `Declaracoes verificadas de politicos de ${UF_NAMES[uf]}`,
        link: `${SITE_URL}/estado/${uf.toLowerCase()}`,
        selfLink: `${SITE_URL}/feed/estado/${uf.toLowerCase()}`,
        ttl: 60,
      },
      []
    )
    return new NextResponse(xml, { headers: rssHeaders() })
  }

  const polIds = (pols as unknown as { id: string }[]).map(p => p.id)
  const polNames = new Map((pols as unknown as { id: string; common_name: string }[]).map(p => [p.id, p.common_name]))

  const { data: statements } = await supabase
    .from('statements')
    .select('id, summary, full_quote, statement_date, slug, created_at, politician_id')
    .in('politician_id', polIds)
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(30)

  const items = ((statements ?? []) as unknown as {
    id: string; summary: string; full_quote: string | null;
    statement_date: string; slug: string | null; created_at: string;
    politician_id: string
  }[]).map(s => ({
    title: s.summary.slice(0, 120),
    description: s.full_quote ?? s.summary,
    link: `${SITE_URL}/declaracao/${s.slug ?? s.id}`,
    pubDate: s.statement_date,
    author: polNames.get(s.politician_id),
  }))

  const xml = buildRssFeed(
    {
      title: `${UF_NAMES[uf]} - Registra Brasil`,
      description: `Declaracoes verificadas de politicos de ${UF_NAMES[uf]}`,
      link: `${SITE_URL}/estado/${uf.toLowerCase()}`,
      selfLink: `${SITE_URL}/feed/estado/${uf.toLowerCase()}`,
      lastBuildDate: items[0]?.pubDate,
      ttl: 60,
    },
    items
  )

  return new NextResponse(xml, { headers: rssHeaders() })
}
