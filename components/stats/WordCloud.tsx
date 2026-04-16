import type { WordFrequency } from '@/lib/utils/word-frequency'

interface WordCloudProps {
  words: WordFrequency[]
  maxFontSize?: number
  minFontSize?: number
  className?: string
}

const COLORS = [
  'text-blue-700', 'text-blue-600', 'text-blue-500',
  'text-emerald-600', 'text-emerald-500',
  'text-amber-600', 'text-amber-500',
  'text-rose-600', 'text-violet-600',
  'text-zinc-700', 'text-zinc-600',
]

export function WordCloud({
  words,
  maxFontSize = 32,
  minFontSize = 12,
  className = '',
}: WordCloudProps) {
  if (words.length === 0) {
    return <p className="text-sm text-zinc-500">Sem dados suficientes.</p>
  }

  // Shuffle for visual variety (deterministic based on word count)
  const shuffled = [...words].sort((a, b) => {
    const hashA = a.word.charCodeAt(0) + a.count
    const hashB = b.word.charCodeAt(0) + b.count
    return hashA - hashB
  })

  return (
    <div
      className={`flex flex-wrap items-center justify-center gap-x-3 gap-y-1 p-4 ${className}`}
      role="img"
      aria-label={`Nuvem de palavras com ${words.length} termos mais frequentes`}
    >
      {shuffled.map((w, i) => {
        const fontSize = minFontSize + w.weight * (maxFontSize - minFontSize)
        const colorClass = COLORS[i % COLORS.length]
        const opacity = 0.5 + w.weight * 0.5

        return (
          <span
            key={w.word}
            className={`inline-block ${colorClass} font-medium transition-transform hover:scale-110 cursor-default`}
            style={{ fontSize: `${fontSize}px`, opacity }}
            title={`${w.word}: ${w.count} ocorrências`}
          >
            {w.word}
          </span>
        )
      })}
    </div>
  )
}
