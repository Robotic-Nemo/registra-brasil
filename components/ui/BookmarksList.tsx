'use client'

import Link from 'next/link'
import { useRef, useState } from 'react'
import { Bookmark, Trash2, Download, Upload, AlertCircle } from 'lucide-react'
import { useBookmarks, type BookmarkItem } from '@/lib/hooks/useBookmarks'

function itemHref(item: BookmarkItem): string {
  if (item.type === 'politician') return `/politico/${item.slug}`
  return `/declaracao/${item.slug}`
}

function downloadJson(data: unknown, filename: string) {
  const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = filename
  document.body.appendChild(a)
  a.click()
  document.body.removeChild(a)
  URL.revokeObjectURL(url)
}

export function BookmarksList() {
  const { bookmarks, removeBookmark, clearAll, addBookmark } = useBookmarks()
  const fileInput = useRef<HTMLInputElement>(null)
  const [importMsg, setImportMsg] = useState<string | null>(null)
  const [importErr, setImportErr] = useState<string | null>(null)

  function onExport() {
    const today = new Date().toISOString().slice(0, 10)
    downloadJson(
      {
        source: 'Registra Brasil',
        exported_at: new Date().toISOString(),
        version: 1,
        items: bookmarks,
      },
      `registra-brasil-favoritos-${today}.json`,
    )
  }

  async function onImport(e: React.ChangeEvent<HTMLInputElement>) {
    setImportMsg(null)
    setImportErr(null)
    const file = e.target.files?.[0]
    if (!file) return
    if (file.size > 500_000) {
      setImportErr('Arquivo grande demais (máx 500 KB).')
      e.target.value = ''
      return
    }
    try {
      const text = await file.text()
      const parsed = JSON.parse(text)
      const items: unknown = Array.isArray(parsed) ? parsed : parsed?.items
      if (!Array.isArray(items)) { setImportErr('Formato inválido.'); return }
      let added = 0
      for (const raw of items) {
        if (typeof raw !== 'object' || raw === null) continue
        const r = raw as Partial<BookmarkItem>
        if (typeof r.id !== 'string' || typeof r.slug !== 'string' || typeof r.title !== 'string') continue
        if (r.type !== 'statement' && r.type !== 'politician') continue
        addBookmark({ id: r.id, slug: r.slug, title: r.title.slice(0, 300), type: r.type })
        added++
      }
      setImportMsg(`Importados ${added} favoritos.`)
    } catch {
      setImportErr('Não foi possível ler o arquivo.')
    } finally {
      e.target.value = ''
    }
  }

  if (bookmarks.length === 0) {
    return (
      <div className="text-center py-12">
        <Bookmark className="h-12 w-12 mx-auto text-gray-300 mb-4" aria-hidden="true" />
        <p className="text-gray-500">Nenhum favorito salvo ainda.</p>
        <p className="text-sm text-gray-400 mt-1">
          Use o botão de salvar em declarações e políticos para adicioná-los aqui.
        </p>

        <div className="mt-6 text-left max-w-sm mx-auto bg-gray-50 border border-gray-200 rounded-lg p-3 text-xs text-gray-600">
          <p className="font-semibold text-gray-900 mb-1">Restaurar de um backup?</p>
          <input
            ref={fileInput}
            type="file"
            accept="application/json,.json"
            onChange={onImport}
            className="block w-full text-xs text-gray-600"
          />
          {importMsg && <p className="text-green-700 mt-1">{importMsg}</p>}
          {importErr && (
            <p className="text-red-700 mt-1 inline-flex items-center gap-1" role="alert">
              <AlertCircle className="w-3 h-3" aria-hidden="true" /> {importErr}
            </p>
          )}
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between flex-wrap gap-2">
        <p className="text-sm text-gray-500">
          {bookmarks.length} {bookmarks.length === 1 ? 'item salvo' : 'itens salvos'}
        </p>
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={onExport}
            className="text-xs inline-flex items-center gap-1 px-2 py-1 border border-gray-300 text-gray-700 hover:bg-gray-50 rounded"
          >
            <Download className="w-3.5 h-3.5" aria-hidden="true" />
            Exportar
          </button>
          <label className="text-xs inline-flex items-center gap-1 px-2 py-1 border border-gray-300 text-gray-700 hover:bg-gray-50 rounded cursor-pointer">
            <Upload className="w-3.5 h-3.5" aria-hidden="true" />
            Importar
            <input
              ref={fileInput}
              type="file"
              accept="application/json,.json"
              onChange={onImport}
              className="sr-only"
            />
          </label>
          <button
            type="button"
            onClick={clearAll}
            className="text-xs text-red-600 hover:text-red-800 flex items-center gap-1"
            aria-label="Remover todos os favoritos"
          >
            <Trash2 className="h-3.5 w-3.5" aria-hidden="true" />
            Limpar tudo
          </button>
        </div>
      </div>

      {importMsg && <p className="text-xs text-green-700 bg-green-50 border border-green-200 rounded p-2">{importMsg}</p>}
      {importErr && <p className="text-xs text-red-700 bg-red-50 border border-red-200 rounded p-2" role="alert">{importErr}</p>}

      <ul className="divide-y divide-gray-100" role="list">
        {bookmarks.map((item) => (
          <li key={`${item.type}-${item.id}`} className="group flex items-center gap-3 py-3">
            <span className="shrink-0 text-xs font-medium uppercase text-gray-400 w-20">
              {item.type === 'politician' ? 'Político' : 'Declaração'}
            </span>
            <Link
              href={itemHref(item)}
              className="flex-1 text-sm font-medium text-gray-700 hover:text-blue-700 truncate transition-colors"
            >
              {item.title}
            </Link>
            <time className="hidden sm:block text-xs text-gray-400" dateTime={item.addedAt}>
              {new Date(item.addedAt).toLocaleDateString('pt-BR')}
            </time>
            <button
              type="button"
              onClick={() => removeBookmark(item.id, item.type)}
              className="opacity-60 group-hover:opacity-100 p-1 text-gray-400 hover:text-red-500 transition-all"
              aria-label={`Remover ${item.title} dos favoritos`}
            >
              <Trash2 className="h-4 w-4" />
            </button>
          </li>
        ))}
      </ul>

      <p className="text-xs text-gray-500 border-t border-gray-100 pt-3">
        Favoritos ficam só neste navegador (LocalStorage). Exporte um JSON para migrar entre
        dispositivos.
      </p>
    </div>
  )
}
