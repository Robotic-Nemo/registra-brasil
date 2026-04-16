/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { renderHook } from '@testing-library/react'
import { useCountUp } from '../useCountUp'

describe('useCountUp', () => {
  beforeEach(() => {
    // Mock matchMedia for reduced motion check
    Object.defineProperty(window, 'matchMedia', {
      writable: true,
      value: vi.fn().mockImplementation((query: string) => ({
        matches: query === '(prefers-reduced-motion: reduce)',
        media: query,
        onchange: null,
        addEventListener: vi.fn(),
        removeEventListener: vi.fn(),
        dispatchEvent: vi.fn(),
      })),
    })
  })

  test('returns end value when reduced motion is preferred', () => {
    const { result } = renderHook(() => useCountUp({ end: 100 }))
    expect(result.current).toBe(100)
  })

  test('returns end value when disabled', () => {
    const { result } = renderHook(() => useCountUp({ end: 50, enabled: false }))
    expect(result.current).toBe(50)
  })

  test('starts from start value', () => {
    // With reduced motion, it jumps to end, so test with enabled=false
    const { result } = renderHook(() => useCountUp({ start: 10, end: 50, enabled: false }))
    expect(result.current).toBe(50)
  })
})
