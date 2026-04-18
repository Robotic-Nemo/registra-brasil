import type { Metadata } from 'next'
import Link from 'next/link'
import { Scale, Info } from 'lucide-react'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { RetractionForm } from './RetractionForm'

export const metadata: Metadata = {
  title: 'Solicitar retificação / direito de resposta — Registra Brasil',
  description:
    'Petição pública para correção, retratação ou direito de resposta sobre uma declaração do arquivo. Baseado na CF art. 5º V e Lei 13.188/2015.',
  alternates: { canonical: '/retratacoes/solicitar' },
}

export const revalidate = 3600

export default async function SolicitarRetratacaoPage({
  searchParams,
}: {
  searchParams: Promise<{ statement?: string }>
}) {
  const { statement: initialId } = await searchParams

  const supabase = await getSupabaseServerClient()
  const { data: politicians } = await (supabase.from('politicians') as any)
    .select('slug, common_name, party, state')
    .eq('is_active', true)
    .order('common_name')

  let initialStatement: { id: string; slug: string | null; summary: string } | null = null
  if (initialId) {
    const { data } = await (supabase.from('statements') as any)
      .select('id, slug, summary')
      .or(`id.eq.${initialId},slug.eq.${initialId}`)
      .maybeSingle()
    if (data) initialStatement = data as any
  }

  return (
    <main className="max-w-2xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Retratações', href: '/retratacoes' },
        { label: 'Solicitar' },
      ]} />

      <header className="mb-6">
        <div className="flex items-center gap-3 mb-2">
          <Scale className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Solicitar retificação</h1>
        </div>
        <p className="text-sm text-gray-700 leading-relaxed">
          Você pode pedir correção factual, remoção editorial, esclarecimento ou direito de
          resposta sobre qualquer declaração do arquivo. Respondemos em até 10 dias úteis.
        </p>
      </header>

      <aside className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-8 text-sm text-blue-900 flex gap-3">
        <Info className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div>
          <strong className="block mb-1">Base legal</strong>
          Constituição Federal art. 5º V (direito de resposta proporcional ao agravo) e Lei
          13.188/2015. Para questões envolvendo dados pessoais, a LGPD (Lei 13.709/2018)
          aplica-se cumulativamente. Decisões editoriais são motivadas e ficam registradas
          publicamente em{' '}
          <Link href="/retratacoes" className="underline">/retratacoes</Link>.
        </div>
      </aside>

      <RetractionForm
        initialStatement={initialStatement}
        politicians={(politicians ?? []) as Array<{ slug: string; common_name: string; party: string; state: string | null }>}
      />

      <p className="text-xs text-gray-500 mt-6">
        Seus dados (nome, e-mail) são usados apenas para comunicação editorial sobre a petição e
        não são compartilhados com terceiros. Ver{' '}
        <Link href="/privacidade" className="underline">privacidade</Link> e{' '}
        <Link href="/termos" className="underline">termos §6</Link>.
      </p>
    </main>
  )
}
