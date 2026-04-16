/**
 * Changelog data structure and parser utilities.
 */

export interface ChangelogEntry {
  date: string
  version: string
  title: string
  changes: string[]
  type?: 'feature' | 'fix' | 'improvement' | 'breaking'
}

/** Sort changelog entries by date (newest first) */
export function sortChangelog(entries: ChangelogEntry[]): ChangelogEntry[] {
  return [...entries].sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime())
}

/** Get entries for a specific version */
export function getVersion(entries: ChangelogEntry[], version: string): ChangelogEntry | undefined {
  return entries.find((e) => e.version === version)
}

/** Get all unique versions */
export function getVersions(entries: ChangelogEntry[]): string[] {
  return [...new Set(entries.map((e) => e.version))]
}

/** Filter entries by type */
export function filterByType(entries: ChangelogEntry[], type: ChangelogEntry['type']): ChangelogEntry[] {
  return entries.filter((e) => e.type === type)
}

/** Get entries within a date range */
export function getEntriesInRange(entries: ChangelogEntry[], from: string, to: string): ChangelogEntry[] {
  const fromDate = new Date(from).getTime()
  const toDate = new Date(to).getTime()
  return entries.filter((e) => {
    const d = new Date(e.date).getTime()
    return d >= fromDate && d <= toDate
  })
}

/** Format a version string for display */
export function formatVersion(version: string): string {
  return `v${version}`
}
