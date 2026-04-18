/**
 * Minimal RFC-4180-compliant CSV parser for the bulk-import tool.
 * Handles quoted fields, embedded commas/newlines/quotes, BOM.
 * No external dependency to keep edge-runtime compatibility.
 */

export interface ParsedCsv {
  headers: string[]
  rows: Record<string, string>[]
  errors: string[]
}

export function parseCsv(input: string): ParsedCsv {
  // Strip BOM
  if (input.charCodeAt(0) === 0xfeff) input = input.slice(1)

  const rows: string[][] = []
  let cur: string[] = []
  let field = ''
  let inQuotes = false
  const errors: string[] = []

  for (let i = 0; i < input.length; i++) {
    const c = input[i]
    if (inQuotes) {
      if (c === '"') {
        if (input[i + 1] === '"') {
          field += '"'
          i++
        } else {
          inQuotes = false
        }
      } else {
        field += c
      }
    } else {
      if (c === '"') {
        if (field.length > 0) {
          errors.push(`Aspas em posição inesperada na linha ${rows.length + 1}`)
        }
        inQuotes = true
      } else if (c === ',') {
        cur.push(field)
        field = ''
      } else if (c === '\r') {
        // swallow (expect \n next)
      } else if (c === '\n') {
        cur.push(field)
        rows.push(cur)
        cur = []
        field = ''
      } else {
        field += c
      }
    }
  }
  if (field.length > 0 || cur.length > 0) {
    cur.push(field)
    rows.push(cur)
  }

  if (rows.length === 0) return { headers: [], rows: [], errors: ['CSV vazio.'] }

  const headers = rows[0].map((h) => h.trim().toLowerCase())
  const body = rows.slice(1).filter((r) => r.some((c) => c.trim() !== ''))
  const objects = body.map((r) => {
    const obj: Record<string, string> = {}
    headers.forEach((h, i) => { obj[h] = (r[i] ?? '').trim() })
    return obj
  })

  return { headers, rows: objects, errors }
}
