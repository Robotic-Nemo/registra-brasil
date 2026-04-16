import { NextRequest, NextResponse } from 'next/server'
import { revalidatePath } from 'next/cache'

export const runtime = 'nodejs'

export async function POST(req: NextRequest) {
  // Accept Authorization header (preferred) or query param as fallback for legacy callers
  const authHeader = req.headers.get('authorization') ?? ''
  const headerSecret = authHeader.startsWith('Bearer ') ? authHeader.slice(7) : null
  const querySecret = req.nextUrl.searchParams.get('secret')
  const secret = headerSecret ?? querySecret

  if (!secret || secret !== process.env.REVALIDATE_SECRET) {
    return NextResponse.json({ error: 'Invalid secret' }, { status: 401 })
  }

  let body: { politician_slug?: string; statement_slug?: string } = {}
  try {
    const text = await req.text()
    if (text) body = JSON.parse(text)
  } catch {
    // Body is optional — proceed without it
  }

  const revalidated: string[] = []
  const errors: string[] = []

  const tryRevalidate = (path: string) => {
    try {
      revalidatePath(path)
      revalidated.push(path)
    } catch (err) {
      errors.push(`${path}: ${err instanceof Error ? err.message : 'unknown error'}`)
    }
  }

  if (body.politician_slug) tryRevalidate(`/politico/${body.politician_slug}`)
  if (body.statement_slug) tryRevalidate(`/declaracao/${body.statement_slug}`)
  tryRevalidate('/buscar')
  tryRevalidate('/')
  tryRevalidate('/politicos')
  tryRevalidate('/categorias')

  const status = errors.length > 0 && revalidated.length === 0 ? 500 : 200
  return NextResponse.json(
    { revalidated: revalidated.length > 0, paths: revalidated, errors },
    { status },
  )
}
