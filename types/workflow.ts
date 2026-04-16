export type WorkflowStage = 'draft' | 'review' | 'verified' | 'disputed' | 'removed'

export interface WorkflowTransition {
  from: WorkflowStage
  to: WorkflowStage
  label: string
  requiresNote: boolean
}

export interface ReviewNote {
  id: string
  statement_id: string
  author: string
  content: string
  stage: WorkflowStage
  created_at: string
}

export interface EditorAssignment {
  statement_id: string
  editor_id: string
  editor_label: string
  assigned_at: string
  completed_at: string | null
}

export const WORKFLOW_STAGES: { stage: WorkflowStage; label: string; color: string }[] = [
  { stage: 'draft', label: 'Rascunho', color: 'gray' },
  { stage: 'review', label: 'Em revisao', color: 'yellow' },
  { stage: 'verified', label: 'Verificada', color: 'green' },
  { stage: 'disputed', label: 'Disputada', color: 'orange' },
  { stage: 'removed', label: 'Removida', color: 'red' },
]

export const WORKFLOW_TRANSITIONS: WorkflowTransition[] = [
  { from: 'draft', to: 'review', label: 'Enviar para revisao', requiresNote: false },
  { from: 'review', to: 'verified', label: 'Aprovar', requiresNote: false },
  { from: 'review', to: 'disputed', label: 'Disputar', requiresNote: true },
  { from: 'review', to: 'draft', label: 'Devolver ao rascunho', requiresNote: true },
  { from: 'verified', to: 'disputed', label: 'Disputar', requiresNote: true },
  { from: 'verified', to: 'removed', label: 'Remover', requiresNote: true },
  { from: 'disputed', to: 'review', label: 'Reabrir revisao', requiresNote: true },
  { from: 'disputed', to: 'removed', label: 'Remover', requiresNote: true },
]
