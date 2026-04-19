/**
 * Cheap, dependency-free Portuguese text analysis used by
 * /politico/[slug]/vocabulario. Not production NLP — just a
 * solid "stopword filter → tokens → n-grams" pipeline good
 * enough for word-frequency charts and over-index comparisons.
 */

export const PT_STOPWORDS = new Set<string>([
  // Articles / prepositions / common particles
  'a', 'o', 'e', 'de', 'do', 'da', 'dos', 'das', 'em', 'no', 'na', 'nos', 'nas',
  'um', 'uma', 'uns', 'umas', 'por', 'para', 'com', 'sem', 'que', 'se', 'ao', 'aos',
  'ou', 'mas', 'mais', 'menos', 'ja', 'nao', 'nem', 'tambem', 'como', 'quando',
  'onde', 'qual', 'quais', 'quem', 'aqui', 'ali', 'la', 'ca', 'assim', 'pois',
  'porem', 'ainda', 'apos', 'antes', 'depois', 'sobre', 'entre', 'ate', 'desde',
  'durante', 'contra', 'pela', 'pelo', 'pelas', 'pelos',
  // Pronouns
  'eu', 'tu', 'ele', 'ela', 'nos', 'vos', 'eles', 'elas', 'voce', 'voces',
  'meu', 'minha', 'meus', 'minhas', 'teu', 'tua', 'teus', 'tuas',
  'seu', 'sua', 'seus', 'suas', 'nosso', 'nossa', 'nossos', 'nossas',
  'esse', 'essa', 'esses', 'essas', 'este', 'esta', 'estes', 'estas',
  'aquele', 'aquela', 'aqueles', 'aquelas', 'isso', 'isto', 'aquilo',
  'me', 'te', 'lhe', 'nos', 'vos', 'lhes', 'se', 'si',
  // Common verbs
  'ser', 'estar', 'ter', 'haver', 'ir', 'vir', 'fazer', 'dizer', 'ver',
  'e', 'sao', 'foi', 'foram', 'era', 'eram', 'sera', 'serao', 'seja', 'sejam',
  'esta', 'estao', 'estava', 'estavam', 'esteve', 'estive', 'estou', 'estamos',
  'tem', 'tinha', 'teve', 'teve', 'tera', 'terao', 'tenha', 'tenham',
  'ha', 'havia', 'houve', 'houver', 'havera',
  'vai', 'vao', 'foi', 'ia', 'iam', 'vamos', 'ira', 'irao',
  'disse', 'disseram', 'falou', 'afirmou', 'declarou', 'comentou',
  'pode', 'podem', 'podia', 'poderia', 'poderao', 'podera',
  'deve', 'devem', 'devia', 'deveria', 'devera',
  'quer', 'querem', 'queria', 'queriam', 'quis',
  // Quantifiers / connectors
  'muito', 'muita', 'muitos', 'muitas', 'pouco', 'pouca', 'poucos', 'poucas',
  'todo', 'toda', 'todos', 'todas', 'cada', 'nenhum', 'nenhuma', 'algum',
  'alguma', 'alguns', 'algumas', 'outro', 'outra', 'outros', 'outras',
  'mesmo', 'mesma', 'mesmos', 'mesmas', 'proprio', 'propria',
  'bem', 'mal', 'so', 'apenas', 'ja', 'sempre', 'nunca', 'talvez',
  'entao', 'logo', 'agora', 'ainda', 'hoje', 'ontem', 'amanha',
  // Numbers/dates noise
  'ano', 'anos', 'mes', 'meses', 'dia', 'dias', 'vez', 'vezes',
  'um', 'dois', 'tres', 'quatro', 'cinco',
])

/**
 * Normalize: lowercase, strip accents, strip punctuation except
 * apostrophe and hyphen, collapse whitespace.
 */
export function normalize(s: string): string {
  return s
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
}

export function tokenize(text: string): string[] {
  return normalize(text)
    .replace(/[^a-z\s\-']/g, ' ')
    .split(/\s+/)
    .filter((w) => w.length >= 3 && w.length <= 30)
    .filter((w) => !/^\d+$/.test(w))
    .filter((w) => !PT_STOPWORDS.has(w))
}

export function bigrams(tokens: string[]): string[] {
  const out: string[] = []
  for (let i = 0; i < tokens.length - 1; i++) {
    out.push(`${tokens[i]} ${tokens[i + 1]}`)
  }
  return out
}

export function countMap(items: string[]): Map<string, number> {
  const m = new Map<string, number>()
  for (const x of items) m.set(x, (m.get(x) ?? 0) + 1)
  return m
}

export function topN(m: Map<string, number>, n: number): Array<{ term: string; count: number }> {
  return [...m.entries()]
    .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]))
    .slice(0, n)
    .map(([term, count]) => ({ term, count }))
}

/**
 * Over-index score: (politician freq / politician total) / (archive freq / archive total).
 * Uses Laplace smoothing + a minimum politician-count floor so one-off words don't
 * dominate. Returns the top-N by score among words the politician used at least
 * `minCount` times.
 */
export interface OverIndexed {
  term: string
  politicianCount: number
  archiveCount: number
  score: number
}

export function overIndexedWords(
  politicianCounts: Map<string, number>,
  archiveCounts: Map<string, number>,
  politicianTotal: number,
  archiveTotal: number,
  minCount = 3,
  n = 30,
): OverIndexed[] {
  if (politicianTotal === 0 || archiveTotal === 0) return []
  const out: OverIndexed[] = []
  for (const [term, pCount] of politicianCounts) {
    if (pCount < minCount) continue
    const aCount = archiveCounts.get(term) ?? 0
    const pFreq = pCount / politicianTotal
    const aFreq = (aCount + 1) / (archiveTotal + 1)
    const score = pFreq / aFreq
    if (!Number.isFinite(score)) continue
    out.push({ term, politicianCount: pCount, archiveCount: aCount, score })
  }
  return out.sort((a, b) => b.score - a.score).slice(0, n)
}
