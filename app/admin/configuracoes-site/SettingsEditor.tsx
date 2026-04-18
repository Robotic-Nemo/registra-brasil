'use client'

import { useState, useTransition } from 'react'
import { Loader2, Save, AlertCircle, Check } from 'lucide-react'
import { saveSetting } from './actions'

interface Row {
  key: string
  value: unknown
  description: string | null
  updated_at: string
  updated_by: string | null
}

export function SettingsEditor({ rows }: { rows: Row[] }) {
  return (
    <ul className="flex flex-col gap-4">
      {rows.map((r) => (
        <SettingRowEditor key={r.key} row={r} />
      ))}
    </ul>
  )
}

function SettingRowEditor({ row }: { row: Row }) {
  const [text, setText] = useState(JSON.stringify(row.value, null, 2))
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState(false)

  function onSave() {
    setErr(null); setOk(false)
    let parsed: unknown
    try { parsed = JSON.parse(text) } catch { setErr('JSON inválido.'); return }
    start(async () => {
      try {
        await saveSetting(row.key, parsed)
        setOk(true)
        setTimeout(() => setOk(false), 1500)
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  return (
    <li className="bg-white border border-gray-200 rounded-xl p-4">
      <div className="flex items-center justify-between gap-3 mb-2">
        <code className="font-mono text-sm font-semibold text-gray-900">{row.key}</code>
        <time className="text-[11px] text-gray-500">
          atualizado em {new Date(row.updated_at).toLocaleString('pt-BR')}
          {row.updated_by && ` · ${row.updated_by}`}
        </time>
      </div>
      {row.description && <p className="text-xs text-gray-600 mb-2">{row.description}</p>}
      <textarea
        value={text}
        onChange={(e) => { setText(e.target.value); setErr(null); setOk(false) }}
        rows={Math.min(8, text.split('\n').length + 1)}
        className="w-full font-mono text-xs px-3 py-2 border border-gray-300 rounded focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
        spellCheck={false}
      />
      {err && <p className="text-xs text-red-700 mt-1 inline-flex items-center gap-1"><AlertCircle className="w-3 h-3" aria-hidden="true" /> {err}</p>}
      <div className="flex items-center gap-2 mt-2">
        <button
          type="button"
          onClick={onSave}
          disabled={pending}
          className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-xs font-medium rounded"
        >
          {pending ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : ok ? <Check className="w-3.5 h-3.5" /> : <Save className="w-3.5 h-3.5" />}
          {ok ? 'Salvo' : 'Salvar'}
        </button>
      </div>
    </li>
  )
}
