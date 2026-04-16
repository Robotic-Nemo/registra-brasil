import { CopyButton } from '@/components/ui/CopyButton'

interface Props {
  quote: string
  attribution: string
  date: string
}

export function QuoteBlock({ quote, attribution, date }: Props) {
  return (
    <div>
      <blockquote className="border-l-4 border-blue-300 pl-4 text-gray-700 italic text-base leading-relaxed bg-blue-50 py-3 rounded-r-lg">
        &ldquo;{quote}&rdquo;
      </blockquote>
      <div className="mt-1.5 pl-4">
        <CopyButton
          text={`"${quote}" — ${attribution}, ${date}`}
          label="Copiar citação"
        />
      </div>
    </div>
  )
}
