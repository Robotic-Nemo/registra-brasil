'use client'

import { useState, useRef, type ChangeEvent } from 'react'
import { Upload, FileText, AlertCircle, CheckCircle2, X } from 'lucide-react'
import type { ImportConfig, ImportRow, ImportError } from '@/types/import'

interface ImportFormProps {
  entityType: ImportConfig['type']
  expectedColumns: string[]
  onImport: (rows: ImportRow[], config: ImportConfig) => Promise<{
    successCount: number
    errorCount: number
    errors: ImportError[]
  }>
}

interface PreviewData {
  headers: string[]
  rows: string[][]
  fileName: string
  totalRows: number
}

/**
 * CSV import form with file upload, column preview, mapping, and validation.
 */
export function ImportForm({ entityType, expectedColumns, onImport }: ImportFormProps) {
  const fileRef = useRef<HTMLInputElement>(null)
  const [preview, setPreview] = useState<PreviewData | null>(null)
  const [columnMapping, setColumnMapping] = useState<Record<string, string>>({})
  const [importing, setImporting] = useState(false)
  const [result, setResult] = useState<{ successCount: number; errorCount: number; errors: ImportError[] } | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [skipOnError, setSkipOnError] = useState(true)
  const [updateExisting, setUpdateExisting] = useState(false)

  function handleFileChange(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return

    setError(null)
    setResult(null)

    if (!file.name.endsWith('.csv')) {
      setError('Apenas arquivos CSV sao aceitos.')
      return
    }

    const reader = new FileReader()
    reader.onload = (event) => {
      const text = event.target?.result as string
      const lines = text.split(/\r?\n/).filter((l) => l.trim())
      if (lines.length < 2) {
        setError('O arquivo precisa ter ao menos um cabecalho e uma linha de dados.')
        return
      }

      const headers = parseCsvLine(lines[0])
      const rows = lines.slice(1, 6).map(parseCsvLine) // Preview first 5 rows

      // Auto-map columns that match expected names
      const autoMapping: Record<string, string> = {}
      headers.forEach((h) => {
        const normalized = h.toLowerCase().trim()
        const match = expectedColumns.find(
          (col) => col.toLowerCase() === normalized || col.toLowerCase().replace(/_/g, ' ') === normalized
        )
        if (match) autoMapping[h] = match
      })

      setColumnMapping(autoMapping)
      setPreview({
        headers,
        rows,
        fileName: file.name,
        totalRows: lines.length - 1,
      })
    }
    reader.readAsText(file)
  }

  async function handleImport() {
    if (!preview) return
    setImporting(true)
    setError(null)

    try {
      const file = fileRef.current?.files?.[0]
      if (!file) return

      const text = await file.text()
      const lines = text.split(/\r?\n/).filter((l) => l.trim())
      const headers = parseCsvLine(lines[0])

      const importRows: ImportRow[] = lines.slice(1).map((line, index) => {
        const values = parseCsvLine(line)
        const data: Record<string, string> = {}
        headers.forEach((h, i) => {
          const mappedField = columnMapping[h]
          if (mappedField) {
            data[mappedField] = values[i] ?? ''
          }
        })
        return { rowIndex: index, data }
      })

      const importResult = await onImport(importRows, {
        type: entityType,
        skipOnError,
        updateExisting,
        columnMapping,
      })

      setResult(importResult)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erro desconhecido durante importacao.')
    } finally {
      setImporting(false)
    }
  }

  function resetForm() {
    setPreview(null)
    setResult(null)
    setError(null)
    setColumnMapping({})
    if (fileRef.current) fileRef.current.value = ''
  }

  const mappedCount = Object.values(columnMapping).filter(Boolean).length

  return (
    <div className="space-y-6">
      {/* File upload */}
      {!preview && (
        <label className="flex flex-col items-center justify-center w-full h-40 border-2 border-dashed border-gray-300 rounded-lg cursor-pointer hover:border-blue-400 hover:bg-blue-50/50 transition-colors">
          <Upload className="w-8 h-8 text-gray-400 mb-2" />
          <p className="text-sm text-gray-600">Clique para selecionar um arquivo CSV</p>
          <p className="text-xs text-gray-400 mt-1">Apenas .csv</p>
          <input
            ref={fileRef}
            type="file"
            accept=".csv"
            onChange={handleFileChange}
            className="hidden"
          />
        </label>
      )}

      {/* Error display */}
      {error && (
        <div className="flex items-start gap-2 bg-red-50 text-red-700 px-4 py-3 rounded-lg text-sm">
          <AlertCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
          <p>{error}</p>
        </div>
      )}

      {/* Preview */}
      {preview && !result && (
        <div className="space-y-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <FileText className="w-5 h-5 text-gray-400" />
              <div>
                <p className="text-sm font-medium text-gray-900">{preview.fileName}</p>
                <p className="text-xs text-gray-500">
                  {preview.totalRows} linhas &middot; {preview.headers.length} colunas &middot; {mappedCount} mapeadas
                </p>
              </div>
            </div>
            <button onClick={resetForm} className="text-gray-400 hover:text-gray-600">
              <X className="w-5 h-5" />
            </button>
          </div>

          {/* Column mapping */}
          <div className="bg-gray-50 rounded-lg p-4 space-y-3">
            <p className="text-sm font-medium text-gray-700">Mapeamento de colunas</p>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              {preview.headers.map((h) => (
                <div key={h} className="flex items-center gap-2">
                  <span className="text-xs text-gray-500 w-32 truncate" title={h}>{h}</span>
                  <select
                    value={columnMapping[h] ?? ''}
                    onChange={(e) => setColumnMapping((prev) => ({ ...prev, [h]: e.target.value }))}
                    className="flex-1 text-xs px-2 py-1.5 border border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
                  >
                    <option value="">-- ignorar --</option>
                    {expectedColumns.map((col) => (
                      <option key={col} value={col}>{col}</option>
                    ))}
                  </select>
                </div>
              ))}
            </div>
          </div>

          {/* Data preview table */}
          <div className="overflow-x-auto border border-gray-200 rounded-lg">
            <table className="w-full text-xs">
              <thead className="bg-gray-50">
                <tr>
                  {preview.headers.map((h) => (
                    <th key={h} className="px-3 py-2 text-left font-medium text-gray-600 whitespace-nowrap">
                      {h}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {preview.rows.map((row, i) => (
                  <tr key={i}>
                    {row.map((cell, j) => (
                      <td key={j} className="px-3 py-2 text-gray-700 whitespace-nowrap max-w-[200px] truncate">
                        {cell}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* Import options */}
          <div className="flex flex-wrap gap-4">
            <label className="flex items-center gap-2 text-sm">
              <input
                type="checkbox"
                checked={skipOnError}
                onChange={(e) => setSkipOnError(e.target.checked)}
                className="w-4 h-4 rounded border-gray-300 text-blue-600"
              />
              Pular linhas com erro
            </label>
            <label className="flex items-center gap-2 text-sm">
              <input
                type="checkbox"
                checked={updateExisting}
                onChange={(e) => setUpdateExisting(e.target.checked)}
                className="w-4 h-4 rounded border-gray-300 text-blue-600"
              />
              Atualizar registros existentes
            </label>
          </div>

          {/* Import button */}
          <div className="flex justify-end">
            <button
              onClick={handleImport}
              disabled={importing || mappedCount === 0}
              className="px-6 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
            >
              {importing ? 'Importando...' : `Importar ${preview.totalRows} linhas`}
            </button>
          </div>
        </div>
      )}

      {/* Result */}
      {result && (
        <div className="space-y-4">
          <div className="flex items-start gap-3 bg-green-50 text-green-700 px-4 py-3 rounded-lg">
            <CheckCircle2 className="w-5 h-5 mt-0.5 flex-shrink-0" />
            <div>
              <p className="text-sm font-medium">Importacao concluida</p>
              <p className="text-xs mt-1">
                {result.successCount} importados com sucesso
                {result.errorCount > 0 && ` | ${result.errorCount} erros`}
              </p>
            </div>
          </div>

          {result.errors.length > 0 && (
            <div className="bg-red-50 rounded-lg p-4">
              <p className="text-sm font-medium text-red-700 mb-2">Erros ({result.errors.length})</p>
              <ul className="space-y-1 max-h-40 overflow-y-auto">
                {result.errors.map((err, i) => (
                  <li key={i} className="text-xs text-red-600">
                    Linha {err.rowIndex + 1}{err.field ? ` (${err.field})` : ''}: {err.message}
                  </li>
                ))}
              </ul>
            </div>
          )}

          <button
            onClick={resetForm}
            className="text-sm text-blue-600 hover:text-blue-800"
          >
            Importar outro arquivo
          </button>
        </div>
      )}
    </div>
  )
}

/**
 * Simple CSV line parser for preview purposes.
 */
function parseCsvLine(line: string): string[] {
  const fields: string[] = []
  let current = ''
  let inQuotes = false

  for (let i = 0; i < line.length; i++) {
    const char = line[i]
    if (char === '"') {
      if (inQuotes && line[i + 1] === '"') {
        current += '"'
        i++
      } else {
        inQuotes = !inQuotes
      }
    } else if (char === ',' && !inQuotes) {
      fields.push(current.trim())
      current = ''
    } else {
      current += char
    }
  }
  fields.push(current.trim())
  return fields
}
