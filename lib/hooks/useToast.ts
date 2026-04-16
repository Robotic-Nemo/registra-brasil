/**
 * Standalone toast state manager for use outside of React component tree.
 * For the React context-based approach, use the useToast() hook from components/ui/Toast.tsx.
 *
 * This module provides an imperative API that can be imported anywhere,
 * including server action callbacks and utility functions.
 */

type ToastVariant = 'success' | 'error' | 'info' | 'warning'

export interface ToastMessage {
  id: string
  message: string
  variant: ToastVariant
  duration: number
  createdAt: number
}

type Listener = (toasts: ToastMessage[]) => void

let toasts: ToastMessage[] = []
let nextId = 0
const listeners = new Set<Listener>()

function emit() {
  for (const fn of listeners) {
    fn([...toasts])
  }
}

function addToast(message: string, variant: ToastVariant = 'info', duration = 4000): string {
  const id = `toast-${++nextId}`
  const toast: ToastMessage = { id, message, variant, duration, createdAt: Date.now() }
  toasts = [...toasts, toast]
  emit()

  if (duration > 0) {
    setTimeout(() => removeToast(id), duration)
  }

  return id
}

function removeToast(id: string) {
  toasts = toasts.filter((t) => t.id !== id)
  emit()
}

function clearAll() {
  toasts = []
  emit()
}

/** Subscribe to toast state changes. Returns an unsubscribe function. */
export function subscribe(listener: Listener): () => void {
  listeners.add(listener)
  listener([...toasts])
  return () => {
    listeners.delete(listener)
  }
}

export const toastManager = {
  success: (msg: string, duration?: number) => addToast(msg, 'success', duration),
  error: (msg: string, duration?: number) => addToast(msg, 'error', duration),
  info: (msg: string, duration?: number) => addToast(msg, 'info', duration),
  warning: (msg: string, duration?: number) => addToast(msg, 'warning', duration),
  dismiss: removeToast,
  clearAll,
  subscribe,
} as const
