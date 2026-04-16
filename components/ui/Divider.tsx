interface DividerProps {
  label?: string
  className?: string
}

export function Divider({ label, className = '' }: DividerProps) {
  if (label) {
    return (
      <div className={`relative flex items-center ${className}`}>
        <div className="flex-grow border-t border-gray-200" />
        <span className="flex-shrink mx-3 text-xs text-gray-400 uppercase tracking-wider">{label}</span>
        <div className="flex-grow border-t border-gray-200" />
      </div>
    )
  }

  return <hr className={`border-gray-200 ${className}`} />
}
