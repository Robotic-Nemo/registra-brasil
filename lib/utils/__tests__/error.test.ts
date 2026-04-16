import { describe, test } from 'vitest'
import { getErrorMessage, safeJsonParse, retry } from '../error'

describe('getErrorMessage', () => {
  test.todo('extracts message from Error instance')
  test.todo('returns string error as-is')
  test.todo('returns default message for unknown error type')
})

describe('safeJsonParse', () => {
  test.todo('parses valid JSON')
  test.todo('returns null for invalid JSON')
  test.todo('returns null for empty string')
})

describe('retry', () => {
  test.todo('resolves on first successful attempt')
  test.todo('retries on failure and resolves on subsequent success')
  test.todo('throws after exhausting all attempts')
  test.todo('uses exponential backoff between retries')
})
