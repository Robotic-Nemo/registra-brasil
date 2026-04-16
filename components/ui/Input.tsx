import { forwardRef, type InputHTMLAttributes } from 'react'

interface Props extends InputHTMLAttributes<HTMLInputElement> {
  error?: boolean
  leftIcon?: React.ReactNode
}

export const Input = forwardRef<HTMLInputElement, Props>(
  ({ error, leftIcon, className = '', ...props }, ref) => {
    return (
      <div className="relative">
        {leftIcon && (
          <span className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none">
            {leftIcon}
          </span>
        )}
        <input
          ref={ref}
          className={`w-full text-sm border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 transition-colors ${
            leftIcon ? 'pl-9' : ''
          } ${
            error
              ? 'border-red-300 focus:ring-red-500'
              : 'border-gray-300 focus:ring-blue-500 focus:border-transparent'
          } ${className}`}
          {...props}
        />
      </div>
    )
  }
)

Input.displayName = 'Input'
