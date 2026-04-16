/**
 * Simple in-memory async queue for background processing
 */

type TaskFn<T = void> = () => Promise<T>

interface QueueOptions {
  concurrency?: number
  onError?: (error: unknown) => void
}

export class AsyncQueue {
  private queue: TaskFn[] = []
  private running = 0
  private concurrency: number
  private onError: (error: unknown) => void

  constructor(options: QueueOptions = {}) {
    this.concurrency = options.concurrency ?? 1
    this.onError = options.onError ?? console.error
  }

  add<T>(task: TaskFn<T>): void {
    this.queue.push(task as TaskFn)
    this.process()
  }

  private async process(): Promise<void> {
    while (this.running < this.concurrency && this.queue.length > 0) {
      const task = this.queue.shift()
      if (!task) break

      this.running++
      try {
        await task()
      } catch (error) {
        this.onError(error)
      } finally {
        this.running--
        this.process()
      }
    }
  }

  get size(): number {
    return this.queue.length
  }

  get active(): number {
    return this.running
  }

  get pending(): number {
    return this.queue.length + this.running
  }

  clear(): void {
    this.queue = []
  }
}

/**
 * Simple debounced queue — collects items and flushes after delay
 */
export class BatchQueue<T> {
  private items: T[] = []
  private timer: ReturnType<typeof setTimeout> | null = null

  constructor(
    private flush: (items: T[]) => Promise<void>,
    private delayMs = 1000,
    private maxBatch = 100
  ) {}

  add(item: T): void {
    this.items.push(item)

    if (this.items.length >= this.maxBatch) {
      this.flushNow()
      return
    }

    if (this.timer) clearTimeout(this.timer)
    this.timer = setTimeout(() => this.flushNow(), this.delayMs)
  }

  private async flushNow(): Promise<void> {
    if (this.timer) {
      clearTimeout(this.timer)
      this.timer = null
    }
    if (this.items.length === 0) return

    const batch = this.items.splice(0)
    try {
      await this.flush(batch)
    } catch (error) {
      console.error('[BatchQueue] flush error:', error)
    }
  }

  async drain(): Promise<void> {
    await this.flushNow()
  }
}
