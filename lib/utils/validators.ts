/**
 * Input validation functions for common form fields.
 */

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
const SLUG_RE = /^[a-z0-9]+(?:-[a-z0-9]+)*$/
const DATE_ISO_RE = /^\d{4}-\d{2}-\d{2}$/

/** Returns true if the string is a valid email address (basic check). */
export function isValidEmail(value: string): boolean {
  return EMAIL_RE.test(value.trim())
}

/** Returns true if the string is a valid URL with http(s) protocol. */
export function isValidUrl(value: string): boolean {
  try {
    const url = new URL(value.trim())
    return url.protocol === 'http:' || url.protocol === 'https:'
  } catch {
    return false
  }
}

/** Returns true if the string matches YYYY-MM-DD and represents a real date. */
export function isValidDate(value: string): boolean {
  if (!DATE_ISO_RE.test(value)) return false
  const d = new Date(value + 'T00:00:00')
  return !isNaN(d.getTime()) && d.toISOString().startsWith(value)
}

/** Returns true if the date string is not in the future. */
export function isDateNotFuture(value: string): boolean {
  if (!isValidDate(value)) return false
  const today = new Date().toISOString().slice(0, 10)
  return value <= today
}

/** Returns true if the string is a valid slug (lowercase, hyphens, no leading/trailing hyphens). */
export function isValidSlug(value: string): boolean {
  return SLUG_RE.test(value) && value.length >= 2 && value.length <= 200
}

/** Returns a validation error message or null if valid. */
export function validateRequired(value: string | undefined | null, fieldName: string): string | null {
  if (!value || !value.trim()) return `${fieldName} é obrigatório.`
  return null
}

/** Returns a validation error message or null if valid. */
export function validateMinLength(value: string, min: number, fieldName: string): string | null {
  if (value.trim().length < min) return `${fieldName} deve ter pelo menos ${min} caracteres.`
  return null
}

/** Returns a validation error message or null if valid. */
export function validateMaxLength(value: string, max: number, fieldName: string): string | null {
  if (value.trim().length > max) return `${fieldName} deve ter no máximo ${max} caracteres.`
  return null
}
