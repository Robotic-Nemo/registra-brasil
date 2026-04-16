import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { searchStatements } from '@/lib/supabase/queries/statements'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ slug: string }> }
) {
  const { slug } = await params
  const sp = request.nextUrl.searchParams
  const page = Math.max(1, parseInt(sp.get('page') ?? '1', 10) || 1)
  const limit = Math.min(Math.max(1, parseInt(sp.get('limit') ?? '20', 10) || 20), 50)

  try {
    const result = await searchStatements(await getSupabaseServerClient(), {
      politico: slug,
      page,
      limit,
      status: 'verified',
    })

    return NextResponse.json({
      results: result.results.map((s) => ({
        id: s.id,
        slug: s.slug,
        summary: s.summary,
        statement_date: s.statement_date,
        categories: s.statement_categories.map((sc) => sc.categories.label_pt),
        primary_source_url: s.primary_source_url,
      })),
      total: result.total,
      page: result.page,
      hasMore: result.hasMore,
    }, {
      headers: { 'Cache-Control': 'public, s-maxage=300, stale-while-revalidate=60' },
    })
  } catch {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
