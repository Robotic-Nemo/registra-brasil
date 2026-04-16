export interface DuplicateCandidate {
  idA: string
  idB: string
  summaryA: string
  summaryB: string
  politicianA: string
  politicianB: string
  dateA: string
  dateB: string
  similarity: number
  reason: string
}

interface StatementForDupeCheck {
  id: string
  summary: string
  full_quote: string | null
  politician_id: string
  politician_name: string
  statement_date: string
}

/**
 * Detect potential duplicates among statements.
 * Uses trigram-like similarity on summary text, same politician + date match.
 */
export function detectDuplicates(
  statements: StatementForDupeCheck[],
  threshold = 0.5
): DuplicateCandidate[] {
  const candidates: DuplicateCandidate[] = []
  const seen = new Set<string>()

  for (let i = 0; i < statements.length; i++) {
    for (let j = i + 1; j < statements.length; j++) {
      const a = statements[i]
      const b = statements[j]
      const pairKey = [a.id, b.id].sort().join(':')
      if (seen.has(pairKey)) continue

      const reasons: string[] = []
      let score = 0

      // Same politician
      if (a.politician_id === b.politician_id) {
        score += 0.3
        reasons.push('Mesmo politico')
      }

      // Same date
      if (a.statement_date === b.statement_date) {
        score += 0.2
        reasons.push('Mesma data')
      }

      // Summary similarity
      const textSim = computeSimilarity(normalize(a.summary), normalize(b.summary))
      score += textSim * 0.5

      if (textSim > 0.6) {
        reasons.push(`Texto similar (${Math.round(textSim * 100)}%)`)
      }

      // Full quote match
      if (a.full_quote && b.full_quote) {
        const quoteSim = computeSimilarity(normalize(a.full_quote), normalize(b.full_quote))
        if (quoteSim > 0.7) {
          score += 0.2
          reasons.push('Citacao similar')
        }
      }

      if (score >= threshold) {
        seen.add(pairKey)
        candidates.push({
          idA: a.id,
          idB: b.id,
          summaryA: a.summary,
          summaryB: b.summary,
          politicianA: a.politician_name,
          politicianB: b.politician_name,
          dateA: a.statement_date,
          dateB: b.statement_date,
          similarity: Math.min(score, 1),
          reason: reasons.join(', '),
        })
      }
    }
  }

  return candidates.sort((a, b) => b.similarity - a.similarity)
}

function normalize(text: string | null | undefined): string {
  if (!text) return ''
  return String(text)
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
}

/** Bigram-based Dice coefficient similarity */
function computeSimilarity(a: string, b: string): number {
  if (a === b) return 1
  if (a.length < 2 || b.length < 2) return 0

  const bigramsA = new Map<string, number>()
  for (let i = 0; i < a.length - 1; i++) {
    const bg = a.slice(i, i + 2)
    bigramsA.set(bg, (bigramsA.get(bg) ?? 0) + 1)
  }

  let intersect = 0
  for (let i = 0; i < b.length - 1; i++) {
    const bg = b.slice(i, i + 2)
    const count = bigramsA.get(bg)
    if (count && count > 0) {
      intersect++
      bigramsA.set(bg, count - 1)
    }
  }

  return (2.0 * intersect) / (a.length - 1 + b.length - 1)
}
