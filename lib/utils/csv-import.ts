export interface ColumnMapping {
  csvColumn: string
  dbField: string
}

export interface ImportValidationError {
  row: number
  column: string
  message: string
}

export interface ImportPreview {
  headers: string[]
  rows: string[][]
  totalRows: number
  mapping: ColumnMapping[]
  errors: ImportValidationError[]
}

const KNOWN_DB_FIELDS = [
  'summary',
  'full_quote',
  'context',
  'statement_date',
  'primary_source_url',
  'primary_source_type',
  'venue',
  'event_name',
  'editor_notes',
  'politician_slug',
] as const

const FIELD_LABELS: Record<string, string> = {
  summary: 'Resumo',
  full_quote: 'Citacao completa',
  context: 'Contexto',
  statement_date: 'Data',
  primary_source_url: 'URL da fonte',
  primary_source_type: 'Tipo da fonte',
  venue: 'Local',
  event_name: 'Evento',
  editor_notes: 'Notas do editor',
  politician_slug: 'Slug do politico',
}

/**
 * Parse CSV text into rows. Handles quoted fields and commas within quotes.
 */
export function parseCSV(text: string): { headers: string[]; rows: string[][] } {
  const lines = text.split('\n').filter((l) => l.trim() !== '')
  if (lines.length === 0) return { headers: [], rows: [] }

  const parseLine = (line: string): string[] => {
    const fields: string[] = []
    let current = ''
    let inQuotes = false

    for (let i = 0; i < line.length; i++) {
      const char = line[i]
      if (char === '"') {
        if (inQuotes && line[i + 1] === '"') {
          current += '"'
          i++
        } else {
          inQuotes = !inQuotes
        }
      } else if ((char === ',' || char === ';') && !inQuotes) {
        fields.push(current.trim())
        current = ''
      } else {
        current += char
      }
    }
    fields.push(current.trim())
    return fields
  }

  const headers = parseLine(lines[0])
  const rows = lines.slice(1).map(parseLine)

  return { headers, rows }
}

/**
 * Auto-detect column mapping based on header names.
 */
export function autoMapColumns(headers: string[]): ColumnMapping[] {
  const mappings: ColumnMapping[] = []
  const normalizedHeaders = headers.map((h) =>
    h.toLowerCase()
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .replace(/[^a-z0-9]/g, '_')
  )

  const HEADER_ALIASES: Record<string, string[]> = {
    summary: ['resumo', 'summary', 'titulo', 'title', 'declaracao'],
    full_quote: ['citacao', 'quote', 'full_quote', 'citacao_completa'],
    context: ['contexto', 'context'],
    statement_date: ['data', 'date', 'statement_date', 'data_declaracao'],
    primary_source_url: ['url', 'fonte', 'source', 'source_url', 'primary_source_url', 'link'],
    primary_source_type: ['tipo', 'type', 'source_type', 'primary_source_type', 'tipo_fonte'],
    venue: ['local', 'venue', 'lugar'],
    event_name: ['evento', 'event', 'event_name'],
    editor_notes: ['notas', 'notes', 'editor_notes', 'observacoes'],
    politician_slug: ['politico', 'politician', 'politician_slug', 'slug_politico'],
  }

  for (const [dbField, aliases] of Object.entries(HEADER_ALIASES)) {
    const idx = normalizedHeaders.findIndex((h) => aliases.includes(h))
    if (idx !== -1) {
      mappings.push({ csvColumn: headers[idx], dbField })
    }
  }

  return mappings
}

/**
 * Validate import data against mapping.
 */
export function validateImport(
  rows: string[][],
  headers: string[],
  mapping: ColumnMapping[]
): ImportValidationError[] {
  const errors: ImportValidationError[] = []

  const summaryMapping = mapping.find((m) => m.dbField === 'summary')
  const dateMapping = mapping.find((m) => m.dbField === 'statement_date')
  const politicianMapping = mapping.find((m) => m.dbField === 'politician_slug')

  if (!summaryMapping) {
    errors.push({ row: 0, column: 'summary', message: 'Coluna de resumo nao mapeada' })
  }

  for (let i = 0; i < rows.length; i++) {
    const row = rows[i]

    // Check summary is not empty
    if (summaryMapping) {
      const colIdx = headers.indexOf(summaryMapping.csvColumn)
      if (colIdx === -1 || !row[colIdx]?.trim()) {
        errors.push({ row: i + 1, column: 'summary', message: 'Resumo vazio' })
      }
    }

    // Check date format
    if (dateMapping) {
      const colIdx = headers.indexOf(dateMapping.csvColumn)
      const val = row[colIdx]?.trim()
      if (val && !/^\d{4}-\d{2}-\d{2}$/.test(val) && !/^\d{2}\/\d{2}\/\d{4}$/.test(val)) {
        errors.push({ row: i + 1, column: 'statement_date', message: 'Formato de data invalido (use AAAA-MM-DD ou DD/MM/AAAA)' })
      }
    }

    // Check politician slug
    if (politicianMapping) {
      const colIdx = headers.indexOf(politicianMapping.csvColumn)
      if (colIdx === -1 || !row[colIdx]?.trim()) {
        errors.push({ row: i + 1, column: 'politician_slug', message: 'Slug do politico vazio' })
      }
    }
  }

  return errors
}

/**
 * Convert a date from DD/MM/YYYY to YYYY-MM-DD.
 */
export function normalizeDateValue(val: string): string {
  const brMatch = val.match(/^(\d{2})\/(\d{2})\/(\d{4})$/)
  if (brMatch) {
    return `${brMatch[3]}-${brMatch[2]}-${brMatch[1]}`
  }
  return val
}

export function getDbFieldLabel(field: string): string {
  return FIELD_LABELS[field] ?? field
}

export function getKnownDbFields(): readonly string[] {
  return KNOWN_DB_FIELDS
}
