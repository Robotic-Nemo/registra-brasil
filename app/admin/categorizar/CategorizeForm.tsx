'use client'

import { FormEvent, useId, useState, useTransition } from 'react'
import { Loader2, Plus, Minus, AlertCircle, Check } from 'lucide-react'
import { bulkAddCategory, bulkRemoveCategory } from './actions'

interface Props {
  categories: Array<{ id: string; slug: string; label_pt: string; color_hex: string }>
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

async function resolveSlugs(rawLines: string[]): Promise<{ uuids: string[]; unresolved: string[] }> {
  const items = [...new Set(rawLines.map((l) => l.trim()).filter(Boolean))]
  const uuids: string[] = []
  const slugs: string[] = []
  for (const it of items) {
    if (UUID_RE.test(it)) uuids.push(it)
    else slugs.push(it)
  }
  if (slugs.length === 0) return { uuids, unresolved: [] }
  const res = await fetch('/api/admin/resolve-slugs', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ slugs }),
  })
  if (!res.ok) return { uuids, unresolved: slugs }
  const j = await res.json() as { resolved: Record<string, string> }
  const unresolved: string[] = []
  for (const s of slugs) {
    const id = j.resolved?.[s]
    if (id) uuids.push(id)
    else unresolved.push(s)
  }
  return { uuids, unresolved }
}

export function CategorizeForm({ categories }: Props) {
  const [ids, setIds] = useState('')
  const [catSlug, setCatSlug] = useState(categories[0]?.slug ?? '')
  const [isPrimary, setIsPrimary] = useState(false)
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [msg, setMsg] = useState<string | null>(null)
  const idsId = useId()
  const catId = useId()

  function lines(): string[] {
    return ids.split('\n').map((s) => s.trim()).filter(Boolean)
  }

  function run(mode: 'add' | 'remove') {
    setErr(null); setMsg(null)
    const raw = lines()
    if (raw.length === 0) { setErr('Cole ao menos uma linha.'); return }
    if (raw.length > 200) { setErr('Máximo 200 por lote.'); return }
    if (!catSlug) { setErr('Escolha uma categoria.'); return }

    start(async () => {
      try {
        const { uuids, unresolved } = await resolveSlugs(raw)
        if (uuids.length === 0) {
          setErr(`Nenhum ID/slug resolvido. Não encontrados: ${unresolved.slice(0, 5).join(', ')}`)
          return
        }

        if (mode === 'add') {
          const res = await bulkAddCategory(uuids, catSlug, isPrimary)
          let msg = `${res.added} nova(s) categorizada(s); ${res.skipped} já tinha(m).`
          if (unresolved.length) msg += ` Não resolvidas: ${unresolved.join(', ')}.`
          setMsg(msg)
        } else {
          const res = await bulkRemoveCategory(uuids, catSlug)
          let msg = `${res.removed} removida(s) da categoria.`
          if (res.skippedPrimary > 0) msg += ` ${res.skippedPrimary} era(m) primária(s) — não removida(s).`
          if (unresolved.length) msg += ` Não resolvidas: ${unresolved.join(', ')}.`
          setMsg(msg)
        }
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500'

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-4">
      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-2 flex gap-2 text-xs text-red-900">
          <AlertCircle className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}
      {msg && (
        <div className="bg-green-50 border border-green-200 rounded p-2 flex gap-2 text-xs text-green-900">
          <Check className="w-3.5 h-3.5 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{msg}</span>
        </div>
      )}

      <div>
        <label htmlFor={idsId} className="block text-xs font-medium text-gray-700 mb-1">
          IDs ou slugs de declarações (1 por linha, até 200)
        </label>
        <textarea
          id={idsId}
          rows={8}
          value={ids}
          onChange={(e) => setIds(e.target.value)}
          className={`${inputCls} font-mono text-xs`}
          placeholder={'abcdef12-...\nlula-amazonia-2023-07-15\n...'}
        />
        <p className="text-[11px] text-gray-500 mt-1">
          {lines().length} linha{lines().length === 1 ? '' : 's'} · slugs são resolvidos para UUIDs antes da ação.
        </p>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label htmlFor={catId} className="block text-xs font-medium text-gray-700 mb-1">Categoria</label>
          <select id={catId} value={catSlug} onChange={(e) => setCatSlug(e.target.value)} className={inputCls}>
            {categories.map((c) => (
              <option key={c.slug} value={c.slug}>{c.label_pt}</option>
            ))}
          </select>
        </div>
        <label className="inline-flex items-center gap-2 mt-5 text-sm text-gray-700 cursor-pointer">
          <input type="checkbox" checked={isPrimary} onChange={(e) => setIsPrimary(e.target.checked)} className="accent-blue-600" />
          Atribuir como primária (quando a declaração ainda não tem uma)
        </label>
      </div>

      <div className="flex gap-2">
        <button
          type="button"
          disabled={pending}
          onClick={() => run('add')}
          className="inline-flex items-center gap-1.5 px-4 py-2 bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white text-sm font-medium rounded"
        >
          {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Plus className="w-4 h-4" />}
          Adicionar categoria
        </button>
        <button
          type="button"
          disabled={pending}
          onClick={() => run('remove')}
          className="inline-flex items-center gap-1.5 px-4 py-2 bg-red-600 hover:bg-red-700 disabled:bg-gray-400 text-white text-sm font-medium rounded"
        >
          {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Minus className="w-4 h-4" />}
          Remover categoria
        </button>
      </div>
    </div>
  )
}
