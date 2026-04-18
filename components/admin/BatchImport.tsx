'use client'

import { useState, useCallback } from 'react'
import { Upload, FileText, AlertCircle, Check, X } from 'lucide-react'
import {
  parseCSV,
  autoMapColumns,
  validateImport,
  getDbFieldLabel,
  getKnownDbFields,
  type ColumnMapping,
  type ImportValidationError,
} from '@/lib/utils/csv-import'

export function BatchImport() {
  const [step, setStep] = useState<'upload' | 'map' | 'preview' | 'done'>('upload')
  const [headers, setHeaders] = useState<string[]>([])
  const [rows, setRows] = useState<string[][]>([])
  const [mapping, setMapping] = useState<ColumnMapping[]>([])
  const [errors, setErrors] = useState<ImportValidationError[]>([])
  const [importing, setImporting] = useState(false)
  const [importResult, setImportResult] = useState<{ success: number; failed: number } | null>(null)

  const handleFile = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = (ev) => {
      const text = ev.target?.result as string
      const { headers: h, rows: r } = parseCSV(text)
      setHeaders(h)
      setRows(r)
      setMapping(autoMapColumns(h))
      setStep('map')
    }
    reader.readAsText(file)
  }, [])

  const handleJsonFile = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = (ev) => {
      try {
        const json = JSON.parse(ev.target?.result as string)
        const arr = Array.isArray(json) ? json : [json]
        if (arr.length === 0) return

        const h = Object.keys(arr[0])
        const r = arr.map((obj: Record<string, unknown>) => h.map((key) => String(obj[key] ?? '')))
        setHeaders(h)
        setRows(r)
        setMapping(autoMapColumns(h))
        setStep('map')
      } catch {
        setErrors([{ row: 0, column: '', message: 'Formato JSON invalido' }])
      }
    }
    reader.readAsText(file)
  }, [])

  function updateMapping(csvColumn: string, dbField: string) {
    setMapping((prev) => {
      const filtered = prev.filter((m) => m.csvColumn !== csvColumn)
      if (dbField) {
        filtered.push({ csvColumn, dbField })
      }
      return filtered
    })
  }

  function goToPreview() {
    const validationErrors = validateImport(rows, headers, mapping)
    setErrors(validationErrors)
    setStep('preview')
  }

  async function runImport() {
    setImporting(true)
    try {
      const res = await fetch('/api/admin/batch-import', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ headers, rows, mapping }),
      })
      const data = await res.json()
      setImportResult({ success: data.success ?? 0, failed: data.failed ?? 0 })
      setStep('done')
    } catch {
      setErrors([{ row: 0, column: '', message: 'Erro ao importar' }])
    }
    setImporting(false)
  }

  const knownFields = getKnownDbFields()

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h3 className="text-sm font-semibold text-gray-700 mb-4">Importacao em lote</h3>

      {/* Upload step */}
      {step === 'upload' && (
        <div className="space-y-4">
          <div className="border-2 border-dashed border-gray-200 rounded-xl p-8 text-center">
            <Upload className="w-8 h-8 text-gray-300 mx-auto mb-3" />
            <p className="text-sm text-gray-600 mb-3">
              Selecione um arquivo CSV ou JSON
            </p>
            <div className="flex justify-center gap-3">
              <label className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-blue-600 bg-blue-50 rounded-lg hover:bg-blue-100 cursor-pointer transition-colors">
                <FileText className="w-4 h-4" />
                CSV
                <input type="file" accept=".csv,.tsv" onChange={handleFile} className="hidden" />
              </label>
              <label className="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-purple-600 bg-purple-50 rounded-lg hover:bg-purple-100 cursor-pointer transition-colors">
                <FileText className="w-4 h-4" />
                JSON
                <input type="file" accept=".json" onChange={handleJsonFile} className="hidden" />
              </label>
            </div>
          </div>
        </div>
      )}

      {/* Map step */}
      {step === 'map' && (
        <div className="space-y-4">
          <p className="text-sm text-gray-600">
            {rows.length} linhas encontradas. Mapeie as colunas do arquivo.
          </p>
          <div className="space-y-2">
            {headers.map((h) => {
              const current = mapping.find((m) => m.csvColumn === h)?.dbField ?? ''
              return (
                <div key={h} className="flex items-center gap-3">
                  <span className="text-sm text-gray-700 w-40 truncate font-medium">{h}</span>
                  <span className="text-gray-400">&rarr;</span>
                  <select
                    value={current}
                    onChange={(e) => updateMapping(h, e.target.value)}
                    className="flex-1 px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
                  >
                    <option value="">-- Ignorar --</option>
                    {knownFields.map((f) => (
                      <option key={f} value={f}>{getDbFieldLabel(f)}</option>
                    ))}
                  </select>
                </div>
              )
            })}
          </div>
          <div className="flex gap-2">
            <button onClick={() => setStep('upload')} className="px-3 py-1.5 text-sm text-gray-600 border border-gray-200 rounded-lg hover:bg-gray-50">
              Voltar
            </button>
            <button onClick={goToPreview} className="px-3 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
              Continuar
            </button>
          </div>
        </div>
      )}

      {/* Preview step */}
      {step === 'preview' && (
        <div className="space-y-4">
          {errors.length > 0 && (
            <div className="p-3 bg-yellow-50 border border-yellow-200 rounded-lg">
              <div className="flex items-center gap-2 mb-2">
                <AlertCircle className="w-4 h-4 text-yellow-600" />
                <p className="text-sm font-medium text-yellow-800">{errors.length} aviso(s)</p>
              </div>
              <ul className="text-xs text-yellow-700 space-y-1 max-h-32 overflow-y-auto">
                {errors.slice(0, 10).map((err, i) => (
                  <li key={i}>Linha {err.row}: {err.message}</li>
                ))}
              </ul>
            </div>
          )}

          <div className="overflow-x-auto max-h-64">
            <table className="w-full text-xs">
              <thead>
                <tr className="bg-gray-50">
                  <th className="px-2 py-1.5 text-left font-medium text-gray-600">#</th>
                  {mapping.map((m) => (
                    <th key={m.dbField} className="px-2 py-1.5 text-left font-medium text-gray-600">
                      {getDbFieldLabel(m.dbField)}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-50">
                {rows.slice(0, 10).map((row, ri) => (
                  <tr key={ri}>
                    <td className="px-2 py-1.5 text-gray-400">{ri + 1}</td>
                    {mapping.map((m) => {
                      const colIdx = headers.indexOf(m.csvColumn)
                      return (
                        <td key={m.dbField} className="px-2 py-1.5 text-gray-700 truncate max-w-[200px]">
                          {row[colIdx] ?? ''}
                        </td>
                      )
                    })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex gap-2">
            <button onClick={() => setStep('map')} className="px-3 py-1.5 text-sm text-gray-600 border border-gray-200 rounded-lg hover:bg-gray-50">
              Voltar
            </button>
            <button
              onClick={runImport}
              disabled={importing}
              className="px-3 py-1.5 text-sm font-medium text-white bg-green-600 rounded-lg hover:bg-green-700 disabled:opacity-50"
            >
              {importing ? 'Importando...' : `Importar ${rows.length} registros`}
            </button>
          </div>
        </div>
      )}

      {/* Done step */}
      {step === 'done' && importResult && (
        <div className="text-center py-6">
          <Check className="w-10 h-10 text-green-500 mx-auto mb-3" />
          <p className="text-sm font-medium text-gray-900 mb-1">Importacao concluida</p>
          <p className="text-xs text-gray-500">
            {importResult.success} importados, {importResult.failed} com erro
          </p>
          <button
            onClick={() => { setStep('upload'); setRows([]); setHeaders([]); setMapping([]); setImportResult(null) }}
            className="mt-4 px-3 py-1.5 text-sm text-blue-600 border border-blue-200 rounded-lg hover:bg-blue-50"
          >
            Nova importacao
          </button>
        </div>
      )}
    </div>
  )
}
