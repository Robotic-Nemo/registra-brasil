/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useEventListener } from '../useEventListener'

describe('useEventListener', () => {
  test('listens to window events by default', () => {
    const handler = vi.fn()
    renderHook(() => useEventListener('click', handler))
    act(() => {
      window.dispatchEvent(new MouseEvent('click'))
    })
    expect(handler).toHaveBeenCalledTimes(1)
  })

  test('listens to specific element events', () => {
    const handler = vi.fn()
    const el = document.createElement('div')
    document.body.appendChild(el)

    renderHook(() => useEventListener('click', handler, el))
    act(() => {
      el.dispatchEvent(new MouseEvent('click'))
    })
    expect(handler).toHaveBeenCalledTimes(1)

    document.body.removeChild(el)
  })

  test('removes listener on unmount', () => {
    const handler = vi.fn()
    const { unmount } = renderHook(() => useEventListener('click', handler))
    unmount()
    act(() => {
      window.dispatchEvent(new MouseEvent('click'))
    })
    expect(handler).not.toHaveBeenCalled()
  })

  test('uses latest handler without reattaching', () => {
    const handler1 = vi.fn()
    const handler2 = vi.fn()
    const { rerender } = renderHook(
      ({ handler }) => useEventListener('click', handler),
      { initialProps: { handler: handler1 } }
    )
    rerender({ handler: handler2 })
    act(() => {
      window.dispatchEvent(new MouseEvent('click'))
    })
    expect(handler1).not.toHaveBeenCalled()
    expect(handler2).toHaveBeenCalledTimes(1)
  })
})
