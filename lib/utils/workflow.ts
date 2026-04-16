import type { WorkflowStage, WorkflowTransition } from '@/types/workflow'
import { WORKFLOW_TRANSITIONS } from '@/types/workflow'

/**
 * Get available transitions from a given stage.
 */
export function getAvailableTransitions(currentStage: WorkflowStage): WorkflowTransition[] {
  return WORKFLOW_TRANSITIONS.filter((t) => t.from === currentStage)
}

/**
 * Check if a transition is valid.
 */
export function isValidTransition(from: WorkflowStage, to: WorkflowStage): boolean {
  return WORKFLOW_TRANSITIONS.some((t) => t.from === from && t.to === to)
}

/**
 * Get the transition object for a specific from->to pair.
 */
export function getTransition(from: WorkflowStage, to: WorkflowStage): WorkflowTransition | null {
  return WORKFLOW_TRANSITIONS.find((t) => t.from === from && t.to === to) ?? null
}

/**
 * Map verification_status to workflow stage.
 * 'unverified' maps to either 'draft' or 'review' based on context.
 */
export function statusToStage(status: string): WorkflowStage {
  switch (status) {
    case 'verified':
      return 'verified'
    case 'disputed':
      return 'disputed'
    case 'removed':
      return 'removed'
    case 'unverified':
    default:
      return 'draft'
  }
}

/**
 * Map workflow stage back to verification_status.
 */
export function stageToStatus(stage: WorkflowStage): string {
  switch (stage) {
    case 'verified':
      return 'verified'
    case 'disputed':
      return 'disputed'
    case 'removed':
      return 'removed'
    case 'review':
    case 'draft':
    default:
      return 'unverified'
  }
}

/**
 * Get color classes for a workflow stage.
 */
export function getStageColor(stage: WorkflowStage): { text: string; bg: string; border: string } {
  switch (stage) {
    case 'draft':
      return { text: 'text-gray-700', bg: 'bg-gray-100', border: 'border-gray-300' }
    case 'review':
      return { text: 'text-yellow-700', bg: 'bg-yellow-100', border: 'border-yellow-300' }
    case 'verified':
      return { text: 'text-green-700', bg: 'bg-green-100', border: 'border-green-300' }
    case 'disputed':
      return { text: 'text-orange-700', bg: 'bg-orange-100', border: 'border-orange-300' }
    case 'removed':
      return { text: 'text-red-700', bg: 'bg-red-100', border: 'border-red-300' }
    default:
      return { text: 'text-gray-700', bg: 'bg-gray-100', border: 'border-gray-300' }
  }
}
