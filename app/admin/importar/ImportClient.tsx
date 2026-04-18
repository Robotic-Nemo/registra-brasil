'use client'

import { useRef, useState, useTransition, useId } from 'react'
import { Loader2, CheckCircle2, AlertCircle, FileUp } from 'lucide-react'
import { previewImport, commitImport, type ImportPreviewResult } from './actions'

type Phase = 'idle' | 'previewing' | 'previewed' | 'committing' | 'done' | 'error'

/**
 * Two-phase importer: upload → preview → confirm → commit.
 * Keeps the CSV text in component state between phases so we never
 * need to re-upload when committing.
 */
export function ImportClient() {
  const [phase, setPhase] = useState<Phase>('idle')
  const [csvText, setCsvText] = useState<string>('')
  const [filename, setFilename] = useState<string>('')
  const [preview, setPreview] = useState<ImportPreviewResult | null>(null)
  const [result, setResult] = useState<{ created: number; skipped: number; errored: number; batchId: string } | null>(null)
  const [errorMsg, setErrorMsg] = useState<string | null>(null)
  const [note, setNote] = useState<string>('')
  const [pending, start] = useTransition()
  const fileInput = useRef<HTMLInputElement>(null)
  const noteId = useId()

  function onFile(e: React.ChangeEvent<HTMLInputElement>) {
    const f = e.target.files?.[0]
    if (!f) return
    if (f.size > 5 * 1024 * 1024) {
      setErrorMsg('Arquivo maior que 5 MB.')
      return
    }
    const reader = new FileReader()
    reader.onload = () => {
      const text = typeof reader.result === 'string' ? reader.result : ''
      setCsvText(text)
      setFilename(f.name)
      setPhase('previewing')
      setErrorMsg(null)
      start(async () => {
        try {
          const p = await previewImport(text, f.name)
          setPreview(p)
          setPhase('previewed')
        } catch (err) {
          setErrorMsg(err instanceof Error ? err.message : 'Erro no preview')
          setPhase('error')
        }
      })
    }
    reader.readAsText(f, 'utf-8')
  }

  function onCommit() {
    if (!csvText || !preview) return
    setPhase('committing')
    setErrorMsg(null)
    start(async () => {
      try {
        const r = await commitImport(csvText, filename, note)
        setResult(r)
        setPhase('done')
      } catch (err) {
        setErrorMsg(err instanceof Error ? err.message : 'Erro ao salvar')
        setPhase('error')
      }
    })
  }

  function reset() {
    setPhase('idle')
    setCsvText('')
    setFilename('')
    setPreview(null)
    setResult(null)
    setErrorMsg(null)
    setNote('')
    if (fileInput.current) fileInput.current.value = ''
  }

  return (
    <div className="space-y-6">
      <section className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
        <h2 className="text-sm font-semibold text-gray-900">1. Selecionar CSV</h2>
        <p className="text-xs text-gray-600">
          Colunas esperadas (header case-insensitive):{' '}
          <code className="bg-gray-100 px-1 rounded">politico_slug,resumo,data,fonte_url,fonte_tipo</code>.{' '}
          Opcional:{' '}
          <code className="bg-gray-100 px-1 rounded">citacao,contexto,local,evento,status,severidade,categorias</code>.
          Tamanho máx: 5 MB. O mesmo CSV nunca é importado duas vezes (checksum).
        </p>
        <label className="inline-flex items-center gap-2 px-3 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm rounded cursor-pointer w-fit">
          <FileUp className="w-4 h-4" aria-hidden="true" />
          Escolher arquivo
          <input ref={fileInput} type="file" accept=".csv,text/csv" onChange={onFile} className="sr-only" />
        </label>
        {filename && <p className="text-xs text-gray-500">Arquivo: <code>{filename}</code> ({(csvText.length / 1024).toFixed(1)} KB)</p>}
      </section>

      {phase === 'previewing' && (
        <p className="text-sm text-gray-600 flex items-center gap-2">
          <Loader2 className="w-4 h-4 animate-spin" /> Validando linhas…
        </p>
      )}

      {errorMsg && (
        <div className="bg-red-50 border border-red-200 rounded p-3 flex gap-2 text-sm text-red-900">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{errorMsg}</span>
        </div>
      )}

      {preview && (phase === 'previewed' || phase === 'committing' || phase === 'error') && (
        <section className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <h2 className="text-sm font-semibold text-gray-900">2. Pré-visualização</h2>

          {preview.alreadyImported && (
            <p className="text-sm text-amber-800 bg-amber-50 border border-amber-200 rounded p-2">
              Este arquivo já foi importado antes (checksum igual). A importação será recusada.
            </p>
          )}

          <div className="grid grid-cols-3 gap-3 text-center text-sm">
            <div className="bg-green-50 border border-green-200 rounded p-2">
              <p className="text-xl font-bold text-green-700 tabular-nums">{preview.okRows.length}</p>
              <p className="text-xs text-green-800">válidas</p>
            </div>
            <div className="bg-red-50 border border-red-200 rounded p-2">
              <p className="text-xl font-bold text-red-700 tabular-nums">{preview.errorRows.length}</p>
              <p className="text-xs text-red-800">com erro</p>
            </div>
            <div className="bg-amber-50 border border-amber-200 rounded p-2">
              <p className="text-xl font-bold text-amber-700 tabular-nums">
                {preview.okRows.filter((r) => !r.politician_id).length}
              </p>
              <p className="text-xs text-amber-800">sem político mapeado</p>
            </div>
          </div>

          {preview.parseErrors.length > 0 && (
            <div className="text-xs text-red-800 bg-red-50 border border-red-200 rounded p-2">
              <strong>Erros de parsing:</strong>
              <ul className="list-disc pl-5">{preview.parseErrors.map((e, i) => <li key={i}>{e}</li>)}</ul>
            </div>
          )}

          {preview.errorRows.length > 0 && (
            <details className="text-xs text-gray-700">
              <summary className="cursor-pointer font-semibold">Ver erros linha-a-linha ({preview.errorRows.length})</summary>
              <ul className="mt-2 space-y-1">
                {preview.errorRows.slice(0, 50).map((er) => (
                  <li key={er.line} className="font-mono">
                    linha {er.line}: <span className="text-red-700">{er.errors.join('; ')}</span>
                  </li>
                ))}
                {preview.errorRows.length > 50 && <li className="italic">…+{preview.errorRows.length - 50} linhas</li>}
              </ul>
            </details>
          )}

          {preview.okRows.length > 0 && (
            <details className="text-xs text-gray-700">
              <summary className="cursor-pointer font-semibold">Ver primeiras 10 linhas válidas</summary>
              <ul className="mt-2 space-y-1">
                {preview.okRows.slice(0, 10).map((r) => (
                  <li key={r.line} className="font-mono">
                    linha {r.line}: <span className="text-gray-900">[{r.politician_id ? '✓' : '✗'} {r.politician_label}]</span>{' '}
                    {r.row.summary.slice(0, 80)}{r.row.summary.length > 80 ? '…' : ''}
                  </li>
                ))}
              </ul>
            </details>
          )}

          <div>
            <label htmlFor={noteId} className="block text-xs font-medium text-gray-700 mb-1">Nota (opcional)</label>
            <input
              id={noteId}
              type="text"
              maxLength={500}
              value={note}
              onChange={(e) => setNote(e.target.value)}
              placeholder="Ex.: Lote de declarações da semana — março/2026"
              className="w-full px-3 py-2 border border-gray-300 rounded text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500"
            />
          </div>

          <div className="flex gap-2">
            <button
              type="button"
              onClick={onCommit}
              disabled={pending || preview.alreadyImported || preview.okRows.filter((r) => r.politician_id).length === 0}
              className="inline-flex items-center gap-1.5 px-4 py-2 bg-green-600 hover:bg-green-700 disabled:bg-gray-400 text-white text-sm font-medium rounded"
            >
              {phase === 'committing' ? <Loader2 className="w-4 h-4 animate-spin" /> : <CheckCircle2 className="w-4 h-4" />}
              Confirmar e importar
            </button>
            <button
              type="button"
              onClick={reset}
              className="px-4 py-2 border border-gray-300 text-gray-700 hover:bg-gray-50 text-sm rounded"
            >
              Cancelar
            </button>
          </div>
        </section>
      )}

      {phase === 'done' && result && (
        <section className="bg-green-50 border border-green-200 rounded-xl p-5 space-y-2">
          <h2 className="text-sm font-semibold text-green-900 flex items-center gap-2">
            <CheckCircle2 className="w-5 h-5 text-green-700" /> Importação concluída
          </h2>
          <p className="text-sm text-green-900">
            <strong>{result.created}</strong> declarações criadas
            {result.skipped > 0 && `, ${result.skipped} puladas`}
            {result.errored > 0 && `, ${result.errored} com erro`}.
          </p>
          <p className="text-xs text-green-800">
            Batch: <code className="bg-green-100 px-1 rounded">{result.batchId.slice(0, 12)}</code>
          </p>
          <button type="button" onClick={reset} className="text-xs underline text-green-800">
            Importar outro arquivo
          </button>
        </section>
      )}
    </div>
  )
}
