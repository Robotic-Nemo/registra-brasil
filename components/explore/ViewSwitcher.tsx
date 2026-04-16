'use client'

type ViewMode = 'grid' | 'lista' | 'timeline'

interface Props {
  value: ViewMode
  onChange: (value: ViewMode) => void
}

const VIEWS: { value: ViewMode; label: string; icon: string }[] = [
  { value: 'grid', label: 'Grade', icon: '▦' },
  { value: 'lista', label: 'Lista', icon: '☰' },
  { value: 'timeline', label: 'Linha do tempo', icon: '⏳' },
]

export function ViewSwitcher({ value, onChange }: Props) {
  return (
    <div className="flex items-center rounded-lg border border-gray-200 overflow-hidden" role="radiogroup" aria-label="Modo de visualizacao">
      {VIEWS.map((view) => (
        <button
          key={view.value}
          role="radio"
          aria-checked={value === view.value}
          onClick={() => onChange(view.value)}
          className={`px-3 py-1.5 text-sm transition-colors ${
            value === view.value
              ? 'bg-blue-50 text-blue-700 font-medium'
              : 'text-gray-500 hover:bg-gray-50'
          }`}
          title={view.label}
        >
          <span className="mr-1">{view.icon}</span>
          <span className="hidden sm:inline">{view.label}</span>
        </button>
      ))}
    </div>
  )
}
