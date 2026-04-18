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
          <strong>Última atualização:</strong> {new Date().toLocaleDateString('pt-BR', { month: 'long', year: 'numeric' })}
        </p>

        <p>
          Ao acessar o Registra Brasil você concorda com estes termos. Caso não concorde, pedimos
          que não utilize o serviço.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">1. Finalidade</h2>
        <p>
          O Registra Brasil é um arquivo público independente de declarações de agentes políticos
          brasileiros com ligação obrigatória a fontes primárias. A finalidade é jornalística, cívica
          e educacional, resguardada pelo art. 5º, incisos IV, IX e XIV da Constituição Federal e
          pelo art. 220 da mesma Carta. Não há vinculação partidária e não oferecemos consultoria
          política.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">2. Responsabilidade editorial</h2>
        <p>
          Cada declaração catalogada é atribuída a um político com base em fontes públicas
          verificáveis indicadas em cada registro. O Registra Brasil responde editorialmente pela
          curadoria (seleção, contextualização, categorização e severidade atribuída), mas não pelo
          mérito do que foi dito pelo próprio agente político. Correções são recebidas pela{' '}
          <a href="/contato" className="text-blue-700 underline">página de contato</a> e, quando
          procedentes, resultam em retificação pública registrada em{' '}
          <a href="/retratacoes" className="text-blue-700 underline">/retratacoes</a>.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">3. Uso permitido</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Consulta individual, pesquisa acadêmica, cobertura jornalística e usos cívicos</li>
          <li>Compartilhamento de links para declarações individuais</li>
          <li>Reutilização do conteúdo textual sob a licença <strong>Creative Commons Atribuição 4.0 (CC BY 4.0)</strong>, com crédito ao Registra Brasil e link para a fonte primária original</li>
          <li>Consumo automatizado via APIs públicas documentadas em{' '}
            <a href="/api-docs" className="text-blue-700 underline">/api-docs</a>, respeitados os limites de rate limit publicados</li>
          <li>Uso de feeds RSS/Atom e embeds oficiais (iframes de{' '}
            <a href="/desenvolvedores" className="text-blue-700 underline">/desenvolvedores</a>)</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">4. Uso vedado</h2>
        <ul className="list-disc pl-5 space-y-1">
          <li>Scraping que ultrapasse os limites documentados da API ou que ignore cabeçalhos <code>Retry-After</code></li>
          <li>Reprodução de citações fora de contexto de modo a distorcer o sentido original</li>
          <li>Tentativa de acesso não autorizado a áreas administrativas ou a endpoints internos</li>
          <li>Qualquer uso que viole a legislação brasileira, incluindo a Lei Geral de Proteção de Dados, o Marco Civil da Internet e a legislação eleitoral</li>
          <li>Revenda ou relicenciamento do acervo em termos mais restritivos que a licença CC BY 4.0</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">5. Licença e propriedade intelectual</h2>
        <p>
          O conteúdo editorial do Registra Brasil (resumos, contextos, categorização, curadoria) é
          licenciado sob{' '}
          <a
            href="https://creativecommons.org/licenses/by/4.0/deed.pt-BR"
            className="text-blue-700 underline"
            rel="noopener noreferrer"
            target="_blank"
          >
            Creative Commons Atribuição 4.0 Internacional (CC BY 4.0)
          </a>
          . As citações de agentes públicos são de caráter público e sua redistribuição é amparada
          pelo direito à informação. O código-fonte do site é disponibilizado publicamente no{' '}
          <a
            href="https://github.com/Robotic-Nemo/registra-brasil"
            className="text-blue-700 underline"
            rel="noopener noreferrer"
            target="_blank"
          >
            GitHub
          </a>
          {' '}sob licença MIT.
        </p>
        <p>
          Fotografias de políticos são exibidas apenas quando a origem e a licença forem compatíveis
          com uso editorial (domínio público, trabalho governamental, Wikimedia Commons, Creative
          Commons ou uso justo para fins jornalísticos). Cada foto guarda, no banco de dados,
          metadados de origem e licença que podem ser solicitados por e-mail editorial. Na ausência
          de licença verificada, o site renderiza um espaço reservado em vez da imagem.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">5.1 Proteção de crianças e adolescentes</h2>
        <p>
          Em observância ao art. 227 da Constituição Federal e ao Estatuto da Criança e do
          Adolescente (Lei 8.069/1990), declarações que envolvam menores de idade — seja por tema,
          citação direta ou identificação — passam por revisão editorial adicional. O acervo
          mantém um sinalizador interno que restringe a indexação e a agregação desses
          registros. Nomes, imagens ou dados pessoais de menores só são exibidos quando já
          tornados públicos por fonte oficial ou quando houver interesse público inequívoco.
          Pedidos de remoção envolvendo menores são tratados como prioridade máxima.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">6. Retificação, remoção e contraditório</h2>
        <p>
          Agentes citados podem solicitar:
        </p>
        <ul className="list-disc pl-5 space-y-1">
          <li><strong>Retificação editorial</strong> quando houver erro verificável no resumo ou no contexto</li>
          <li><strong>Inclusão de esclarecimento</strong> (direito de resposta) adjacente à declaração</li>
          <li><strong>Remoção</strong> em casos de fonte inválida, deepfake, atribuição equivocada ou decisão judicial transitada em julgado</li>
        </ul>
        <p>
          Pedidos devem ser enviados pela <a href="/contato" className="text-blue-700 underline">página de contato</a>{' '}
          com indicação da declaração, fundamentação e, quando aplicável, fonte primária
          corretiva. Respondemos em até 10 dias úteis.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">7. Isenção de responsabilidade e limitação</h2>
        <p>
          O serviço é oferecido &quot;como está&quot;, sem garantias de disponibilidade contínua ou
          de atualidade integral do acervo. Não nos responsabilizamos por decisões tomadas com base
          exclusivamente no que está registrado aqui; usuários devem sempre consultar as fontes
          primárias citadas. Na máxima extensão permitida em lei, nossa responsabilidade por danos
          indiretos, lucros cessantes ou danos morais decorrentes do uso do site está limitada ao
          valor eventualmente pago pelo usuário pelos serviços — que para este projeto é{' '}
          <strong>zero</strong>.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">8. Alterações</h2>
        <p>
          Podemos atualizar estes termos. Mudanças relevantes são anunciadas no rodapé do site e em{' '}
          <a href="/changelog" className="text-blue-700 underline">/changelog</a>. O uso continuado
          após a atualização caracteriza aceitação dos novos termos.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">9. Lei aplicável e foro</h2>
        <p>
          Estes termos são regidos pela legislação brasileira. Fica eleito o foro da Comarca de
          São Paulo — SP para dirimir controvérsias, com renúncia a qualquer outro, por mais
          privilegiado que seja.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">10. Contato</h2>
        <p>
          Dúvidas sobre estes termos podem ser enviadas pela{' '}
          <a href="/contato" className="text-blue-700 underline">página de contato</a>.
        </p>
      </div>
    </main>
  )
}
