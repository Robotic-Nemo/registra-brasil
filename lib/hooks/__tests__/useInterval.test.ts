/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { renderHook } from '@testing-library/react'
import { useInterval } from '../useInterval'

describe('useInterval', () => {
  beforeEach(() => { vi.useFakeTimers() })
  afterEach(() => { vi.useRealTimers() })

  test('calls callback at specified interval', () => {
    const callback = vi.fn()
    renderHook(() => useInterval(callback, 100))
    expect(callback).not.toHaveBeenCalled()
    vi.advanceTimersByTime(100)
    expect(callback).toHaveBeenCalledTimes(1)
    vi.advanceTimersByTime(100)
    expect(callback).toHaveBeenCalledTimes(2)
  })

  test('does not call when delay is null', () => {
    const callback = vi.fn()
    renderHook(() => useInterval(callback, null))
    vi.advanceTimersByTime(1000)
    expect(callback).not.toHaveBeenCalled()
  })

  test('clears interval on unmount', () => {
    const callback = vi.fn()
    const { unmount } = renderHook(() => useInterval(callback, 100))
    vi.advanceTimersByTime(100)
    expect(callback).toHaveBeenCalledTimes(1)
    unmount()
    vi.advanceTimersByTime(200)
    expect(callback).toHaveBeenCalledTimes(1)
  })

  test('uses latest callback without resetting interval', () => {
    const callback1 = vi.fn()
    const callback2 = vi.fn()
    const { rerender } = renderHook(
      ({ cb }) => useInterval(cb, 100),
      { initialProps: { cb: callback1 } }
    )
    vi.advanceTimersByTime(100)
    expect(callback1).toHaveBeenCalledTimes(1)
    rerender({ cb: callback2 })
    vi.advanceTimersByTime(100)
    expect(callback2).toHaveBeenCalledTimes(1)
  })
})
