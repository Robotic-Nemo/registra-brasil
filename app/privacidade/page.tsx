import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Política de Privacidade — Registra Brasil',
  description: 'Política de privacidade e proteção de dados do Registra Brasil, em conformidade com a LGPD.',
  alternates: { canonical: '/privacidade' },
}

export default function PrivacidadePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Política de Privacidade</h1>

      <div className="prose prose-gray max-w-none space-y-6 text-sm leading-relaxed text-gray-700">
        <p>
          <strong>Última atualização:</strong> {new Date().toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' })}
        </p>

        <p>
          O Registra Brasil respeita a sua privacidade. Esta política descreve quais dados coletamos,
          como os utilizamos, com quem são compartilhados e quais são seus direitos, em conformidade
          com a Lei Geral de Proteção de Dados (LGPD — Lei 13.709/2018).
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">1. Dados coletados automaticamente</h2>
        <p>Ao navegar pelo Registra Brasil, coletamos automaticamente:</p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Endereço IP (registrado brevemente para controle de rate limit e mitigação de abuso; não usamos para identificar pessoas)</li>
          <li>User-Agent (tipo de navegador e sistema operacional)</li>
          <li>Páginas visitadas e referrer</li>
          <li>Termos digitados no campo de busca</li>
        </ul>
        <p>
          <strong>Não utilizamos ferramentas de analytics de terceiros por padrão.</strong> Se e
          quando um provedor como Google Analytics ou Plausible for ativado, isso será comunicado
          nesta página e exigirá seu consentimento explícito via banner.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">2. Dados fornecidos por você</h2>
        <p>
          Alguns recursos coletam dados que você fornece voluntariamente:
        </p>
        <ul className="list-disc pl-5 space-y-1">
          <li>
            <strong>Newsletter:</strong> ao se inscrever, armazenamos seu e-mail e, opcionalmente,
            seu nome. O e-mail é usado apenas para enviar atualizações do arquivo. Você pode
            cancelar a inscrição a qualquer momento pelo link no rodapé de cada e-mail ou pela
            página <a href="/contato" className="text-blue-700 underline">/contato</a>.
          </li>
          <li>
            <strong>Contato:</strong> se você enviar uma mensagem ou sugestão de declaração,
            guardamos o conteúdo e o endereço de origem apenas pelo tempo necessário para
            responder.
          </li>
          <li>
            <strong>Webhooks (APIs):</strong> parceiros que registram endpoints de webhook
            fornecem uma URL de destino. Essa URL é armazenada em banco de dados cifrado em
            repouso e usada exclusivamente para entregar notificações de eventos assinados via
            HMAC-SHA256.
          </li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">3. Armazenamento local no navegador</h2>
        <p>
          Algumas páginas usam o <code>localStorage</code> do seu navegador para guardar
          preferências que <strong>nunca saem do seu dispositivo</strong>:
        </p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Favoritos (página <a href="/favoritos" className="text-blue-700 underline">/favoritos</a>) — lista de declarações que você marcou</li>
          <li>Perfil local (página <a href="/perfil" className="text-blue-700 underline">/perfil</a>) — nome de exibição, filtros salvos e histórico de navegação opcional</li>
          <li>Preferências de interface (tema claro/escuro, modo de contraste, tamanho de fonte)</li>
        </ul>
        <p>
          Esses dados podem ser apagados por você a qualquer momento pelas próprias páginas ou
          limpando o armazenamento do site nas configurações do navegador.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">4. Cookies</h2>
        <p>
          Utilizamos apenas cookies estritamente necessários para o funcionamento do site, como o
          cookie de sessão administrativa (<code>admin_session</code>), acessível apenas à equipe
          editorial. <strong>Não utilizamos cookies de marketing, rastreamento ou remarketing.</strong>
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">5. Compartilhamento</h2>
        <p>
          Não vendemos, alugamos ou compartilhamos seus dados com terceiros para fins comerciais.
          Compartilhamos dados apenas:
        </p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Com nossos provedores de infraestrutura (Vercel para hospedagem, Supabase para banco de dados), estritamente necessários para o funcionamento técnico do serviço.</li>
          <li>Quando exigido por lei ou ordem judicial brasileira.</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">6. Conteúdo editorial</h2>
        <p>
          O acervo de declarações é formado por manifestações públicas de agentes políticos (discursos,
          entrevistas, postagens em redes sociais, sessões legislativas, etc.), coletadas de fontes
          primárias acessíveis publicamente. Esse conteúdo não configura dado pessoal privado
          passível de oposição sob a LGPD, por tratar-se de atividade pública de interesse
          legítimo (art. 7º, inciso IX) e de atividade jornalística (art. 4º, inciso II). Correções
          podem ser solicitadas pela <a href="/contato" className="text-blue-700 underline">página de contato</a>
          {' '}— todas as retratações são publicadas em <a href="/retratacoes" className="text-blue-700 underline">/retratacoes</a>.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">7. Seus direitos (LGPD — art. 18)</h2>
        <p>Você tem direito a:</p>
        <ul className="list-disc pl-5 space-y-1">
          <li>Confirmar a existência de tratamento dos seus dados</li>
          <li>Acessar os dados que possuímos sobre você</li>
          <li>Solicitar correção de dados incompletos ou inexatos</li>
          <li>Solicitar anonimização, bloqueio ou eliminação de dados desnecessários</li>
          <li>Revogar consentimento a qualquer momento</li>
          <li>Solicitar portabilidade para outro provedor de serviço (quando aplicável)</li>
          <li>Peticionar à Autoridade Nacional de Proteção de Dados (ANPD)</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">8. Retenção de dados</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Logs de rate limit e erro técnico: até 30 dias</li>
          <li>Inscrições de newsletter: até o cancelamento pelo titular</li>
          <li>Mensagens de contato: até a resolução da solicitação, no máximo 6 meses</li>
          <li>Conteúdo editorial publicado: indefinidamente, por ser histórico público</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">9. Segurança</h2>
        <p>
          Aplicamos medidas técnicas e organizacionais razoáveis, incluindo criptografia em
          trânsito (HTTPS com HSTS), criptografia em repouso no banco de dados, controle de acesso
          administrativo com autenticação por segredo e logs de auditoria, conforme detalhado em{' '}
          <a href="/sobre" className="text-blue-700 underline">/sobre</a>.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">10. Atualizações</h2>
        <p>
          Esta política pode ser atualizada. Mudanças materiais são comunicadas via banner no site
          e, quando possível, por e-mail aos inscritos na newsletter.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">11. Contato</h2>
        <p>
          Para exercer seus direitos ou esclarecer dúvidas, use a{' '}
          <a href="/contato" className="text-blue-700 underline">página de contato</a>.
        </p>
      </div>
    </main>
  )
}
