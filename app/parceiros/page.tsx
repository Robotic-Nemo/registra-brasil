import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Handshake } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Parceiros — Registra Brasil',
  description:
    'Veículos jornalísticos, organizações acadêmicas e entidades parceiras do Registra Brasil.',
  alternates: { canonical: '/parceiros' },
  openGraph: {
    title: 'Parceiros — Registra Brasil',
    description: 'Rede de parceiros jornalísticos e acadêmicos.',
    type: 'website',
    url: `${SITE_URL}/parceiros`,
    siteName: 'Registra Brasil',
  },
}

const JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'AboutPage',
  name: 'Parceiros — Registra Brasil',
  url: `${SITE_URL}/parceiros`,
  inLanguage: 'pt-BR',
}

export default function ParceirosPage() {
  return (
    <main id="main-content" className="max-w-3xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(JSON_LD) }}
      />

      <Breadcrumbs items={[{ label: 'Parceiros' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Handshake className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Parceiros</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          O Registra Brasil trabalha em rede com veículos de jornalismo, grupos de pesquisa e
          iniciativas de transparência pública. Abaixo, as formas atuais de colaboração.
        </p>
      </header>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Parcerias editoriais</h2>
        <p className="text-gray-700 leading-relaxed">
          Reutilização de conteúdo sob <a href="https://creativecommons.org/licenses/by/4.0/deed.pt-BR" rel="noopener noreferrer" target="_blank" className="text-blue-700 underline">CC BY 4.0</a>,
          intercâmbio de dados e revisão cruzada de verificação são bem-vindos.
        </p>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Pesquisa acadêmica</h2>
        <p className="text-gray-700 leading-relaxed">
          Toda a base de dados está exposta via <a href="/dados" className="text-blue-700 underline">/dados</a> para
          pesquisa quantitativa e qualitativa. Para pedidos customizados (dumps completos, dados
          históricos adicionais), entre em <a href="/contato" className="text-blue-700 underline">contato</a>.
        </p>
      </section>

      <section>
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Como se tornar parceiro</h2>
        <p className="text-gray-700 leading-relaxed">
          Envie uma proposta pela <a href="/contato" className="text-blue-700 underline">página de contato</a>.
          Avaliamos caso a caso e publicamos a lista de parceiros ativos aqui assim que firmadas
          as colaborações.
        </p>
      </section>
    </main>
  )
}
