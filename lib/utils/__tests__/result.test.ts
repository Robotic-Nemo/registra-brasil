import { describe, test, expect } from 'vitest'
import {
  ok, err, unwrap, unwrapOr, mapResult, mapError,
  tryCatch, tryCatchSync, type Result,
} from '../result'

describe('ok / err', () => {
  test('ok creates success result', () => {
    const result = ok(42)
    expect(result.ok).toBe(true)
    if (result.ok) expect(result.value).toBe(42)
  })

  test('err creates error result', () => {
    const result = err('bad')
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error).toBe('bad')
  })
})

describe('unwrap', () => {
  test('returns value for ok result', () => {
    expect(unwrap(ok(42))).toBe(42)
  })

  test('throws for err result with Error', () => {
    expect(() => unwrap(err(new Error('fail')))).toThrow('fail')
  })

  test('throws wrapped string error', () => {
    expect(() => unwrap(err('string error'))).toThrow('string error')
  })
})

describe('unwrapOr', () => {
  test('returns value for ok result', () => {
    expect(unwrapOr(ok(42), 0)).toBe(42)
  })

  test('returns default for err result', () => {
    expect(unwrapOr(err('fail'), 0)).toBe(0)
  })
})

describe('mapResult', () => {
  test('maps success value', () => {
    const result = mapResult(ok(5), x => x * 2)
    expect(result).toEqual(ok(10))
  })

  test('passes through error', () => {
    const result = mapResult(err('fail') as Result<number, string>, (x: number) => x * 2)
    expect(result.ok).toBe(false)
  })
})

describe('mapError', () => {
  test('maps error value', () => {
    const result = mapError(err('fail'), e => `Error: ${e}`)
    if (!result.ok) expect(result.error).toBe('Error: fail')
  })

  test('passes through success', () => {
    const result = mapError(ok(42) as Result<number, string>, (e: string) => `Error: ${e}`)
    expect(result).toEqual(ok(42))
  })
})

describe('tryCatch', () => {
  test('wraps successful async call', async () => {
    const result = await tryCatch(async () => 42)
    expect(result).toEqual(ok(42))
  })

  test('wraps failed async call', async () => {
    const result = await tryCatch(async () => { throw new Error('fail') })
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error.message).toBe('fail')
  })

  test('wraps non-Error throws as Error', async () => {
    const result = await tryCatch(async () => { throw 'string error' })
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error).toBeInstanceOf(Error)
  })
})

describe('tryCatchSync', () => {
  test('wraps successful sync call', () => {
    const result = tryCatchSync(() => 42)
    expect(result).toEqual(ok(42))
  })

  test('wraps failed sync call', () => {
    const result = tryCatchSync(() => { throw new Error('fail') })
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error.message).toBe('fail')
  })
})
