import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Documentação da API | Registra Brasil',
  description: 'Documentação da API pública do Registra Brasil para acesso a declarações e dados de políticos.',
  alternates: { canonical: '/api-docs' },
}

const endpoints = [
  {
    method: 'GET',
    path: '/api/search',
    description: 'Busca declarações por texto',
    params: [
      { name: 'q', type: 'string', required: true, description: 'Termo de busca' },
      { name: 'page', type: 'number', required: false, description: 'Página (padrão: 1)' },
      { name: 'limit', type: 'number', required: false, description: 'Itens por página (máx: 50)' },
      { name: 'party', type: 'string', required: false, description: 'Filtrar por partido' },
      { name: 'state', type: 'string', required: false, description: 'Filtrar por estado (UF)' },
      { name: 'category', type: 'string', required: false, description: 'Filtrar por slug da categoria' },
    ],
  },
  {
    method: 'GET',
    path: '/api/politicians',
    description: 'Lista todos os políticos',
    params: [],
  },
  {
    method: 'GET',
    path: '/api/categories',
    description: 'Lista todas as categorias',
    params: [],
  },
  {
    method: 'GET',
    path: '/api/stats',
    description: 'Estatísticas gerais do site',
    params: [],
  },
  {
    method: 'GET',
    path: '/api/trending',
    description: 'Políticos e categorias em alta',
    params: [
      { name: 'type', type: 'string', required: false, description: '"politicians", "categories" ou "all"' },
      { name: 'days', type: 'number', required: false, description: 'Período em dias (máx: 90)' },
      { name: 'limit', type: 'number', required: false, description: 'Limite de resultados (máx: 20)' },
    ],
  },
  {
    method: 'GET',
    path: '/api/export',
    description: 'Exportar declarações em JSON ou CSV',
    params: [
      { name: 'format', type: 'string', required: false, description: '"json" ou "csv"' },
      { name: 'politician', type: 'string', required: false, description: 'Slug do político' },
      { name: 'category', type: 'string', required: false, description: 'Slug da categoria' },
      { name: 'status', type: 'string', required: false, description: 'Status de verificação' },
      { name: 'limit', type: 'number', required: false, description: 'Limite (máx: 2000)' },
    ],
  },
  {
    method: 'GET',
    path: '/api/health',
    description: 'Verificação de saúde da API',
    params: [],
  },
  {
    method: 'GET',
    path: '/api/embed',
    description: 'Endpoint oEmbed para incorporação',
    params: [
      { name: 'url', type: 'string', required: true, description: 'URL da declaração' },
      { name: 'format', type: 'string', required: false, description: '"json" (padrão)' },
    ],
  },
  {
    method: 'GET',
    path: '/feed.xml',
    description: 'Feed RSS 2.0',
    params: [],
  },
  {
    method: 'GET',
    path: '/atom.xml',
    description: 'Feed Atom',
    params: [],
  },
]

export default function ApiDocsPage() {
  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-zinc-900 mb-2">Documentação da API</h1>
      <p className="text-zinc-600 mb-6">
        A API pública do Registra Brasil permite acesso aos dados de declarações verificadas.
        Todas as respostas são em JSON (exceto feeds e exportações CSV). Licença CC BY 4.0 — uso
        livre com atribuição.
      </p>

      <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6 text-sm">
        <p className="font-semibold text-blue-900 mb-1">Especificação OpenAPI 3.1</p>
        <p className="text-blue-800 mb-2">
          Definição machine-readable completa da API — importável em Postman, Insomnia, Swagger UI,
          Redoc e qualquer gerador de client SDK.
        </p>
        <div className="flex flex-wrap gap-3 text-xs">
          <a href="/api/openapi.json" className="inline-flex items-center gap-1 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white rounded font-medium">
            Baixar openapi.json
          </a>
          <a
            href="https://petstore.swagger.io/?url=https://registrabrasil.com.br/api/openapi.json"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-1 px-3 py-1.5 border border-blue-300 text-blue-700 hover:bg-blue-100 rounded font-medium"
          >
            Abrir no Swagger Editor ↗
          </a>
        </div>
      </div>

      <div className="bg-green-50 border border-green-200 rounded-lg p-4 mb-8 text-sm">
        <p className="font-semibold text-green-900 mb-1">Dump completo do acervo</p>
        <p className="text-green-800 mb-2">
          Arquivo único com <strong>todas</strong> as declarações não-removidas (~12.500 rows).
          ETag estável + cache 1h edge / 24h browser, resposta 304 se nada mudou.
        </p>
        <div className="flex flex-wrap gap-3 text-xs">
          <a href="/api/dump/statements?format=json" className="inline-flex items-center gap-1 px-3 py-1.5 bg-green-700 hover:bg-green-800 text-white rounded font-medium">
            statements.json
          </a>
          <a href="/api/dump/statements?format=csv" className="inline-flex items-center gap-1 px-3 py-1.5 border border-green-300 text-green-800 hover:bg-green-100 rounded font-medium">
            statements.csv
          </a>
          <a href="/api/dump/politicians" className="inline-flex items-center gap-1 px-3 py-1.5 border border-green-300 text-green-800 hover:bg-green-100 rounded font-medium">
            politicians.json
          </a>
          <a href="/api/dump/categories" className="inline-flex items-center gap-1 px-3 py-1.5 border border-green-300 text-green-800 hover:bg-green-100 rounded font-medium">
            categories.json
          </a>
        </div>
      </div>

      <div className="bg-amber-50 border border-amber-200 rounded-lg p-4 mb-8">
        <h2 className="font-semibold text-amber-800 text-sm">Limites de uso</h2>
        <p className="text-sm text-amber-700 mt-1">
          A API é limitada a 100 requisições por minuto por IP.
          Ao exceder o limite, você receberá uma resposta 429 com o cabeçalho <code className="bg-amber-100 px-1 rounded">Retry-After</code>.
        </p>
      </div>

      <div className="space-y-6">
        {endpoints.map((endpoint) => (
          <section key={endpoint.path} className="border border-zinc-200 rounded-lg overflow-hidden">
            <div className="bg-zinc-50 px-4 py-3 flex items-center gap-3">
              <span className={`px-2 py-0.5 rounded text-xs font-bold ${
                endpoint.method === 'GET' ? 'bg-green-100 text-green-800' : 'bg-blue-100 text-blue-800'
              }`}>
                {endpoint.method}
              </span>
              <code className="text-sm font-mono text-zinc-800">{endpoint.path}</code>
            </div>
            <div className="px-4 py-3">
              <p className="text-sm text-zinc-600 mb-3">{endpoint.description}</p>
              {endpoint.params.length > 0 && (
                <table className="w-full text-sm">
                  <thead>
                    <tr className="text-left text-xs text-zinc-500 uppercase">
                      <th className="pb-1 pr-4">Parâmetro</th>
                      <th className="pb-1 pr-4">Tipo</th>
                      <th className="pb-1 pr-4">Obrigatório</th>
                      <th className="pb-1">Descrição</th>
                    </tr>
                  </thead>
                  <tbody>
                    {endpoint.params.map((param) => (
                      <tr key={param.name} className="border-t border-zinc-100">
                        <td className="py-1.5 pr-4 font-mono text-xs">{param.name}</td>
                        <td className="py-1.5 pr-4 text-zinc-500">{param.type}</td>
                        <td className="py-1.5 pr-4">{param.required ? 'Sim' : 'Não'}</td>
                        <td className="py-1.5 text-zinc-600">{param.description}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>
          </section>
        ))}
      </div>

      <section className="mt-12">
        <h2 className="text-xl font-bold text-zinc-900 mb-4">Exemplos</h2>
        <div className="space-y-4">
          <div>
            <h3 className="text-sm font-semibold text-zinc-700 mb-1">Buscar declarações sobre educação:</h3>
            <code className="block bg-zinc-900 text-green-400 px-4 py-3 rounded-lg text-sm overflow-x-auto">
              curl &quot;https://registrabrasil.com.br/api/search?q=educação&amp;limit=10&quot;
            </code>
          </div>
          <div>
            <h3 className="text-sm font-semibold text-zinc-700 mb-1">Exportar dados de um político em CSV:</h3>
            <code className="block bg-zinc-900 text-green-400 px-4 py-3 rounded-lg text-sm overflow-x-auto">
              curl &quot;https://registrabrasil.com.br/api/export?format=csv&amp;politician=lula&quot; -o dados.csv
            </code>
          </div>
        </div>
      </section>
    </main>
  )
}
