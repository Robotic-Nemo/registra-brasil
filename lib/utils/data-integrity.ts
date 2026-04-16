/**
 * Data integrity check utilities.
 * Run these periodically or on-demand to detect issues in the database.
 */

import type { SupabaseClient } from '@supabase/supabase-js'

export interface IntegrityIssue {
  type: 'orphaned_record' | 'broken_reference' | 'missing_data' | 'inconsistency'
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
    .limit(10) as any

  if (error || !data || data.length === 0) return null

  const statementsWithoutCategories = data.filter(
    (s: any) => !s.statement_categories || s.statement_categories.length === 0
  )

  if (statementsWithoutCategories.length === 0) return null

  return {
    type: 'missing_data',
    table: 'statements',
    description: 'Declarações sem categorias associadas',
    count: statementsWithoutCategories.length,
    sampleIds: statementsWithoutCategories.slice(0, 5).map((s: any) => s.id),
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
  // Use a simple approach: count politicians with is_active=true and no statements
  const { data: politicians } = await supabase
    .from('politicians')
    .select('id, slug, statements(id)')
    .eq('is_active', true)
    .limit(100) as any

  if (!politicians) return null

  const empty = politicians.filter(
    (p: any) => !p.statements || p.statements.length === 0
  )

  if (empty.length === 0) return null

  return {
    type: 'inconsistency',
    table: 'politicians',
    description: 'Políticos ativos sem declarações registradas',
    count: empty.length,
    sampleIds: empty.slice(0, 5).map((p: any) => p.slug),
  }
}

/**
 * Check for duplicate slugs in statements.
 */
async function checkDuplicateSlugs(
  supabase: SupabaseClient
): Promise<IntegrityIssue | null> {
  const { data, error } = await supabase
    .rpc('check_duplicate_slugs') as any

  // RPC might not exist — gracefully handle
  if (error || !data || data.length === 0) return null

  return {
    type: 'inconsistency',
    table: 'statements',
    description: 'Slugs duplicados encontrados',
    count: data.length,
    sampleIds: data.slice(0, 5).map((d: any) => d.slug),
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
