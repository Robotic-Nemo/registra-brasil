'use client'

import { X } from 'lucide-react'

interface Chip {
  id: string
  label: string
  color?: string
}

interface Props {
  chips: Chip[]
  selected: Set<string>
  onChange: (selected: Set<string>) => void
  className?: string
}

export function ChipGroup({ chips, selected, onChange, className = '' }: Props) {
  function toggle(id: string) {
    const next = new Set(selected)
    if (next.has(id)) {
      next.delete(id)
    } else {
      next.add(id)
    }
    onChange(next)
  }

  return (
    <div className={`flex flex-wrap gap-2 ${className}`} role="group">
      {chips.map((chip) => {
        const isSelected = selected.has(chip.id)
        return (
          <button
            key={chip.id}
            onClick={() => toggle(chip.id)}
            aria-pressed={isSelected}
            className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium border transition-colors ${
              isSelected
                ? 'bg-blue-50 border-blue-300 text-blue-700'
                : 'bg-white border-gray-200 text-gray-600 hover:border-gray-300'
            }`}
          >
            {chip.color && (
              <span
                className="w-2 h-2 rounded-full flex-shrink-0"
                style={{ backgroundColor: chip.color }}
              />
            )}
            {chip.label}
            {isSelected && <X className="w-3 h-3" />}
          </button>
        )
      })}
    </div>
  )
}
