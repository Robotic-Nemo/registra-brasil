interface Props {
  orientation?: 'horizontal' | 'vertical'
  className?: string
}

export function Separator({ orientation = 'horizontal', className = '' }: Props) {
  if (orientation === 'vertical') {
    return <div className={`w-px bg-gray-200 self-stretch ${className}`} role="separator" aria-orientation="vertical" />
  }
  return <hr className={`border-gray-200 ${className}`} role="separator" />
}
