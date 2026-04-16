'use client'

interface PrintViewProps {
  summary: string
  fullQuote?: string | null
  context?: string | null
  politicianName: string
  party: string
  date: string
  source: string
  venue?: string | null
}

export function PrintView({
  summary,
  fullQuote,
  context,
  politicianName,
  party,
  date,
  source,
  venue,
}: PrintViewProps) {
  return (
    <div className="hidden print:block print:text-black">
      <div className="border-b-2 border-black pb-2 mb-4">
        <h1 className="text-xl font-bold">Registra Brasil</h1>
        <p className="text-sm">Registro público de declarações de políticos brasileiros</p>
      </div>

      <div className="mb-4">
        <h2 className="text-lg font-semibold mb-1">{summary}</h2>
        <p className="text-sm">
          <strong>{politicianName}</strong> ({party}) — {date}
        </p>
        {venue && <p className="text-sm text-gray-600">Local: {venue}</p>}
      </div>

      {fullQuote && (
        <div className="mb-4">
          <h3 className="text-sm font-semibold mb-1">Citação completa:</h3>
          <blockquote className="border-l-4 border-gray-400 pl-3 italic">
            &ldquo;{fullQuote}&rdquo;
          </blockquote>
        </div>
      )}

      {context && (
        <div className="mb-4">
          <h3 className="text-sm font-semibold mb-1">Contexto:</h3>
          <p>{context}</p>
        </div>
      )}

      <div className="border-t border-gray-300 pt-2 mt-4 text-xs text-gray-500">
        <p>Fonte: {source}</p>
        <p>Impresso em: {new Date().toLocaleDateString('pt-BR')}</p>
        <p>registrabrasil.com.br</p>
      </div>
    </div>
  )
}
