/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { renderHook } from '@testing-library/react'
import { useIdleCallback } from '../useIdleCallback'

describe('useIdleCallback', () => {
  beforeEach(() => {
    vi.useFakeTimers()
    // Mock requestIdleCallback with setTimeout fallback behavior
    if (typeof globalThis.requestIdleCallback === 'undefined') {
      (globalThis as any).requestIdleCallback = (cb: () => void) => setTimeout(cb, 0)
      ;(globalThis as any).cancelIdleCallback = (id: number) => clearTimeout(id)
    }
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  test('calls callback when enabled', () => {
    const callback = vi.fn()
    renderHook(() => useIdleCallback(callback, { enabled: true }))
    vi.runAllTimers()
    expect(callback).toHaveBeenCalledTimes(1)
  })

  test('does not call callback when disabled', () => {
    const callback = vi.fn()
    renderHook(() => useIdleCallback(callback, { enabled: false }))
    vi.runAllTimers()
    expect(callback).not.toHaveBeenCalled()
  })

  test('cancels on unmount', () => {
    const callback = vi.fn()
    const { unmount } = renderHook(() => useIdleCallback(callback, { enabled: true }))
    unmount()
    vi.runAllTimers()
    expect(callback).not.toHaveBeenCalled()
  })
})
