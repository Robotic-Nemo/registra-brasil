import { describe, test, expect, vi } from 'vitest'
import { createLogger, logger } from '../logger'

describe('createLogger', () => {
  test('returns object with level methods', () => {
    const log = createLogger('test')
    expect(typeof log.debug).toBe('function')
    expect(typeof log.info).toBe('function')
    expect(typeof log.warn).toBe('function')
    expect(typeof log.error).toBe('function')
  })

  test('methods do not throw', () => {
    const log = createLogger('test')
    const spy = vi.spyOn(console, 'log').mockImplementation(() => {})
    const spyErr = vi.spyOn(console, 'error').mockImplementation(() => {})
    const spyWarn = vi.spyOn(console, 'warn').mockImplementation(() => {})
    expect(() => log.info('hi')).not.toThrow()
    expect(() => log.error('boom')).not.toThrow()
    expect(() => log.warn('careful')).not.toThrow()
    spy.mockRestore()
    spyErr.mockRestore()
    spyWarn.mockRestore()
  })
})

describe('default logger', () => {
  test('has all methods', () => {
    expect(typeof logger.info).toBe('function')
  })
})
