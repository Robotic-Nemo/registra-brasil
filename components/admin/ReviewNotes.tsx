'use client'

import { useState } from 'react'
import { MessageSquare, Send } from 'lucide-react'
import type { ReviewNote } from '@/types/workflow'
import { WorkflowIndicator } from './WorkflowIndicator'

interface ReviewNotesProps {
  notes: ReviewNote[]
  statementId: string
  onAddNote?: (content: string) => Promise<void>
}

export function ReviewNotes({ notes, statementId, onAddNote }: ReviewNotesProps) {
  const [newNote, setNewNote] = useState('')
  const [submitting, setSubmitting] = useState(false)

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (!newNote.trim() || !onAddNote) return

    setSubmitting(true)
    try {
      await onAddNote(newNote.trim())
      setNewNote('')
    } catch {
      // silently fail
    }
    setSubmitting(false)
  }

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center gap-2 mb-4">
        <MessageSquare className="w-4 h-4 text-gray-500" />
        <h3 className="text-sm font-semibold text-gray-700">Notas de revisao</h3>
        {notes.length > 0 && (
          <span className="text-xs text-gray-400">({notes.length})</span>
        )}
      </div>

      {notes.length === 0 ? (
        <p className="text-sm text-gray-500 mb-4">Nenhuma nota de revisao ainda.</p>
      ) : (
        <ul className="space-y-3 mb-4">
          {notes.map((note) => (
            <li key={note.id} className="pl-4 border-l-2 border-gray-200">
              <div className="flex items-center gap-2 mb-1">
                <span className="text-xs font-medium text-gray-700">{note.author}</span>
                <WorkflowIndicator currentStage={note.stage} compact />
                <span className="text-[10px] text-gray-400">
                  {new Date(note.created_at).toLocaleString('pt-BR')}
                </span>
              </div>
              <p className="text-sm text-gray-600">{note.content}</p>
            </li>
          ))}
        </ul>
      )}

      {onAddNote && (
        <form onSubmit={handleSubmit} className="flex gap-2">
          <input
            type="text"
            value={newNote}
            onChange={(e) => setNewNote(e.target.value)}
            placeholder="Adicionar nota..."
            className="flex-1 px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
          <button
            type="submit"
            disabled={!newNote.trim() || submitting}
            className="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50 transition-colors"
          >
            <Send className="w-3.5 h-3.5" />
            Enviar
          </button>
        </form>
      )}
    </div>
  )
}
