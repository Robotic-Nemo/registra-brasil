import { describe, test, expect } from 'vitest'
import { measure, reportWebVital } from '../performance'

describe('measure', () => {
  test('returns function result', async () => {
    const r = await measure('test', async () => 42)
    expect(r).toBe(42)
  })
  test('propagates errors', async () => {
    await expect(measure('x', async () => { throw new Error('boom') })).rejects.toThrow('boom')
  })
})

describe('reportWebVital', () => {
  test('does not throw', () => {
    expect(() => reportWebVital({ name: 'LCP', value: 1000, id: 'a' })).not.toThrow()
  })
})
