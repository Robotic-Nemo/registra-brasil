import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getTrendingPoliticians, getTrendingCategories } from '@/lib/supabase/queries/trending'

export const runtime = 'edge'
export const revalidate = 3600

export async function GET(request: NextRequest) {
  const { searchParams } = request.nextUrl
  const type = searchParams.get('type') ?? 'all'
  const days = Math.min(Math.max(1, Number(searchParams.get('days') ?? 30) || 30), 90)
  const limit = Math.min(Math.max(1, Number(searchParams.get('limit') ?? 10) || 10), 20)

  const supabase = getSupabaseServiceClient()

  const result: Record<string, unknown> = {}

  if (type === 'all' || type === 'politicians') {
    result.politicians = await getTrendingPoliticians(supabase, days, limit)
  }

  if (type === 'all' || type === 'categories') {
    result.categories = await getTrendingCategories(supabase, days, limit)
  }

  return NextResponse.json(result, {
    headers: {
      'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=1800',
    },
  })
}
