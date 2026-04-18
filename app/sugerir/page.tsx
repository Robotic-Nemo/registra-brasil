import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { SubmissionForm } from './SubmissionForm'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Info } from 'lucide-react'

export const metadata: Metadata = {
  title: 'Sugerir declaração — Registra Brasil',
  description:
    'Conhece uma declaração pública de político brasileiro que deveria estar no arquivo? Proponha aqui com a fonte primária.',
  alternates: { canonical: '/sugerir' },
}

export const revalidate = 3600

export default async function SugerirPage() {
  const supabase = await getSupabaseServerClient()
  const { data: politicians } = await supabase
    .from('politicians')
    .select('slug, common_name, party, state')
    .eq('is_active', true)
    .order('common_name')

  return (
    <main className="max-w-2xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Sugerir declaração' }]} />

      <h1 className="text-2xl font-bold text-gray-900 mb-3">Sugerir declaração</h1>
      <p className="text-sm text-gray-700 mb-6 leading-relaxed">
        Conhece uma declaração pública de político brasileiro que ainda não está no arquivo?
        Proponha aqui. Toda submissão passa por revisão editorial antes de ser publicada —
        nenhum conteúdo vai ao ar sem conferência e ligação a fonte primária.
      </p>

      <aside className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-8 text-sm text-blue-900 flex gap-3">
        <Info className="w-5 h-5 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <div>
          <strong className="block mb-1">O que aceitamos:</strong>
          Declarações feitas em público por agentes políticos (deputados, senadores, ministros,
          governadores etc.), com link para fonte primária verificável: vídeo oficial, diário
          oficial, reportagem com citação direta, transmissão ao vivo arquivada ou transcrição
          autêntica. Opiniões, boatos e reproduções sem fonte são rejeitados.
        </div>
      </aside>

      <SubmissionForm politicians={(politicians ?? []) as { slug: string; common_name: string; party: string; state: string | null }[]} />

      <p className="text-xs text-gray-500 mt-6">
        Seu e-mail é opcional e só é usado para informarmos o desfecho da revisão.
        Não compartilhamos com terceiros. Ver{' '}
        <a href="/privacidade" className="underline">política de privacidade</a>.
      </p>
    </main>
  )
}
