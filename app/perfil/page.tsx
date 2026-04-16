'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'

type SavedFilter = { id: string; name: string; query: string; createdAt: number }
type Favorite = { id: string; type: 'statement' | 'politician'; label: string; addedAt: number }
type HistoryEntry = { path: string; title: string; visitedAt: number }

const LS_FILTERS = 'rb:saved-filters'
const LS_FAVORITES = 'rb:favorites'
const LS_HISTORY = 'rb:history'
const LS_NAME = 'rb:profile-name'

export default function PerfilPage() {
  const [name, setName] = useState('')
  const [filters, setFilters] = useState<SavedFilter[]>([])
  const [favorites, setFavorites] = useState<Favorite[]>([])
  const [history, setHistory] = useState<HistoryEntry[]>([])
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    try {
      setName(localStorage.getItem(LS_NAME) ?? '')
      setFilters(JSON.parse(localStorage.getItem(LS_FILTERS) ?? '[]'))
      setFavorites(JSON.parse(localStorage.getItem(LS_FAVORITES) ?? '[]'))
      setHistory(JSON.parse(localStorage.getItem(LS_HISTORY) ?? '[]'))
    } catch {
      // ignore parse errors
    }
    setMounted(true)
  }, [])

  function saveName(newName: string) {
    setName(newName)
    localStorage.setItem(LS_NAME, newName)
  }

  function removeFilter(id: string) {
    const next = filters.filter((f) => f.id !== id)
    setFilters(next)
    localStorage.setItem(LS_FILTERS, JSON.stringify(next))
  }

  function removeFavorite(id: string) {
    const next = favorites.filter((f) => f.id !== id)
    setFavorites(next)
    localStorage.setItem(LS_FAVORITES, JSON.stringify(next))
  }

  function clearHistory() {
    setHistory([])
    localStorage.removeItem(LS_HISTORY)
  }

  function exportData() {
    const blob = new Blob(
      [JSON.stringify({ name, filters, favorites, history }, null, 2)],
      { type: 'application/json' },
    )
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'registra-brasil-perfil.json'
    a.click()
    URL.revokeObjectURL(url)
  }

  if (!mounted) {
    return <main className="max-w-3xl mx-auto px-4 py-12"><p className="text-gray-500">Carregando…</p></main>
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <Breadcrumbs items={[{ label: 'Meu perfil' }]} />
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Meu perfil</h1>
      <p className="text-gray-500 mb-8">
        Seus filtros salvos, favoritos e histórico de navegação ficam armazenados apenas neste navegador.
      </p>

      <section className="mb-10">
        <h2 className="text-xl font-semibold mb-3">Nome de exibição</h2>
        <input
          type="text"
          value={name}
          onChange={(e) => saveName(e.target.value)}
          placeholder="Como quer ser chamado(a)?"
          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </section>

      <section className="mb-10">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-xl font-semibold">Filtros salvos ({filters.length})</h2>
        </div>
        {filters.length === 0 ? (
          <p className="text-sm text-gray-500">
            Nenhum filtro salvo ainda. Salve buscas da página <Link href="/buscar" className="underline">Buscar</Link>.
          </p>
        ) : (
          <ul className="space-y-2">
            {filters.map((f) => (
              <li key={f.id} className="flex items-center justify-between bg-white border border-gray-200 rounded-lg px-4 py-3">
                <div>
                  <p className="font-medium text-gray-900">{f.name}</p>
                  <p className="text-xs text-gray-500 font-mono">{f.query}</p>
                </div>
                <button
                  onClick={() => removeFilter(f.id)}
                  className="text-sm text-red-600 hover:underline"
                >
                  Remover
                </button>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="mb-10">
        <h2 className="text-xl font-semibold mb-3">Favoritos ({favorites.length})</h2>
        {favorites.length === 0 ? (
          <p className="text-sm text-gray-500">Nenhum favorito salvo.</p>
        ) : (
          <ul className="space-y-2">
            {favorites.map((f) => (
              <li key={f.id} className="flex items-center justify-between bg-white border border-gray-200 rounded-lg px-4 py-3">
                <span className="text-gray-900">{f.label}</span>
                <button
                  onClick={() => removeFavorite(f.id)}
                  className="text-sm text-red-600 hover:underline"
                >
                  Remover
                </button>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="mb-10">
        <div className="flex items-center justify-between mb-3">
          <h2 className="text-xl font-semibold">Histórico ({history.length})</h2>
          {history.length > 0 && (
            <button onClick={clearHistory} className="text-sm text-red-600 hover:underline">
              Limpar histórico
            </button>
          )}
        </div>
        {history.length === 0 ? (
          <p className="text-sm text-gray-500">Sem histórico registrado.</p>
        ) : (
          <ul className="space-y-1 text-sm">
            {history.slice(0, 20).map((h, idx) => (
              <li key={idx}>
                <Link href={h.path} className="text-blue-600 hover:underline">{h.title || h.path}</Link>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2 className="text-xl font-semibold mb-3">Exportar dados</h2>
        <button
          onClick={exportData}
          className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
          Baixar JSON
        </button>
      </section>
    </main>
  )
}
