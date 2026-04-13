import { NextRequest, NextResponse } from 'next/server'
import { revalidatePath, revalidateTag } from 'next/cache'

export const runtime = 'nodejs'

export async function POST(req: NextRequest) {
  const secret = req.nextUrl.searchParams.get('secret')

  if (secret !== process.env.REVALIDATE_SECRET) {
    return NextResponse.json({ error: 'Invalid secret' }, { status: 401 })
  }

  try {
    const body = await req.json()

    // Revalidate specific politician page if slug provided
    if (body.politician_slug) {
      revalidatePath(`/politico/${body.politician_slug}`)
    }

    // Revalidate specific statement page
    if (body.statement_slug) {
      revalidatePath(`/declaracao/${body.statement_slug}`)
    }

    // Revalidate search and home
    revalidatePath('/buscar')
    revalidatePath('/')

    return NextResponse.json({ revalidated: true })
  } catch {
    return NextResponse.json({ error: 'Revalidation failed' }, { status: 500 })
  }
}
