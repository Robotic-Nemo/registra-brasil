interface Props {
  value: number
  currency?: string
  locale?: string
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const SIZE_STYLES = {
  sm: 'text-sm',
  md: 'text-lg',
  lg: 'text-2xl',
} as const

/**
 * Formatted price/value display with currency symbol.
 */
export function PriceTag({
  value,
  currency = 'BRL',
  locale = 'pt-BR',
  size = 'md',
  className = '',
}: Props) {
  const formatted = new Intl.NumberFormat(locale, {
    style: 'currency',
    currency,
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(value)

  return (
    <span className={`font-semibold text-gray-900 ${SIZE_STYLES[size]} ${className}`}>
      {formatted}
    </span>
  )
}
