import Image from 'next/image'
import { getPartyColor } from '@/lib/constants/party-colors'

interface AvatarProps {
  src?: string | null
  name: string
  party?: string
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const sizeMap = {
  sm: { px: 32, cls: 'w-8 h-8 text-xs' },
  md: { px: 48, cls: 'w-12 h-12 text-lg' },
  lg: { px: 80, cls: 'w-20 h-20 text-2xl' },
} as const

export function Avatar({ src, name, party, size = 'md', className = '' }: AvatarProps) {
  const { px, cls } = sizeMap[size]
  const initials = name
    .split(' ')
    .filter(Boolean)
    .slice(0, 2)
    .map((w) => w[0])
    .join('')
    .toUpperCase()

  const bgColor = party ? getPartyColor(party) : '#9ca3af'

  if (src) {
    return (
      <Image
        src={src}
        alt={name}
        width={px}
        height={px}
        sizes={`${px}px`}
        className={`${cls} rounded-full object-cover border border-gray-200 ${className}`}
        referrerPolicy="no-referrer"
      />
    )
  }

  return (
    <div
      className={`${cls} rounded-full flex items-center justify-center font-bold text-white ${className}`}
      style={{ backgroundColor: bgColor }}
      aria-label={name}
    >
      {initials || '?'}
    </div>
  )
}
