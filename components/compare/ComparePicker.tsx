'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

interface Politician {
  id: string
  name: string
  party: string
  state: string | null
}

interface Props {
  politicians: Politician[]
  initialA?: string
  initialB?: string
}

export function ComparePicker({ politicians, initialA, initialB }: Props) {
  const [idA, setIdA] = useState(initialA ?? '')
  const [idB, setIdB] = useState(initialB ?? '')
  const router = useRouter()

  function handleCompare() {
    if (idA && idB && idA !== idB) {
      router.push(`/comparar/resultado?a=${idA}&b=${idB}`)
    }
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <h2 className="font-semibold text-gray-900 mb-4">Selecionar politicos para comparar</h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
        <div>
          <label htmlFor="compare-a" className="block text-xs font-medium text-gray-600 mb-1">
            Politico A
          </label>
          <select
            id="compare-a"
            value={idA}
            onChange={(e) => setIdA(e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm"
          >
            <option value="">Selecionar...</option>
            {politicians.map((p) => (
              <option key={p.id} value={p.id} disabled={p.id === idB}>
                {p.name} ({p.party}{p.state ? ` - ${p.state}` : ''})
              </option>
            ))}
          </select>
        </div>
        <div>
          <label htmlFor="compare-b" className="block text-xs font-medium text-gray-600 mb-1">
            Politico B
          </label>
          <select
            id="compare-b"
            value={idB}
            onChange={(e) => setIdB(e.target.value)}
            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm"
          >
            <option value="">Selecionar...</option>
            {politicians.map((p) => (
              <option key={p.id} value={p.id} disabled={p.id === idA}>
                {p.name} ({p.party}{p.state ? ` - ${p.state}` : ''})
              </option>
            ))}
          </select>
        </div>
      </div>
      <button
        onClick={handleCompare}
        disabled={!idA || !idB || idA === idB}
        className="w-full sm:w-auto bg-blue-600 text-white px-6 py-2 rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
      >
        Comparar
      </button>
    </div>
  )
}
