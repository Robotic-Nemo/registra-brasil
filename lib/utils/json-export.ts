/**
 * JSON export formatter with metadata, pretty printing, and filtering.
 */

export interface ExportMetadata {
  /** Name of the export. */
  exportName: string
  /** ISO timestamp of when the export was created. */
  exportedAt: string
  /** Total number of records in the export. */
  totalRecords: number
  /** Entity type. */
  entityType: string
  /** Applied filters, if any. */
  filters?: Record<string, string>
  /** Version of the export format. */
  formatVersion: string
}

export interface JsonExportOptions {
  /** Whether to pretty-print the output. Defaults to true. */
  prettyPrint?: boolean
  /** Indentation size (spaces). Defaults to 2. */
  indent?: number
  /** Whether to include metadata. Defaults to true. */
  includeMetadata?: boolean
  /** Fields to include. If empty/undefined, includes all fields. */
  fields?: string[]
}

/**
 * Format data as a JSON export with optional metadata.
 */
export function formatJsonExport<T extends Record<string, unknown>>(
  records: T[],
  entityType: string,
  options: JsonExportOptions = {}
): string {
  const {
    prettyPrint = true,
    indent = 2,
    includeMetadata = true,
    fields,
  } = options

  const filteredRecords = fields && fields.length > 0
    ? records.map((record) => {
        const filtered: Record<string, unknown> = {}
        for (const field of fields) {
          if (field in record) {
            filtered[field] = record[field]
          }
        }
        return filtered
      })
    : records

  const output: Record<string, unknown> = {}

  if (includeMetadata) {
    output.metadata = {
      exportName: `registra-brasil-${entityType}`,
      exportedAt: new Date().toISOString(),
      totalRecords: filteredRecords.length,
      entityType,
      formatVersion: '1.0',
    } satisfies ExportMetadata
  }

  output.data = filteredRecords

  return prettyPrint
    ? JSON.stringify(output, null, indent)
    : JSON.stringify(output)
}

/**
 * Create a downloadable blob URL from a JSON string.
 */
export function createJsonBlobUrl(jsonString: string): string {
  const blob = new Blob([jsonString], { type: 'application/json' })
  return URL.createObjectURL(blob)
}

/**
 * Create a downloadable blob URL from a CSV string.
 */
export function createCsvBlobUrl(csvString: string): string {
  const blob = new Blob([csvString], { type: 'text/csv;charset=utf-8;' })
  return URL.createObjectURL(blob)
}

/**
 * Trigger a file download in the browser.
 */
export function triggerDownload(url: string, filename: string): void {
  if (typeof document === 'undefined') return
  const link = document.createElement('a')
  link.href = url
  link.download = filename
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
  URL.revokeObjectURL(url)
}
