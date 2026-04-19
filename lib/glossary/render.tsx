import { Fragment, type ReactNode } from 'react'
import { GLOSSARY_TERMS, type GlossaryTerm } from '@/lib/constants/glossary'

/**
 * Build a RegExp that matches any glossary term as a whole word, case-
 * insensitive, longest-first so "CPI (Comissão Parlamentar de Inquérito)"
 * wins over a hypothetical shorter "CPI" entry.
 *
 * The match surface (term .term) contains the canonical casing, but we
 * also accept a case-insensitive hit so "Câmara dos deputados" highlights
 * even when the author lowercased it.
 */
const SORTED_TERMS = [...GLOSSARY_TERMS].sort((a, b) => b.term.length - a.term.length)

function escapeRegExp(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

const TERM_REGEX = new RegExp(
  `\\b(${SORTED_TERMS.map((t) => escapeRegExp(t.term)).join('|')})\\b`,
  'giu',
)

/**
 * Renders `text` with inline glossary anchors on the FIRST occurrence of
 * each matching term. Subsequent occurrences are left plain so the reader
 * isn't overwhelmed by dotted underlines.
 *
 * Safe by default: all non-term text goes through React as plain strings,
 * so arbitrary author input can't inject HTML.
 */
export function renderWithGlossary(text: string | null | undefined): ReactNode {
  if (!text) return null

  const seen = new Set<string>()
  const parts: ReactNode[] = []
  let lastIndex = 0
  let key = 0

  const re = new RegExp(TERM_REGEX.source, TERM_REGEX.flags)
  let m: RegExpExecArray | null
  while ((m = re.exec(text)) !== null) {
    const matched = m[0]
    const slug = lookupSlug(matched)
    if (!slug) continue
    if (seen.has(slug)) continue

    if (m.index > lastIndex) {
      parts.push(<Fragment key={`t${key++}`}>{text.slice(lastIndex, m.index)}</Fragment>)
    }
    parts.push(<GlossaryAnchor key={`g${key++}`} display={matched} slug={slug} />)
    seen.add(slug)
    lastIndex = m.index + matched.length
  }

  if (lastIndex < text.length) {
    parts.push(<Fragment key={`t${key++}`}>{text.slice(lastIndex)}</Fragment>)
  }

  return parts.length === 0 ? text : <>{parts}</>
}

function lookupSlug(raw: string): string | null {
  const lc = raw.toLowerCase()
  const hit = SORTED_TERMS.find((t) => t.term.toLowerCase() === lc)
  return hit?.slug ?? null
}

function GlossaryAnchor({ display, slug }: { display: string; slug: string }) {
  const def = GLOSSARY_TERMS.find((t) => t.slug === slug)
  const title = def ? `${def.term} — ${def.definition.slice(0, 200)}` : display
  return (
    <a
      href={`/glossario#${slug}`}
      title={title}
      className="border-b border-dotted border-indigo-400 text-indigo-700 decoration-indigo-400 underline-offset-2 hover:border-solid hover:bg-indigo-50 dark:border-indigo-500 dark:text-indigo-300 dark:hover:bg-indigo-950/30"
      data-glossary-term={slug}
    >
      {display}
    </a>
  )
}

export type { GlossaryTerm }
