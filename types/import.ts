/**
 * Types for data import/export functionality.
 */

/** A single row parsed from a CSV file. */
export interface ImportRow {
  /** 0-based index of the row in the original file (excluding header). */
  rowIndex: number
  /** Key-value pairs from the CSV columns. */
  data: Record<string, string>
}

/** An error that occurred while processing an import row. */
export interface ImportError {
  /** 0-based index of the row in the original file (excluding header). */
  rowIndex: number
  /** The field that caused the error, if applicable. */
  field?: string
  /** Human-readable error message. */
  message: string
  /** The raw value that caused the error. */
  value?: string
}

/** The result of an import operation. */
export interface ImportResult {
  /** Total rows parsed from the file. */
  totalRows: number
  /** Number of rows successfully imported. */
  successCount: number
  /** Number of rows that failed validation or import. */
  errorCount: number
  /** Number of rows skipped (e.g., duplicates). */
  skippedCount: number
  /** Detailed list of errors. */
  errors: ImportError[]
  /** Duration of the import in milliseconds. */
  durationMs: number
}

/** Configuration for an import operation. */
export interface ImportConfig {
  /** The target entity type. */
  type: 'politicians' | 'statements' | 'categories'
  /** Whether to skip rows with validation errors. */
  skipOnError: boolean
  /** Whether to update existing records when a duplicate is found. */
  updateExisting: boolean
  /** Column mapping: CSV column name -> database field name. */
  columnMapping: Record<string, string>
}

/** Configuration for an export operation. */
export interface ExportConfig {
  /** The entity type to export. */
  type: 'politicians' | 'statements' | 'categories'
  /** Output format. */
  format: 'csv' | 'json'
  /** Filters to apply. */
  filters?: {
    dateFrom?: string
    dateTo?: string
    party?: string
    state?: string
    verificationStatus?: string
    categorySlug?: string
  }
  /** Which fields to include in the export. */
  fields?: string[]
}
