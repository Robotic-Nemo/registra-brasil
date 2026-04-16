#!/usr/bin/env npx tsx
/**
 * scripts/scan-scandals.ts
 * CLI tool to scan for recent Brazilian political scandals and insert them
 * into the database as unverified statements.
 *
 * Usage:
 *   npm run scan
 *   npm run scan -- --dry-run
 *   npm run scan -- --politician lula
 *   npm run scan -- --query "bolsonaro 2026" --query "moro STF"
 *   npm run scan -- --limit 5 --verbose
 */

import * as fs from 'fs'
import * as path from 'path'

// Load .env.local before importing scanner (which uses env vars)
function loadEnv() {
  const envPath = path.resolve(process.cwd(), '.env.local')
  if (!fs.existsSync(envPath)) return

  const lines = fs.readFileSync(envPath, 'utf-8').split('\n')
  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) continue
    const eq = trimmed.indexOf('=')
    if (eq === -1) continue
    const key = trimmed.substring(0, eq).trim()
    const value = trimmed.substring(eq + 1).trim()
    if (!process.env[key]) {
      process.env[key] = value
    }
  }
}

loadEnv()

import { scanForScandals } from '../lib/scanner/index'

// ─── CLI arg parsing ──────────────────────────────────────────────────────────

const args = process.argv.slice(2)

function getFlag(name: string): boolean {
  return args.includes(`--${name}`)
}

function getOption(name: string): string | undefined {
  const idx = args.indexOf(`--${name}`)
  return idx !== -1 ? args[idx + 1] : undefined
}

function getMultiOption(name: string): string[] {
  const results: string[] = []
  for (let i = 0; i < args.length; i++) {
    if (args[i] === `--${name}` && args[i + 1]) {
      results.push(args[i + 1])
    }
  }
  return results
}

const dryRun = getFlag('dry-run')
const verbose = getFlag('verbose') || getFlag('v')
const politicianSlug = getOption('politician')
const customQueries = getMultiOption('query')
const limit = getOption('limit') ? parseInt(getOption('limit')!) : 8

// ─── Main ─────────────────────────────────────────────────────────────────────

async function main() {
  console.log('🔍 Registra Brasil — Scandal Scanner')
  console.log('─'.repeat(40))

  if (dryRun) console.log('⚠️  DRY RUN — no data will be written')
  if (politicianSlug) console.log(`👤 Filtering for politician: ${politicianSlug}`)
  if (customQueries.length) console.log(`🔎 Custom queries: ${customQueries.join(', ')}`)

  const startTime = Date.now()

  try {
    const result = await scanForScandals({
      queries: customQueries.length ? customQueries : undefined,
      politicianSlugFilter: politicianSlug,
      dryRun,
      limit,
      verbose: verbose || true,   // always verbose in CLI
    })

    const elapsed = ((Date.now() - startTime) / 1000).toFixed(1)

    console.log('\n' + '─'.repeat(40))
    console.log(`✅ Scan complete in ${elapsed}s`)
    console.log(`   Inserted : ${result.inserted}`)
    console.log(`   Skipped  : ${result.skipped}`)
    console.log(`   Errors   : ${result.errors}`)

    if (result.statements.length > 0) {
      console.log('\nInserted statements:')
      for (const s of result.statements) {
        console.log(`  [${s.politician_slug}] ${s.slug}`)
        console.log(`    ${s.summary.substring(0, 80)}`)
        console.log(`    ${s.source_url}`)
      }
    }

    process.exit(result.errors > 0 && result.inserted === 0 ? 1 : 0)
  } catch (err) {
    console.error('\n❌ Fatal error:', err)
    process.exit(1)
  }
}

main()
