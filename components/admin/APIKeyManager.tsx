'use client'

import { useState } from 'react'
import { Key, Plus, Trash2, Copy, Check, Eye, EyeOff } from 'lucide-react'
import type { APIKey } from '@/types/settings'

interface APIKeyManagerProps {
  apiKeys: APIKey[]
}

export function APIKeyManager({ apiKeys: initialKeys }: APIKeyManagerProps) {
  const [keys, setKeys] = useState(initialKeys)
  const [showCreate, setShowCreate] = useState(false)
  const [newLabel, setNewLabel] = useState('')
  const [newPermissions, setNewPermissions] = useState<string[]>(['read'])
  const [copied, setCopied] = useState<string | null>(null)
  const [visibleKey, setVisibleKey] = useState<string | null>(null)

  const allPermissions = ['read', 'write', 'delete', 'admin']

  function togglePermission(perm: string) {
    setNewPermissions((prev) =>
      prev.includes(perm) ? prev.filter((p) => p !== perm) : [...prev, perm]
    )
  }

  function createKey() {
    if (!newLabel) return
    const newKey: APIKey = {
      id: crypto.randomUUID(),
      label: newLabel,
      prefix: 'rb_' + Math.random().toString(36).slice(2, 10),
      permissions: newPermissions,
      isActive: true,
      lastUsedAt: null,
      createdAt: new Date().toISOString(),
      expiresAt: null,
    }
    setKeys((prev) => [...prev, newKey])
    setNewLabel('')
    setNewPermissions(['read'])
    setShowCreate(false)
  }

  function revokeKey(id: string) {
    setKeys((prev) => prev.map((k) => (k.id === id ? { ...k, isActive: false } : k)))
  }

  function deleteKey(id: string) {
    setKeys((prev) => prev.filter((k) => k.id !== id))
  }

  function copyPrefix(prefix: string) {
    navigator.clipboard.writeText(prefix).then(() => {
      setCopied(prefix)
      setTimeout(() => setCopied(null), 2000)
    })
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Key className="w-4 h-4 text-gray-500" />
          <h3 className="text-sm font-semibold text-gray-700">Chaves de API</h3>
        </div>
        <button
          onClick={() => setShowCreate(!showCreate)}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-blue-600 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors"
        >
          <Plus className="w-3.5 h-3.5" />
          Nova chave
        </button>
      </div>

      {/* Create form */}
      {showCreate && (
        <div className="bg-gray-50 border border-gray-200 rounded-lg p-4 space-y-3">
          <input
            type="text"
            value={newLabel}
            onChange={(e) => setNewLabel(e.target.value)}
            placeholder="Nome da chave (ex: Frontend, Mobile)"
            className="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          <div>
            <p className="text-xs font-medium text-gray-600 mb-1.5">Permissoes:</p>
            <div className="flex gap-2">
              {allPermissions.map((perm) => (
                <button
                  key={perm}
                  onClick={() => togglePermission(perm)}
                  className={`px-2.5 py-1 text-xs rounded-lg border transition-colors ${
                    newPermissions.includes(perm)
                      ? 'bg-blue-100 border-blue-300 text-blue-700'
                      : 'bg-white border-gray-200 text-gray-500 hover:bg-gray-50'
                  }`}
                >
                  {perm}
                </button>
              ))}
            </div>
          </div>
          <div className="flex gap-2">
            <button
              onClick={createKey}
              disabled={!newLabel}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50"
            >
              <Check className="w-3 h-3" />
              Criar
            </button>
            <button
              onClick={() => setShowCreate(false)}
              className="px-3 py-1.5 text-xs text-gray-600 border border-gray-200 rounded-lg hover:bg-white"
            >
              Cancelar
            </button>
          </div>
        </div>
      )}

      {/* Key list */}
      {keys.length === 0 ? (
        <p className="text-sm text-gray-500">Nenhuma chave de API criada.</p>
      ) : (
        <ul className="space-y-2">
          {keys.map((key) => (
            <li key={key.id} className={`border rounded-lg p-3 ${key.isActive ? 'bg-white border-gray-200' : 'bg-gray-50 border-gray-200 opacity-60'}`}>
              <div className="flex items-start justify-between gap-2">
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-2 mb-1">
                    <span className={`w-2 h-2 rounded-full ${key.isActive ? 'bg-green-500' : 'bg-red-400'}`} />
                    <p className="text-sm font-medium text-gray-900">{key.label}</p>
                  </div>
                  <div className="flex items-center gap-2 mb-1">
                    <code className="text-xs font-mono bg-gray-100 px-2 py-0.5 rounded text-gray-600">
                      {visibleKey === key.id ? key.prefix + '...' : key.prefix.slice(0, 4) + '****'}
                    </code>
                    <button
                      onClick={() => setVisibleKey(visibleKey === key.id ? null : key.id)}
                      className="text-gray-400 hover:text-gray-600"
                    >
                      {visibleKey === key.id ? <EyeOff className="w-3 h-3" /> : <Eye className="w-3 h-3" />}
                    </button>
                    <button
                      onClick={() => copyPrefix(key.prefix)}
                      className="text-gray-400 hover:text-gray-600"
                    >
                      {copied === key.prefix ? <Check className="w-3 h-3 text-green-500" /> : <Copy className="w-3 h-3" />}
                    </button>
                  </div>
                  <div className="flex flex-wrap gap-1">
                    {key.permissions.map((perm) => (
                      <span key={perm} className="px-1.5 py-0.5 text-[9px] bg-gray-100 text-gray-600 rounded">
                        {perm}
                      </span>
                    ))}
                  </div>
                  <p className="text-[10px] text-gray-400 mt-1">
                    Criada em {new Date(key.createdAt).toLocaleDateString('pt-BR')}
                    {key.lastUsedAt && ` | Usado em ${new Date(key.lastUsedAt).toLocaleDateString('pt-BR')}`}
                  </p>
                </div>
                <div className="flex items-center gap-1 shrink-0">
                  {key.isActive && (
                    <button
                      onClick={() => revokeKey(key.id)}
                      className="px-2 py-1 text-[10px] text-yellow-600 hover:bg-yellow-50 rounded transition-colors"
                    >
                      Revogar
                    </button>
                  )}
                  <button
                    onClick={() => deleteKey(key.id)}
                    className="p-1.5 rounded text-red-400 hover:bg-red-50 transition-colors"
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </div>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
