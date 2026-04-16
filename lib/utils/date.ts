import { format, parseISO, isValid } from 'date-fns'
import { ptBR } from 'date-fns/locale'

export function formatDatePtBR(dateStr: string | null | undefined, approx = false): string {
  if (!dateStr) return ''
  try {
    const date = parseISO(dateStr)
    if (!isValid(date)) return dateStr
    const formatted = format(date, "d 'de' MMMM 'de' yyyy", { locale: ptBR })
    return approx ? `aprox. ${formatted}` : formatted
  } catch {
    return dateStr
  }
}

export function formatDateShort(dateStr: string): string {
  try {
    const date = parseISO(dateStr)
    if (!isValid(date)) return dateStr
    return format(date, 'dd/MM/yyyy', { locale: ptBR })
  } catch {
    return dateStr
  }
}

export function formatDateRelative(dateStr: string): string {
  try {
    const date = parseISO(dateStr)
    if (!isValid(date)) return dateStr
    const now = new Date()
    const diffMs = now.getTime() - date.getTime()
    const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24))

    if (diffDays < 0) return formatDateShort(dateStr)
    if (diffDays === 0) return 'hoje'
    if (diffDays === 1) return 'ontem'
    if (diffDays <= 7) return `há ${diffDays} dias`
    const weeks = Math.floor(diffDays / 7)
    if (diffDays <= 30) return weeks === 1 ? 'há 1 semana' : `há ${weeks} semanas`
    const months = Math.floor(diffDays / 30)
    if (diffDays <= 365) return months === 1 ? 'há 1 mês' : `há ${months} meses`
    const years = Math.floor(diffDays / 365)
    return years === 1 ? 'há 1 ano' : `há ${years} anos`
  } catch {
    return dateStr
  }
}
