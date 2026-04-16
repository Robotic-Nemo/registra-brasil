interface Props {
  context: string
}

export function ContextBox({ context }: Props) {
  return (
    <div className="bg-gray-50 rounded-lg p-4 text-sm text-gray-700">
      <p className="font-semibold text-gray-900 mb-1">Contexto</p>
      <p>{context}</p>
    </div>
  )
}
