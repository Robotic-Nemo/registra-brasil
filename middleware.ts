import { NextRequest, NextResponse } from 'next/server'

export function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl

  if (pathname.startsWith('/admin')) {
    const adminSecret = process.env.ADMIN_SECRET
    if (!adminSecret) return NextResponse.next() // dev: no secret set = open

    const cookie = req.cookies.get('admin_session')?.value
    if (cookie !== adminSecret) {
      const loginUrl = req.nextUrl.clone()
      loginUrl.pathname = '/admin/login'
      // Avoid redirect loop
      if (pathname === '/admin/login') return NextResponse.next()
      return NextResponse.redirect(loginUrl)
    }
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/admin/:path*'],
}
