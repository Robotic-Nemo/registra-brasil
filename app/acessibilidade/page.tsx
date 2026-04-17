import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Acessibilidade — Registra Brasil',
  description: 'Declaração de acessibilidade do Registra Brasil.',
  alternates: { canonical: '/acessibilidade' },
}

export default function AcessibilidadePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Declaração de Acessibilidade</h1>

      <div className="prose prose-gray max-w-none space-y-6 text-sm leading-relaxed text-gray-700">
        <p>
          O Registra Brasil se compromete a tornar seu conteúdo acessível ao maior número possível de
          pessoas, independentemente de suas habilidades ou tecnologias utilizadas.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">Padrões seguidos</h2>
        <p>
          Buscamos conformidade com as Diretrizes de Acessibilidade para Conteúdo Web (WCAG) 2.1,
          nível AA. Essas diretrizes explicam como tornar o conteúdo da web mais acessível para
          pessoas com deficiência.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">Recursos de acessibilidade</h2>
        <ul className="list-disc pl-5 space-y-2">
          <li>Navegação completa por teclado com atalhos dedicados</li>
          <li>Links para pular diretamente ao conteúdo principal</li>
          <li>Estrutura semântica de cabeçalhos (h1-h6)</li>
          <li>Textos alternativos em imagens</li>
          <li>Contraste de cores adequado (ratio mínimo 4.5:1)</li>
          <li>Formulários com labels associados e mensagens de erro claras</li>
          <li>Regiões ARIA live para conteúdo dinâmico</li>
          <li>Compatibilidade com leitores de tela (NVDA, JAWS, VoiceOver)</li>
          <li>Design responsivo que funciona em diferentes tamanhos de tela</li>
          <li>Respeito à preferência de movimento reduzido do sistema</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">Atalhos de teclado</h2>
        <ul className="list-disc pl-5 space-y-2">
          <li><kbd className="px-1.5 py-0.5 bg-gray-100 rounded text-xs font-mono">/</kbd> — Abrir busca</li>
          <li><kbd className="px-1.5 py-0.5 bg-gray-100 rounded text-xs font-mono">Esc</kbd> — Fechar diálogos</li>
          <li><kbd className="px-1.5 py-0.5 bg-gray-100 rounded text-xs font-mono">Tab</kbd> — Navegar entre elementos interativos</li>
        </ul>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">Limitações conhecidas</h2>
        <p>
          Embora nos esforcemos para garantir a acessibilidade de todo o conteúdo, algumas páginas
          podem conter conteúdo de terceiros (como vídeos do YouTube) sobre os quais temos controle
          limitado de acessibilidade.
        </p>

        <h2 className="text-lg font-semibold text-gray-900 mt-8">Contato</h2>
        <p>
          Se encontrar barreiras de acessibilidade ou tiver sugestões de melhoria, abra uma
          issue em{' '}
          <a
            href="https://github.com/Robotic-Nemo/registra-brasil/issues/new?labels=acessibilidade"
            rel="noopener noreferrer"
            target="_blank"
            className="text-blue-700 underline"
          >
            github.com/Robotic-Nemo/registra-brasil
          </a>
          {' '}ou use a <a href="/contato" className="text-blue-700 underline">página de contato</a>.
          Faremos o possível para responder em até 5 dias úteis.
        </p>
      </div>
    </main>
  )
}
