/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useClickAway } from '../useClickAway'

describe('useClickAway', () => {
  test('calls handler when clicking outside the element', () => {
    const handler = vi.fn()
    const { result } = renderHook(() => useClickAway<HTMLDivElement>(handler))

    // Create a DOM element and assign it to the ref
    const el = document.createElement('div')
    document.body.appendChild(el)
    Object.defineProperty(result.current, 'current', { value: el, writable: true })

    // Click outside
    act(() => {
      document.dispatchEvent(new MouseEvent('mousedown', { bubbles: true }))
    })
    expect(handler).toHaveBeenCalledTimes(1)

    document.body.removeChild(el)
  })

  test('does not call handler when clicking inside the element', () => {
    const handler = vi.fn()
    const { result } = renderHook(() => useClickAway<HTMLDivElement>(handler))

    const el = document.createElement('div')
    document.body.appendChild(el)
    Object.defineProperty(result.current, 'current', { value: el, writable: true })

    // Click inside
    act(() => {
      el.dispatchEvent(new MouseEvent('mousedown', { bubbles: true }))
    })
    expect(handler).not.toHaveBeenCalled()

    document.body.removeChild(el)
  })
})
