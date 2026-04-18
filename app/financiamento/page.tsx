import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Coins, Shield, Eye } from 'lucide-react'
import type { Metadata } from 'next'

export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Financiamento — Registra Brasil',
  description:
    'Transparência sobre financiamento, custos operacionais e independência editorial do Registra Brasil.',
  alternates: { canonical: '/financiamento' },
  openGraph: {
    title: 'Financiamento e transparência — Registra Brasil',
    description: 'Quem financia, quanto custa, como garantimos independência editorial.',
    type: 'website',
    url: `${SITE_URL}/financiamento`,
    siteName: 'Registra Brasil',
  },
}

const JSON_LD = {
  '@context': 'https://schema.org',
  '@type': 'AboutPage',
  name: 'Financiamento — Registra Brasil',
  url: `${SITE_URL}/financiamento`,
  inLanguage: 'pt-BR',
  description: 'Transparência sobre financiamento e independência editorial.',
}

export default function FinanciamentoPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(JSON_LD) }}
      />

      <Breadcrumbs items={[{ label: 'Financiamento' }]} />

      <header className="mb-10">
        <div className="flex items-center gap-3 mb-3">
          <Coins className="w-8 h-8 text-emerald-600" aria-hidden="true" />
          <h1 className="text-3xl font-bold text-gray-900">Financiamento e independência</h1>
        </div>
        <p className="text-gray-600 leading-relaxed">
          Transparência sobre como o Registra Brasil é financiado e como mantemos independência
          editorial em relação a partidos, governos e interesses comerciais.
        </p>
      </header>

      <section className="mb-10 bg-emerald-50 border border-emerald-200 rounded-lg p-5 flex gap-3">
        <Shield className="w-5 h-5 text-emerald-700 shrink-0 mt-0.5" aria-hidden="true" />
        <div className="text-sm text-emerald-900">
          <strong>Nenhum financiamento partidário ou governamental é aceito.</strong> Doações de
          entidades públicas, candidatos, partidos ou empresas que tenham contratos com o governo
          federal são recusadas sem exceção.
        </div>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Custos operacionais</h2>
        <p className="text-gray-700 leading-relaxed mb-3">
          Os custos principais do projeto são:
        </p>
        <ul className="list-disc list-inside space-y-1 text-gray-700">
          <li>Infraestrutura (Vercel + Supabase): ~US$ 100–300/mês</li>
          <li>Domínio + e-mail corporativo: ~US$ 60/ano</li>
          <li>Ferramentas de moderação e verificação: variável</li>
          <li>Honorários editoriais (revisão, curadoria): variável</li>
        </ul>
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold text-gray-900 mb-3">Fontes de receita</h2>
        <p className="text-gray-700 leading-relaxed">
          O projeto é custeado atualmente por financiamento próprio dos mantenedores. Parcerias com
          veículos de jornalismo, fundações ou editais de pesquisa são avaliadas caso a caso,
          sempre preservando independência editorial.
        </p>
      </section>

      <section className="mb-10 flex gap-3 items-start">
        <Eye className="w-5 h-5 text-gray-600 shrink-0 mt-1" aria-hidden="true" />
        <div>
          <h2 className="text-xl font-semibold text-gray-900 mb-2">Controles de independência</h2>
          <ul className="list-disc list-inside space-y-1 text-gray-700">
            <li>Lista aberta de fontes aceitas em <a href="/sobre#fontes" className="underline">/sobre</a>.</li>
            <li>Histórico público de retratações em <a href="/retratacoes" className="underline">/retratacoes</a>.</li>
            <li>Dados brutos publicados em <a href="/dados" className="underline">/dados</a> sob CC BY 4.0.</li>
            <li>Código aberto no <a href="https://github.com/Robotic-Nemo/registra-brasil" rel="noopener noreferrer" target="_blank" className="underline">GitHub</a>.</li>
          </ul>
        </div>
      </section>
    </main>
  )
}
