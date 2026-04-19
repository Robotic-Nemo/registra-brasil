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
 * GET /api/declaracao/:id/cite.txt — a plaintext ABNT-ish citation ready
 * to paste into an email, report, or terminal. curl-friendly shortcut
 * that complements the full CitationGenerator UI.
 */
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> },
) {
  const { id } = await params
  const supabase = await getSupabaseServerClient()
  const s = (await getStatementBySlug(supabase, id)) ?? (await getStatementById(supabase, id))
  if (!s) {
    return new NextResponse('Declaração não encontrada\n', { status: 404, headers: { 'Content-Type': 'text/plain; charset=utf-8' } })
  }
  const p = s.politicians
  const party = p.party ? ` (${p.party}${p.state ? `-${p.state}` : ''})` : ''
  const permalink = `${SITE_URL}/declaracao/${s.slug ?? s.id}`
  const body = [
    `${p.common_name.toUpperCase()}${party}. "${s.summary}"`,
    `Registra Brasil, ${fmtDate(s.statement_date)}.`,
    `Disponível em: ${permalink}`,
    `Fonte primária: ${s.primary_source_url}`,
    `Acesso em: ${new Date().toISOString().slice(0, 10)}.`,
  ].join('\n') + '\n'
  return new NextResponse(body, {
    headers: {
      'Content-Type': 'text/plain; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  })
}
