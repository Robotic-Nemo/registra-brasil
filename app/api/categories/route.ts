import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600 // 1 hour

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()
    const { data, error } = await supabase
      .from('categories')
      .select('slug, label_pt, color_hex')
      .order('sort_order')

    if (error) throw error

    return NextResponse.json(data ?? [], {
      headers: {
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
      },
    })
  } catch (err) {
    console.error('[api/categories] Error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
