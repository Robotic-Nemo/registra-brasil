import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Declaracao de Acessibilidade — Registra Brasil',
  description: 'Declaracao de acessibilidade do Registra Brasil, compromisso com inclusao digital.',
  alternates: { canonical: '/acessibilidade/declaracao' },
}

export default function DeclaracaoAcessibilidadePage() {
  return (
    <main id="main-content" className="container mx-auto max-w-3xl px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white mb-6">
        Declaracao de Acessibilidade
      </h1>

      <div className="prose dark:prose-invert max-w-none space-y-6">
        <section>
          <h2 className="text-lg font-semibold">Compromisso</h2>
          <p>
            O Registra Brasil se compromete a garantir a acessibilidade digital para
            pessoas com deficiencia. Trabalhamos continuamente para melhorar a experiencia
            de todos os usuarios, seguindo as diretrizes de acessibilidade WCAG 2.1 nivel AA.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-semibold">Medidas de Acessibilidade</h2>
          <ul className="list-disc pl-6 space-y-1">
            <li>Navegacao completa por teclado</li>
            <li>Compatibilidade com leitores de tela</li>
            <li>Textos alternativos em imagens</li>
            <li>Contraste de cores adequado</li>
            <li>Estrutura semantica de titulos</li>
            <li>Links de pular navegacao</li>
            <li>Formularios com rotulos acessiveis</li>
            <li>Controle de tamanho de texto</li>
            <li>Modo de alto contraste</li>
            <li>Respeito a preferencia de movimento reduzido</li>
          </ul>
        </section>

        <section>
          <h2 className="text-lg font-semibold">Conformidade</h2>
          <p>
            Este site busca conformidade com as Diretrizes de Acessibilidade para Conteudo Web
            (WCAG) 2.1, nivel AA, e com a Lei Brasileira de Inclusao (Lei 13.146/2015).
          </p>
        </section>

        <section>
          <h2 className="text-lg font-semibold">Feedback</h2>
          <p>
            Se voce encontrar barreiras de acessibilidade neste site, por favor entre
            em contato conosco pela pagina de contato. Levamos todos os relatos a serio
            e trabalharemos para resolver qualquer problema identificado.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-semibold">Tecnologias Assistivas Suportadas</h2>
          <ul className="list-disc pl-6 space-y-1">
            <li>NVDA (Windows)</li>
            <li>VoiceOver (macOS e iOS)</li>
            <li>TalkBack (Android)</li>
            <li>JAWS (Windows)</li>
          </ul>
        </section>

        <p className="text-sm text-gray-500 dark:text-gray-400 mt-8">
          Ultima atualizacao: Abril de 2026
        </p>
      </div>
    </main>
  )
}
