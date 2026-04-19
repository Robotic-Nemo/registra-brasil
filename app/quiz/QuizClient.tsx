'use client'

import { useCallback, useEffect, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Sparkles, RefreshCcw } from 'lucide-react'

interface Option {
  id: string
  slug: string
  common_name: string
  party: string | null
  state: string | null
  photo_url: string | null
}

interface Round {
  statement: { id: string; slug: string | null; statement_date: string; quote: string }
  answer_id: string
  answer_slug: string
  answer_name: string
  options: Option[]
}

function fmtDate(iso: string): string {
  return new Date(iso + 'T12:00:00Z').toLocaleDateString('pt-BR', {
    year: 'numeric', month: 'long', day: '2-digit',
  })
}

export function QuizClient() {
  const [round, setRound] = useState<Round | null>(null)
  const [selected, setSelected] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [score, setScore] = useState({ right: 0, total: 0 })

  const load = useCallback(async () => {
    setLoading(true)
    setSelected(null)
    try {
      const r = await fetch('/api/quiz', { cache: 'no-store' })
      if (!r.ok) throw new Error('fail')
      const data = (await r.json()) as Round
      setRound(data)
    } catch {
      setRound(null)
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { load() }, [load])

  function pick(id: string) {
    if (selected || !round) return
    setSelected(id)
    setScore((s) => ({
      right: s.right + (id === round.answer_id ? 1 : 0),
      total: s.total + 1,
    }))
  }

  const revealed = selected !== null

  if (loading && !round) {
    return <p className="text-sm text-gray-500">Carregando pergunta…</p>
  }
  if (!round) {
    return (
      <div className="rounded-lg border border-gray-200 bg-gray-50 p-4 text-sm">
        <p>Não consegui carregar o quiz agora. Tente de novo em alguns segundos.</p>
        <button onClick={load} className="mt-2 rounded bg-indigo-600 px-3 py-1 text-white">Recarregar</button>
      </div>
    )
  }

  return (
    <section>
      <header className="mb-3 flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
        <span>Declaração de {fmtDate(round.statement.statement_date)}</span>
        <span>
          Acertos: <strong className="tabular-nums">{score.right}</strong> / {score.total}
        </span>
      </header>

      <blockquote className="mb-5 rounded-xl border-l-4 border-indigo-500 bg-indigo-50/50 p-5 text-base font-medium leading-relaxed text-gray-900 dark:border-indigo-400 dark:bg-indigo-950/30 dark:text-gray-100">
        “{round.statement.quote}”
      </blockquote>

      <h2 className="mb-3 text-sm font-semibold text-gray-900 dark:text-gray-100">
        Quem disse?
      </h2>

      <ul className="mb-5 grid grid-cols-1 gap-2 sm:grid-cols-2">
        {round.options.map((o) => {
          const isAnswer = o.id === round.answer_id
          const isChosen = o.id === selected
          let toneClass = 'border-gray-200 bg-white hover:border-indigo-400 dark:border-gray-800 dark:bg-gray-900 dark:hover:border-indigo-500'
          if (revealed) {
            if (isAnswer) toneClass = 'border-emerald-400 bg-emerald-50 dark:border-emerald-600 dark:bg-emerald-950/40'
            else if (isChosen) toneClass = 'border-rose-400 bg-rose-50 dark:border-rose-600 dark:bg-rose-950/40'
            else toneClass = 'border-gray-200 bg-gray-50 opacity-60 dark:border-gray-800 dark:bg-gray-950'
          }
          return (
            <li key={o.id}>
              <button
                type="button"
                onClick={() => pick(o.id)}
                disabled={revealed}
                className={`flex w-full items-center gap-3 rounded-xl border p-3 text-left transition ${toneClass} disabled:cursor-default`}
              >
                {o.photo_url ? (
                  <Image src={o.photo_url} alt="" width={40} height={40} unoptimized className="h-10 w-10 shrink-0 rounded-full object-cover" />
                ) : (
                  <span className="h-10 w-10 shrink-0 rounded-full bg-gray-200 dark:bg-gray-800" />
                )}
                <div className="min-w-0 flex-1">
                  <div className="truncate font-medium text-gray-900 dark:text-gray-100">{o.common_name}</div>
                  <div className="truncate text-xs text-gray-500 dark:text-gray-400">
                    {o.party ?? '—'}{o.state ? `-${o.state}` : ''}
                  </div>
                </div>
                {revealed && isAnswer && <span className="text-xs font-bold text-emerald-700 dark:text-emerald-300">✓ Resposta</span>}
                {revealed && isChosen && !isAnswer && <span className="text-xs font-bold text-rose-700 dark:text-rose-300">✗ Sua escolha</span>}
              </button>
            </li>
          )
        })}
      </ul>

      {revealed && (
        <div className="mb-5 rounded-lg border border-gray-200 bg-white p-4 text-sm dark:border-gray-800 dark:bg-gray-900">
          <p className="mb-2">
            Resposta:{' '}
            <Link href={`/politico/${round.answer_slug}`} className="font-medium text-indigo-700 hover:underline dark:text-indigo-300">
              {round.answer_name}
            </Link>
          </p>
          <Link
            href={`/declaracao/${round.statement.slug ?? round.statement.id}`}
            className="text-xs text-indigo-700 hover:underline dark:text-indigo-300"
          >
            Ver registro completo →
          </Link>
        </div>
      )}

      <button
        type="button"
        onClick={load}
        disabled={loading}
        className="inline-flex items-center gap-1 rounded-full bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700 disabled:opacity-50"
      >
        <RefreshCcw className="h-4 w-4" aria-hidden />
        {loading ? 'Carregando…' : revealed ? 'Próxima pergunta' : 'Pular esta'}
      </button>

      <p className="mt-6 text-xs text-gray-500 dark:text-gray-500">
        <Sparkles className="mr-1 inline h-3 w-3" aria-hidden />
        Todas as perguntas vêm de declarações verificadas do arquivo. Nenhuma
        resposta é enviada para o servidor — o placar fica só na sua sessão.
      </p>
    </section>
  )
}
