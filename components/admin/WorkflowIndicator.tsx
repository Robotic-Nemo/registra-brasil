import { WORKFLOW_STAGES, type WorkflowStage } from '@/types/workflow'
import { getStageColor } from '@/lib/utils/workflow'
import { Check } from 'lucide-react'

interface WorkflowIndicatorProps {
  currentStage: WorkflowStage
  compact?: boolean
}

export function WorkflowIndicator({ currentStage, compact = false }: WorkflowIndicatorProps) {
  const progressStages = WORKFLOW_STAGES.filter((s) => s.stage !== 'removed')
  const currentIndex = progressStages.findIndex((s) => s.stage === currentStage)
  const colors = getStageColor(currentStage)

  if (compact) {
    return (
      <span className={`inline-flex items-center gap-1 px-2 py-0.5 text-xs font-medium rounded-full ${colors.bg} ${colors.text}`}>
        {WORKFLOW_STAGES.find((s) => s.stage === currentStage)?.label ?? currentStage}
      </span>
    )
  }

  return (
    <div className="flex items-center gap-1">
      {progressStages.map((stage, i) => {
        const isActive = stage.stage === currentStage
        const isPast = i < currentIndex
        const stageColors = getStageColor(stage.stage)

        return (
          <div key={stage.stage} className="flex items-center">
            {i > 0 && (
              <div className={`w-8 h-0.5 ${isPast ? 'bg-green-400' : 'bg-gray-200'}`} />
            )}
            <div
              className={`w-7 h-7 rounded-full flex items-center justify-center text-[10px] font-bold ${
                isActive
                  ? `${stageColors.bg} ${stageColors.text} ring-2 ${stageColors.border}`
                  : isPast
                    ? 'bg-green-100 text-green-700'
                    : 'bg-gray-100 text-gray-400'
              }`}
              title={stage.label}
            >
              {isPast ? <Check className="w-3.5 h-3.5" /> : i + 1}
            </div>
          </div>
        )
      })}
    </div>
  )
}
