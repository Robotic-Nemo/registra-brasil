'use client'

import { useState, type FormEvent } from 'react'
import type { Politician } from '@/types/database'

export interface PoliticianFormData {
  slug: string
  full_name: string
  common_name: string
  party: string
  party_history: { party: string; from: string; to?: string }[]
  state: string | null
  role: string | null
  role_history: { role: string; from: string; to?: string }[]
  photo_url: string | null
  tse_id: string | null
  camara_id: number | null
  senado_id: number | null
  wikipedia_url: string | null
  is_active: boolean
}

interface PoliticianFormProps {
  politician?: Partial<Politician>
  onSubmit: (data: PoliticianFormData) => Promise<void>
  isLoading?: boolean
}

const BRAZILIAN_STATES = [
  'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA',
  'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN',
  'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO',
]

const COMMON_PARTIES = [
  'PL', 'PT', 'UNIÃO', 'PP', 'MDB', 'PSD', 'REPUBLICANOS',
  'PSDB', 'PDT', 'PODE', 'PSB', 'PSOL', 'AVANTE', 'NOVO',
  'PCdoB', 'PV', 'REDE', 'SOLIDARIEDADE', 'CIDADANIA',
]

/**
 * Form for creating or editing a politician.
 * Handles all politician fields with proper labels and validation.
 */
export function PoliticianForm({ politician, onSubmit, isLoading = false }: PoliticianFormProps) {
  const [formData, setFormData] = useState<PoliticianFormData>({
    slug: politician?.slug ?? '',
    full_name: politician?.full_name ?? '',
    common_name: politician?.common_name ?? '',
    party: politician?.party ?? '',
    party_history: politician?.party_history ?? [],
    state: politician?.state ?? null,
    role: politician?.role ?? null,
    role_history: politician?.role_history ?? [],
    photo_url: politician?.photo_url ?? null,
    tse_id: politician?.tse_id ?? null,
    camara_id: politician?.camara_id ?? null,
    senado_id: politician?.senado_id ?? null,
    wikipedia_url: politician?.wikipedia_url ?? null,
    is_active: politician?.is_active ?? true,
  })

  const [partyEntry, setPartyEntry] = useState({ party: '', from: '', to: '' })
  const [roleEntry, setRoleEntry] = useState({ role: '', from: '', to: '' })

  function updateField<K extends keyof PoliticianFormData>(key: K, value: PoliticianFormData[K]) {
    setFormData((prev) => ({ ...prev, [key]: value }))
  }

  function addPartyHistory() {
    if (!partyEntry.party || !partyEntry.from) return
    updateField('party_history', [
      ...formData.party_history,
      { party: partyEntry.party, from: partyEntry.from, ...(partyEntry.to ? { to: partyEntry.to } : {}) },
    ])
    setPartyEntry({ party: '', from: '', to: '' })
  }

  function removePartyHistory(index: number) {
    updateField('party_history', formData.party_history.filter((_, i) => i !== index))
  }

  function addRoleHistory() {
    if (!roleEntry.role || !roleEntry.from) return
    updateField('role_history', [
      ...formData.role_history,
      { role: roleEntry.role, from: roleEntry.from, ...(roleEntry.to ? { to: roleEntry.to } : {}) },
    ])
    setRoleEntry({ role: '', from: '', to: '' })
  }

  function removeRoleHistory(index: number) {
    updateField('role_history', formData.role_history.filter((_, i) => i !== index))
  }

  async function handleSubmit(e: FormEvent) {
    e.preventDefault()
    await onSubmit(formData)
  }

  const inputClass = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent'
  const labelClass = 'block text-sm font-medium text-gray-700 mb-1'

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {/* Basic info */}
      <fieldset className="space-y-4">
        <legend className="text-lg font-semibold text-gray-900 border-b pb-2 w-full">
          Informacoes Basicas
        </legend>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label htmlFor="full_name" className={labelClass}>Nome completo *</label>
            <input
              id="full_name"
              type="text"
              required
              value={formData.full_name}
              onChange={(e) => updateField('full_name', e.target.value)}
              className={inputClass}
              placeholder="Luiz Inacio Lula da Silva"
            />
          </div>
          <div>
            <label htmlFor="common_name" className={labelClass}>Nome comum *</label>
            <input
              id="common_name"
              type="text"
              required
              value={formData.common_name}
              onChange={(e) => updateField('common_name', e.target.value)}
              className={inputClass}
              placeholder="Lula"
            />
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
          <div>
            <label htmlFor="slug" className={labelClass}>Slug *</label>
            <input
              id="slug"
              type="text"
              required
              value={formData.slug}
              onChange={(e) => updateField('slug', e.target.value)}
              className={inputClass}
              placeholder="lula"
            />
          </div>
          <div>
            <label htmlFor="party" className={labelClass}>Partido atual *</label>
            <select
              id="party"
              required
              value={formData.party}
              onChange={(e) => updateField('party', e.target.value)}
              className={inputClass}
            >
              <option value="">Selecione</option>
              {COMMON_PARTIES.map((p) => (
                <option key={p} value={p}>{p}</option>
              ))}
            </select>
          </div>
          <div>
            <label htmlFor="state" className={labelClass}>Estado</label>
            <select
              id="state"
              value={formData.state ?? ''}
              onChange={(e) => updateField('state', e.target.value || null)}
              className={inputClass}
            >
              <option value="">Nacional</option>
              {BRAZILIAN_STATES.map((s) => (
                <option key={s} value={s}>{s}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label htmlFor="role" className={labelClass}>Cargo atual</label>
            <input
              id="role"
              type="text"
              value={formData.role ?? ''}
              onChange={(e) => updateField('role', e.target.value || null)}
              className={inputClass}
              placeholder="Presidente da Republica"
            />
          </div>
          <div className="flex items-end">
            <label className="flex items-center gap-2 cursor-pointer">
              <input
                type="checkbox"
                checked={formData.is_active}
                onChange={(e) => updateField('is_active', e.target.checked)}
                className="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500"
              />
              <span className="text-sm font-medium text-gray-700">Politico ativo</span>
            </label>
          </div>
        </div>
      </fieldset>

      {/* External IDs */}
      <fieldset className="space-y-4">
        <legend className="text-lg font-semibold text-gray-900 border-b pb-2 w-full">
          Identificadores Externos
        </legend>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <div>
            <label htmlFor="photo_url" className={labelClass}>URL da foto</label>
            <input
              id="photo_url"
              type="url"
              value={formData.photo_url ?? ''}
              onChange={(e) => updateField('photo_url', e.target.value || null)}
              className={inputClass}
              placeholder="https://..."
            />
          </div>
          <div>
            <label htmlFor="wikipedia_url" className={labelClass}>URL Wikipedia</label>
            <input
              id="wikipedia_url"
              type="url"
              value={formData.wikipedia_url ?? ''}
              onChange={(e) => updateField('wikipedia_url', e.target.value || null)}
              className={inputClass}
              placeholder="https://pt.wikipedia.org/wiki/..."
            />
          </div>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
          <div>
            <label htmlFor="tse_id" className={labelClass}>ID TSE</label>
            <input
              id="tse_id"
              type="text"
              value={formData.tse_id ?? ''}
              onChange={(e) => updateField('tse_id', e.target.value || null)}
              className={inputClass}
            />
          </div>
          <div>
            <label htmlFor="camara_id" className={labelClass}>ID Camara</label>
            <input
              id="camara_id"
              type="number"
              value={formData.camara_id ?? ''}
              onChange={(e) => updateField('camara_id', e.target.value ? Number(e.target.value) : null)}
              className={inputClass}
            />
          </div>
          <div>
            <label htmlFor="senado_id" className={labelClass}>ID Senado</label>
            <input
              id="senado_id"
              type="number"
              value={formData.senado_id ?? ''}
              onChange={(e) => updateField('senado_id', e.target.value ? Number(e.target.value) : null)}
              className={inputClass}
            />
          </div>
        </div>
      </fieldset>

      {/* Party history */}
      <fieldset className="space-y-4">
        <legend className="text-lg font-semibold text-gray-900 border-b pb-2 w-full">
          Historico Partidario
        </legend>

        {formData.party_history.length > 0 && (
          <ul className="space-y-2">
            {formData.party_history.map((entry, i) => (
              <li key={i} className="flex items-center gap-2 text-sm bg-gray-50 px-3 py-2 rounded-lg">
                <span className="font-medium">{entry.party}</span>
                <span className="text-gray-500">{entry.from}{entry.to ? ` - ${entry.to}` : ' - presente'}</span>
                <button
                  type="button"
                  onClick={() => removePartyHistory(i)}
                  className="ml-auto text-red-500 hover:text-red-700 text-xs"
                >
                  Remover
                </button>
              </li>
            ))}
          </ul>
        )}

        <div className="flex gap-2 items-end">
          <div className="flex-1">
            <label className="block text-xs text-gray-500 mb-1">Partido</label>
            <input
              type="text"
              value={partyEntry.party}
              onChange={(e) => setPartyEntry((p) => ({ ...p, party: e.target.value }))}
              className={inputClass}
              placeholder="PT"
            />
          </div>
          <div className="w-32">
            <label className="block text-xs text-gray-500 mb-1">De</label>
            <input
              type="date"
              value={partyEntry.from}
              onChange={(e) => setPartyEntry((p) => ({ ...p, from: e.target.value }))}
              className={inputClass}
            />
          </div>
          <div className="w-32">
            <label className="block text-xs text-gray-500 mb-1">Ate</label>
            <input
              type="date"
              value={partyEntry.to}
              onChange={(e) => setPartyEntry((p) => ({ ...p, to: e.target.value }))}
              className={inputClass}
            />
          </div>
          <button
            type="button"
            onClick={addPartyHistory}
            className="px-3 py-2 bg-gray-100 text-gray-700 rounded-lg text-sm hover:bg-gray-200"
          >
            Adicionar
          </button>
        </div>
      </fieldset>

      {/* Role history */}
      <fieldset className="space-y-4">
        <legend className="text-lg font-semibold text-gray-900 border-b pb-2 w-full">
          Historico de Cargos
        </legend>

        {formData.role_history.length > 0 && (
          <ul className="space-y-2">
            {formData.role_history.map((entry, i) => (
              <li key={i} className="flex items-center gap-2 text-sm bg-gray-50 px-3 py-2 rounded-lg">
                <span className="font-medium">{entry.role}</span>
                <span className="text-gray-500">{entry.from}{entry.to ? ` - ${entry.to}` : ' - presente'}</span>
                <button
                  type="button"
                  onClick={() => removeRoleHistory(i)}
                  className="ml-auto text-red-500 hover:text-red-700 text-xs"
                >
                  Remover
                </button>
              </li>
            ))}
          </ul>
        )}

        <div className="flex gap-2 items-end">
          <div className="flex-1">
            <label className="block text-xs text-gray-500 mb-1">Cargo</label>
            <input
              type="text"
              value={roleEntry.role}
              onChange={(e) => setRoleEntry((p) => ({ ...p, role: e.target.value }))}
              className={inputClass}
              placeholder="Deputado Federal"
            />
          </div>
          <div className="w-32">
            <label className="block text-xs text-gray-500 mb-1">De</label>
            <input
              type="date"
              value={roleEntry.from}
              onChange={(e) => setRoleEntry((p) => ({ ...p, from: e.target.value }))}
              className={inputClass}
            />
          </div>
          <div className="w-32">
            <label className="block text-xs text-gray-500 mb-1">Ate</label>
            <input
              type="date"
              value={roleEntry.to}
              onChange={(e) => setRoleEntry((p) => ({ ...p, to: e.target.value }))}
              className={inputClass}
            />
          </div>
          <button
            type="button"
            onClick={addRoleHistory}
            className="px-3 py-2 bg-gray-100 text-gray-700 rounded-lg text-sm hover:bg-gray-200"
          >
            Adicionar
          </button>
        </div>
      </fieldset>

      {/* Submit */}
      <div className="flex justify-end gap-3 pt-4 border-t">
        <button
          type="submit"
          disabled={isLoading}
          className="px-6 py-2.5 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          {isLoading ? 'Salvando...' : politician?.id ? 'Atualizar Politico' : 'Criar Politico'}
        </button>
      </div>
    </form>
  )
}
