'use client'

import { Check } from 'lucide-react'
import type { ReactNode } from 'react'

export interface StepperStep {
  id: string
  label: string
  description?: string
}

interface StepperProps {
  steps: StepperStep[]
  currentStep: number
  className?: string
}

export function Stepper({ steps, currentStep, className = '' }: StepperProps) {
  return (
    <nav aria-label="Progresso do formulario" className={className}>
      <ol className="flex items-center gap-2">
        {steps.map((step, index) => {
          const isCompleted = index < currentStep
          const isCurrent = index === currentStep
          const isFuture = index > currentStep

          return (
            <li key={step.id} className="flex items-center gap-2 flex-1 last:flex-initial">
              <div className="flex items-center gap-2">
                <div
                  className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold flex-shrink-0 transition-colors ${
                    isCompleted
                      ? 'bg-green-600 text-white'
                      : isCurrent
                        ? 'bg-blue-600 text-white'
                        : 'bg-gray-200 text-gray-500'
                  }`}
                  aria-current={isCurrent ? 'step' : undefined}
                >
                  {isCompleted ? <Check className="w-4 h-4" /> : index + 1}
                </div>
                <div className="hidden sm:block">
                  <p
                    className={`text-sm font-medium ${
                      isFuture ? 'text-gray-400' : 'text-gray-900'
                    }`}
                  >
                    {step.label}
                  </p>
                  {step.description && (
                    <p className="text-xs text-gray-400">{step.description}</p>
                  )}
                </div>
              </div>
              {index < steps.length - 1 && (
                <div
                  className={`flex-1 h-0.5 rounded ${
                    isCompleted ? 'bg-green-600' : 'bg-gray-200'
                  }`}
                  aria-hidden="true"
                />
              )}
            </li>
          )
        })}
      </ol>
    </nav>
  )
}

interface StepperContentProps {
  children: ReactNode
  className?: string
}

export function StepperContent({ children, className = '' }: StepperContentProps) {
  return <div className={`mt-6 ${className}`}>{children}</div>
}
