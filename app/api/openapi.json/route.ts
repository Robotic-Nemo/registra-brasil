import { NextRequest } from 'next/server'

export const runtime = 'edge'
export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * OpenAPI 3.1 spec. Manually written (not generated) because it lets us
 * describe error shapes, rate-limit headers, and editorial invariants
 * (every statement has a primary_source_url) that auto-gen would miss.
 */
const SPEC = {
  openapi: '3.1.0',
  info: {
    title: 'Registra Brasil Public API',
    version: '2.0.0',
    description:
      'Arquivo público de declarações de políticos brasileiros. Todas as respostas são CC BY 4.0: uso livre com atribuição. Rate limits são conservadores e documentados por endpoint.',
    contact: {
      name: 'Registra Brasil',
      url: 'https://registrabrasil.com.br/contato',
    },
    license: {
      name: 'CC BY 4.0',
      url: 'https://creativecommons.org/licenses/by/4.0/',
    },
  },
  servers: [{ url: SITE_URL, description: 'Production' }],
  paths: {
    '/api/v2/statements': {
      get: {
        summary: 'Listar declarações',
        description:
          'Retorna declarações verificadas por padrão. Suporta paginação, filtros e ordenação. Rate limit: 120 req/min por IP.',
        parameters: [
          { name: 'q', in: 'query', schema: { type: 'string' }, description: 'Texto de busca full-text (portuguese)' },
          { name: 'politico', in: 'query', schema: { type: 'string' }, description: 'Slug do político' },
          { name: 'partido', in: 'query', schema: { type: 'string' } },
          { name: 'estado', in: 'query', schema: { type: 'string', pattern: '^[A-Z]{2}$' } },
          { name: 'status', in: 'query', schema: { type: 'string', enum: ['verified', 'unverified', 'disputed'] } },
          { name: 'de', in: 'query', schema: { type: 'string', format: 'date' } },
          { name: 'ate', in: 'query', schema: { type: 'string', format: 'date' } },
          { name: 'page', in: 'query', schema: { type: 'integer', minimum: 1 } },
          { name: 'per_page', in: 'query', schema: { type: 'integer', minimum: 1, maximum: 100 } },
        ],
        responses: {
          '200': {
            description: 'OK',
            content: {
              'application/json': {
                schema: {
                  type: 'object',
                  properties: {
                    data: { type: 'array', items: { $ref: '#/components/schemas/Statement' } },
                    meta: { $ref: '#/components/schemas/PaginationMeta' },
                  },
                },
              },
            },
          },
          '429': { $ref: '#/components/responses/RateLimited' },
        },
      },
    },
    '/api/v2/politicians': {
      get: {
        summary: 'Listar políticos ativos',
        parameters: [
          { name: 'partido', in: 'query', schema: { type: 'string' } },
          { name: 'estado', in: 'query', schema: { type: 'string', pattern: '^[A-Z]{2}$' } },
          { name: 'q', in: 'query', schema: { type: 'string' } },
        ],
        responses: {
          '200': {
            description: 'OK',
            content: {
              'application/json': {
                schema: {
                  type: 'object',
                  properties: {
                    data: { type: 'array', items: { $ref: '#/components/schemas/Politician' } },
                  },
                },
              },
            },
          },
        },
      },
    },
    '/api/v2/categories': {
      get: {
        summary: 'Listar categorias',
        responses: { '200': { description: 'OK' } },
      },
    },
    '/api/v2/statistics': {
      get: {
        summary: 'Estatísticas agregadas',
        description: 'Retorna totais por status, contagens por partido, evolução temporal.',
        responses: { '200': { description: 'OK' } },
      },
    },
    '/api/search': {
      get: {
        summary: 'Busca unificada (texto + filtros)',
        parameters: [
          { name: 'q', in: 'query', required: true, schema: { type: 'string' } },
        ],
        responses: { '200': { description: 'OK' } },
      },
    },
    '/api/dump/statements': {
      get: {
        summary: 'Dump completo do acervo (JSON ou CSV)',
        description:
          'Retorna **todas** as declarações não-removidas (~12.5 mil linhas). Cache público de 1h + 24h browser. Responde 304 com ETag estável (conta × último updated_at).',
        parameters: [
          { name: 'format', in: 'query', schema: { type: 'string', enum: ['json', 'csv'] }, description: 'Padrão json' },
        ],
        responses: {
          '200': { description: 'Full catalog dump' },
          '304': { description: 'Not modified (ETag match)' },
        },
      },
    },
    '/api/dump/politicians': {
      get: { summary: 'Dump completo de políticos ativos', responses: { '200': { description: 'OK' } } },
    },
    '/api/dump/categories': {
      get: { summary: 'Dump completo de categorias', responses: { '200': { description: 'OK' } } },
    },
    '/api/submissions': {
      post: {
        summary: 'Enviar declaração para revisão editorial',
        description:
          'Público. Rate limit: 5/10min + 20/hora por IP. SSRF-bloqueado para hosts privados. Honeypot anti-bot silencioso.',
        requestBody: {
          required: true,
          content: {
            'application/json': {
              schema: {
                type: 'object',
                required: ['summary', 'primary_source_url'],
                properties: {
                  politician_slug: { type: 'string' },
                  politician_name_raw: { type: 'string' },
                  summary: { type: 'string', minLength: 10, maxLength: 1000 },
                  full_quote: { type: 'string', maxLength: 5000 },
                  statement_date: { type: 'string', format: 'date' },
                  venue: { type: 'string', maxLength: 300 },
                  primary_source_url: { type: 'string', format: 'uri' },
                  context: { type: 'string', maxLength: 2000 },
                  submitter_email: { type: 'string', format: 'email' },
                  submitter_name: { type: 'string', maxLength: 200 },
                  submitter_notes: { type: 'string', maxLength: 2000 },
                },
              },
            },
          },
        },
        responses: {
          '200': { description: 'Aceito para revisão' },
          '400': { description: 'Validação falhou' },
          '429': { $ref: '#/components/responses/RateLimited' },
        },
      },
    },
    '/api/alerts/subscribe': {
      post: {
        summary: 'Assinar alerta de busca por e-mail',
        description: 'Dupla confirmação (LGPD art. 8). Rate limit: 5/10min.',
        requestBody: {
          required: true,
          content: {
            'application/json': {
              schema: {
                type: 'object',
                required: ['email', 'query'],
                properties: {
                  email: { type: 'string', format: 'email' },
                  label: { type: 'string', maxLength: 200 },
                  query: {
                    type: 'object',
                    properties: {
                      q: { type: 'string' },
                      politico: { type: 'string' },
                      partido: { type: 'string' },
                      estado: { type: 'string' },
                      status: { type: 'string' },
                      de: { type: 'string', format: 'date' },
                      ate: { type: 'string', format: 'date' },
                      categoria: { type: 'array', items: { type: 'string' } },
                    },
                  },
                },
              },
            },
          },
        },
        responses: { '200': { description: 'Confirmação enviada por e-mail' } },
      },
    },
    '/feed.xml': {
      get: { summary: 'RSS geral (30 declarações mais recentes)', responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/politico/{slug}/feed.xml': {
      get: { summary: 'RSS de um político', parameters: [{ name: 'slug', in: 'path', required: true, schema: { type: 'string' } }], responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/categorias/{slug}/feed.xml': {
      get: { summary: 'RSS de uma categoria', parameters: [{ name: 'slug', in: 'path', required: true, schema: { type: 'string' } }], responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/estados/{uf}/feed.xml': {
      get: { summary: 'RSS de um estado', parameters: [{ name: 'uf', in: 'path', required: true, schema: { type: 'string', pattern: '^[A-Z]{2}$' } }], responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/partidos/{slug}/feed.xml': {
      get: { summary: 'RSS de um partido', parameters: [{ name: 'slug', in: 'path', required: true, schema: { type: 'string' } }], responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/colecao/{slug}/feed.xml': {
      get: { summary: 'RSS de uma coleção editorial', parameters: [{ name: 'slug', in: 'path', required: true, schema: { type: 'string' } }], responses: { '200': { description: 'RSS 2.0' } } },
    },
    '/atualizacoes/feed.xml': {
      get: { summary: 'RSS do log público de correções', responses: { '200': { description: 'RSS 2.0' } } },
    },
  },
  components: {
    schemas: {
      Statement: {
        type: 'object',
        required: ['id', 'summary', 'statement_date', 'verification_status', 'primary_source_url'],
        properties: {
          id: { type: 'string', format: 'uuid' },
          slug: { type: 'string', nullable: true },
          summary: { type: 'string' },
          full_quote: { type: 'string', nullable: true },
          context: { type: 'string', nullable: true },
          statement_date: { type: 'string', format: 'date' },
          verification_status: { type: 'string', enum: ['verified', 'unverified', 'disputed'] },
          primary_source_url: { type: 'string', format: 'uri' },
          primary_source_type: { type: 'string' },
          severity_score: { type: 'integer', nullable: true, minimum: 1, maximum: 5 },
          minors_involved: { type: 'boolean' },
          politician: { $ref: '#/components/schemas/Politician' },
          categories: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                slug: { type: 'string' },
                label: { type: 'string' },
                is_primary: { type: 'boolean' },
              },
            },
          },
        },
      },
      Politician: {
        type: 'object',
        required: ['id', 'slug', 'common_name', 'party'],
        properties: {
          id: { type: 'string', format: 'uuid' },
          slug: { type: 'string' },
          common_name: { type: 'string' },
          full_name: { type: 'string' },
          party: { type: 'string' },
          state: { type: 'string', nullable: true },
          role: { type: 'string', nullable: true },
          photo_url: { type: 'string', nullable: true, format: 'uri' },
        },
      },
      PaginationMeta: {
        type: 'object',
        properties: {
          total: { type: 'integer' },
          page: { type: 'integer' },
          per_page: { type: 'integer' },
          total_pages: { type: 'integer' },
        },
      },
      ErrorResponse: {
        type: 'object',
        properties: {
          error: {
            type: 'object',
            properties: {
              code: { type: 'string' },
              message: { type: 'string' },
            },
          },
        },
      },
    },
    responses: {
      RateLimited: {
        description: 'Rate limit exceeded',
        headers: {
          'Retry-After': { schema: { type: 'integer' }, description: 'Seconds until window resets' },
        },
        content: {
          'application/json': { schema: { $ref: '#/components/schemas/ErrorResponse' } },
        },
      },
    },
  },
} as const

export async function GET(_req: NextRequest) {
  return new Response(JSON.stringify(SPEC, null, 2), {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Content-Disposition': 'inline; filename="registra-brasil-openapi.json"',
      'Cache-Control': 'public, s-maxage=86400, stale-while-revalidate=86400',
    },
  })
}
