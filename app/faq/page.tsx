import type { Metadata } from 'next'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Perguntas Frequentes — Registra Brasil',
  description: 'Respostas para as duvidas mais comuns sobre o Registra Brasil.',
  alternates: { canonical: '/faq' },
}

interface FaqItem {
  question: string
  answer: string
}

const FAQ_ITEMS: FaqItem[] = [
  {
    question: 'O que e o Registra Brasil?',
    answer: 'O Registra Brasil e um arquivo publico de declaracoes de politicos brasileiros. Toda declaracao e vinculada a uma fonte primaria verificavel, como transmissoes oficiais do Congresso, Diario Oficial ou videos sem edicao.',
  },
  {
    question: 'Quais fontes sao aceitas?',
    answer: 'Aceitamos fontes primarias como TV Camara, TV Senado, canais oficiais do YouTube (Camara, Senado, TSE, Presidencia), Diario Oficial da Uniao e transcricoes parlamentares. Noticias sao aceitas apenas como fonte secundaria.',
  },
  {
    question: 'O que significam os status de verificacao?',
    answer: 'Verificado indica que a fonte primaria foi confirmada e revisada. Nao verificado significa que a declaracao aguarda revisao. Disputado indica que o contexto ou interpretacao foi questionado. Removido significa que foi retirado por erro factual.',
  },
  {
    question: 'Como posso sugerir uma declaracao?',
    answer: 'Voce pode sugerir declaracoes atraves do formulario de sugestao disponivel no site. E necessario incluir o link da fonte primaria. Nossa equipe revisara a sugestao antes da publicacao.',
  },
  {
    question: 'O Registra Brasil tem posicao politica?',
    answer: 'Nao. O projeto e apartidario e nao faz analise de merito das declaracoes. Nosso objetivo e exclusivamente registrar o que foi dito, por quem, quando e com link para a fonte original.',
  },
  {
    question: 'Posso usar os dados em meu site ou pesquisa?',
    answer: 'Sim. Disponibilizamos uma API publica gratuita em /api/v1 para consulta de declaracoes, politicos e categorias. Os dados podem ser usados com atribuicao ao Registra Brasil.',
  },
  {
    question: 'Como funciona a API?',
    answer: 'A API v1 oferece endpoints RESTful para declaracoes, politicos, categorias e busca. Ha limite de 60 requisicoes por minuto. Consulte a documentacao em /api-docs para detalhes.',
  },
  {
    question: 'Posso contribuir com o projeto?',
    answer: 'Sim! Alem de sugerir declaracoes, voce pode reportar erros, sugerir melhorias ou contribuir com o codigo-fonte. Acesse nossa pagina Sobre para mais informacoes.',
  },
]

export default function FaqPage() {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: FAQ_ITEMS.map((item) => ({
      '@type': 'Question',
      name: item.question,
      acceptedAnswer: {
        '@type': 'Answer',
        text: item.answer,
      },
    })),
  }

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <main className="max-w-3xl mx-auto px-4 py-12">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">
          Perguntas Frequentes
        </h1>
        <p className="text-gray-500 mb-10">
          Respostas para as duvidas mais comuns sobre o projeto.
        </p>

        <div className="space-y-6">
          {FAQ_ITEMS.map((item, index) => (
            <details
              key={index}
              className="group bg-white border border-gray-200 rounded-xl overflow-hidden"
            >
              <summary className="flex items-center justify-between px-6 py-4 cursor-pointer select-none hover:bg-gray-50 transition-colors">
                <span className="font-medium text-gray-900 pr-4">{item.question}</span>
                <span className="text-gray-400 flex-shrink-0 transition-transform group-open:rotate-45 text-xl leading-none">
                  +
                </span>
              </summary>
              <div className="px-6 pb-4 text-sm text-gray-600 leading-relaxed">
                {item.answer}
              </div>
            </details>
          ))}
        </div>
      </main>
    </>
  )
}
