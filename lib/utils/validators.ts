/**
 * Input validation functions for common form fields.
 */

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
const SLUG_RE = /^[a-z0-9]+(?:-[a-z0-9]+)*$/
const DATE_ISO_RE = /^\d{4}-\d{2}-\d{2}$/

/** Returns true if the string is a valid email address (basic check). */
export function isValidEmail(value: string | null | undefined): boolean {
  if (!value || typeof value !== 'string') return false
  return EMAIL_RE.test(value.trim())
}

/** Returns true if the string is a valid URL with http(s) protocol. */
export function isValidUrl(value: string | null | undefined): boolean {
  if (!value || typeof value !== 'string') return false
  try {
    const url = new URL(value.trim())
    return url.protocol === 'http:' || url.protocol === 'https:'
  } catch {
    return false
  }
}

/** Returns true if the string matches YYYY-MM-DD and represents a real date. */
export function isValidDate(value: string | null | undefined): boolean {
  if (!value || typeof value !== 'string') return false
  if (!DATE_ISO_RE.test(value)) return false
  const d = new Date(value + 'T00:00:00')
  return !isNaN(d.getTime()) && d.toISOString().startsWith(value)
}

/** Returns true if the date string is not in the future (in America/Sao_Paulo timezone). */
export function isDateNotFuture(value: string | null | undefined): boolean {
  if (!isValidDate(value)) return false
  // Use Brazil local date so dates near midnight UTC behave as users expect.
  const today = new Date().toLocaleDateString('en-CA', { timeZone: 'America/Sao_Paulo' })
  return (value as string) <= today
}

/** Returns true if the string is a valid slug (lowercase, hyphens, no leading/trailing hyphens). */
export function isValidSlug(value: string | null | undefined): boolean {
  if (!value || typeof value !== 'string') return false
  return SLUG_RE.test(value) && value.length >= 2 && value.length <= 200
}

/** Returns a validation error message or null if valid. */
export function validateRequired(value: string | undefined | null, fieldName: string): string | null {
  if (!value || !value.trim()) return `${fieldName} é obrigatório.`
  return null
}

/** Returns a validation error message or null if valid. */
export function validateMinLength(value: string | null | undefined, min: number, fieldName: string): string | null {
  const v = value ?? ''
  if (v.trim().length < min) return `${fieldName} deve ter pelo menos ${min} caracteres.`
  return null
}

/** Returns a validation error message or null if valid. */
export function validateMaxLength(value: string | null | undefined, max: number, fieldName: string): string | null {
  const v = value ?? ''
  if (v.trim().length > max) return `${fieldName} deve ter no máximo ${max} caracteres.`
  return null
}
