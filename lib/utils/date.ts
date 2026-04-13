import { format, parseISO } from 'date-fns'
import { ptBR } from 'date-fns/locale'

export function formatDatePtBR(dateStr: string, approx = false): string {
  const date = parseISO(dateStr)
  const formatted = format(date, "d 'de' MMMM 'de' yyyy", { locale: ptBR })
  return approx ? `aprox. ${formatted}` : formatted
}

export function formatDateShort(dateStr: string): string {
  return format(parseISO(dateStr), 'dd/MM/yyyy', { locale: ptBR })
}
