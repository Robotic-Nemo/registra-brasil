'use client'

import { useRef, useCallback, type KeyboardEvent, type ClipboardEvent } from 'react'

interface Props {
  /** Number of input digits. */
  length?: number
  /** Current value array. */
  value: string[]
  /** Called when value changes. */
  onChange: (value: string[]) => void
  /** Called when all digits are filled. */
  onComplete?: (code: string) => void
  /** Mask input (for passwords). */
  masked?: boolean
  /** Disable all inputs. */
  disabled?: boolean
  className?: string
}

/**
 * PIN/OTP code input with auto-advance between digits.
 */
export function PinInput({
  length = 6,
  value,
  onChange,
  onComplete,
  masked = false,
  disabled = false,
  className = '',
}: Props) {
  const inputRefs = useRef<(HTMLInputElement | null)[]>([])

  const focusInput = useCallback((index: number) => {
    const input = inputRefs.current[index]
    if (input) {
      input.focus()
      input.select()
    }
  }, [])

  const handleChange = useCallback(
    (index: number, digit: string) => {
      if (!/^\d?$/.test(digit)) return

      const newValue = [...value]
      newValue[index] = digit
      onChange(newValue)

      if (digit && index < length - 1) {
        focusInput(index + 1)
      }

      if (digit && newValue.every((v) => v !== '')) {
        onComplete?.(newValue.join(''))
      }
    },
    [value, onChange, onComplete, length, focusInput]
  )

  const handleKeyDown = useCallback(
    (index: number, e: KeyboardEvent<HTMLInputElement>) => {
      if (e.key === 'Backspace' && !value[index] && index > 0) {
        focusInput(index - 1)
      }
      if (e.key === 'ArrowLeft' && index > 0) {
        e.preventDefault()
        focusInput(index - 1)
      }
      if (e.key === 'ArrowRight' && index < length - 1) {
        e.preventDefault()
        focusInput(index + 1)
      }
    },
    [value, length, focusInput]
  )

  const handlePaste = useCallback(
    (e: ClipboardEvent<HTMLInputElement>) => {
      e.preventDefault()
      const pasted = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, length)
      if (!pasted) return

      const newValue = [...value]
      for (let i = 0; i < pasted.length; i++) {
        newValue[i] = pasted[i]
      }
      onChange(newValue)

      if (newValue.every((v) => v !== '')) {
        onComplete?.(newValue.join(''))
      } else {
        focusInput(Math.min(pasted.length, length - 1))
      }
    },
    [value, onChange, onComplete, length, focusInput]
  )

  return (
    <div className={`flex gap-2 ${className}`} role="group" aria-label="Codigo de verificacao">
      {Array.from({ length }).map((_, i) => (
        <input
          key={i}
          ref={(el) => { inputRefs.current[i] = el }}
          type={masked ? 'password' : 'text'}
          inputMode="numeric"
          pattern="[0-9]*"
          maxLength={1}
          value={value[i] ?? ''}
          onChange={(e) => handleChange(i, e.target.value)}
          onKeyDown={(e) => handleKeyDown(i, e)}
          onPaste={i === 0 ? handlePaste : undefined}
          onFocus={(e) => e.target.select()}
          disabled={disabled}
          aria-label={`Digito ${i + 1}`}
          className="w-10 h-12 text-center text-lg font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 disabled:bg-gray-100 disabled:text-gray-400"
        />
      ))}
    </div>
  )
}
