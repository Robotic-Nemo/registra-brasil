import type { SupabaseClient } from '@supabase/supabase-js'
import { groupAndCount, aggregateTimeSeries, type DataPoint, type TimeSeriesPoint } from './chart-data'

export type ReportType = 'by_period' | 'by_politician' | 'by_category' | 'by_status' | 'by_source_type'

export interface ReportConfig {
  type: ReportType
  startDate?: string
  endDate?: string
  bucket?: 'day' | 'week' | 'month'
}

export interface ReportResult {
  title: string
  type: ReportType
  data: DataPoint[]
  timeSeries?: TimeSeriesPoint[]
  generatedAt: string
}

export async function generateReport(
  supabase: SupabaseClient,
  config: ReportConfig
): Promise<ReportResult> {
  let query = supabase
    .from('statements')
    .select('id, summary, statement_date, verification_status, primary_source_type, politician_id, politicians(common_name), statement_categories(categories(label_pt))')
    .neq('verification_status', 'removed')

  if (config.startDate) {
    query = query.gte('statement_date', config.startDate)
  }
  if (config.endDate) {
    query = query.lte('statement_date', config.endDate)
  }

  const { data: rawStatements } = await query

  type RawRow = {
    id: string
    summary: string
    statement_date: string
    verification_status: string
    primary_source_type: string
    politician_id: string
    politicians: { common_name: string }
    statement_categories: { categories: { label_pt: string } }[]
  }

  const statements = (rawStatements ?? []) as unknown as RawRow[]

  switch (config.type) {
    case 'by_period': {
      const timeSeries = aggregateTimeSeries(
        statements,
        (s) => s.statement_date,
        config.bucket ?? 'month'
      )
      return {
        title: 'Declaracoes por periodo',
        type: 'by_period',
        data: timeSeries.map((t) => ({ label: t.date, value: t.value })),
        timeSeries,
        generatedAt: new Date().toISOString(),
      }
    }

    case 'by_politician': {
      const data = groupAndCount(
        statements,
        (s) => s.politicians?.common_name ?? 'Desconhecido'
      )
      return {
        title: 'Declaracoes por politico',
        type: 'by_politician',
        data,
        generatedAt: new Date().toISOString(),
      }
    }

    case 'by_category': {
      const flat = statements.flatMap((s) =>
        (s.statement_categories ?? []).map((sc) => sc.categories?.label_pt ?? 'Sem categoria')
      )
      const counts = new Map<string, number>()
      for (const label of flat) {
        counts.set(label, (counts.get(label) ?? 0) + 1)
      }
      const data = Array.from(counts.entries())
        .sort((a, b) => b[1] - a[1])
        .map(([label, value]) => ({ label, value }))
      return {
        title: 'Declaracoes por categoria',
        type: 'by_category',
        data,
        generatedAt: new Date().toISOString(),
      }
    }

    case 'by_status': {
      const data = groupAndCount(statements, (s) => s.verification_status)
      return {
        title: 'Declaracoes por status',
        type: 'by_status',
        data,
        generatedAt: new Date().toISOString(),
      }
    }

    case 'by_source_type': {
      const data = groupAndCount(statements, (s) => s.primary_source_type)
      return {
        title: 'Declaracoes por tipo de fonte',
        type: 'by_source_type',
        data,
        generatedAt: new Date().toISOString(),
      }
    }

    default: {
      return {
        title: 'Relatorio',
        type: config.type,
        data: [],
        generatedAt: new Date().toISOString(),
      }
    }
  }
}

/**
 * Convert report data to CSV string.
 */
export function reportToCSV(result: ReportResult): string {
  const lines: string[] = []
  lines.push(`# ${result.title}`)
  lines.push(`# Gerado em: ${new Date(result.generatedAt).toLocaleString('pt-BR')}`)
  lines.push('')

  if (result.timeSeries && result.timeSeries.length > 0) {
    lines.push('Data,Quantidade')
    for (const point of result.timeSeries) {
      lines.push(`${point.date},${point.value}`)
    }
  } else {
    lines.push('Item,Quantidade')
    for (const point of result.data) {
      lines.push(`"${point.label.replace(/"/g, '""')}",${point.value}`)
    }
  }

  return lines.join('\n')
}
