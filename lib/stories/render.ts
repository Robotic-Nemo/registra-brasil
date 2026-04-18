/**
 * Minimal Markdown-ish renderer for story bodies. Supports:
 *   - # H1, ## H2, ### H3
 *   - blank-line paragraphs
 *   - > blockquotes
 *   - **bold**, _italic_
 *   - [text](url) links
 *   - Statement embed tokens: {{statement:<uuid>}} → rendered inline by the page
 *
 * Not a general-purpose MD parser — tight scope keeps output consistent
 * and sanitization trivial. Returns an array of blocks the React tree
 * can map over without dangerouslySetInnerHTML.
 */

export type Block =
  | { kind: 'h2'; text: string }
  | { kind: 'h3'; text: string }
  | { kind: 'p'; inlines: Inline[] }
  | { kind: 'quote'; inlines: Inline[] }
  | { kind: 'statement'; id: string }
  | { kind: 'hr' }

export type Inline =
  | { t: 'text'; value: string }
  | { t: 'bold'; value: string }
  | { t: 'italic'; value: string }
  | { t: 'link'; value: string; href: string }

const UUID_RE = /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/i

function parseInlines(line: string): Inline[] {
  const out: Inline[] = []
  let i = 0
  let buf = ''
  const flush = () => {
    if (buf) { out.push({ t: 'text', value: buf }); buf = '' }
  }
  while (i < line.length) {
    const c = line[i]
    // link [text](url)
    if (c === '[') {
      const closeBracket = line.indexOf(']', i + 1)
      if (closeBracket > 0 && line[closeBracket + 1] === '(') {
        const closeParen = line.indexOf(')', closeBracket + 2)
        if (closeParen > 0) {
          flush()
          const text = line.slice(i + 1, closeBracket)
          const href = line.slice(closeBracket + 2, closeParen)
          if (/^https?:\/\//.test(href)) {
            out.push({ t: 'link', value: text, href })
          } else {
            out.push({ t: 'text', value: `[${text}](${href})` })
          }
          i = closeParen + 1
          continue
        }
      }
    }
    // bold **...**
    if (c === '*' && line[i + 1] === '*') {
      const end = line.indexOf('**', i + 2)
      if (end > 0) {
        flush()
        out.push({ t: 'bold', value: line.slice(i + 2, end) })
        i = end + 2
        continue
      }
    }
    // italic _..._
    if (c === '_') {
      const end = line.indexOf('_', i + 1)
      if (end > 0 && line[end - 1] !== ' ') {
        flush()
        out.push({ t: 'italic', value: line.slice(i + 1, end) })
        i = end + 1
        continue
      }
    }
    buf += c
    i++
  }
  flush()
  return out
}

export function parseStoryBody(md: string): Block[] {
  const blocks: Block[] = []
  const lines = md.replace(/\r\n/g, '\n').split('\n')
  let paraLines: string[] = []

  const flushPara = () => {
    if (paraLines.length === 0) return
    const text = paraLines.join(' ').trim()
    paraLines = []
    if (!text) return
    blocks.push({ kind: 'p', inlines: parseInlines(text) })
  }

  for (const raw of lines) {
    const line = raw.trimEnd()
    // Statement embed on its own line
    const embedMatch = line.match(/^\s*\{\{statement:(.+?)\}\}\s*$/)
    if (embedMatch) {
      flushPara()
      const id = embedMatch[1].trim()
      if (UUID_RE.test(id)) blocks.push({ kind: 'statement', id })
      continue
    }
    if (line === '' || line === '---') {
      flushPara()
      if (line === '---') blocks.push({ kind: 'hr' })
      continue
    }
    if (line.startsWith('### ')) {
      flushPara()
      blocks.push({ kind: 'h3', text: line.slice(4) })
      continue
    }
    if (line.startsWith('## ')) {
      flushPara()
      blocks.push({ kind: 'h2', text: line.slice(3) })
      continue
    }
    if (line.startsWith('> ')) {
      flushPara()
      blocks.push({ kind: 'quote', inlines: parseInlines(line.slice(2)) })
      continue
    }
    paraLines.push(line.trim())
  }
  flushPara()
  return blocks
}

export function referencedStatementIds(md: string): string[] {
  const ids = new Set<string>()
  const re = /\{\{statement:([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\}\}/gi
  let m
  while ((m = re.exec(md))) ids.add(m[1].toLowerCase())
  return [...ids]
}

export function estimateReadingTimeMinutes(md: string): number {
  const words = md.trim().split(/\s+/).filter(Boolean).length
  return Math.max(1, Math.round(words / 220))
}
