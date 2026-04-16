'use client'

import { useId } from 'react'

interface RadioOption {
  value: string
  label: string
  description?: string
  disabled?: boolean
}

interface RadioGroupProps {
  name: string
  value: string
  onChange: (value: string) => void
  options: RadioOption[]
  label?: string
  orientation?: 'horizontal' | 'vertical'
}

export function RadioGroup({
  name,
  value,
  onChange,
  options,
  label,
  orientation = 'vertical',
}: RadioGroupProps) {
  const groupId = useId()

  return (
    <fieldset>
      {label && (
        <legend className="block text-sm font-medium text-gray-700 mb-2">{label}</legend>
      )}
      <div
        role="radiogroup"
        aria-label={label}
        className={`flex ${orientation === 'horizontal' ? 'flex-row flex-wrap gap-4' : 'flex-col gap-2'}`}
      >
        {options.map((opt) => {
          const optId = `${groupId}-${opt.value}`
          const isSelected = value === opt.value

          return (
            <label
              key={opt.value}
              htmlFor={optId}
              className={`flex items-start gap-2.5 cursor-pointer rounded-lg border p-3 transition-colors ${
                opt.disabled
                  ? 'opacity-50 cursor-not-allowed'
                  : isSelected
                  ? 'border-blue-400 bg-blue-50'
                  : 'border-gray-200 hover:border-gray-300 hover:bg-gray-50'
              }`}
            >
              <input
                type="radio"
                id={optId}
                name={name}
                value={opt.value}
                checked={isSelected}
                disabled={opt.disabled}
                onChange={() => onChange(opt.value)}
                className="mt-0.5 accent-blue-600"
              />
              <div>
                <span className="text-sm font-medium text-gray-900">{opt.label}</span>
                {opt.description && (
                  <p className="text-xs text-gray-500 mt-0.5">{opt.description}</p>
                )}
              </div>
            </label>
          )
        })}
      </div>
    </fieldset>
  )
}
