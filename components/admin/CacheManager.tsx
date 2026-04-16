'use client'

import { useState } from 'react'
import { Database, Trash2, RefreshCw, Check, Zap } from 'lucide-react'
import type { CacheStats } from '@/types/settings'

interface CacheManagerProps {
  stats: CacheStats
}

export function CacheManager({ stats: initialStats }: CacheManagerProps) {
  const [stats, setStats] = useState(initialStats)
  const [clearing, setClearing] = useState(false)
  const [cleared, setCleared] = useState(false)

  async function clearCache() {
    setClearing(true)
    try {
      await fetch('/api/admin/cache', { method: 'DELETE' })
      setStats((prev) => ({
        ...prev,
        totalEntries: 0,
        memoryUsageMb: 0,
        lastCleared: new Date().toISOString(),
      }))
      setCleared(true)
      setTimeout(() => setCleared(false), 3000)
    } catch {
      // silently fail
    }
    setClearing(false)
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center gap-2">
        <Database className="w-4 h-4 text-gray-500" />
        <h3 className="text-sm font-semibold text-gray-700">Gerenciamento de Cache</h3>
      </div>

      {/* Stats grid */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
        <div className="bg-gray-50 rounded-lg p-3 text-center">
          <p className={`text-lg font-bold ${stats.enabled ? 'text-green-600' : 'text-red-600'}`}>
            {stats.enabled ? 'Ativo' : 'Inativo'}
          </p>
          <p className="text-[10px] text-gray-500 mt-0.5">Status</p>
        </div>
        <div className="bg-gray-50 rounded-lg p-3 text-center">
          <p className="text-lg font-bold text-blue-600 tabular-nums">
            {stats.hitRate}%
          </p>
          <p className="text-[10px] text-gray-500 mt-0.5">Taxa de acerto</p>
        </div>
        <div className="bg-gray-50 rounded-lg p-3 text-center">
          <p className="text-lg font-bold text-gray-700 tabular-nums">
            {stats.totalEntries.toLocaleString('pt-BR')}
          </p>
          <p className="text-[10px] text-gray-500 mt-0.5">Entradas</p>
        </div>
        <div className="bg-gray-50 rounded-lg p-3 text-center">
          <p className="text-lg font-bold text-gray-700 tabular-nums">
            {stats.memoryUsageMb.toFixed(1)} MB
          </p>
          <p className="text-[10px] text-gray-500 mt-0.5">Memoria</p>
        </div>
      </div>

      {/* Hit rate bar */}
      <div>
        <div className="flex items-center justify-between text-xs text-gray-500 mb-1">
          <span>Taxa de acerto</span>
          <span>{stats.hitRate}%</span>
        </div>
        <div className="h-2 bg-gray-100 rounded-full overflow-hidden">
          <div
            className={`h-full rounded-full transition-all ${
              stats.hitRate >= 80 ? 'bg-green-500' :
              stats.hitRate >= 50 ? 'bg-yellow-500' :
              'bg-red-500'
            }`}
            style={{ width: `${stats.hitRate}%` }}
          />
        </div>
      </div>

      {/* Actions */}
      <div className="flex items-center gap-3">
        <button
          onClick={clearCache}
          disabled={clearing}
          className="inline-flex items-center gap-2 px-3 py-1.5 text-sm font-medium text-red-600 border border-red-200 rounded-lg hover:bg-red-50 disabled:opacity-50 transition-colors"
        >
          {clearing ? (
            <RefreshCw className="w-4 h-4 animate-spin" />
          ) : cleared ? (
            <Check className="w-4 h-4 text-green-500" />
          ) : (
            <Trash2 className="w-4 h-4" />
          )}
          {cleared ? 'Cache limpo' : clearing ? 'Limpando...' : 'Limpar cache'}
        </button>

        {stats.lastCleared && (
          <span className="text-xs text-gray-400">
            Ultimo reset: {new Date(stats.lastCleared).toLocaleString('pt-BR')}
          </span>
        )}
      </div>
    </div>
  )
}
