/**
 * lib/scanner/index.ts
 * Core scandal scanner: Claude web search → extraction → Supabase insert
 *
 * Uses Anthropic's built-in web_search tool — no external API keys needed.
 * Optionally falls back to Google CSE if GOOGLE_CSE_API_KEY is set.
 */

import Anthropic from '@anthropic-ai/sdk'
import { createClient } from '@supabase/supabase-js'
import { slugify } from '@/lib/utils/slugify'

// ─── Types ──────────────────────────────────────────────────────────────────

export interface ScanOptions {
  queries?: string[]
  politicianSlugFilter?: string
  dryRun?: boolean
  limit?: number        // max statements to extract per query batch
  verbose?: boolean
}

export interface ScanResult {
  inserted: number
  skipped: number
  errors: number
  statements: InsertedStatement[]
}

interface InsertedStatement {
  slug: string
  politician_slug: string
  summary: string
  source_url: string
  dry_run: boolean
}

export interface ExtractedStatement {
  politician_slug: string
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string          // YYYY-MM-DD
  statement_date_approx: boolean
  primary_source_url: string
  primary_source_type: 'news_article' | 'social_media_post' | 'other'
  venue: string | null
  event_name: string | null
  slug: string
  category_slug: string
}

// ─── Constants ───────────────────────────────────────────────────────────────

const DEFAULT_QUERIES = [
  'declarações polêmicas de políticos brasileiros em 2025',
  'escândalos no congresso nacional brasileiro 2025',
  'Lula controversia declaracao recente 2025',
  'Bolsonaro declaracao escandalo 2025',
  'ministros brasileiros controversia 2025',
  'senadores deputados federais polêmica Brasil 2025 2026',
  'investigacao corrupcao politica brasil 2025',
  'Alexandre de Moraes STF declaracao 2025',
  'eleicoes brasil 2026 candidatos controversia',
  'politicos brasil fake news desinformação 2025',
]

const CATEGORY_SLUGS = [
  'corrupcao', 'economia', 'seguranca-publica', 'saude', 'educacao',
  'meio-ambiente', 'democracia', 'direitos-humanos', 'politica-externa',
  'militares', 'midia', 'religiao', 'fake-news', 'violencia-politica',
  'previdencia', 'impostos', 'privatizacao', 'reforma-politica',
]

const TODAY = new Date().toISOString().substring(0, 10)

// ─── Helpers ─────────────────────────────────────────────────────────────────

function makeSlug(text: string, date: string): string {
  const year = date.substring(0, 4)
  const base = slugify(text).substring(0, 60).replace(/-$/, '')
  return `${base}-${year}`
}

function getSupabaseClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) throw new Error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY')
  return createClient(url, key)
}

// ─── DB helpers ──────────────────────────────────────────────────────────────

interface PoliticianRef {
  slug: string
  full_name: string
  common_name: string
  party: string
}

async function loadPoliticians(slugFilter?: string): Promise<PoliticianRef[]> {
  const supabase = getSupabaseClient()
  let q = supabase.from('politicians').select('slug, full_name, common_name, party').eq('is_active', true)
  if (slugFilter) q = q.eq('slug', slugFilter)
  const { data, error } = await q
  if (error) throw new Error(`Failed to load politicians: ${error.message}`)
  return (data ?? []) as PoliticianRef[]
}

async function loadExistingUrls(): Promise<Set<string>> {
  const supabase = getSupabaseClient()
  const { data, error } = await supabase
    .from('statements')
    .select('primary_source_url')
    .order('created_at', { ascending: false })
    .limit(5000)
  if (error) throw new Error(`Failed to load existing URLs: ${error.message}`)
  return new Set((data ?? []).map((r: { primary_source_url: string }) => r.primary_source_url))
}

async function loadExistingSlugs(): Promise<Set<string>> {
  const supabase = getSupabaseClient()
  const { data, error } = await supabase.from('statements').select('slug').not('slug', 'is', null)
  if (error) throw new Error(`Failed to load existing slugs: ${error.message}`)
  return new Set((data ?? []).map((r: { slug: string | null }) => r.slug!))
}

// ─── Claude web search + extraction ──────────────────────────────────────────

async function searchAndExtract(
  query: string,
  politicians: PoliticianRef[],
  existingUrls: Set<string>,
  maxResults: number,
): Promise<ExtractedStatement[]> {
  const client = new Anthropic()

  const politicianList = politicians
    .map((p) => `  - slug="${p.slug}" nome="${p.common_name}" (${p.full_name}, ${p.party})`)
    .join('\n')

  const existingUrlsSample = [...existingUrls].slice(0, 20).join('\n')

  const systemPrompt = `Você é um fact-checker político brasileiro especializado em rastrear declarações e controvérsias de políticos.

Sua tarefa: buscar notícias recentes sobre o tema dado e extrair declarações controversas ou notáveis de políticos brasileiros conhecidos.

Políticos conhecidos no banco de dados (use APENAS estes slugs):
${politicianList}

URLs já cadastradas (NÃO reutilize estas):
${existingUrlsSample}

Data de hoje: ${TODAY}

REGRAS:
- Busque notícias dos últimos 30 dias preferencialmente
- Só extraia declarações de políticos da lista acima
- Cada declaração deve ter uma URL fonte real e verificável
- Não invente citações — use apenas o que está nas notícias
- Se não encontrar notícias relevantes recentes, retorne array vazio []
- Retorne no máximo ${maxResults} declarações

Retorne APENAS JSON válido, sem markdown, sem explicações.`

  const userPrompt = `Busque notícias sobre: "${query}"

Encontre declarações controversas, polêmicas ou significativas de políticos brasileiros.
Para cada declaração encontrada, retorne um objeto JSON com estes campos:
{
  "politician_slug": string (da lista acima),
  "summary": string (1 frase em português descrevendo o que o político disse/fez),
  "full_quote": string | null (citação exata se disponível),
  "context": string | null (2-3 frases de contexto),
  "statement_date": string (YYYY-MM-DD, use data aproximada se necessário),
  "statement_date_approx": boolean,
  "primary_source_url": string (URL real da fonte),
  "primary_source_type": "news_article" | "social_media_post" | "other",
  "venue": string | null,
  "event_name": string | null,
  "slug": string (slug único em português, máx 70 chars, formato: palavras-chave-YYYY),
  "category_slug": string (um de: ${CATEGORY_SLUGS.join(', ')})
}

Retorne um array JSON com as declarações encontradas.`

  // Use beta messages with web_search tool
  const response = await client.beta.messages.create({
    model: 'claude-opus-4-6',
    max_tokens: 8000,
    betas: ['web-search-2025-03-05'],
    tools: [
      {
        type: 'web_search_20250305',
        name: 'web_search',
        max_uses: 5,
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      } as any,
    ],
    system: systemPrompt,
    messages: [{ role: 'user', content: userPrompt }],
  })

  // Find the final text block (after tool use)
  const textBlocks = response.content.filter((b) => b.type === 'text')
  const lastText = textBlocks[textBlocks.length - 1]
  if (!lastText || lastText.type !== 'text') return []

  try {
    const raw = lastText.text.replace(/^```(?:json)?\n?/m, '').replace(/\n?```$/m, '').trim()
    // Find JSON array in the response
    const match = raw.match(/\[[\s\S]*\]/)
    if (!match) {
      console.error('[scanner] No JSON array found in Claude response')
      console.error('[scanner] Raw (first 400 chars):', raw.substring(0, 400))
      return []
    }
    const extracted = JSON.parse(match[0]) as ExtractedStatement[]

    const validSlugs = new Set(politicians.map((p) => p.slug))
    const validSourceTypes = new Set(['news_article', 'social_media_post', 'other'])
    const validCategorySlugs = new Set(CATEGORY_SLUGS)

    return extracted.filter((s) => {
      if (!validSlugs.has(s.politician_slug)) return false
      if (!s.summary || typeof s.summary !== 'string' || s.summary.trim().length < 10) return false
      if (!s.primary_source_url || typeof s.primary_source_url !== 'string') return false
      try {
        const u = new URL(s.primary_source_url)
        if (!['http:', 'https:'].includes(u.protocol)) return false
      } catch { return false }
      if (!validSourceTypes.has(s.primary_source_type)) return false
      if (existingUrls.has(s.primary_source_url)) return false
      if (!/^\d{4}-\d{2}-\d{2}$/.test(s.statement_date)) return false
      if (!s.category_slug || typeof s.category_slug !== 'string' || !validCategorySlugs.has(s.category_slug.trim())) return false
      if (!s.slug || typeof s.slug !== 'string') return false
      return true
    })
  } catch (err) {
    console.error('[scanner] JSON parse error:', err)
    console.error('[scanner] Raw (first 300 chars):', lastText.text.substring(0, 300))
    return []
  }
}

// ─── Insert statement ─────────────────────────────────────────────────────────

async function insertStatement(
  stmt: ExtractedStatement,
  existingSlugs: Set<string>,
  dryRun: boolean,
): Promise<{ success: boolean; slug: string; reason?: string }> {
  let slug = makeSlug(stmt.slug, stmt.statement_date)
  let attempt = 0
  while (existingSlugs.has(slug)) {
    attempt++
    slug = makeSlug(stmt.slug, stmt.statement_date) + `-${attempt}`
  }

  if (dryRun) {
    existingSlugs.add(slug)
    return { success: true, slug }
  }

  const supabase = getSupabaseClient()

  const { data: politician, error: polError } = await supabase
    .from('politicians')
    .select('id')
    .eq('slug', stmt.politician_slug)
    .single()

  if (polError || !politician) {
    return { success: false, slug, reason: `Politician not found: ${stmt.politician_slug}` }
  }

  const { data: category } = await supabase
    .from('categories')
    .select('id')
    .eq('slug', stmt.category_slug)
    .maybeSingle()

  const { error: insertError } = await supabase.from('statements').insert({
    politician_id: (politician as { id: string }).id,
    summary: stmt.summary,
    full_quote: stmt.full_quote,
    context: stmt.context,
    verification_status: 'unverified',
    is_featured: false,
    statement_date: stmt.statement_date,
    statement_date_approx: stmt.statement_date_approx,
    primary_source_url: stmt.primary_source_url,
    primary_source_type: stmt.primary_source_type,
    venue: stmt.venue,
    event_name: stmt.event_name,
    slug,
    ...(category ? { category_id: (category as { id: string }).id } : {}),
  })

  if (insertError) {
    // Handle slug unique constraint violation by appending timestamp suffix and retrying once
    if (insertError.code === '23505' && insertError.message.includes('slug')) {
      const retrySlug = `${slug}-${Date.now()}`
      const { error: retryError } = await supabase.from('statements').insert({
        politician_id: (politician as { id: string }).id,
        summary: stmt.summary,
        full_quote: stmt.full_quote,
        context: stmt.context,
        verification_status: 'unverified',
        is_featured: false,
        statement_date: stmt.statement_date,
        statement_date_approx: stmt.statement_date_approx,
        primary_source_url: stmt.primary_source_url,
        primary_source_type: stmt.primary_source_type,
        venue: stmt.venue,
        event_name: stmt.event_name,
        slug: retrySlug,
        ...(category ? { category_id: (category as { id: string }).id } : {}),
      })
      if (retryError) return { success: false, slug: retrySlug, reason: retryError.message }
      existingSlugs.add(retrySlug)
      return { success: true, slug: retrySlug }
    }
    return { success: false, slug, reason: insertError.message }
  }

  existingSlugs.add(slug)
  return { success: true, slug }
}

// ─── Main export ──────────────────────────────────────────────────────────────

export async function scanForScandals(options: ScanOptions = {}): Promise<ScanResult> {
  const {
    queries = DEFAULT_QUERIES,
    politicianSlugFilter,
    dryRun = false,
    limit = 5,
    verbose = false,
  } = options

  const log = verbose ? console.log : () => {}

  log(`[scanner] Starting scan (dry_run=${dryRun}, queries=${queries.length})`)

  const [politicians, existingUrls, existingSlugs] = await Promise.all([
    loadPoliticians(politicianSlugFilter),
    loadExistingUrls(),
    loadExistingSlugs(),
  ])

  log(`[scanner] Loaded ${politicians.length} politicians, ${existingUrls.size} existing URLs`)

  const result: ScanResult = { inserted: 0, skipped: 0, errors: 0, statements: [] }

  for (const query of queries) {
    log(`[scanner] Searching: "${query}"`)

    let extracted: ExtractedStatement[]
    try {
      extracted = await searchAndExtract(query, politicians, existingUrls, limit)
    } catch (err) {
      console.error(`[scanner] Failed for "${query}":`, err)
      result.errors++
      continue
    }

    log(`[scanner] Extracted ${extracted.length} statements`)

    for (const stmt of extracted) {
      existingUrls.add(stmt.primary_source_url)

      try {
        const { success, slug, reason } = await insertStatement(stmt, existingSlugs, dryRun)

        if (success) {
          result.inserted++
          result.statements.push({
            slug,
            politician_slug: stmt.politician_slug,
            summary: stmt.summary,
            source_url: stmt.primary_source_url,
            dry_run: dryRun,
          })
          log(`[scanner] ✓ ${slug}`)
        } else {
          result.skipped++
          log(`[scanner] ✗ Skipped: ${reason}`)
        }
      } catch (stmtErr) {
        result.errors++
        console.error(
          `[scanner] Error processing statement for politician "${stmt.politician_slug}":`,
          stmtErr,
        )
      }
    }

    // Brief pause between queries to avoid rate limits
    if (queries.indexOf(query) < queries.length - 1) {
      await new Promise((r) => setTimeout(r, 1000))
    }
  }

  log(`[scanner] Done: inserted=${result.inserted} skipped=${result.skipped} errors=${result.errors}`)
  return result
}
