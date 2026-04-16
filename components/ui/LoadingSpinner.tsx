interface Props {
  size?: 'sm' | 'md' | 'lg'
  className?: string
  label?: string
}

const sizeMap = {
  sm: 'w-4 h-4 border-2',
  md: 'w-6 h-6 border-2',
  lg: 'w-10 h-10 border-3',
} as const

export function LoadingSpinner({ size = 'md', className = '', label = 'Carregando...' }: Props) {
  return (
    <div className={`flex items-center justify-center gap-2 ${className}`} role="status" aria-busy="true" aria-label={label}>
      <div
        className={`${sizeMap[size]} rounded-full border-gray-200 border-t-blue-600 animate-spin`}
      />
      <span className="sr-only">{label}</span>
    </div>
  )
}
