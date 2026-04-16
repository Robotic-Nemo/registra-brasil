/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useMediaQuery } from '../useMediaQuery'

describe('useMediaQuery', () => {
  let listeners: Map<string, ((e: { matches: boolean }) => void)>

  beforeEach(() => {
    listeners = new Map()
    Object.defineProperty(window, 'matchMedia', {
      writable: true,
      value: vi.fn().mockImplementation((query: string) => ({
        matches: false,
        media: query,
        onchange: null,
        addEventListener: vi.fn((_, handler) => { listeners.set(query, handler) }),
        removeEventListener: vi.fn(),
        dispatchEvent: vi.fn(),
      })),
    })
  })

  test('returns false initially (SSR-safe)', () => {
    const { result } = renderHook(() => useMediaQuery('(min-width: 768px)'))
    expect(result.current).toBe(false)
  })

  test('updates when media query changes', () => {
    const { result } = renderHook(() => useMediaQuery('(min-width: 768px)'))
    const handler = listeners.get('(min-width: 768px)')
    if (handler) {
      act(() => { handler({ matches: true }) })
      expect(result.current).toBe(true)
    }
  })
})
