import type { NarrativeThread, NarrativeStoryline } from '@/types/narrative'

interface StatementForNarrative {
  id: string
  summary: string
  statement_date: string
  politician_id: string
  politician_name: string
  politician_party: string
  politician_slug: string
  categories: { slug: string; label: string; color: string }[]
}

/**
 * Group statements into narrative threads by shared politician + category within a time window.
 */
export function groupIntoNarratives(
  statements: StatementForNarrative[],
  maxDaysBetween = 90
): NarrativeStoryline[] {
  if (statements.length === 0) return []

  // Sort by date
  const sorted = [...statements].sort(
    (a, b) => a.statement_date.localeCompare(b.statement_date)
  )

  // Group by politician + primary category
  const groups = new Map<string, StatementForNarrative[]>()
  for (const stmt of sorted) {
    const primaryCat = stmt.categories[0]?.slug ?? 'geral'
    const key = `${stmt.politician_id}:${primaryCat}`
    const existing = groups.get(key) ?? []
    existing.push(stmt)
    groups.set(key, existing)
  }

  const storylines: NarrativeStoryline[] = []

  for (const [, stmts] of groups) {
    if (stmts.length < 2) continue

    // Split into sub-groups if gaps are too large
    const subGroups: StatementForNarrative[][] = [[stmts[0]]]
    for (let i = 1; i < stmts.length; i++) {
      const prev = new Date(stmts[i - 1].statement_date)
      const curr = new Date(stmts[i].statement_date)
      const daysDiff = (curr.getTime() - prev.getTime()) / (1000 * 60 * 60 * 24)

      if (daysDiff > maxDaysBetween) {
        subGroups.push([stmts[i]])
      } else {
        subGroups[subGroups.length - 1].push(stmts[i])
      }
    }

    for (const group of subGroups) {
      if (group.length < 2) continue

      const first = group[0]
      const last = group[group.length - 1]
      const allCats = new Map<string, { slug: string; label: string; color: string }>()
      const allPoliticians = new Map<string, { id: string; slug: string; name: string; party: string }>()

      for (const s of group) {
        for (const c of s.categories) {
          allCats.set(c.slug, c)
        }
        allPoliticians.set(s.politician_id, {
          id: s.politician_id,
          slug: s.politician_slug,
          name: s.politician_name,
          party: s.politician_party,
        })
      }

      const primaryCat = first.categories[0]

      const thread: NarrativeThread = {
        id: `${first.politician_id}-${primaryCat?.slug ?? 'geral'}-${first.statement_date}`,
        title: `${first.politician_name} sobre ${primaryCat?.label ?? 'temas diversos'}`,
        description: `${group.length} declaracoes de ${first.politician_name} (${first.politician_party}) sobre ${primaryCat?.label ?? 'temas diversos'}`,
        topic: primaryCat?.slug ?? 'geral',
        dateRange: {
          start: first.statement_date,
          end: last.statement_date,
        },
        statementCount: group.length,
        politicians: Array.from(allPoliticians.values()),
        categories: Array.from(allCats.values()),
      }

      storylines.push({
        thread,
        statements: group.map((s) => ({
          id: s.id,
          summary: s.summary,
          statement_date: s.statement_date,
          politician_name: s.politician_name,
          politician_party: s.politician_party,
        })),
      })
    }
  }

  // Sort by most recent first
  storylines.sort((a, b) =>
    b.thread.dateRange.end.localeCompare(a.thread.dateRange.end)
  )

  return storylines
}

/**
 * Format a date range as a human-readable string.
 */
export function formatDateRange(start: string, end: string): string {
  const startDate = new Date(start + 'T00:00:00')
  const endDate = new Date(end + 'T00:00:00')

  const months = [
    'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
    'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez',
  ]

  const startMonth = months[startDate.getMonth()]
  const endMonth = months[endDate.getMonth()]
  const startYear = startDate.getFullYear()
  const endYear = endDate.getFullYear()

  if (startYear === endYear && startDate.getMonth() === endDate.getMonth()) {
    return `${startMonth} ${startYear}`
  }
  if (startYear === endYear) {
    return `${startMonth} - ${endMonth} ${startYear}`
  }
  return `${startMonth} ${startYear} - ${endMonth} ${endYear}`
}
