/**
 * Form validation utilities with Portuguese error messages
 */

export interface ValidationRule {
  validate: (value: string) => boolean
  message: string
}

export interface FieldValidation {
  field: string
  rules: ValidationRule[]
}

export interface ValidationResult {
  valid: boolean
  errors: Record<string, string[]>
}

/** Built-in validation rules */
export const rules = {
  required: (message = 'Campo obrigatório'): ValidationRule => ({
    validate: (v) => v.trim().length > 0,
    message,
  }),

  minLength: (min: number, message?: string): ValidationRule => ({
    validate: (v) => v.length >= min,
    message: message ?? `Mínimo de ${min} caracteres`,
  }),

  maxLength: (max: number, message?: string): ValidationRule => ({
    validate: (v) => v.length <= max,
    message: message ?? `Máximo de ${max} caracteres`,
  }),

  email: (message = 'E-mail inválido'): ValidationRule => ({
    validate: (v) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v),
    message,
  }),

  url: (message = 'URL inválida'): ValidationRule => ({
    validate: (v) => {
      try { new URL(v); return true } catch { return false }
    },
    message,
  }),

  slug: (message = 'Slug inválido'): ValidationRule => ({
    validate: (v) => /^[a-z0-9]+(-[a-z0-9]+)*$/.test(v),
    message,
  }),

  date: (message = 'Data inválida'): ValidationRule => ({
    validate: (v) => !isNaN(new Date(v).getTime()),
    message,
  }),

  noFutureDate: (message = 'Data não pode ser no futuro'): ValidationRule => ({
    validate: (v) => new Date(v) <= new Date(),
    message,
  }),

  pattern: (regex: RegExp, message: string): ValidationRule => ({
    validate: (v) => regex.test(v),
    message,
  }),

  matches: (other: string, message = 'Campos não coincidem'): ValidationRule => ({
    validate: (v) => v === other,
    message,
  }),
}

/**
 * Validate form data against field validations
 */
export function validateForm(
  data: Record<string, string>,
  fields: FieldValidation[]
): ValidationResult {
  const errors: Record<string, string[]> = {}
  let valid = true

  for (const { field, rules: fieldRules } of fields) {
    const value = data[field] ?? ''
    const fieldErrors: string[] = []

    for (const rule of fieldRules) {
      if (!rule.validate(value)) {
        fieldErrors.push(rule.message)
      }
    }

    if (fieldErrors.length > 0) {
      errors[field] = fieldErrors
      valid = false
    }
  }

  return { valid, errors }
}

/**
 * Get first error for a field
 */
export function getFieldError(errors: Record<string, string[]>, field: string): string | undefined {
  return errors[field]?.[0]
}
