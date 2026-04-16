'use client'

interface ButtonOption {
  value: string
  label: string
}

interface Props {
  options: ButtonOption[]
  value: string
  onChange: (value: string) => void
  className?: string
  'aria-label'?: string
}

export function ButtonGroup({ options, value, onChange, className = '', ...rest }: Props) {
  return (
    <div
      role="radiogroup"
      aria-label={rest['aria-label']}
      className={`inline-flex rounded-lg border border-gray-200 divide-x divide-gray-200 overflow-hidden ${className}`}
    >
      {options.map((opt) => (
        <button
          key={opt.value}
          role="radio"
          aria-checked={value === opt.value}
          onClick={() => onChange(opt.value)}
          className={`px-3 py-1.5 text-sm font-medium transition-colors ${
            value === opt.value
              ? 'bg-blue-600 text-white'
              : 'bg-white text-gray-600 hover:bg-gray-50'
          }`}
        >
          {opt.label}
        </button>
      ))}
    </div>
  )
}
