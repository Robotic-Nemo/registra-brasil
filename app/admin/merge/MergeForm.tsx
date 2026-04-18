'use client'

import Link from 'next/link'
import { FormEvent, useId, useMemo, useState, useTransition } from 'react'
import { Loader2, AlertTriangle, Merge, AlertCircle } from 'lucide-react'
import { mergeStatements } from './actions'

interface Stmt {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string
  venue: string | null
  event_name: string | null
  verification_status: string
  severity_score: number | null
  minors_involved: boolean | null
  primary_source_url: string
  primary_source_type: string
  editor_notes: string | null
  created_at: string
  politicians: { id: string; slug: string; common_name: string; party: string; state: string | null } | null
}

interface FieldDiff {
  key: string
  label: string
  a: unknown
  b: unknown
  differ: boolean
}

interface Props {
  a: Stmt
  b: Stmt
  fields: FieldDiff[]
}

function formatValue(v: unknown): string {
  if (v === null || v === undefined) return '—'
  if (typeof v === 'boolean') return v ? 'sim' : 'não'
  const s = String(v)
  return s.length > 400 ? s.slice(0, 400) + '…' : s
}

export function MergeForm({ a, b, fields }: Props) {
  const [keeper, setKeeper] = useState<'a' | 'b'>('a')
  // Default per-field pick = keeper side. User can flip individually.
  const [picks, setPicks] = useState<Record<string, 'a' | 'b'>>(() => {
    const init: Record<string, 'a' | 'b'> = {}
    for (const f of fields) init[f.key] = 'a'
    return init
  })
  const [reason, setReason] = useState('')
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)

  const reasonId = useId()

  function setKeeperSide(side: 'a' | 'b') {
    setKeeper(side)
    setPicks((p) => {
      const next = { ...p }
      for (const f of fields) if (!f.differ) next[f.key] = side
      // For diffing fields, leave user's current pick alone.
      return next
    })
  }

  const fieldPicks = useMemo(() => picks, [picks])

  function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setErr(null)

    const keeperStmt = keeper === 'a' ? a : b
    const removedStmt = keeper === 'a' ? b : a

    if (keeperStmt.politicians?.id !== removedStmt.politicians?.id) {
      if (!confirm('Os políticos são diferentes. Continuar vai atribuir ambas as declarações ao político da declaração retida. OK?')) return
    }

    // Build field_values for the keeper row: for each field, if pick ≠ keeper, override.
    const field_values: Record<string, unknown> = {}
    for (const f of fields) {
      const desiredSide = fieldPicks[f.key]
      if (desiredSide !== keeper) {
        const val = desiredSide === 'a' ? a[f.key as keyof Stmt] : b[f.key as keyof Stmt]
        field_values[f.key] = val
      }
    }
    // Always inherit keeper's politician id (no override option here to
    // keep editorial clarity). If user picked fields across both, politician
    // stays as keeper's.

    start(async () => {
      try {
        await mergeStatements({
          keeper_id: keeperStmt.id,
          removed_id: removedStmt.id,
          field_values,
          reason,
        })
      } catch (ex) {
        setErr(ex instanceof Error ? ex.message : 'Erro')
      }
    })
  }

  const keeperStmt = keeper === 'a' ? a : b
  const removedStmt = keeper === 'a' ? b : a

  return (
    <form onSubmit={onSubmit} className="space-y-5">
      <section className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {(['a', 'b'] as const).map((side) => {
          const s = side === 'a' ? a : b
          const isKeeper = keeper === side
          return (
            <label
              key={side}
              className={`block border rounded-xl p-4 cursor-pointer transition-all ${
                isKeeper ? 'border-purple-500 bg-purple-50' : 'border-gray-200 bg-white hover:border-gray-300'
              }`}
            >
              <div className="flex items-center justify-between mb-2">
                <span className="text-xs font-semibold uppercase tracking-wider text-gray-500">
                  Declaração {side.toUpperCase()}
                </span>
                <input
                  type="radio"
                  name="keeper"
                  checked={isKeeper}
                  onChange={() => setKeeperSide(side)}
                  className="accent-purple-600"
                />
              </div>
              <p className="text-sm font-semibold text-gray-900 mb-1">
                {s.politicians ? `${s.politicians.common_name} (${s.politicians.party}${s.politicians.state ? '-' + s.politicians.state : ''})` : '—'}
              </p>
              <p className="text-xs text-gray-500 mb-1">{s.statement_date} · {s.verification_status}</p>
              <p className="text-sm text-gray-800">{s.summary.slice(0, 200)}{s.summary.length > 200 ? '…' : ''}</p>
              <p className="text-[11px] text-gray-500 mt-2">
                <Link href={`/admin/editar/${s.id}`} target="_blank" className="underline">Editar</Link>
                {' · '}
                <Link href={`/declaracao/${s.slug ?? s.id}`} target="_blank" className="underline">Ver pública</Link>
              </p>
              {isKeeper && <p className="mt-2 text-xs font-semibold text-purple-700">← Esta permanece</p>}
            </label>
          )
        })}
      </section>

      <section className="bg-white border border-gray-200 rounded-xl p-5">
        <h2 className="text-sm font-semibold text-gray-900 mb-3">Campos</h2>
        <p className="text-xs text-gray-600 mb-3">
          Campos com valores diferentes destacados em amarelo. Escolha por-campo; o padrão segue a
          declaração retida.
        </p>
        <table className="w-full text-sm">
          <thead>
            <tr className="text-left text-xs text-gray-500 uppercase">
              <th className="pb-1.5">Campo</th>
              <th className="pb-1.5">Valor em A</th>
              <th className="pb-1.5">Valor em B</th>
              <th className="pb-1.5 w-24">Usar</th>
            </tr>
          </thead>
          <tbody>
            {fields.map((f) => (
              <tr key={f.key} className={`border-t border-gray-100 ${f.differ ? 'bg-yellow-50' : ''}`}>
                <td className="py-1.5 pr-3 font-mono text-xs text-gray-700">{f.label}</td>
                <td className={`py-1.5 pr-3 text-xs ${fieldPicks[f.key] === 'a' ? 'text-gray-900 font-medium' : 'text-gray-500'}`}>
                  {formatValue(f.a)}
                </td>
                <td className={`py-1.5 pr-3 text-xs ${fieldPicks[f.key] === 'b' ? 'text-gray-900 font-medium' : 'text-gray-500'}`}>
                  {formatValue(f.b)}
                </td>
                <td className="py-1.5">
                  <div className="flex gap-2 text-xs">
                    {(['a', 'b'] as const).map((side) => (
                      <label key={side} className={`inline-flex items-center gap-1 cursor-pointer ${fieldPicks[f.key] === side ? 'text-purple-700 font-semibold' : 'text-gray-600'}`}>
                        <input
                          type="radio"
                          name={`f-${f.key}`}
                          checked={fieldPicks[f.key] === side}
                          onChange={() => setPicks((p) => ({ ...p, [f.key]: side }))}
                          className="accent-purple-600"
                        />
                        {side.toUpperCase()}
                      </label>
                    ))}
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>

      <section className="bg-red-50 border border-red-200 rounded-xl p-4">
        <div className="flex items-start gap-2 mb-3 text-sm text-red-900">
          <AlertTriangle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <div>
            <p className="font-semibold">Efeito</p>
            <ul className="list-disc pl-5 mt-1 text-xs space-y-0.5">
              <li>Campos selecionados são aplicados à <strong>{keeperStmt.slug ?? keeperStmt.id.slice(0, 8)}</strong> (retida)</li>
              <li>Checagens externas, reações, coleções, histórias, retratações e submissões de <strong>{removedStmt.slug ?? removedStmt.id.slice(0, 8)}</strong> são re-parentadas</li>
              <li>A retida <strong>{removedStmt.slug ?? removedStmt.id.slice(0, 8)}</strong> fica com <code>verification_status=removed</code> + nota apontando para a retida</li>
              <li>Trigger de revisão registra a mudança em ambas</li>
            </ul>
          </div>
        </div>
        <div>
          <label htmlFor={reasonId} className="block text-xs font-medium text-red-900 mb-1">Motivo (obrigatório, ≥3 caracteres)</label>
          <input
            id={reasonId}
            type="text"
            maxLength={300}
            required
            value={reason}
            onChange={(e) => setReason(e.target.value)}
            placeholder="Ex.: mesma declaração capturada duas vezes por fontes diferentes"
            className="w-full px-3 py-2 border border-red-300 rounded text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-red-500"
          />
        </div>
      </section>

      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-3 flex gap-2 text-sm text-red-900">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}

      <div className="flex gap-2">
        <button
          type="submit"
          disabled={pending || reason.trim().length < 3}
          className="inline-flex items-center gap-1.5 px-4 py-2 bg-purple-700 hover:bg-purple-800 disabled:bg-gray-400 text-white text-sm font-medium rounded-lg"
        >
          {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Merge className="w-4 h-4" />}
          Mesclar
        </button>
        <Link href="/admin/duplicatas" className="px-4 py-2 border border-gray-300 text-gray-700 hover:bg-gray-50 text-sm rounded-lg">
          Cancelar
        </Link>
      </div>
    </form>
  )
}
