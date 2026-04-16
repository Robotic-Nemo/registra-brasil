/**
 * Data integrity check utilities.
 * Run these periodically or on-demand to detect issues in the database.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export type IntegrityIssueType =
  | 'orphaned_record'
  | 'broken_reference'
  | 'missing_data'
  | 'inconsistency'

export interface IntegrityIssue {
  type: IntegrityIssueType
  table: string
  description: string
  count: number
  sampleIds?: string[]
}

export interface IntegrityReport {
  checkedAt: string
  issues: IntegrityIssue[]
  totalIssues: number
  ok: boolean
}

const SAMPLE_ID_LIMIT = 5
const STATEMENTS_QUERY_LIMIT = 10
const POLITICIANS_QUERY_LIMIT = 100

interface StatementWithCategories {
  id: string
  statement_categories: Array<{ id: string }> | null
}

interface PoliticianWithStatements {
  id: string
  slug: string
  statements: Array<{ id: string }> | null
}

interface DuplicateSlugRow {
  slug: string
}

/**
 * Check for statements without any categories assigned.
 */
async function checkStatementsWithoutCategories(
  supabase: SupabaseClient
): Promise<IntegrityIssue | null> {
  const { data, error } = await supabase
    .from('statements')
    .select('id, statement_categories(id)')
    .is('statement_categories', null)
    .limit(STATEMENTS_QUERY_LIMIT)

  if (error || !data || data.length === 0) return null

  const rows = data as unknown as StatementWithCategories[]
  const statementsWithoutCategories = rows.filter(
    (s) => !s.statement_categories || s.statement_categories.length === 0
  )

  if (statementsWithoutCategories.length === 0) return null

  return {
    type: 'missing_data',
    table: 'statements',
    description: 'Declarações sem categorias associadas',
    count: statementsWithoutCategories.length,
    sampleIds: statementsWithoutCategories.slice(0, SAMPLE_ID_LIMIT).map((s) => s.id),
  }
}

/**
 * Check for statements with missing required fields.
 */
async function checkStatementsMissingFields(
  supabase: SupabaseClient
): Promise<IntegrityIssue | null> {
  const { count, error } = await supabase
    .from('statements')
    .select('id', { count: 'exact', head: true })
    .or('summary.is.null,statement_date.is.null,primary_source_url.is.null')

  if (error || !count || count === 0) return null

  return {
    type: 'missing_data',
    table: 'statements',
    description: 'Declarações com campos obrigatórios vazios (summary, date, ou source URL)',
    count,
  }
}

/**
 * Check for politicians without any statements.
 */
async function checkPoliticiansWithoutStatements(
  supabase: SupabaseClient
): Promise<IntegrityIssue | null> {
  const { data: politicians } = await supabase
    .from('politicians')
    .select('id, slug, statements(id)')
    .eq('is_active', true)
    .limit(POLITICIANS_QUERY_LIMIT)

  if (!politicians) return null

  const rows = politicians as unknown as PoliticianWithStatements[]
  const empty = rows.filter((p) => !p.statements || p.statements.length === 0)

  if (empty.length === 0) return null

  return {
    type: 'inconsistency',
    table: 'politicians',
    description: 'Políticos ativos sem declarações registradas',
    count: empty.length,
    sampleIds: empty.slice(0, SAMPLE_ID_LIMIT).map((p) => p.slug),
  }
}

/**
 * Check for duplicate slugs in statements.
 */
async function checkDuplicateSlugs(
  supabase: SupabaseClient
): Promise<IntegrityIssue | null> {
  const { data, error } = await supabase.rpc('check_duplicate_slugs')

  // RPC might not exist — gracefully handle
  if (error || !data) return null

  const rows = data as unknown as DuplicateSlugRow[]
  if (rows.length === 0) return null

  return {
    type: 'inconsistency',
    table: 'statements',
    description: 'Slugs duplicados encontrados',
    count: rows.length,
    sampleIds: rows.slice(0, SAMPLE_ID_LIMIT).map((d) => d.slug),
  }
}

/**
 * Run all integrity checks and return a report.
 */
export async function runIntegrityChecks(
  supabase: SupabaseClient
): Promise<IntegrityReport> {
  const checks = await Promise.allSettled([
    checkStatementsWithoutCategories(supabase),
    checkStatementsMissingFields(supabase),
    checkPoliticiansWithoutStatements(supabase),
    checkDuplicateSlugs(supabase),
  ])

  const issues: IntegrityIssue[] = []
  for (const result of checks) {
    if (result.status === 'fulfilled' && result.value) {
      issues.push(result.value)
    }
  }

  return {
    checkedAt: new Date().toISOString(),
    issues,
    totalIssues: issues.reduce((sum, i) => sum + i.count, 0),
    ok: issues.length === 0,
  }
}
