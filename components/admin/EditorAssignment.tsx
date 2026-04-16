'use client'

import { useState } from 'react'
import { UserPlus, Check, X } from 'lucide-react'

interface EditorOption {
  id: string
  label: string
}

interface EditorAssignmentProps {
  statementId: string
  currentEditor?: string | null
  editors: EditorOption[]
  onAssign?: (editorId: string) => Promise<void>
  onUnassign?: () => Promise<void>
}

export function EditorAssignment({
  statementId,
  currentEditor,
  editors,
  onAssign,
  onUnassign,
}: EditorAssignmentProps) {
  const [selectedEditor, setSelectedEditor] = useState('')
  const [assigning, setAssigning] = useState(false)

  async function handleAssign() {
    if (!selectedEditor || !onAssign) return
    setAssigning(true)
    try {
      await onAssign(selectedEditor)
      setSelectedEditor('')
    } catch {
      // silently fail
    }
    setAssigning(false)
  }

  async function handleUnassign() {
    if (!onUnassign) return
    setAssigning(true)
    try {
      await onUnassign()
    } catch {
      // silently fail
    }
    setAssigning(false)
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-4">
      <div className="flex items-center gap-2 mb-3">
        <UserPlus className="w-4 h-4 text-gray-500" />
        <h4 className="text-sm font-semibold text-gray-700">Atribuicao de editor</h4>
      </div>

      {currentEditor ? (
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-full bg-blue-100 flex items-center justify-center text-xs font-bold text-blue-700">
              {currentEditor.charAt(0).toUpperCase()}
            </div>
            <span className="text-sm text-gray-700">{currentEditor}</span>
          </div>
          {onUnassign && (
            <button
              onClick={handleUnassign}
              disabled={assigning}
              className="inline-flex items-center gap-1 px-2 py-1 text-xs text-red-600 hover:bg-red-50 rounded transition-colors"
            >
              <X className="w-3 h-3" />
              Remover
            </button>
          )}
        </div>
      ) : (
        <div className="flex items-center gap-2">
          <select
            value={selectedEditor}
            onChange={(e) => setSelectedEditor(e.target.value)}
            className="flex-1 px-2 py-1.5 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Selecione um editor</option>
            {editors.map((editor) => (
              <option key={editor.id} value={editor.id}>{editor.label}</option>
            ))}
          </select>
          <button
            onClick={handleAssign}
            disabled={!selectedEditor || assigning}
            className="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
          >
            <Check className="w-3.5 h-3.5" />
            Atribuir
          </button>
        </div>
      )}
    </div>
  )
}
