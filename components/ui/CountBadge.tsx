interface Props {
  count: number
  max?: number
  variant?: 'default' | 'primary' | 'danger'
  className?: string
}

const variants = {
  default: 'bg-gray-200 text-gray-700',
  primary: 'bg-blue-600 text-white',
  danger: 'bg-red-600 text-white',
} as const

export function CountBadge({ count, max = 99, variant = 'default', className = '' }: Props) {
  if (count <= 0) return null

  const display = count > max ? `${max}+` : String(count)

  return (
    <span
      className={`inline-flex items-center justify-center text-xs font-bold rounded-full min-w-[1.25rem] h-5 px-1.5 ${variants[variant]} ${className}`}
    >
      {display}
    </span>
  )
}
