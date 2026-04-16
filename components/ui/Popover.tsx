'use client'

import { useState, useRef, type ReactNode } from 'react'
import { useOnClickOutside } from '@/lib/hooks/useOnClickOutside'

interface Props {
  trigger: ReactNode
  children: ReactNode
  align?: 'left' | 'right' | 'center'
  className?: string
}

export function Popover({ trigger, children, align = 'left', className = '' }: Props) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)

  useOnClickOutside(ref, () => setOpen(false))

  const alignClass = {
    left: 'left-0',
    right: 'right-0',
    center: 'left-1/2 -translate-x-1/2',
  }[align]

  return (
    <div className={`relative inline-block ${className}`} ref={ref}>
      <div onClick={() => setOpen(!open)} className="cursor-pointer">
        {trigger}
      </div>
      {open && (
        <div className={`absolute top-full mt-2 ${alignClass} bg-white border border-gray-200 rounded-lg shadow-lg z-50 min-w-[200px]`}>
          {children}
        </div>
      )}
    </div>
  )
}
