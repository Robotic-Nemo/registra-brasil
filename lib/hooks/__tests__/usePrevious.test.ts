/**
 * @vitest-environment jsdom
 */
import { describe, test, expect } from 'vitest'
import { renderHook } from '@testing-library/react'
import { usePrevious } from '../usePrevious'

describe('usePrevious', () => {
  test('returns undefined on first render', () => {
    const { result } = renderHook(() => usePrevious(1))
    expect(result.current).toBeUndefined()
  })

  test('returns previous value after update', () => {
    const { result, rerender } = renderHook(
      ({ value }) => usePrevious(value),
      { initialProps: { value: 1 } }
    )
    rerender({ value: 2 })
    expect(result.current).toBe(1)
  })

  test('tracks successive changes', () => {
    const { result, rerender } = renderHook(
      ({ value }) => usePrevious(value),
      { initialProps: { value: 'a' } }
    )
    rerender({ value: 'b' })
    expect(result.current).toBe('a')
    rerender({ value: 'c' })
    expect(result.current).toBe('b')
  })
})
