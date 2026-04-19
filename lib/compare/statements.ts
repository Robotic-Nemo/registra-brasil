import { tokenize } from '@/lib/vocabulary/analyze'

/**
 * Pure text-overlap analysis between two statement bodies. Returns the
 * share of tokens each side shares with the other and the sets of
 * unique tokens — enough to show a quick visual diff on the compare
 * page without pulling in a heavy diff library.
 */
export interface OverlapResult {
  jaccard: number
  shared: string[]
  onlyA: string[]
  onlyB: string[]
  aCount: number
  bCount: number
}

export function compareTexts(a: string, b: string): OverlapResult {
  const tA = new Set(tokenize(a))
  const tB = new Set(tokenize(b))
  const shared: string[] = []
  const onlyA: string[] = []
  const onlyB: string[] = []

  for (const t of tA) (tB.has(t) ? shared : onlyA).push(t)
  for (const t of tB) if (!tA.has(t)) onlyB.push(t)

  const union = tA.size + onlyB.length
  const jaccard = union === 0 ? 0 : shared.length / union

  shared.sort()
  onlyA.sort()
  onlyB.sort()

  return {
    jaccard,
    shared,
    onlyA,
    onlyB,
    aCount: tA.size,
    bCount: tB.size,
  }
}
