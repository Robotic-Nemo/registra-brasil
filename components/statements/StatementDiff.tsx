'use client'

interface DiffField {
  label: string
  before: string
  after: string
}

interface Props {
  fields: DiffField[]
  className?: string
}

export function StatementDiff({ fields, className = '' }: Props) {
  const changedFields = fields.filter((f) => f.before !== f.after)

  if (changedFields.length === 0) {
    return (
      <p className="text-sm text-gray-400 italic">Nenhuma alteracao detectada.</p>
    )
  }

  return (
    <div className={`flex flex-col gap-4 ${className}`}>
      <p className="text-xs text-gray-500 uppercase tracking-wider font-semibold">
        {changedFields.length} campo{changedFields.length !== 1 ? 's' : ''} alterado{changedFields.length !== 1 ? 's' : ''}
      </p>

      {changedFields.map((field) => (
        <div key={field.label} className="border border-gray-200 rounded-lg overflow-hidden">
          <div className="bg-gray-50 px-3 py-1.5 border-b border-gray-200">
            <span className="text-xs font-semibold text-gray-600">{field.label}</span>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 divide-y sm:divide-y-0 sm:divide-x divide-gray-200">
            <div className="px-3 py-2">
              <p className="text-[10px] uppercase text-red-500 font-semibold mb-1">Antes</p>
              <p className="text-sm text-gray-700 bg-red-50 rounded px-2 py-1 whitespace-pre-wrap break-words">
                {field.before || <span className="italic text-gray-400">(vazio)</span>}
              </p>
            </div>
            <div className="px-3 py-2">
              <p className="text-[10px] uppercase text-green-600 font-semibold mb-1">Depois</p>
              <p className="text-sm text-gray-700 bg-green-50 rounded px-2 py-1 whitespace-pre-wrap break-words">
                {field.after || <span className="italic text-gray-400">(vazio)</span>}
              </p>
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}
