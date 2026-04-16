'use client'

import { useState, useTransition } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'

interface AdminSearchBarProps {
  placeholder?: string
  paramName?: string
}

export function AdminSearchBar({
  placeholder = 'Buscar...',
  paramName = 'q',
}: AdminSearchBarProps) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [isPending, startTransition] = useTransition()
  const [query, setQuery] = useState(searchParams.get(paramName) ?? '')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    const params = new URLSearchParams(searchParams.toString())
    if (query.trim()) {
      params.set(paramName, query.trim())
    } else {
      params.delete(paramName)
    }
    params.delete('page')
    startTransition(() => {
      router.push(`?${params.toString()}`)
    })
  }

  return (
    <form onSubmit={handleSubmit} className="flex gap-2">
      <input
        type="search"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder={placeholder}
        className="flex-1 px-3 py-2 text-sm border border-zinc-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"
        aria-label="Buscar no admin"
      />
      <button
        type="submit"
        disabled={isPending}
        className="px-4 py-2 bg-zinc-800 text-white text-sm rounded-lg hover:bg-zinc-700 disabled:opacity-50"
      >
        {isPending ? '...' : 'Buscar'}
      </button>
    </form>
  )
}
