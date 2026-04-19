import Link from 'next/link'
import type { Metadata } from 'next'
import { AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SEVERITIES } from '@/lib/severity/labels'

export const revalidate = 1800

export const metadata: Metadata = {
  title: 'Explorar por gravidade — Registra Brasil',
  description:
    'Navegue o arquivo pelas cinco categorias de gravidade editorial: leve, média, elevada, crítica e extrema.',
  alternates: { canonical: '/severidade' },
  openGraph: {
    title: 'Explorar por gravidade — Registra Brasil',
    description: 'Índice por gravidade editorial.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

export default async function SeveridadePage() {
  const supabase = getSupabaseServiceClient()
  const counts = new Map<number, number>()
  for (const s of SEVERITIES) {
    const { count } = await (supabase.from('statements') as any)
      .select('id', { count: 'exact', head: true })
      .eq('severity_score', s.level)
      .neq('verification_status', 'removed')
    counts.set(s.level, Number(count ?? 0))
  }

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-8 flex items-start gap-3">
        <AlertTriangle className="mt-1 h-7 w-7 shrink-0 text-amber-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Navegação editorial
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            Explorar por gravidade
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            A equipe editorial atribui um <em>severity_score</em> de 1 a 5 a
            cada declaração. Escolha um nível para ver apenas registros
            daquela faixa, em ordem cronológica reversa.
          </p>
        </div>
      </header>

      <ul className="flex flex-col gap-3">
        {SEVERITIES.map((s) => (
          <li key={s.level}>
            <Link
              href={`/severidade/${s.level}`}
              className="block rounded-xl border border-gray-200 bg-white p-4 transition hover:border-indigo-400 hover:shadow-sm dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-600"
            >
              <div className="flex items-center justify-between gap-3">
                <span className={`inline-flex items-center gap-2 rounded-full border px-3 py-0.5 text-xs font-semibold ${s.tone}`}>
                  {s.label}
                </span>
                <span className="text-sm font-semibold tabular-nums text-gray-900 dark:text-gray-100">
                  {(counts.get(s.level) ?? 0).toLocaleString('pt-BR')}
                </span>
              </div>
              <p className="mt-1.5 text-sm text-gray-600 dark:text-gray-400">
                {s.description}
              </p>
            </Link>
          </li>
        ))}
      </ul>

      <footer className="mt-10 rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          A atribuição de severidade é subjetiva por natureza e segue a
          metodologia descrita em{' '}
          <Link href="/sobre" className="underline">/sobre</Link>. Nenhuma
          declaração é contada em mais de um nível — o score é um número
          único por registro.
        </p>
      </footer>
    </main>
  )
}
