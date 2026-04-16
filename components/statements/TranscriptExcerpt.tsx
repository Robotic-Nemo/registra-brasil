interface Props {
  excerpt: string
}

export function TranscriptExcerpt({ excerpt }: Props) {
  return (
    <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 text-sm">
      <p className="font-semibold text-yellow-900 mb-1">Trecho da transcrição oficial</p>
      <p className="font-mono text-yellow-800 whitespace-pre-wrap">{excerpt}</p>
    </div>
  )
}
