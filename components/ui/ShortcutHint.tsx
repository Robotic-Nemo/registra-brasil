interface ShortcutHintProps {
  keys: string[]
  className?: string
}

/**
 * Displays keyboard shortcut hints inline.
 * Example: <ShortcutHint keys={['Ctrl', 'K']} />
 */
export function ShortcutHint({ keys, className = '' }: ShortcutHintProps) {
  return (
    <span className={`inline-flex items-center gap-0.5 ${className}`} aria-label={`Atalho: ${keys.join(' + ')}`}>
      {keys.map((key, i) => (
        <span key={i}>
          <kbd className="inline-block min-w-[1.5em] text-center px-1.5 py-0.5 text-xs font-mono font-medium text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded shadow-sm">
            {key}
          </kbd>
          {i < keys.length - 1 && <span className="text-gray-300 dark:text-gray-600 mx-0.5">+</span>}
        </span>
      ))}
    </span>
  )
}
