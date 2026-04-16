import type { QualityScore } from '@/lib/utils/data-quality'

interface DataQualityCardProps {
  score: QualityScore
}

export function DataQualityCard({ score }: DataQualityCardProps) {
  const color =
    score.score >= 80
      ? 'text-green-600'
      : score.score >= 60
        ? 'text-yellow-600'
        : 'text-red-600'

  const ringColor =
    score.score >= 80
      ? 'stroke-green-500'
      : score.score >= 60
        ? 'stroke-yellow-500'
        : 'stroke-red-500'

  const circumference = 2 * Math.PI * 40
  const offset = circumference - (score.score / 100) * circumference

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-6 flex items-center gap-6">
      {/* Score ring */}
      <div className="relative w-24 h-24 shrink-0">
        <svg className="w-24 h-24 -rotate-90" viewBox="0 0 100 100">
          <circle cx="50" cy="50" r="40" fill="none" stroke="#e5e7eb" strokeWidth="8" />
          <circle
            cx="50"
            cy="50"
            r="40"
            fill="none"
            className={ringColor}
            strokeWidth="8"
            strokeLinecap="round"
            strokeDasharray={circumference}
            strokeDashoffset={offset}
          />
        </svg>
        <div className="absolute inset-0 flex items-center justify-center">
          <span className={`text-2xl font-bold ${color}`}>{score.score}</span>
        </div>
      </div>

      <div>
        <h3 className="text-sm font-semibold text-gray-700 mb-1">Qualidade dos Dados</h3>
        <p className="text-xs text-gray-500 mb-2">
          {score.total} declaracoes analisadas, {score.issues} problemas encontrados
        </p>
        <div className="flex flex-wrap gap-2">
          {Object.entries(score.byType).map(([type, count]) => (
            <span
              key={type}
              className="inline-flex items-center gap-1 px-2 py-0.5 text-[10px] font-medium rounded-full bg-gray-100 text-gray-600"
            >
              {type.replace(/_/g, ' ')}
              <span className="font-bold">{count}</span>
            </span>
          ))}
        </div>
      </div>
    </div>
  )
}
