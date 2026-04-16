import { Avatar } from './Avatar'

interface AvatarItem {
  src?: string | null
  name: string
  party?: string
}

interface Props {
  items: AvatarItem[]
  max?: number
  size?: 'sm' | 'md'
  className?: string
}

export function AvatarGroup({ items, max = 5, size = 'sm', className = '' }: Props) {
  const visible = items.slice(0, max)
  const remaining = items.length - max

  return (
    <div className={`flex -space-x-2 ${className}`}>
      {visible.map((item, i) => (
        <div key={i} className="ring-2 ring-white rounded-full" title={item.name}>
          <Avatar src={item.src} name={item.name} party={item.party} size={size} />
        </div>
      ))}
      {remaining > 0 && (
        <div className={`${size === 'sm' ? 'w-8 h-8 text-xs' : 'w-12 h-12 text-sm'} rounded-full bg-gray-200 text-gray-600 font-bold flex items-center justify-center ring-2 ring-white`}>
          +{remaining}
        </div>
      )}
    </div>
  )
}
