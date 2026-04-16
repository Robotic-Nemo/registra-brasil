const STOP_WORDS_PT = new Set([
  'a', 'o', 'e', 'é', 'de', 'do', 'da', 'dos', 'das', 'em', 'no', 'na', 'nos', 'nas',
  'um', 'uma', 'uns', 'umas', 'por', 'para', 'com', 'sem', 'sobre', 'entre',
  'que', 'se', 'não', 'mais', 'mas', 'ou', 'como', 'ao', 'à', 'aos', 'às',
  'esse', 'essa', 'esses', 'essas', 'este', 'esta', 'estes', 'estas',
  'aquele', 'aquela', 'aqueles', 'aquelas', 'isso', 'isto', 'aquilo',
  'ele', 'ela', 'eles', 'elas', 'eu', 'nós', 'vocês', 'você', 'tu',
  'meu', 'minha', 'seu', 'sua', 'nosso', 'nossa', 'seus', 'suas',
  'ter', 'ser', 'estar', 'ir', 'foi', 'tem', 'são', 'está', 'vai',
  'já', 'muito', 'também', 'só', 'ainda', 'então', 'porque', 'quando',
  'aqui', 'ali', 'lá', 'onde', 'todo', 'toda', 'todos', 'todas',
  'pode', 'vai', 'vou', 'vamos', 'temos', 'tem', 'tinha', 'havia',
  'nenhum', 'nenhuma', 'cada', 'algum', 'alguma', 'outro', 'outra',
  'mesmo', 'mesma', 'próprio', 'própria', 'qual', 'quais', 'quanto',
])

export interface WordFrequency {
  word: string
  count: number
  weight: number
}

/**
 * Extract word frequencies from text, excluding Portuguese stop words
 */
export function getWordFrequencies(
  text: string,
  options: { minLength?: number; maxWords?: number } = {}
): WordFrequency[] {
  const { minLength = 3, maxWords = 100 } = options

  const words = text
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z\s]/g, ' ')
    .split(/\s+/)
    .filter(w => w.length >= minLength && !STOP_WORDS_PT.has(w))

  const freq = new Map<string, number>()
  for (const word of words) {
    freq.set(word, (freq.get(word) ?? 0) + 1)
  }

  const sorted = Array.from(freq.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, maxWords)

  const maxCount = sorted[0]?.[1] ?? 1

  return sorted.map(([word, count]) => ({
    word,
    count,
    weight: count / maxCount,
  }))
}

/**
 * Combine word frequencies from multiple texts
 */
export function combineFrequencies(texts: string[], maxWords = 100): WordFrequency[] {
  const combined = texts.join(' ')
  return getWordFrequencies(combined, { maxWords })
}
