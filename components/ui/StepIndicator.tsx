import { Check } from 'lucide-react'

interface Props {
  /** Current step (1-indexed). */
  current: number
  /** Total number of steps. */
  total: number
  /** Optional labels for each step. */
  labels?: string[]
  className?: string
}

/**
 * Simple step indicator showing progress through a multi-step process.
 * Displays as: (1) --- (2) --- (3) with filled/current/pending states.
 */
export function StepIndicator({ current, total, labels, className = '' }: Props) {
  return (
    <div className={`flex items-center ${className}`} role="group" aria-label={`Passo ${current} de ${total}`}>
      {Array.from({ length: total }).map((_, i) => {
        const step = i + 1
        const isCompleted = step < current
        const isCurrent = step === current

        return (
          <div key={step} className="flex items-center">
            {i > 0 && (
              <div
                className={`h-0.5 w-8 mx-1 ${
                  isCompleted ? 'bg-blue-600' : 'bg-gray-200'
                }`}
                aria-hidden="true"
              />
            )}
            <div className="flex flex-col items-center gap-1">
              <div
                className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-medium transition-colors ${
                  isCompleted
                    ? 'bg-blue-600 text-white'
                    : isCurrent
                    ? 'bg-blue-100 text-blue-700 ring-2 ring-blue-600'
                    : 'bg-gray-100 text-gray-400'
                }`}
                aria-current={isCurrent ? 'step' : undefined}
              >
                {isCompleted ? (
                  <Check className="w-4 h-4" aria-hidden="true" />
                ) : (
                  step
                )}
              </div>
              {labels?.[i] && (
                <span
                  className={`text-xs whitespace-nowrap ${
                    isCurrent ? 'text-blue-700 font-medium' : isCompleted ? 'text-gray-600' : 'text-gray-400'
                  }`}
                >
                  {labels[i]}
                </span>
              )}
            </div>
          </div>
        )
      })}
    </div>
  )
}
