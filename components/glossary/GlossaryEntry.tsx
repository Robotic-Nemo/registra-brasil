import type { GlossaryTerm } from '@/lib/constants/glossary'

interface Props {
  term: GlossaryTerm
}

const CATEGORY_COLORS: Record<string, { bg: string; text: string }> = {
  processo: { bg: 'bg-purple-50', text: 'text-purple-700' },
  instituicao: { bg: 'bg-blue-50', text: 'text-blue-700' },
  cargo: { bg: 'bg-green-50', text: 'text-green-700' },
  conceito: { bg: 'bg-amber-50', text: 'text-amber-700' },
  legislacao: { bg: 'bg-red-50', text: 'text-red-700' },
}

const CATEGORY_LABELS: Record<string, string> = {
  processo: 'Processo',
  instituicao: 'Instituicao',
  cargo: 'Cargo',
  conceito: 'Conceito',
  legislacao: 'Legislacao',
}

export function GlossaryEntry({ term }: Props) {
  const colors = CATEGORY_COLORS[term.category] ?? { bg: 'bg-gray-50', text: 'text-gray-700' }

  return (
    <div
      id={term.slug}
      className="bg-white border border-gray-200 rounded-lg p-4 scroll-mt-20"
    >
      <div className="flex items-start justify-between gap-2 mb-2">
        <h3 className="text-base font-semibold text-gray-900">{term.term}</h3>
        <span className={`text-[10px] font-medium px-2 py-0.5 rounded-full whitespace-nowrap ${colors.bg} ${colors.text}`}>
          {CATEGORY_LABELS[term.category] ?? term.category}
        </span>
      </div>
      <p className="text-sm text-gray-600 leading-relaxed">{term.definition}</p>
    </div>
  )
}
