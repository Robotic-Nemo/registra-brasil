import { NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const runtime = 'edge'
export const revalidate = 3600 // 1 hour

export async function GET() {
  try {
    const supabase = getSupabaseServiceClient()
    const { data, error } = await supabase
      .from('politicians')
      .select('slug, common_name, party, state')
      .eq('is_active', true)
      .order('common_name')

    if (error) throw error

    return NextResponse.json(data ?? [], {
      headers: {
        'Cache-Control': 'public, s-maxage=3600, stale-while-revalidate=600',
      },
    })
  } catch (err) {
    console.error('[api/politicians] Error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
