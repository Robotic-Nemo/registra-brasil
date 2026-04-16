import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Sobre e Metodologia — Registra Brasil',
  description: 'Como o Registra Brasil coleta, verifica e publica declarações de políticos brasileiros.',
  alternates: { canonical: '/sobre' },
}

const NAV_ITEMS = [
  { id: 'missao', label: 'Missão' },
  { id: 'fontes', label: 'Fontes aceitas' },
  { id: 'verificacao', label: 'Verificação' },
  { id: 'resultados-ao-vivo', label: 'Resultados ao vivo' },
  { id: 'nao-fazemos', label: 'O que não fazemos' },
  { id: 'contribuir', label: 'Contribuir' },
  { id: 'tecnologia', label: 'Tecnologia' },
]

const faqJsonLd = {
  '@context': 'https://schema.org',
  '@type': 'FAQPage',
  mainEntity: [
    {
      '@type': 'Question',
      name: 'Quais fontes o Registra Brasil aceita?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'TV Câmara, TV Senado, canais oficiais do YouTube (Câmara, Senado, TSE, Presidência), Diário Oficial da União, transcrições do parlamento e vídeos sem edição aparente. Notícias são aceitas apenas como fonte secundária.',
      },
    },
    {
      '@type': 'Question',
      name: 'O que significam os status de verificação?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Verificado: fonte primária confirmada e revisada. Não verificado: aguardando revisão. Disputado: contexto ou interpretação questionados. Removido: retirado por erro factual.',
      },
    },
    {
      '@type': 'Question',
      name: 'Como posso contribuir com o Registra Brasil?',
      acceptedAnswer: {
        '@type': 'Answer',
        text: 'Para enviar uma declaração, é necessário ter o link direto para a fonte primária, preferencialmente com marcação de tempo no vídeo. Jornalistas e pesquisadores podem solicitar acesso editorial.',
      },
    },
  ],
}

export default function SobrePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(faqJsonLd) }}
      />
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Sobre o Registra Brasil</h1>
      <p className="text-gray-600 mb-8">
        Arquivo público de declarações de políticos brasileiros, com ligação obrigatória a fontes primárias.
      </p>

      {/* Quick nav */}
      <nav aria-label="Navegação da página" className="mb-10 flex flex-wrap gap-2">
        {NAV_ITEMS.map((item) => (
          <a
            key={item.id}
            href={`#${item.id}`}
            className="text-xs text-blue-600 hover:text-blue-800 bg-blue-50 hover:bg-blue-100 px-2.5 py-1 rounded-full transition-colors"
          >
            {item.label}
          </a>
        ))}
      </nav>

      <article id="topo" className="prose prose-gray max-w-none">
        <h2 id="missao" tabIndex={-1}>Missão</h2>
        <p>
          O Registra Brasil documenta declarações de políticos brasileiros que contenham conteúdo factualmente
          relevante para o debate público — incluindo afirmações que possam ser classificadas como racistas,
          misóginas, homofóbicas, antidemocráticas, ou que envolvam corrupção ou desinformação.
        </p>
        <p>
          <strong>Não somos um site de opinião.</strong> Cada entrada deve ter uma fonte primária verificável.
          Se não há vídeo, transcrição oficial ou documento público, a declaração não entra no arquivo.
        </p>

        <h2 id="fontes" tabIndex={-1}>Fontes aceitas</h2>
        <ul>
          <li><strong>TV Câmara / TV Senado</strong> — transmissões e arquivos oficiais do parlamento</li>
          <li><strong>YouTube (canais oficiais)</strong> — canais verificados da Câmara, Senado, TSE, Presidência</li>
          <li><strong>Diário Oficial da União</strong> — atos, pronunciamentos e publicações oficiais</li>
          <li><strong>Transcrições do parlamento</strong> — notas taquigráficas e atas oficiais</li>
          <li><strong>YouTube (outros canais)</strong> — aceitos como fonte primária se o vídeo contém a declaração completa e sem edição aparente</li>
          <li><strong>Notícias</strong> — aceitas apenas como fonte secundária, nunca como única evidência</li>
        </ul>

        <h2 id="verificacao" tabIndex={-1}>Status de verificação</h2>
        <ul>
          <li><strong>Verificado</strong> — fonte primária confirmada e revisada por um editor</li>
          <li><strong>Não verificado</strong> — enviado por colaborador, aguardando revisão editorial</li>
          <li><strong>Disputado</strong> — fonte encontrada, mas contexto ou interpretação questionados</li>
          <li><strong>Removido</strong> — retirado por erro factual comprovado ou duplicata</li>
        </ul>

        <h2 id="resultados-ao-vivo" tabIndex={-1}>Resultados ao vivo</h2>
        <p>
          A aba &quot;Fontes ao vivo&quot; exibe resultados do YouTube e da imprensa em tempo real. Esses resultados
          <strong> não foram verificados editorialmente</strong>. Servem como ponto de partida para pesquisa,
          mas não devem ser tratados como fatos confirmados.
        </p>

        <h2 id="nao-fazemos" tabIndex={-1}>O que não fazemos</h2>
        <ul>
          <li>Não publicamos declarações sem fonte primária</li>
          <li>Não inferimos intenção ou fazemos análise política</li>
          <li>Não aceitamos declarações baseadas exclusivamente em notícias de terceiros</li>
          <li>Não removemos entradas por pressão política — apenas por erro factual comprovado</li>
        </ul>

        <h2 id="contribuir" tabIndex={-1}>Como contribuir</h2>
        <p>
          O banco de dados é mantido por uma equipe editorial voluntária. Para enviar uma declaração,
          é necessário ter o link direto para a fonte primária (preferencialmente com marcação de tempo no vídeo).
        </p>
        <p>
          Se você é jornalista, pesquisador ou cidadão com acesso a fontes primárias, entre em contato
          para solicitar acesso editorial.
        </p>

        <h2 id="tecnologia" tabIndex={-1}>Tecnologia</h2>
        <p>
          O Registra Brasil usa busca de texto completo em português (PostgreSQL com dicionário <code>portuguese</code>),
          integração com a YouTube Data API v3 para resultados ao vivo, e Google Custom Search para notícias.
        </p>
        <p>
          O scanner automatizado utiliza a API do Claude (Anthropic) com busca web para identificar novas
          declarações relevantes, que são inseridas como &quot;não verificadas&quot; até revisão editorial.
        </p>
        <p>
          Tecnologias: Next.js, React, Supabase (PostgreSQL), Tailwind CSS, TypeScript.
          O código-fonte é aberto.
        </p>
      </article>

      <div className="mt-10 text-center">
        <a
          href="#topo"
          className="inline-flex items-center gap-1 text-sm text-blue-600 hover:text-blue-800 transition-colors"
        >
          ↑ Voltar ao topo
        </a>
      </div>
    </main>
  )
}
