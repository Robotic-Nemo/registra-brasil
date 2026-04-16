import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { generateReport, reportToCSV, type ReportConfig, type ReportType } from '@/lib/utils/report-generator'

const VALID_TYPES: ReportType[] = ['by_period', 'by_politician', 'by_category', 'by_status', 'by_source_type']

export async function GET(request: NextRequest) {
  const params = request.nextUrl.searchParams
  const type = params.get('type') as ReportType | null
  const startDate = params.get('startDate') ?? undefined
  const endDate = params.get('endDate') ?? undefined
  const bucket = (params.get('bucket') as 'day' | 'week' | 'month') ?? 'month'

  if (!type || !VALID_TYPES.includes(type)) {
    return NextResponse.json({ error: 'Invalid report type' }, { status: 400 })
  }

  const supabase = getSupabaseServiceClient()

  const config: ReportConfig = {
    type,
    startDate,
    endDate,
    bucket,
  }

  try {
    const result = await generateReport(supabase, config)
    const csv = reportToCSV(result)

    return new NextResponse(csv, {
      status: 200,
      headers: {
        'Content-Type': 'text/csv; charset=utf-8',
        'Content-Disposition': `attachment; filename="relatorio-${type}-${new Date().toISOString().slice(0, 10)}.csv"`,
      },
    })
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Erro ao gerar relatorio' },
      { status: 500 }
    )
  }
}
