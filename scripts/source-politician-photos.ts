/**
 * Backfill politician photos from the Portuguese Wikipedia.
 *
 * For each politician without photo_url, queries the MediaWiki API for a
 * page matching their full name, pulls the infobox thumbnail via the
 * pageimages prop, and updates the row with:
 *   - photo_url          → 400px thumbnail (stable Wikimedia URL)
 *   - photo_source_url   → canonical article URL (attribution target)
 *   - photo_license      → 'wikimedia' (covers CC-BY-SA / PD / government)
 *
 * Wikimedia terms allow hotlinking for editorial use with attribution.
 * Each image served includes the article URL in its immediate context
 * (politician profile page renders "Foto: Wikipedia").
 *
 * Run: `npx tsx scripts/source-politician-photos.ts [--dry-run]`
 *
 * Requires SUPABASE_SERVICE_ROLE_KEY in .env.local.
 */

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

// Minimal .env.local loader (no dotenv dependency).
try {
  const raw = readFileSync(resolve(process.cwd(), '.env.local'), 'utf8')
  for (const line of raw.split('\n')) {
    const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*?)\s*$/)
    if (m && !process.env[m[1]]) {
      process.env[m[1]] = m[2].replace(/^['"]|['"]$/g, '')
    }
  }
} catch {
  // .env.local missing: fall through to existing process.env
}

const DRY_RUN = process.argv.includes('--dry-run')
const USER_AGENT = 'RegistraBrasilBot/1.0 (https://registrabrasil.com.br; contato via GitHub Issues)'
const THUMB_SIZE = 400
const REQUEST_DELAY_MS = 500 // respectful pacing, Wikimedia asks for <200 req/s but we go slow

interface PoliticianRow {
  id: string
  slug: string
  full_name: string
  common_name: string
  photo_url: string | null
}

interface WikiResult {
  thumbnail: string
  articleUrl: string
  title: string
}

async function queryWikipedia(query: string): Promise<WikiResult | null> {
  const params = new URLSearchParams({
    action: 'query',
    format: 'json',
    prop: 'pageimages|info',
    inprop: 'url',
    pithumbsize: String(THUMB_SIZE),
    generator: 'search',
    gsrsearch: query,
    gsrlimit: '1',
    gsrnamespace: '0',
    redirects: '1',
    origin: '*',
  })

  const url = `https://pt.wikipedia.org/w/api.php?${params}`
  const res = await fetch(url, {
    headers: { 'User-Agent': USER_AGENT, Accept: 'application/json' },
    signal: AbortSignal.timeout(8000),
  })
  if (!res.ok) return null
  const json = (await res.json()) as {
    query?: { pages?: Record<string, { title: string; fullurl?: string; thumbnail?: { source: string } }> }
  }
  const pages = json.query?.pages
  if (!pages) return null
  const first = Object.values(pages)[0]
  if (!first?.thumbnail?.source || !first?.fullurl) return null

  // Skip obviously wrong hits: pages with no Político/Politician match and no
  // matching last name surface random disambiguations. Require at least one
  // query token to appear in the title (case-insensitive).
  const tokens = query
    .toLowerCase()
    .split(/\s+/)
    .filter((t) => t.length > 2)
  const titleLower = first.title.toLowerCase()
  const tokenHit = tokens.some((t) => titleLower.includes(t))
  if (!tokenHit) return null

  return { thumbnail: first.thumbnail.source, articleUrl: first.fullurl, title: first.title }
}

async function main() {
  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!supabaseUrl || !serviceKey) {
    console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY')
    process.exit(1)
  }
  const supabase = createClient(supabaseUrl, serviceKey, { auth: { persistSession: false } })

  const { data: politicians, error } = await supabase
    .from('politicians')
    .select('id, slug, full_name, common_name, photo_url')
    .is('photo_url', null)
    .order('common_name')

  if (error) {
    console.error('Supabase error:', error)
    process.exit(1)
  }

  const rows = (politicians ?? []) as PoliticianRow[]
  console.log(`Backfilling ${rows.length} politicians. Dry run: ${DRY_RUN}`)

  let found = 0
  let missed = 0
  let errored = 0

  for (const p of rows) {
    const queries = [
      `${p.full_name} político`,
      p.full_name,
      `${p.common_name} político brasileiro`,
    ]

    let hit: WikiResult | null = null
    for (const q of queries) {
      try {
        hit = await queryWikipedia(q)
      } catch (err) {
        errored++
        console.error(`  [${p.slug}] query error:`, err instanceof Error ? err.message : err)
      }
      if (hit) break
      await new Promise((r) => setTimeout(r, REQUEST_DELAY_MS))
    }

    if (!hit) {
      missed++
      console.log(`  [MISS] ${p.common_name}`)
      await new Promise((r) => setTimeout(r, REQUEST_DELAY_MS))
      continue
    }

    found++
    console.log(`  [HIT]  ${p.common_name} → ${hit.title}`)

    if (!DRY_RUN) {
      const { error: updErr } = await (supabase.from('politicians') as any)
        .update({
          photo_url: hit.thumbnail,
          photo_source_url: hit.articleUrl,
          photo_license: 'wikimedia',
          updated_at: new Date().toISOString(),
        })
        .eq('id', p.id)
      if (updErr) {
        errored++
        console.error(`  [${p.slug}] update error:`, updErr.message)
      }
    }

    await new Promise((r) => setTimeout(r, REQUEST_DELAY_MS))
  }

  console.log(`\nDone. hits=${found} misses=${missed} errors=${errored}`)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})
