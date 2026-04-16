/**
 * Brazilian CNPJ validation and formatting utilities
 */

const CNPJ_WEIGHTS_1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
const CNPJ_WEIGHTS_2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

/**
 * Validate a CNPJ number
 */
export function isValidCnpj(cnpj: string | null | undefined): boolean {
  if (!cnpj || typeof cnpj !== 'string') return false
  const digits = cnpj.replace(/\D/g, '')

  if (digits.length !== 14) return false
  if (/^(\d)\1{13}$/.test(digits)) return false

  // First check digit
  let sum = 0
  for (let i = 0; i < 12; i++) {
    sum += parseInt(digits[i]) * CNPJ_WEIGHTS_1[i]
  }
  let remainder = sum % 11
  const check1 = remainder < 2 ? 0 : 11 - remainder
  if (parseInt(digits[12]) !== check1) return false

  // Second check digit
  sum = 0
  for (let i = 0; i < 13; i++) {
    sum += parseInt(digits[i]) * CNPJ_WEIGHTS_2[i]
  }
  remainder = sum % 11
  const check2 = remainder < 2 ? 0 : 11 - remainder
  if (parseInt(digits[13]) !== check2) return false

  return true
}

/**
 * Format a CNPJ: 12345678000199 → 12.345.678/0001-99
 */
export function formatCnpj(cnpj: string | null | undefined): string {
  if (!cnpj) return ''
  const digits = cnpj.replace(/\D/g, '')
  if (digits.length !== 14) return cnpj
  return `${digits.slice(0, 2)}.${digits.slice(2, 5)}.${digits.slice(5, 8)}/${digits.slice(8, 12)}-${digits.slice(12)}`
}
