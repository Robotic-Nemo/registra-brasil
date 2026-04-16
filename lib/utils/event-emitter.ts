/**
 * Simple typed event emitter for client-side events
 */

type Listener<T> = (data: T) => void

export class EventEmitter<TEvents extends { [key: string]: unknown }> {
  private listeners = new Map<keyof TEvents, Set<Listener<unknown>>>()

  on<K extends keyof TEvents>(event: K, listener: Listener<TEvents[K]>): () => void {
    if (!this.listeners.has(event)) {
      this.listeners.set(event, new Set())
    }
    this.listeners.get(event)!.add(listener as Listener<unknown>)

    // Return unsubscribe function
    return () => this.off(event, listener)
  }

  off<K extends keyof TEvents>(event: K, listener: Listener<TEvents[K]>): void {
    this.listeners.get(event)?.delete(listener as Listener<unknown>)
  }

  emit<K extends keyof TEvents>(event: K, data: TEvents[K]): void {
    this.listeners.get(event)?.forEach(listener => {
      try {
        listener(data)
      } catch (error) {
        console.error(`[EventEmitter] Error in listener for "${String(event)}":`, error)
      }
    })
  }

  once<K extends keyof TEvents>(event: K, listener: Listener<TEvents[K]>): () => void {
    const wrapped: Listener<TEvents[K]> = (data) => {
      this.off(event, wrapped)
      listener(data)
    }
    return this.on(event, wrapped)
  }

  removeAllListeners(event?: keyof TEvents): void {
    if (event) {
      this.listeners.delete(event)
    } else {
      this.listeners.clear()
    }
  }
}

// App-wide event types
export type AppEvents = {
  'statement:viewed': { id: string }
  'search:performed': { query: string; resultCount: number }
  'theme:changed': { theme: 'light' | 'dark' | 'system' }
  'notification:received': { message: string; type: string }
  [key: string]: unknown
}

export const appEvents = new EventEmitter<AppEvents>()
