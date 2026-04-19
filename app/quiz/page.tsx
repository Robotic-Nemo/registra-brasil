import type { Metadata } from 'next'
import { HelpCircle } from 'lucide-react'
import { QuizClient } from './QuizClient'

export const metadata: Metadata = {
  title: 'Quiz — De quem é a declaração? — Registra Brasil',
  description: 'Jogue: mostramos uma citação real do arquivo e você adivinha qual político disse. Ótimo para treinar memória política.',
  alternates: { canonical: '/quiz' },
  openGraph: {
    title: 'Quiz — Registra Brasil',
    description: 'De quem é esta declaração?',
    type: 'website',
    siteName: 'Registra Brasil',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Quiz — Registra Brasil',
    description: 'De quem é esta declaração?',
  },
}

export default function QuizPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <header className="mb-6 flex items-start gap-3">
        <HelpCircle className="mt-1 h-7 w-7 shrink-0 text-indigo-600" aria-hidden />
        <div>
          <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Jogo de memória política
          </p>
          <h1 className="mt-1 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
            De quem é a declaração?
          </h1>
          <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
            Lemos uma citação real do arquivo, você adivinha qual dos quatro
            políticos disse. Fontes e registros completos depois que você
            responde.
          </p>
        </div>
      </header>
      <QuizClient />
    </main>
  )
}
