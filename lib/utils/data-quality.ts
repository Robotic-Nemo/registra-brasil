export type QualityIssueSeverity = 'high' | 'medium' | 'low'
export type QualityIssueType =
  | 'missing_source'
  | 'empty_quote'
  | 'missing_category'
  | 'short_summary'
  | 'stale_unverified'
  | 'missing_slug'
  | 'missing_context'
  | 'future_date'

export interface QualityIssue {
  statementId: string
  summary: string
  politicianName: string
  type: QualityIssueType
  severity: QualityIssueSeverity
  description: string
}

export interface QualityScore {
  total: number
  issues: number
  score: number // 0-100
  byType: Record<QualityIssueType, number>
}

interface StatementForQuality {
  id: string
  summary: string
  full_quote: string | null
  context: string | null
  primary_source_url: string
  slug: string | null
  statement_date: string
  verification_status: string
  created_at: string
  politician_name: string
  category_count: number
}

const ISSUE_LABELS: Record<QualityIssueType, { label: string; severity: QualityIssueSeverity }> = {
  missing_source: { label: 'Fonte primaria ausente ou vazia', severity: 'high' },
  empty_quote: { label: 'Citacao completa ausente', severity: 'medium' },
  missing_category: { label: 'Nenhuma categoria atribuida', severity: 'medium' },
  short_summary: { label: 'Resumo muito curto (menos de 20 caracteres)', severity: 'low' },
  stale_unverified: { label: 'Nao verificada ha mais de 7 dias', severity: 'high' },
  missing_slug: { label: 'Slug ausente', severity: 'low' },
  missing_context: { label: 'Contexto ausente', severity: 'low' },
  future_date: { label: 'Data da declaracao no futuro', severity: 'high' },
}

export function checkDataQuality(statements: StatementForQuality[]): {
  issues: QualityIssue[]
  score: QualityScore
} {
  const issues: QualityIssue[] = []
  const now = new Date()
  const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)

  for (const stmt of statements) {
    // Missing source
    if (!stmt.primary_source_url || stmt.primary_source_url.trim() === '') {
      issues.push(makeIssue(stmt, 'missing_source'))
    }

    // Empty quote
    if (!stmt.full_quote || stmt.full_quote.trim() === '') {
      issues.push(makeIssue(stmt, 'empty_quote'))
    }

    // Missing category
    if (stmt.category_count === 0) {
      issues.push(makeIssue(stmt, 'missing_category'))
    }

    // Short summary
    if (stmt.summary.length < 20) {
      issues.push(makeIssue(stmt, 'short_summary'))
    }

    // Stale unverified
    if (
      stmt.verification_status === 'unverified' &&
      new Date(stmt.created_at) < sevenDaysAgo
    ) {
      issues.push(makeIssue(stmt, 'stale_unverified'))
    }

    // Missing slug
    if (!stmt.slug) {
      issues.push(makeIssue(stmt, 'missing_slug'))
    }

    // Missing context
    if (!stmt.context || stmt.context.trim() === '') {
      issues.push(makeIssue(stmt, 'missing_context'))
    }

    // Future date
    if (new Date(stmt.statement_date) > now) {
      issues.push(makeIssue(stmt, 'future_date'))
    }
  }

  const byType: Record<string, number> = {}
  for (const issue of issues) {
    byType[issue.type] = (byType[issue.type] ?? 0) + 1
  }

  // Score: max possible issues = statements.length * checks (8)
  const maxIssues = statements.length * 8
  const score = maxIssues > 0 ? Math.round(((maxIssues - issues.length) / maxIssues) * 100) : 100

  return {
    issues,
    score: {
      total: statements.length,
      issues: issues.length,
      score,
      byType: byType as Record<QualityIssueType, number>,
    },
  }
}

function makeIssue(
  stmt: StatementForQuality,
  type: QualityIssueType
): QualityIssue {
  const config = ISSUE_LABELS[type]
  return {
    statementId: stmt.id,
    summary: stmt.summary,
    politicianName: stmt.politician_name,
    type,
    severity: config.severity,
    description: config.label,
  }
}

export function getIssueLabel(type: QualityIssueType): string {
  return ISSUE_LABELS[type]?.label ?? type
}
