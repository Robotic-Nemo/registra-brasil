import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { AsyncQueue, BatchQueue } from '../queue'

describe('AsyncQueue', () => {
  test('processes tasks sequentially by default', async () => {
    const results: number[] = []
    const queue = new AsyncQueue()

    queue.add(async () => { results.push(1) })
    queue.add(async () => { results.push(2) })
    queue.add(async () => { results.push(3) })

    // Wait for all tasks to process
    await new Promise(r => setTimeout(r, 50))
    expect(results).toEqual([1, 2, 3])
  })

  test('respects concurrency limit', async () => {
    let maxConcurrent = 0
    let current = 0
    const queue = new AsyncQueue({ concurrency: 2 })

    for (let i = 0; i < 5; i++) {
      queue.add(async () => {
        current++
        maxConcurrent = Math.max(maxConcurrent, current)
        await new Promise(r => setTimeout(r, 10))
        current--
      })
    }

    await new Promise(r => setTimeout(r, 200))
    expect(maxConcurrent).toBeLessThanOrEqual(2)
  })

  test('calls onError for failed tasks', async () => {
    const onError = vi.fn()
    const queue = new AsyncQueue({ onError })
    queue.add(async () => { throw new Error('fail') })

    await new Promise(r => setTimeout(r, 50))
    expect(onError).toHaveBeenCalledWith(expect.any(Error))
  })

  test('reports size and active counts', () => {
    const queue = new AsyncQueue()
    expect(queue.size).toBe(0)
    expect(queue.active).toBe(0)
  })

  test('clear removes pending tasks', () => {
    const queue = new AsyncQueue()
    queue.add(async () => new Promise(r => setTimeout(r, 1000)))
    queue.add(async () => {})
    queue.clear()
    expect(queue.size).toBe(0)
  })
})

describe('BatchQueue', () => {
  beforeEach(() => { vi.useFakeTimers() })
  afterEach(() => { vi.useRealTimers() })

  test('flushes after delay', async () => {
    const flush = vi.fn(async () => {})
    const queue = new BatchQueue<number>(flush, 100)

    queue.add(1)
    queue.add(2)
    expect(flush).not.toHaveBeenCalled()

    vi.advanceTimersByTime(100)
    await Promise.resolve() // allow async flush
    expect(flush).toHaveBeenCalledWith([1, 2])
  })

  test('flushes when maxBatch reached', async () => {
    const flush = vi.fn(async () => {})
    const queue = new BatchQueue<number>(flush, 10000, 3)

    queue.add(1)
    queue.add(2)
    queue.add(3) // should trigger flush immediately

    await Promise.resolve()
    expect(flush).toHaveBeenCalledWith([1, 2, 3])
  })

  test('drain flushes all remaining items', async () => {
    const flush = vi.fn(async () => {})
    const queue = new BatchQueue<number>(flush, 10000)

    queue.add(1)
    queue.add(2)
    await queue.drain()
    expect(flush).toHaveBeenCalledWith([1, 2])
  })
})
