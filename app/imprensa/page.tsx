import Link from 'next/link'
import Image from 'next/image'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Newspaper, Mail, Download, ExternalLink } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Imprensa — Registra Brasil',
  description: 'Materiais, logotipo, dados e contato para jornalistas e parceiros de mídia.',
  alternates: { canonical: '/imprensa' },
  openGraph: {
    title: 'Imprensa — Registra Brasil',
    description: 'Materiais, logotipo, dados e contato para jornalistas e parceiros de mídia.',
    type: 'website',
    url: `${SITE_URL}/imprensa`,
    siteName: 'Registra Brasil',
  },
}

export default function ImprensaPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Imprensa' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Newspaper className="w-8 h-8 text-blue-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Kit de imprensa</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          Materiais e dados para jornalistas que desejem noticiar ou utilizar o Registra Brasil
          como fonte.
        </p>
      </header>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Sobre o projeto</h2>
        <p className="text-gray-700 leading-relaxed">
          O Registra Brasil é um arquivo público de declarações de políticos brasileiros. Cada
          registro tem ligação obrigatória a pelo menos uma fonte primária (vídeo oficial,
          transcrição, publicação) e passa por revisão editorial antes de ganhar o status de
          verificado. O projeto é independente e tem propósito de interesse público.
        </p>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Recursos visuais</h2>
        <div className="grid grid-cols-2 gap-4">
          <a
            href="/icon"
            download="registra-brasil-logo.png"
            className="block border border-gray-200 rounded-lg p-4 hover:border-blue-400 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          >
            <div className="aspect-square bg-gray-50 rounded flex items-center justify-center mb-3">
              <Image
                src="/icon"
                alt="Logotipo Registra Brasil"
                width={96}
                height={96}
                unoptimized
              />
            </div>
            <div className="flex items-center gap-1 text-sm font-medium text-blue-700">
              <Download className="w-4 h-4" aria-hidden="true" />
              Logotipo (PNG 512×512)
            </div>
          </a>
          <a
            href="/opengraph-image"
            download="registra-brasil-og.png"
            className="block border border-gray-200 rounded-lg p-4 hover:border-blue-400 transition-colors focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
          >
            <div className="aspect-square bg-gray-50 rounded flex items-center justify-center mb-3 text-gray-400">
              1200×630
            </div>
            <div className="flex items-center gap-1 text-sm font-medium text-blue-700">
              <Download className="w-4 h-4" aria-hidden="true" />
              Imagem Open Graph (PNG 1200×630)
            </div>
          </a>
        </div>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Números</h2>
        <p className="text-sm text-gray-600 mb-3">
          Estatísticas ao vivo estão disponíveis em{' '}
          <Link href="/estatisticas" className="text-blue-700 underline">
            /estatisticas
          </Link>
          {' '}ou pela API{' '}
          <code className="bg-gray-100 px-1.5 py-0.5 rounded text-xs">/api/v2/statistics</code>.
        </p>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Como citar</h2>
        <pre className="bg-gray-100 border border-gray-200 rounded p-4 text-sm overflow-x-auto whitespace-pre-wrap">
{`Registra Brasil (${new Date().getFullYear()}). "{Título da declaração}".
Disponível em: ${SITE_URL}/declaracao/{slug}. Acesso em: {data}.`}
        </pre>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Licença</h2>
        <p className="text-gray-700">
          Todo o conteúdo é licenciado sob{' '}
          <a
            href="https://creativecommons.org/licenses/by/4.0/deed.pt-BR"
            className="text-blue-700 underline inline-flex items-center gap-1"
            rel="noopener noreferrer"
            target="_blank"
          >
            CC BY 4.0 <ExternalLink className="w-3.5 h-3.5" aria-hidden="true" />
          </a>
          — livre para uso comercial e não-comercial, bastando atribuir autoria.
        </p>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Contato</h2>
        <p className="text-gray-700 mb-3">Para entrevistas, dúvidas editoriais ou parcerias:</p>
        <Link
          href="/contato"
          className="inline-flex items-center gap-2 px-4 py-2 bg-blue-700 text-white font-medium rounded-lg hover:bg-blue-800 transition-colors"
        >
          <Mail className="w-4 h-4" aria-hidden="true" />
          Página de contato
        </Link>
      </section>
    </main>
  )
}
