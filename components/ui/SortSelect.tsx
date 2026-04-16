'use client'

import { useRouter, usePathname, useSearchParams } from 'next/navigation'
import { ArrowUpDown } from 'lucide-react'

interface SortOption {
  value: string
  label: string
}

interface Props {
  options: SortOption[]
  paramName?: string
  className?: string
}

export function SortSelect({ options, paramName = 'ordenar', className = '' }: Props) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()

  const current = searchParams.get(paramName) ?? options[0]?.value ?? ''

  function onChange(value: string) {
    const params = new URLSearchParams(searchParams.toString())
    if (value === options[0]?.value) {
      params.delete(paramName)
    } else {
      params.set(paramName, value)
    }
    params.delete('page')
    const qs = params.toString()
    router.push(qs ? `${pathname}?${qs}` : pathname)
  }

  return (
    <div className={`flex items-center gap-2 ${className}`}>
      <ArrowUpDown className="w-4 h-4 text-gray-400" />
      <select
        value={current}
        onChange={(e) => onChange(e.target.value)}
        aria-label="Ordenar por"
        className="text-sm border border-gray-300 rounded-lg px-2 py-1.5 focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white"
      >
        {options.map((opt) => (
          <option key={opt.value} value={opt.value}>{opt.label}</option>
        ))}
      </select>
    </div>
  )
}
