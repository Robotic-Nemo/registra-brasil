import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Termos de Uso — Registra Brasil',
  description: 'Termos e condições de uso do Registra Brasil.',
  alternates: { canonical: '/termos' },
}

export default function TermosPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Termos de Uso</h1>

      <div className="prose prose-gray max-w-none space-y-6 text-sm leading-relaxed text-gray-700">
        <p>
          <strong>Última atualização:</strong> abril de 2026
        </p>

        <p>
          Ao acessar e utilizar o Registra Brasil, você concorda com os termos e condições descritos
          abaixo. Caso não concorde, pedimos que não utilize o site.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">1. Finalidade</h2>
        <p>
          O Registra Brasil é um arquivo público de declarações de políticos brasileiros, com
          ligação obrigatória a fontes primárias. O projeto tem finalidade cívica e não possui
          vinculação partidária.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">2. Conteúdo</h2>
        <p>
          As declarações catalogadas são atribuídas a políticos com base em fontes públicas
          verificáveis. O Registra Brasil não é responsável pelo conteúdo das declarações em si,
          apenas pelo registro e organização das mesmas.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">3. Uso permitido</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Consultar declarações para fins informativos, educacionais ou jornalísticos</li>
          <li>Compartilhar links para declarações específicas</li>
          <li>Citar o Registra Brasil como fonte, com devida atribuição</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">4. Uso proibido</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Extração automatizada massiva de dados (scraping) sem autorização</li>
          <li>Uso do conteúdo para desinformação ou fora de contexto</li>
          <li>Tentativa de acesso não autorizado a áreas administrativas</li>
          <li>Uso que viole a legislação brasileira</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">5. Propriedade intelectual</h2>
        <p>
          O código-fonte, design e organização do Registra Brasil são propriedade do projeto. As
          declarações em si são de domínio público por se tratarem de pronunciamentos de agentes
          públicos em exercício de função.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">6. Isenção de responsabilidade</h2>
        <p>
          O Registra Brasil é oferecido &quot;como está&quot;, sem garantias de qualquer tipo. Não
          nos responsabilizamos por decisões tomadas com base nas informações disponibilizadas.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">7. Alterações</h2>
        <p>
          Reservamo-nos o direito de modificar estes termos a qualquer momento. Alterações
          significativas serão comunicadas na página inicial.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">8. Contato</h2>
        <p>
          Dúvidas sobre estes termos podem ser enviadas para{' '}
          <a href="mailto:contato@registrabrasil.com.br" className="text-blue-700 underline">
            contato@registrabrasil.com.br
          </a>.
        </p>
      </div>
    </main>
  )
}
