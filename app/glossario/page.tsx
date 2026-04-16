import { GLOSSARY_TERMS } from '@/lib/constants/glossary'
import { GlossarySearch } from '@/components/glossary/GlossarySearch'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Glossario Politico — Registra Brasil',
  description: 'Glossario de termos politicos brasileiros com definicoes claras e acessiveis.',
  alternates: { canonical: '/glossario' },
}

export default function GlossarioPage() {
  const sortedTerms = [...GLOSSARY_TERMS].sort((a, b) => a.term.localeCompare(b.term, 'pt-BR'))

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs items={[{ label: 'Glossario' }]} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Glossario Politico</h1>
      <p className="text-gray-600 mb-6">
        Definicoes de termos politicos brasileiros para ajudar na compreensao das declaracoes registradas.
      </p>

      <GlossarySearch terms={sortedTerms} />
    </main>
  )
}
