import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import Link from 'next/link'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Metodologia — Registra Brasil',
  description: 'Metodologia de coleta, verificacao e classificacao das declaracoes de politicos brasileiros.',
  alternates: { canonical: '/metodologia' },
}

const STEPS = [
  {
    title: '1. Identificacao',
    description: 'Declaracoes sao identificadas a partir de fontes publicas: transmissoes ao vivo da Camara e Senado, videos no YouTube, Diario Oficial, entrevistas e redes sociais.',
  },
  {
    title: '2. Registro',
    description: 'Cada declaracao e registrada com a citacao completa, data, contexto, fonte primaria (com URL) e informacoes do politico associado.',
  },
  {
    title: '3. Categorizacao',
    description: 'Declaracoes sao classificadas em categorias tematicas (economia, saude, educacao, etc.) com indicacao da categoria primaria e categorias secundarias.',
  },
  {
    title: '4. Verificacao',
    description: 'A fonte primaria e checada por um editor. Declaracoes com fonte confirmada recebem status "verificada". Sem confirmacao, permanecem como "nao verificada".',
  },
  {
    title: '5. Publicacao',
    description: 'Declaracoes verificadas sao publicadas com todas as fontes e metadados. Cada registro inclui link para a fonte primaria e quaisquer fontes secundarias.',
  },
  {
    title: '6. Revisao continua',
    description: 'Declaracoes podem ser atualizadas se novas informacoes surgirem. Alteracoes sao registradas no historico. Declaracoes imprecisas podem receber status "disputada".',
  },
]

const PRINCIPLES = [
  {
    title: 'Transparencia',
    description: 'Todas as fontes sao publicas e acessiveis. O codigo-fonte da plataforma e aberto.',
  },
  {
    title: 'Imparcialidade',
    description: 'Registramos declaracoes de politicos de todos os partidos sem julgamento editorial sobre o conteudo.',
  },
  {
    title: 'Precisao',
    description: 'Priorizamos a citacao exata. Quando apenas um resumo e possivel, indicamos isso claramente.',
  },
  {
    title: 'Rastreabilidade',
    description: 'Cada declaracao possui link para a fonte primaria, permitindo verificacao independente por qualquer pessoa.',
  },
]

export default function MetodologiaPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs items={[{ label: 'Metodologia' }]} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Metodologia</h1>
      <p className="text-gray-600 mb-8">
        Como coletamos, verificamos e publicamos declaracoes de politicos brasileiros.
      </p>

      <section className="mb-10">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Processo de registro</h2>
        <div className="space-y-4">
          {STEPS.map((step) => (
            <div key={step.title} className="bg-white border border-gray-200 rounded-lg p-4">
              <h3 className="font-semibold text-gray-900 mb-1">{step.title}</h3>
              <p className="text-sm text-gray-600">{step.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="mb-10">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Principios</h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          {PRINCIPLES.map((p) => (
            <div key={p.title} className="bg-blue-50 border border-blue-100 rounded-lg p-4">
              <h3 className="font-semibold text-blue-900 mb-1">{p.title}</h3>
              <p className="text-sm text-blue-700">{p.description}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="mb-10">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Status de verificacao</h2>
        <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-gray-50">
                <th className="text-left px-4 py-2 font-medium text-gray-600">Status</th>
                <th className="text-left px-4 py-2 font-medium text-gray-600">Significado</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              <tr>
                <td className="px-4 py-2 text-green-700 font-medium">Verificada</td>
                <td className="px-4 py-2 text-gray-600">Fonte primaria confirmada e revisada por editor.</td>
              </tr>
              <tr>
                <td className="px-4 py-2 text-yellow-700 font-medium">Nao verificada</td>
                <td className="px-4 py-2 text-gray-600">Aguardando revisao editorial. Fonte ainda nao confirmada.</td>
              </tr>
              <tr>
                <td className="px-4 py-2 text-orange-700 font-medium">Disputada</td>
                <td className="px-4 py-2 text-gray-600">Ha controversia sobre a precisao ou contexto da declaracao.</td>
              </tr>
              <tr>
                <td className="px-4 py-2 text-red-700 font-medium">Removida</td>
                <td className="px-4 py-2 text-gray-600">Declaracao removida por imprecisao ou violacao de politicas.</td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      <div className="text-center text-sm text-gray-500">
        <p>
          Para mais informacoes, consulte a pagina{' '}
          <Link href="/sobre" className="text-blue-600 hover:underline">Sobre</Link>{' '}
          ou entre em{' '}
          <Link href="/contato" className="text-blue-600 hover:underline">contato</Link>.
        </p>
      </div>
    </main>
  )
}
