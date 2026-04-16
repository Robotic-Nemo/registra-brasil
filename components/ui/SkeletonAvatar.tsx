interface Props {
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const SIZE_MAP = {
  sm: 'w-8 h-8',
  md: 'w-10 h-10',
  lg: 'w-14 h-14',
} as const

/**
 * Circular skeleton placeholder for avatars.
 */
export function SkeletonAvatar({ size = 'md', className = '' }: Props) {
  return (
    <div
      className={`rounded-full bg-gray-200 animate-pulse ${SIZE_MAP[size]} ${className}`}
      aria-hidden="true"
      role="status"
      aria-label="Carregando avatar"
    />
  )
}
