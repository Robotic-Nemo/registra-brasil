import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Users } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Equipe — Registra Brasil',
  description:
    'Conheça quem mantém o arquivo Registra Brasil — equipe editorial, curadores e colaboradores.',
  alternates: { canonical: '/equipe' },
  openGraph: {
    title: 'Equipe — Registra Brasil',
    description: 'Conheça quem mantém o arquivo público de declarações políticas.',
    type: 'website',
    url: `${SITE_URL}/equipe`,
    siteName: 'Registra Brasil',
  },
}

const JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'AboutPage',
  name: 'Equipe — Registra Brasil',
  url: `${SITE_URL}/equipe`,
  inLanguage: 'pt-BR',
  mainEntity: {
    '@type': 'Organization',
    name: 'Registra Brasil',
    url: SITE_URL,
  },
}

export default function EquipePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(JSON_LD) }}
      />

      <Breadcrumbs items={[{ label: 'Equipe' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Users className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Equipe</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          O Registra Brasil é mantido por uma equipe pequena e independente. A seguir, as
          atribuições e canais de comunicação para jornalistas, pesquisadores e o público em geral.
        </p>
      </header>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Editorial</h2>
        <p className="text-gray-700 leading-relaxed">
          A linha editorial segue o princípio da ligação obrigatória à fonte primária. Toda
          declaração registrada tem pelo menos um link verificável para vídeo oficial, transcrição
          ou publicação. Nenhum item é adicionado a partir de capturas de tela isoladas ou redes
          sociais sem link funcional.
        </p>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Contribuições</h2>
        <p className="text-gray-700 leading-relaxed">
          Colaborações são bem-vindas e passam por revisão antes da publicação. Sugestões de
          declarações, correções e críticas podem ser enviadas pela{' '}
          <a href="/contato" className="text-blue-700 underline">página de contato</a>.
        </p>
      </section>

      <section>
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Código aberto</h2>
        <p className="text-gray-700 leading-relaxed">
          O código do site está disponível no{' '}
          <a
            href="https://github.com/Robotic-Nemo/registra-brasil"
            className="text-blue-700 underline"
            rel="noopener noreferrer"
            target="_blank"
          >
            GitHub
          </a>
          . Issues e pull requests são revisados pelo time editorial.
        </p>
      </section>
    </main>
  )
}
