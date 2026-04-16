/**
 * Brazilian phone number utilities
 */

/**
 * Format a Brazilian phone number
 * Input: 11999887766 → Output: (11) 99988-7766
 */
export function formatPhone(phone: string | null | undefined): string {
  if (!phone) return ''
  const digits = phone.replace(/\D/g, '')

  if (digits.length === 11) {
    return `(${digits.slice(0, 2)}) ${digits.slice(2, 7)}-${digits.slice(7)}`
  }
  if (digits.length === 10) {
    return `(${digits.slice(0, 2)}) ${digits.slice(2, 6)}-${digits.slice(6)}`
  }
  if (digits.length === 13 && digits.startsWith('55')) {
    return `+55 (${digits.slice(2, 4)}) ${digits.slice(4, 9)}-${digits.slice(9)}`
  }

  return phone
}

/**
 * Validate a Brazilian phone number
 */
export function isValidPhone(phone: string | null | undefined): boolean {
  if (!phone || typeof phone !== 'string') return false
  const digits = phone.replace(/\D/g, '')
  return digits.length === 10 || digits.length === 11
}

/**
 * Generate a WhatsApp link
 */
export function whatsappLink(phone: string, message?: string): string {
  const digits = phone.replace(/\D/g, '')
  const fullNumber = digits.startsWith('55') ? digits : `55${digits}`
  const params = message ? `?text=${encodeURIComponent(message)}` : ''
  return `https://wa.me/${fullNumber}${params}`
}
