import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Política de Privacidade — Registra Brasil',
  description: 'Política de privacidade e proteção de dados do Registra Brasil.',
  alternates: { canonical: '/privacidade' },
}

export default function PrivacidadePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Política de Privacidade</h1>

      <div className="prose prose-gray max-w-none space-y-6 text-sm leading-relaxed text-gray-700">
        <p>
          <strong>Última atualização:</strong> abril de 2026
        </p>

        <p>
          O Registra Brasil respeita a sua privacidade. Esta política descreve quais dados coletamos,
          como os utilizamos e quais são seus direitos, em conformidade com a Lei Geral de Proteção
          de Dados (LGPD — Lei 13.709/2018).
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">1. Dados coletados</h2>
        <p>O Registra Brasil pode coletar os seguintes dados de forma automática:</p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Endereço IP (de forma anonimizada para analytics)</li>
          <li>Tipo de navegador e sistema operacional</li>
          <li>Páginas visitadas e tempo de permanência</li>
          <li>Termos de busca utilizados na plataforma</li>
        </ul>
        <p>
          Não coletamos dados pessoais identificáveis como nome, e-mail ou CPF, a menos que você
          entre em contato conosco voluntariamente.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">2. Uso dos dados</h2>
        <p>Os dados coletados são usados exclusivamente para:</p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Melhorar a experiência de navegação</li>
          <li>Gerar estatísticas agregadas de uso</li>
          <li>Identificar e corrigir problemas técnicos</li>
          <li>Melhorar a relevância dos resultados de busca</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">3. Cookies</h2>
        <p>
          Utilizamos cookies estritamente necessários para o funcionamento do site. Cookies de
          analytics só são ativados com seu consentimento explícito por meio do banner de cookies.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">4. Compartilhamento</h2>
        <p>
          Não vendemos, alugamos ou compartilhamos seus dados com terceiros, exceto quando
          exigido por lei ou ordem judicial.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">5. Seus direitos (LGPD)</h2>
        <p>Conforme a LGPD, você tem direito a:</p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Confirmar a existência de tratamento de dados</li>
          <li>Acessar os dados que possuímos sobre você</li>
          <li>Solicitar correção de dados incompletos ou inexatos</li>
          <li>Solicitar exclusão de dados desnecessários</li>
          <li>Revogar consentimento a qualquer momento</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">6. Contato</h2>
        <p>
          Para exercer seus direitos ou esclarecer dúvidas, entre em contato pelo e-mail{' '}
          <a href="mailto:contato@registrabrasil.com.br" className="text-blue-700 underline">
            contato@registrabrasil.com.br
          </a>.
        </p>
      </div>
    </main>
  )
}
