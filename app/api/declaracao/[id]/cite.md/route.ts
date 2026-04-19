import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getStatementById, getStatementBySlug } from '@/lib/supabase/queries/statements'

export const runtime = 'nodejs'
export const revalidate = 3600

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

function fmtDate(iso: string): string {
  return new Date(iso + 'T12:00:00Z').toLocaleDateString('pt-BR', {
    year: 'numeric', month: 'long', day: '2-digit',
  })
}

/**
 * GET /api/declaracao/:id/cite.md — Markdown citation block, usable in
 * Substack, Notion, GitHub issues, or any markdown editor. Matches the
 * in-page CopyMarkdownButton output so the URL form is scriptable.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const s = (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!s) {
    return new NextResponse('Declaração não encontrada\n', {
      status: 404,
      headers: { 'Content-Type': 'text/markdown; charset=utf-8' },
    })
  }
  const p = s.politicians
  const byline = p.party
    ? `${p.common_name} (${p.party}${p.state ? `-${p.state}` : ''})`
    : p.common_name
  const permalink = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
  const quote = (s.full_quote ?? s.summary).replace(/\r?\n/g, '\n> ')

  const md = [
    `> ${quote}`,
    ``,
    `— **${byline}** — ${fmtDate(s.statement_date)} · via [Registra Brasil](${permalink}) · [fonte original](${s.primary_source_url})`,
    ``,
  ].join('\n')

  return new NextResponse(md, {
    headers: {
      'Content-Type': 'text/markdown; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
