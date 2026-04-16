/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useIsOnline } from '../useIsOnline'

describe('useIsOnline', () => {
  test('returns true when navigator.onLine is true', () => {
    Object.defineProperty(navigator, 'onLine', { value: true, writable: true })
    const { result } = renderHook(() => useIsOnline())
    expect(result.current).toBe(true)
  })

  test('updates when offline event fires', () => {
    Object.defineProperty(navigator, 'onLine', { value: true, writable: true })
    const { result } = renderHook(() => useIsOnline())
    act(() => {
      window.dispatchEvent(new Event('offline'))
    })
    expect(result.current).toBe(false)
  })

  test('updates when online event fires', () => {
    Object.defineProperty(navigator, 'onLine', { value: false, writable: true })
    const { result } = renderHook(() => useIsOnline())
    act(() => {
      window.dispatchEvent(new Event('online'))
    })
    expect(result.current).toBe(true)
  })
})
