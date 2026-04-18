import type { Metadata } from 'next'
import Link from 'next/link'
import { Bell, Mail } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { verifyAlertAccessToken } from '@/lib/utils/alert-access'
import { describeQuery, queryToSearchString, type SavedSearchQuery } from '@/lib/utils/saved-searches'
import { RequestAccessForm } from './RequestAccessForm'
import { AlertList } from './AlertList'

export const dynamic = 'force-dynamic'

export const metadata: Metadata = {
  title: 'Meus alertas — Registra Brasil',
  description: 'Portal de autoatendimento para ver e cancelar seus alertas de busca por e-mail.',
  robots: { index: false, follow: false },
  alternates: { canonical: '/meus-alertas' },
}

interface PageProps {
  searchParams: Promise<{ email?: string; token?: string }>
}

export default async function MyAlertsPage({ searchParams }: PageProps) {
  const { email, token } = await searchParams

  if (!email || !token) {
    return (
      <main className="max-w-2xl mx-auto px-4 py-10">
        <div className="flex items-center gap-3 mb-4">
          <Bell className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Meus alertas</h1>
        </div>
        <p className="text-sm text-gray-700 mb-6">
          Para gerenciar seus alertas, informe seu e-mail e enviaremos um link de acesso. O link
          expira em 7 dias; enquanto isso, você pode cancelar alertas individualmente ou todos de
          uma vez sem precisar criar conta.
        </p>
        <RequestAccessForm />
      </main>
    )
  }

  const valid = await verifyAlertAccessToken(email, token)
  if (!valid) {
    return (
      <main className="max-w-2xl mx-auto px-4 py-10">
        <h1 className="text-xl font-bold text-gray-900 mb-2">Link inválido ou expirado</h1>
        <p className="text-sm text-gray-700 mb-5">
          O link que você usou não é válido ou já passou dos 7 dias. Solicite um novo:
        </p>
        <RequestAccessForm defaultEmail={email} />
      </main>
    )
  }

  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('saved_searches') as any)
    .select('id, label, query, query_hash, is_confirmed, confirmed_at, last_notified_at, created_at, unsubscribed_at')
    .eq('email', email.toLowerCase())
    .order('created_at', { ascending: false })

  const rows = (data ?? []) as Array<{
    id: string
    label: string | null
    query: SavedSearchQuery
    query_hash: string
    is_confirmed: boolean
    confirmed_at: string | null
    last_notified_at: string | null
    created_at: string
    unsubscribed_at: string | null
  }>

  const alerts = rows.map((r) => ({
    id: r.id,
    label: r.label ?? describeQuery(r.query),
    description: describeQuery(r.query),
    search_url: `/buscar?${queryToSearchString(r.query)}`,
    active: r.is_confirmed && !r.unsubscribed_at,
    confirmed_at: r.confirmed_at,
    last_notified_at: r.last_notified_at,
    created_at: r.created_at,
    unsubscribed_at: r.unsubscribed_at,
  }))

  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <div className="flex items-center gap-3 mb-4">
        <Bell className="w-6 h-6 text-blue-700" aria-hidden="true" />
        <h1 className="text-2xl font-bold text-gray-900">Meus alertas</h1>
      </div>
      <p className="text-sm text-gray-700 mb-6 flex items-center gap-2">
        <Mail className="w-4 h-4 text-gray-500" aria-hidden="true" />
        <span>
          Sessão para <strong>{email}</strong>{' '}
          <Link href="/meus-alertas" className="text-xs text-gray-500 underline ml-1">(sair)</Link>
        </span>
      </p>

      <AlertList email={email} token={token} alerts={alerts} />

      <footer className="mt-10 text-xs text-gray-500 border-t border-gray-200 pt-4">
        Nenhum dado seu é armazenado no navegador. Todas as ações nesta página são autorizadas
        por um link único enviado ao seu e-mail (HMAC-SHA256, expira em 7 dias).
      </footer>
    </main>
  )
}
