'use client'

import { useState } from 'react'
import { FileBarChart, Download, Loader2 } from 'lucide-react'
import type { ReportType } from '@/lib/utils/report-generator'
import type { DataPoint, TimeSeriesPoint } from '@/lib/utils/chart-data'
import { DateRangeSelector } from './DateRangeSelector'
import { PieChart } from './PieChart'
import { LineChart } from './LineChart'
import { AreaChart } from './AreaChart'
import { ChartContainer } from './ChartContainer'

interface ReportResult {
  title: string
  type: ReportType
  data: DataPoint[]
  timeSeries?: TimeSeriesPoint[]
  generatedAt: string
}

const REPORT_TYPES: { value: ReportType; label: string }[] = [
  { value: 'by_period', label: 'Por periodo' },
  { value: 'by_politician', label: 'Por politico' },
  { value: 'by_category', label: 'Por categoria' },
  { value: 'by_status', label: 'Por status' },
  { value: 'by_source_type', label: 'Por tipo de fonte' },
]

const BUCKET_OPTIONS = [
  { value: 'day', label: 'Diario' },
  { value: 'week', label: 'Semanal' },
  { value: 'month', label: 'Mensal' },
]

export function ReportBuilder() {
  const [reportType, setReportType] = useState<ReportType>('by_period')
  const [bucket, setBucket] = useState<'day' | 'week' | 'month'>('month')
  const [startDate, setStartDate] = useState('')
  const [endDate, setEndDate] = useState('')
  const [loading, setLoading] = useState(false)
  const [result, setResult] = useState<ReportResult | null>(null)

  async function generateReport() {
    setLoading(true)
    try {
      const params = new URLSearchParams()
      params.set('type', reportType)
      if (startDate) params.set('startDate', startDate)
      if (endDate) params.set('endDate', endDate)
      params.set('bucket', bucket)

      const res = await fetch(`/api/admin/reports?${params}`)
      const data = await res.json()
      setResult(data)
    } catch {
      // silently fail
    }
    setLoading(false)
  }

  function exportCSV() {
    if (!result) return
    const params = new URLSearchParams()
    params.set('type', reportType)
    if (startDate) params.set('startDate', startDate)
    if (endDate) params.set('endDate', endDate)
    params.set('bucket', bucket)
    window.open(`/admin/relatorios/exportar?${params}`, '_blank')
  }

  const showTimeSeries = reportType === 'by_period'

  return (
    <div className="space-y-6">
      {/* Controls */}
      <div className="bg-white border border-gray-200 rounded-xl p-5">
        <h3 className="text-sm font-semibold text-gray-700 mb-4 flex items-center gap-2">
          <FileBarChart className="w-4 h-4" />
          Configurar relatorio
        </h3>

        <div className="space-y-4">
          <div className="flex flex-wrap gap-3">
            <select
              value={reportType}
              onChange={(e) => setReportType(e.target.value as ReportType)}
              className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            >
              {REPORT_TYPES.map((rt) => (
                <option key={rt.value} value={rt.value}>{rt.label}</option>
              ))}
            </select>

            {showTimeSeries && (
              <select
                value={bucket}
                onChange={(e) => setBucket(e.target.value as 'day' | 'week' | 'month')}
                className="px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              >
                {BUCKET_OPTIONS.map((b) => (
                  <option key={b.value} value={b.value}>{b.label}</option>
                ))}
              </select>
            )}
          </div>

          <DateRangeSelector
            startDate={startDate}
            endDate={endDate}
            onChangeStart={setStartDate}
            onChangeEnd={setEndDate}
          />

          <div className="flex gap-2">
            <button
              onClick={generateReport}
              disabled={loading}
              className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
            >
              {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <FileBarChart className="w-4 h-4" />}
              {loading ? 'Gerando...' : 'Gerar relatorio'}
            </button>

            {result && (
              <button
                onClick={exportCSV}
                className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-600 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
              >
                <Download className="w-4 h-4" />
                Exportar CSV
              </button>
            )}
          </div>
        </div>
      </div>

      {/* Results */}
      {result && (
        <div>
          {result.timeSeries && result.timeSeries.length > 0 ? (
            <div className="space-y-4">
              <ChartContainer title={result.title} subtitle={`Gerado em ${new Date(result.generatedAt).toLocaleString('pt-BR')}`}>
                <AreaChart data={result.timeSeries} />
              </ChartContainer>
              <ChartContainer title="Linha temporal">
                <LineChart data={result.timeSeries} />
              </ChartContainer>
            </div>
          ) : (
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
              <ChartContainer title={result.title}>
                <PieChart data={result.data.slice(0, 10)} />
              </ChartContainer>

              {/* Bar-like table */}
              <ChartContainer title="Detalhamento">
                <div className="space-y-2">
                  {result.data.slice(0, 15).map((d, i) => {
                    const maxVal = result.data[0]?.value ?? 1
                    const pct = Math.max((d.value / maxVal) * 100, 3)
                    return (
                      <div key={i} className="flex items-center gap-2">
                        <span className="text-xs text-gray-600 w-32 truncate">{d.label}</span>
                        <div className="flex-1 h-4 bg-gray-100 rounded-full overflow-hidden">
                          <div
                            className="h-full bg-blue-500 rounded-full"
                            style={{ width: `${pct}%` }}
                          />
                        </div>
                        <span className="text-xs text-gray-500 tabular-nums w-10 text-right">{d.value}</span>
                      </div>
                    )
                  })}
                </div>
              </ChartContainer>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
