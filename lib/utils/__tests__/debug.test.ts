import { describe, test, expect, vi } from 'vitest'
import { debugLog, debugTime, debugAssert, debugRender, debugJson } from '../debug'

describe('debug utilities', () => {
  test('debugLog does not throw', () => {
    const spy = vi.spyOn(console, 'log').mockImplementation(() => {})
    expect(() => debugLog('test', 'hi')).not.toThrow()
    spy.mockRestore()
  })

  test('debugTime returns result', async () => {
    const spy = vi.spyOn(console, 'log').mockImplementation(() => {})
    const r = await debugTime('x', async () => 42)
    expect(r).toBe(42)
    spy.mockRestore()
  })

  test('debugTime propagates errors', async () => {
    const spyLog = vi.spyOn(console, 'log').mockImplementation(() => {})
    const spyErr = vi.spyOn(console, 'error').mockImplementation(() => {})
    await expect(debugTime('x', async () => { throw new Error('nope') })).rejects.toThrow()
    spyLog.mockRestore()
    spyErr.mockRestore()
  })

  test('debugAssert noop when true', () => {
    expect(() => debugAssert(true, 'ok')).not.toThrow()
  })

  test('debugRender does not throw', () => {
    const spy = vi.spyOn(console, 'log').mockImplementation(() => {})
    expect(() => debugRender('Component')).not.toThrow()
    spy.mockRestore()
  })

  test('debugJson does not throw', () => {
    const spy = vi.spyOn(console, 'log').mockImplementation(() => {})
    expect(() => debugJson('data', { x: 1 })).not.toThrow()
    spy.mockRestore()
  })
})
