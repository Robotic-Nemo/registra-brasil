/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useDebounce } from '../useDebounce'

describe('useDebounce', () => {
  beforeEach(() => { vi.useFakeTimers() })
  afterEach(() => { vi.useRealTimers() })

  test('returns initial value immediately', () => {
    const { result } = renderHook(() => useDebounce('hello', 300))
    expect(result.current).toBe('hello')
  })

  test('does not update value before delay', () => {
    const { result, rerender } = renderHook(
      ({ value, delay }) => useDebounce(value, delay),
      { initialProps: { value: 'hello', delay: 300 } }
    )
    rerender({ value: 'world', delay: 300 })
    expect(result.current).toBe('hello')
  })

  test('updates value after delay', () => {
    const { result, rerender } = renderHook(
      ({ value, delay }) => useDebounce(value, delay),
      { initialProps: { value: 'hello', delay: 300 } }
    )
    rerender({ value: 'world', delay: 300 })
    act(() => { vi.advanceTimersByTime(300) })
    expect(result.current).toBe('world')
  })

  test('resets timer on value change', () => {
    const { result, rerender } = renderHook(
      ({ value, delay }) => useDebounce(value, delay),
      { initialProps: { value: 'a', delay: 300 } }
    )
    rerender({ value: 'b', delay: 300 })
    act(() => { vi.advanceTimersByTime(200) })
    rerender({ value: 'c', delay: 300 })
    act(() => { vi.advanceTimersByTime(200) })
    expect(result.current).toBe('a') // not updated yet
    act(() => { vi.advanceTimersByTime(100) })
    expect(result.current).toBe('c')
  })
})
