import Link from 'next/link'

interface Props {
  years: number[]
  currentYear: number
}

export function YearSelector({ years, currentYear }: Props) {
  return (
    <nav className="flex flex-wrap gap-2" aria-label="Selecionar ano">
      {years.map((year) => (
        <Link
          key={year}
          href={`/linha-do-tempo/${year}`}
          className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
            year === currentYear
              ? 'bg-blue-600 text-white'
              : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
          }`}
          aria-current={year === currentYear ? 'page' : undefined}
        >
          {year}
        </Link>
      ))}
    </nav>
  )
}
