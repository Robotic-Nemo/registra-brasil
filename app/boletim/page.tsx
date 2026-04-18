import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Mail, Calendar } from 'lucide-react'

export const revalidate = 600

export const metadata: Metadata = {
  title: 'Boletim — Registra Brasil',
  description: 'Resumo editorial semanal com as declarações mais relevantes da semana. Transparente: todos os boletins enviados ficam arquivados publicamente.',
  alternates: { canonical: '/boletim' },
}

export default async function BoletimPage() {
  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('newsletter_digests') as any)
    .select('id, week_of, subject, preview_text, recipient_count, sent_at, statement_ids')
    .not('sent_at', 'is', null)
    .order('week_of', { ascending: false })
    .limit(24)

  const digests = (data ?? []) as Array<{
    id: string
    week_of: string
    subject: string
    preview_text: string | null
    recipient_count: number
    sent_at: string
    statement_ids: string[] | null
  }>

  return (
    <main className="max-w-2xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Boletim' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Mail className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Boletim semanal</h1>
        </div>
        <p className="text-sm text-gray-700 leading-relaxed">
          Toda segunda-feira, um resumo com as declarações mais relevantes da semana — ranqueadas
          por severidade e recência. Para transparência, todos os boletins já enviados ficam
          arquivados abaixo.
        </p>
      </header>

      {digests.length === 0 ? (
        <p className="text-sm text-gray-600 bg-gray-50 border border-gray-200 rounded p-4">
          Nenhum boletim enviado ainda.
        </p>
      ) : (
        <ol className="flex flex-col gap-3">
          {digests.map((d) => (
            <li key={d.id}>
              <Link
                href={`/boletim/${d.week_of}`}
                className="block bg-white border border-gray-200 rounded-lg p-4 hover:border-blue-400 hover:shadow-sm transition-all"
              >
                <div className="flex items-center gap-2 text-xs text-gray-500 mb-1">
                  <Calendar className="w-3.5 h-3.5" aria-hidden="true" />
                  Semana de {d.week_of}
                  {' · '}
                  enviado a {d.recipient_count} assinantes
                  {' · '}
                  {(d.statement_ids?.length ?? 0)} declarações
                </div>
                <p className="font-semibold text-gray-900">{d.subject}</p>
                {d.preview_text && <p className="text-sm text-gray-600 mt-1">{d.preview_text}</p>}
              </Link>
            </li>
          ))}
        </ol>
      )}

      <p className="text-xs text-gray-500 mt-8 border-t border-gray-200 pt-4">
        Para assinar o boletim, role até o rodapé do site ou use o{' '}
        <Link href="/dados" className="underline">feed RSS</Link> se preferir não receber e-mails.
      </p>
    </main>
  )
}
