/**
 * Simple text diff utilities for showing statement edit history
 */

export interface DiffSegment {
  type: 'equal' | 'added' | 'removed'
  value: string
}

/**
 * Simple word-level diff between two strings
 */
export function wordDiff(oldText: string | null | undefined, newText: string | null | undefined): DiffSegment[] {
  const safeOld = oldText ?? ''
  const safeNew = newText ?? ''
  if (!safeOld && !safeNew) return []
  const oldWords = safeOld.split(/(\s+)/)
  const newWords = safeNew.split(/(\s+)/)

  // Simple LCS-based diff
  const m = oldWords.length
  const n = newWords.length
  const dp: number[][] = Array.from({ length: m + 1 }, () => Array(n + 1).fill(0))

  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (oldWords[i - 1] === newWords[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1
      } else {
        dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1])
      }
    }
  }

  // Backtrack
  const segments: DiffSegment[] = []
  let i = m, j = n

  const stack: DiffSegment[] = []
  while (i > 0 || j > 0) {
    if (i > 0 && j > 0 && oldWords[i - 1] === newWords[j - 1]) {
      stack.push({ type: 'equal', value: oldWords[i - 1] })
      i--
      j--
    } else if (j > 0 && (i === 0 || dp[i][j - 1] >= dp[i - 1][j])) {
      stack.push({ type: 'added', value: newWords[j - 1] })
      j--
    } else {
      stack.push({ type: 'removed', value: oldWords[i - 1] })
      i--
    }
  }

  stack.reverse()

  // Merge consecutive segments of the same type
  for (const seg of stack) {
    const last = segments[segments.length - 1]
    if (last && last.type === seg.type) {
      last.value += seg.value
    } else {
      segments.push({ ...seg })
    }
  }

  return segments
}

/**
 * Count changes in a diff
 */
export function countChanges(segments: DiffSegment[]): { added: number; removed: number } {
  let added = 0
  let removed = 0
  for (const seg of segments) {
    if (seg.type === 'added') added += seg.value.split(/\s+/).filter(Boolean).length
    if (seg.type === 'removed') removed += seg.value.split(/\s+/).filter(Boolean).length
  }
  return { added, removed }
}
