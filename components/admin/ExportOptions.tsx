'use client'

import { useState } from 'react'
import { Download, FileJson, FileSpreadsheet } from 'lucide-react'
import type { ExportConfig } from '@/types/import'

interface ExportOptionsProps {
  entityType: ExportConfig['type']
  availableFields: string[]
  onExport: (config: ExportConfig) => Promise<void>
}

const FORMAT_OPTIONS: { value: ExportConfig['format']; label: string; icon: typeof FileJson }[] = [
  { value: 'json', label: 'JSON', icon: FileJson },
  { value: 'csv', label: 'CSV', icon: FileSpreadsheet },
]

/**
 * Export configuration panel with format selection, field picking,
 * and filter options.
 */
export function ExportOptions({ entityType, availableFields, onExport }: ExportOptionsProps) {
  const [format, setFormat] = useState<ExportConfig['format']>('json')
  const [selectedFields, setSelectedFields] = useState<Set<string>>(new Set(availableFields))
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')
  const [party, setParty] = useState('')
  const [state, setState] = useState('')
  const [verificationStatus, setVerificationStatus] = useState('')
  const [exporting, setExporting] = useState(false)

  function toggleField(field: string) {
    setSelectedFields((prev) => {
      const next = new Set(prev)
      if (next.has(field)) {
        next.delete(field)
      } else {
        next.add(field)
      }
      return next
    })
  }

  function selectAllFields() {
    setSelectedFields(new Set(availableFields))
  }

  function deselectAllFields() {
    setSelectedFields(new Set())
  }

  async function handleExport() {
    setExporting(true)
    try {
      const config: ExportConfig = {
        type: entityType,
        format,
        fields: Array.from(selectedFields),
        filters: {
          ...(dateFrom ? { dateFrom } : {}),
          ...(dateTo ? { dateTo } : {}),
          ...(party ? { party } : {}),
          ...(state ? { state } : {}),
          ...(verificationStatus ? { verificationStatus } : {}),
        },
      }
      await onExport(config)
    } finally {
      setExporting(false)
    }
  }

  return (
    <div className="space-y-6">
      {/* Format selection */}
      <div>
        <p className="text-sm font-medium text-gray-700 mb-2">Formato</p>
        <div className="flex gap-3">
          {FORMAT_OPTIONS.map((opt) => {
            const Icon = opt.icon
            return (
              <button
                key={opt.value}
                onClick={() => setFormat(opt.value)}
                className={`flex items-center gap-2 px-4 py-2.5 rounded-lg border text-sm font-medium transition-colors ${
                  format === opt.value
                    ? 'border-blue-500 bg-blue-50 text-blue-700'
                    : 'border-gray-200 bg-white text-gray-600 hover:border-gray-300'
                }`}
              >
                <Icon className="w-4 h-4" />
                {opt.label}
              </button>
            )
          })}
        </div>
      </div>

      {/* Filters */}
      {entityType === 'statements' && (
        <div>
          <p className="text-sm font-medium text-gray-700 mb-2">Filtros</p>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
            <div>
              <label className="block text-xs text-gray-500 mb-1">Data inicio</label>
              <input
                type="date"
                value={dateFrom}
                onChange={(e) => setDateFrom(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Data fim</label>
              <input
                type="date"
                value={dateTo}
                onChange={(e) => setDateTo(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Status de verificacao</label>
              <select
                value={verificationStatus}
                onChange={(e) => setVerificationStatus(e.target.value)}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              >
                <option value="">Todos</option>
                <option value="verified">Verificado</option>
                <option value="unverified">Nao verificado</option>
                <option value="disputed">Disputado</option>
                <option value="removed">Removido</option>
              </select>
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Partido</label>
              <input
                type="text"
                value={party}
                onChange={(e) => setParty(e.target.value)}
                placeholder="Ex: PT"
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-xs text-gray-500 mb-1">Estado</label>
              <input
                type="text"
                value={state}
                onChange={(e) => setState(e.target.value)}
                placeholder="Ex: SP"
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
              />
            </div>
          </div>
        </div>
      )}

      {/* Field selection */}
      <div>
        <div className="flex items-center justify-between mb-2">
          <p className="text-sm font-medium text-gray-700">
            Campos ({selectedFields.size}/{availableFields.length})
          </p>
          <div className="flex gap-2">
            <button
              onClick={selectAllFields}
              className="text-xs text-blue-600 hover:text-blue-800"
            >
              Selecionar todos
            </button>
            <span className="text-gray-300">|</span>
            <button
              onClick={deselectAllFields}
              className="text-xs text-blue-600 hover:text-blue-800"
            >
              Limpar
            </button>
          </div>
        </div>
        <div className="flex flex-wrap gap-2">
          {availableFields.map((field) => (
            <button
              key={field}
              onClick={() => toggleField(field)}
              className={`px-2.5 py-1 rounded-full text-xs font-medium transition-colors ${
                selectedFields.has(field)
                  ? 'bg-blue-100 text-blue-700 hover:bg-blue-200'
                  : 'bg-gray-100 text-gray-500 hover:bg-gray-200'
              }`}
            >
              {field}
            </button>
          ))}
        </div>
      </div>

      {/* Export button */}
      <div className="flex justify-end">
        <button
          onClick={handleExport}
          disabled={exporting || selectedFields.size === 0}
          className="flex items-center gap-2 px-6 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          <Download className="w-4 h-4" />
          {exporting ? 'Exportando...' : `Exportar ${format.toUpperCase()}`}
        </button>
      </div>
    </div>
  )
}
