'use client'

import { forwardRef, useState, useId, type TextareaHTMLAttributes } from 'react'

interface TextAreaProps extends Omit<TextareaHTMLAttributes<HTMLTextAreaElement>, 'className'> {
  label?: string
  error?: string
  maxLength?: number
  showCount?: boolean
}

export const TextArea = forwardRef<HTMLTextAreaElement, TextAreaProps>(
  function TextArea({ label, error, maxLength, showCount = !!maxLength, id: idProp, ...props }, ref) {
    const generatedId = useId()
    const id = idProp ?? generatedId
    const errorId = `${id}-error`

    const [charCount, setCharCount] = useState(() => {
      const val = typeof props.value === 'string' ? props.value : (props.defaultValue as string) ?? ''
      return val.length
    })

    return (
      <div>
        {label && (
          <label htmlFor={id} className="block text-sm font-medium text-gray-700 mb-1">
            {label}
            {props.required && <span className="text-red-500 ml-0.5">*</span>}
          </label>
        )}
        <textarea
          ref={ref}
          id={id}
          maxLength={maxLength}
          aria-invalid={!!error}
          aria-describedby={error ? errorId : undefined}
          onChange={(e) => {
            setCharCount(e.target.value.length)
            props.onChange?.(e)
          }}
          className={`w-full border rounded-lg px-3 py-2 text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 resize-none transition-colors ${
            error
              ? 'border-red-300 focus:ring-red-500'
              : 'border-gray-300'
          }`}
          {...props}
        />
        <div className="flex items-center justify-between mt-1">
          {error ? (
            <p id={errorId} className="text-xs text-red-600">{error}</p>
          ) : (
            <span />
          )}
          {showCount && maxLength && (
            <span
              className={`text-xs tabular-nums ${
                charCount > maxLength * 0.9 ? 'text-amber-600' : 'text-gray-400'
              }`}
            >
              {charCount}/{maxLength}
            </span>
          )}
        </div>
      </div>
    )
  }
)
