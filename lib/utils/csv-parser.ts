/**
 * Simple CSV parser — no dependencies
 */

export interface CsvParseResult {
  headers: string[]
  rows: Record<string, string>[]
  errors: { line: number; message: string }[]
}

/**
 * Parse CSV text into structured data
 */
export function parseCsv(text: string, separator = ','): CsvParseResult {
  const lines = text.split('\n').map(l => l.trim()).filter(Boolean)
  const errors: CsvParseResult['errors'] = []

  if (lines.length === 0) {
    return { headers: [], rows: [], errors: [{ line: 0, message: 'CSV vazio' }] }
  }

  const headers = parseRow(lines[0], separator)
  const rows: Record<string, string>[] = []

  for (let i = 1; i < lines.length; i++) {
    try {
      const values = parseRow(lines[i], separator)
      if (values.length !== headers.length) {
        errors.push({ line: i + 1, message: `Esperado ${headers.length} colunas, encontrado ${values.length}` })
        continue
      }
      const row: Record<string, string> = {}
      for (let j = 0; j < headers.length; j++) {
        row[headers[j]] = values[j]
      }
      rows.push(row)
    } catch (e) {
      errors.push({ line: i + 1, message: String(e) })
    }
  }

  return { headers, rows, errors }
}

/**
 * Parse a single CSV row, handling quoted fields
 */
function parseRow(line: string, separator: string): string[] {
  const fields: string[] = []
  let current = ''
  let inQuotes = false

  for (let i = 0; i < line.length; i++) {
    const char = line[i]

    if (inQuotes) {
      if (char === '"') {
        if (i + 1 < line.length && line[i + 1] === '"') {
          current += '"'
          i++ // Skip escaped quote
        } else {
          inQuotes = false
        }
      } else {
        current += char
      }
    } else {
      if (char === '"') {
        inQuotes = true
      } else if (char === separator) {
        fields.push(current.trim())
        current = ''
      } else {
        current += char
      }
    }
  }

  fields.push(current.trim())
  return fields
}

/**
 * Convert array of objects to CSV string
 */
export function toCsv(
  data: Record<string, unknown>[],
  headers?: string[],
  separator = ','
): string {
  if (data.length === 0) return ''

  const cols = headers ?? Object.keys(data[0])
  const headerLine = cols.join(separator)

  const rows = data.map(row =>
    cols.map(col => {
      const val = String(row[col] ?? '')
      if (val.includes(separator) || val.includes('"') || val.includes('\n')) {
        return `"${val.replace(/"/g, '""')}"`
      }
      return val
    }).join(separator)
  )

  return [headerLine, ...rows].join('\n')
}
