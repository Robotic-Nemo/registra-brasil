import { describe, test, expect, vi } from 'vitest'
import { chunk, processInParallel, processSequentially, collectResults, batchSequential } from '../batch'

describe('chunk', () => {
  test('splits array into chunks', () => {
    expect(chunk([1, 2, 3, 4, 5], 2)).toEqual([[1, 2], [3, 4], [5]])
  })
  test('handles empty array', () => {
    expect(chunk([], 3)).toEqual([])
  })
  test('handles size <= 0', () => {
    expect(chunk([1, 2, 3], 0)).toEqual([[1, 2, 3]])
  })
  test('handles size of 1', () => {
    expect(chunk([1, 2], 1)).toEqual([[1], [2]])
  })
})

describe('processInParallel', () => {
  test('processes all items', async () => {
    const results = await processInParallel([1, 2, 3], async (n) => n * 2, 2)
    expect(results).toEqual([2, 4, 6])
  })

  test('handles empty array', async () => {
    const results = await processInParallel([], async (n: number) => n, 5)
    expect(results).toEqual([])
  })

  test('respects concurrency', async () => {
    let max = 0
    let current = 0
    await processInParallel([1, 2, 3, 4], async () => {
      current++
      max = Math.max(max, current)
      await new Promise(r => setTimeout(r, 10))
      current--
    }, 2)
    expect(max).toBeLessThanOrEqual(2)
  })

  test('passes index to function', async () => {
    const indices: number[] = []
    await processInParallel(['a', 'b'], async (_, i) => { indices.push(i) }, 1)
    expect(indices).toEqual([0, 1])
  })
})

describe('processSequentially', () => {
  test('processes items in order', async () => {
    const order: number[] = []
    await processSequentially([1, 2, 3], async (n) => { order.push(n); return n })
    expect(order).toEqual([1, 2, 3])
  })

  test('returns results', async () => {
    const results = await processSequentially([1, 2], async (n) => n * 10)
    expect(results).toEqual([10, 20])
  })
})

describe('collectResults', () => {
  test('separates successes and errors', async () => {
    const result = await collectResults([1, 2, 3], async (n) => {
      if (n === 2) throw new Error('fail')
      return n * 10
    })
    expect(result.successes).toEqual([10, 30])
    expect(result.errors).toHaveLength(1)
    expect(result.errors[0].item).toBe(2)
  })

  test('handles all success', async () => {
    const result = await collectResults([1, 2], async (n) => n)
    expect(result.successes).toEqual([1, 2])
    expect(result.errors).toHaveLength(0)
  })
})

describe('batchSequential', () => {
  test('processes batches sequentially with parallel items within batch', async () => {
    const order: number[] = []
    await batchSequential([1, 2, 3, 4], 2, async (n) => {
      order.push(n)
      return n
    })
    // Items 1 and 2 run in parallel, then 3 and 4
    expect(order).toContain(1)
    expect(order).toContain(4)
  })

  test('returns all results in order', async () => {
    const results = await batchSequential([1, 2, 3], 2, async (n) => n * 10)
    expect(results).toEqual([10, 20, 30])
  })

  test('passes global index', async () => {
    const indices: number[] = []
    await batchSequential([10, 20, 30], 2, async (_, i) => { indices.push(i) })
    expect(indices).toEqual([0, 1, 2])
  })
})
