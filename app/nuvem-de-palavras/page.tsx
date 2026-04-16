import type { Metadata } from 'next'
import { getSupabaseServiceClient } from '@/lib/supabase/server'

export const metadata: Metadata = {
  title: 'Nuvem de Palavras — Registra Brasil',
  description: 'Palavras mais frequentes nas declaracoes registradas.',
  alternates: { canonical: '/nuvem-de-palavras' },
}

// Portuguese stop words to exclude
const STOP_WORDS = new Set([
  'a', 'o', 'e', 'de', 'do', 'da', 'dos', 'das', 'em', 'no', 'na', 'nos', 'nas',
  'um', 'uma', 'uns', 'umas', 'por', 'para', 'com', 'sem', 'que', 'se', 'ao', 'ou',
  'mais', 'mas', 'foi', 'ser', 'ter', 'esta', 'este', 'isso', 'ele', 'ela', 'nos',
  'eu', 'voce', 'nao', 'sim', 'como', 'ja', 'sua', 'seu', 'tem', 'vai', 'sao',
  'muito', 'ate', 'sobre', 'entre', 'tambem', 'pode', 'quando', 'aqui', 'isso',
  'essa', 'esse', 'pela', 'pelo', 'todo', 'toda', 'todos', 'todas', 'bem', 'havia',
  'onde', 'qual', 'quem', 'temos', 'vamos', 'ainda', 'disse',
])

function extractWords(texts: string[]): Map<string, number> {
  const wordMap = new Map<string, number>()

  for (const text of texts) {
    const words = text
      .toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z\s]/g, '')
      .split(/\s+/)
      .filter((w) => w.length >= 3 && !STOP_WORDS.has(w))

    for (const word of words) {
      wordMap.set(word, (wordMap.get(word) ?? 0) + 1)
    }
  }

  return wordMap
}

function getWordSize(count: number, max: number, min: number): string {
  if (max === min) return 'text-lg'
  const ratio = (count - min) / (max - min)
  if (ratio > 0.8) return 'text-4xl font-bold'
  if (ratio > 0.6) return 'text-3xl font-semibold'
  if (ratio > 0.4) return 'text-2xl font-medium'
  if (ratio > 0.2) return 'text-xl'
  return 'text-base'
}

const WORD_COLORS = [
  'text-blue-600', 'text-green-600', 'text-purple-600', 'text-orange-600',
  'text-rose-600', 'text-cyan-600', 'text-amber-600', 'text-indigo-600',
  'text-teal-600', 'text-pink-600',
]

export default async function NuvemDePalavrasPage() {
  const supabase = getSupabaseServiceClient()

  const { data: statements } = await supabase
    .from('statements')
    .select('summary')
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: false })
    .limit(500)

  const texts = (statements ?? []).map((s) => (s as unknown as { summary: string }).summary)
  const wordMap = extractWords(texts)

  // Get top 80 words
  const sortedWords = Array.from(wordMap.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, 80)

  const maxCount = sortedWords[0]?.[1] ?? 1
  const minCount = sortedWords[sortedWords.length - 1]?.[1] ?? 1

  // Shuffle for visual variety
  const shuffled = [...sortedWords].sort(() => Math.random() - 0.5)

  return (
    <main className="max-w-5xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">
        Nuvem de Palavras
      </h1>
      <p className="text-gray-500 mb-8">
        Termos mais frequentes nas {texts.length} declaracoes mais recentes.
      </p>

      {shuffled.length === 0 ? (
        <div className="text-center py-16 text-gray-400">
          <p>Nenhuma declaracao encontrada para gerar a nuvem.</p>
        </div>
      ) : (
        <div
          className="flex flex-wrap items-center justify-center gap-x-4 gap-y-2 p-8 bg-white border border-gray-200 rounded-2xl min-h-[400px]"
          aria-label="Nuvem de palavras"
        >
          {shuffled.map(([word, count], index) => (
            <span
              key={word}
              className={`inline-block px-1 transition-opacity hover:opacity-70 cursor-default ${
                getWordSize(count, maxCount, minCount)
              } ${WORD_COLORS[index % WORD_COLORS.length]}`}
              title={`${word}: ${count} ocorrencia(s)`}
            >
              {word}
            </span>
          ))}
        </div>
      )}

      {/* Top words table */}
      {sortedWords.length > 0 && (
        <div className="mt-10">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">
            Top 20 palavras
          </h2>
          <div className="grid grid-cols-2 sm:grid-cols-4 gap-2">
            {sortedWords.slice(0, 20).map(([word, count], index) => (
              <div
                key={word}
                className="flex items-center justify-between bg-white border border-gray-200 rounded-lg px-3 py-2"
              >
                <span className="text-sm font-medium text-gray-700">
                  <span className="text-gray-300 mr-1.5">{index + 1}.</span>
                  {word}
                </span>
                <span className="text-xs text-gray-400 tabular-nums">{count}</span>
              </div>
            ))}
          </div>
        </div>
      )}
    </main>
  )
}
