import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { searchStatements } from '@/lib/supabase/queries/statements'
import { parseSearchParams } from '@/lib/utils/validate-search-params'

export const runtime = 'nodejs'
export const revalidate = 300

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function xmlEscape(s: string): string {
  return s
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

/**
 * Build a human-readable title that summarizes the saved search, e.g.
 * "lula" in "corrupcao" (PT, SP). Used both for the feed title and
 * the descriptive text on /busca-salva.
 */
function summarize(params: ReturnType<typeof parseSearchParams>): string {
  const parts: string[] = []
  if (params.q) parts.push(`"${params.q}"`)
  if (params.categoria) {
    const cat = Array.isArray(params.categoria) ? params.categoria.join('/') : params.categoria
    parts.push(`em ${cat}`)
  }
  if (params.politico) parts.push(`político=${params.politico}`)
  if (params.partido) parts.push(`partido=${params.partido}`)
  if (params.estado) parts.push(`UF=${params.estado}`)
  if (params.de || params.ate) parts.push(`${params.de ?? '…'} → ${params.ate ?? '…'}`)
  if (params.status) parts.push(`status=${params.status}`)
  return parts.length ? parts.join(' · ') : 'todas as declarações'
}

export async function GET(request: NextRequest) {
  // parseSearchParams expects the multi-value shape; collect each key
  const raw: Record<string, string | string[]> = {}
  for (const key of new Set(Array.from(request.nextUrl.searchParams.keys()))) {
    const all = request.nextUrl.searchParams.getAll(key)
    raw[key] = all.length > 1 ? all : (all[0] ?? '')
  }

  const params = parseSearchParams(raw)
  // Force curated only and cap results
  const forFeed = {
    ...params,
    page: 1,
    limit: 50,
    status: params.status ?? 'verified',
    fonte: 'curado' as const,
  }

  const supabase = getSupabaseServiceClient()
  let result
  try {
    result = await searchStatements(supabase, forFeed)
  } catch {
    result = { results: [], total: 0, page: 1, hasMore: false }
  }

  const title = `Registra Brasil — Busca: ${summarize(params)}`
  const selfUrl = `${SITE_URL}/api/saved-search/feed.xml${request.nextUrl.search}`
  const htmlUrl = `${SITE_URL}/busca-salva${request.nextUrl.search}`

  const items = result.results
    .map((s) => {
      const permalink = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
      const politicianName = s.politicians?.common_name ?? 'Político'
      const party = s.politicians?.party ? ` (${s.politicians.party})` : ''
      const itemTitle = `${politicianName}${party}: ${s.summary.slice(0, 120)}`
      const desc = s.full_quote ?? s.summary
      const pubDate = new Date(`${s.statement_date}T12:00:00Z`).toUTCString()
      return `
    <item>
      <title>${xmlEscape(itemTitle)}</title>
      <link>${xmlEscape(permalink)}</link>
      <guid isPermaLink="true">${xmlEscape(permalink)}</guid>
      <pubDate>${pubDate}</pubDate>
      <author>${xmlEscape(politicianName)}</author>
      <description>${xmlEscape(desc)}</description>
    </item>`
    })
    .join('')

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>${xmlEscape(title)}</title>
    <link>${xmlEscape(htmlUrl)}</link>
    <atom:link href="${xmlEscape(selfUrl)}" rel="self" type="application/rss+xml" />
    <description>Resultados da busca arquivada no Registra Brasil: ${xmlEscape(summarize(params))}. ${result.total} no total; 50 mais recentes aqui.</description>
    <language>pt-BR</language>
    <lastBuildDate>${new Date().toUTCString()}</lastBuildDate>${items}
  </channel>
</rss>`

  return new NextResponse(xml, {
    headers: {
      'Content-Type': 'application/rss+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=180, s-maxage=300, stale-while-revalidate=900',
    },
  })
}

export async function HEAD() {
  return new NextResponse(null, {
    status: 200,
    headers: { 'Content-Type': 'application/rss+xml' },
  })
}
