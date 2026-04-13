import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Sobre e Metodologia — Registra Brasil',
  description: 'Como o Registra Brasil coleta, verifica e publica declarações de políticos brasileiros.',
}

export default function SobrePage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Sobre o Registra Brasil</h1>
      <p className="text-gray-600 mb-10">
        Arquivo público de declarações de políticos brasileiros, com ligação obrigatória a fontes primárias.
      </p>

      <section className="prose prose-gray max-w-none">
        <h2 id="missao">Missão</h2>
        <p>
          O Registra Brasil documenta declarações de políticos brasileiros que contenham conteúdo factualmente
          relevante para o debate público — incluindo afirmações que possam ser classificadas como racistas,
          misóginas, homofóbicas, antidemocráticas, ou que envolvam corrupção ou desinformação.
        </p>
        <p>
          <strong>Não somos um site de opinião.</strong> Cada entrada deve ter uma fonte primária verificável.
          Se não há vídeo, transcrição oficial ou documento público, a declaração não entra no arquivo.
        </p>

        <h2 id="fontes">Fontes aceitas</h2>
        <ul>
          <li><strong>TV Câmara / TV Senado</strong> — transmissões e arquivos oficiais do parlamento</li>
          <li><strong>YouTube (canais oficiais)</strong> — canais verificados da Câmara, Senado, TSE, Presidência</li>
          <li><strong>Diário Oficial da União</strong> — atos, pronunciamentos e publicações oficiais</li>
          <li><strong>Transcrições do parlamento</strong> — notas taquigráficas e atas oficiais</li>
          <li><strong>YouTube (outros canais)</strong> — aceitos como fonte primária se o vídeo contém a declaração completa e sem edição aparente</li>
          <li><strong>Notícias</strong> — aceitas apenas como fonte secundária, nunca como única evidência</li>
        </ul>

        <h2 id="verificacao">Status de verificação</h2>
        <ul>
          <li><strong>Verificado</strong> — fonte primária confirmada e revisada por um editor</li>
          <li><strong>Não verificado</strong> — enviado por colaborador, aguardando revisão editorial</li>
          <li><strong>Disputado</strong> — fonte encontrada, mas contexto ou interpretação questionados</li>
        </ul>

        <h2 id="resultados-ao-vivo">Resultados ao vivo</h2>
        <p>
          A aba "Fontes ao vivo" exibe resultados do YouTube e da imprensa em tempo real. Esses resultados
          <strong> não foram verificados editorialmente</strong>. Servem como ponto de partida para pesquisa,
          mas não devem ser tratados como fatos confirmados.
        </p>

        <h2 id="nao-fazemos">O que não fazemos</h2>
        <ul>
          <li>Não publicamos declarações sem fonte primária</li>
          <li>Não inferimos intenção ou fazemos análise política</li>
          <li>Não aceitamos declarações baseadas exclusivamente em notícias de terceiros</li>
          <li>Não removemos entradas por pressão política — apenas por erro factual comprovado</li>
        </ul>

        <h2 id="contribuir">Como contribuir</h2>
        <p>
          O banco de dados é mantido por uma equipe editorial voluntária. Para enviar uma declaração,
          é necessário ter o link direto para a fonte primária (preferencialmente com marcação de tempo no vídeo).
        </p>

        <h2 id="tecnologia">Tecnologia</h2>
        <p>
          O Registra Brasil usa busca de texto completo em português (PostgreSQL com dicionário <code>portuguese</code>),
          integração com a YouTube Data API v3 para resultados ao vivo, e Google Custom Search para notícias.
          O código-fonte é aberto.
        </p>
      </section>
    </main>
  )
}
