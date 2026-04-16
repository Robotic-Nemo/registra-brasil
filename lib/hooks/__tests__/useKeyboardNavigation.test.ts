/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useKeyboardNavigation } from '../useKeyboardNavigation'

describe('useKeyboardNavigation', () => {
  function createContainer(itemCount: number) {
    const container = document.createElement('div')
    for (let i = 0; i < itemCount; i++) {
      const item = document.createElement('button')
      item.setAttribute('data-nav-item', '')
      item.textContent = `Item ${i}`
      item.focus = vi.fn()
      container.appendChild(item)
    }
    document.body.appendChild(container)
    return container
  }

  test('returns containerRef and setActiveIndex', () => {
    const { result } = renderHook(() =>
      useKeyboardNavigation({ items: 5 })
    )
    expect(result.current.containerRef).toBeDefined()
    expect(result.current.setActiveIndex).toBeInstanceOf(Function)
  })

  test('navigates down with ArrowDown', () => {
    const { result } = renderHook(() =>
      useKeyboardNavigation({ items: 3, wrap: true })
    )

    const container = createContainer(3)
    Object.defineProperty(result.current.containerRef, 'current', {
      value: container,
      writable: true,
    })

    // Trigger ArrowDown
    act(() => {
      container.dispatchEvent(new KeyboardEvent('keydown', { key: 'ArrowDown', bubbles: true }))
    })

    // First item should receive focus
    const items = container.querySelectorAll('[data-nav-item]')
    expect(items[0] && (items[0] as HTMLElement).focus).toHaveBeenCalled()

    document.body.removeChild(container)
  })

  test('calls onSelect on Enter', () => {
    const onSelect = vi.fn()
    const { result } = renderHook(() =>
      useKeyboardNavigation({ items: 3, onSelect })
    )

    const container = createContainer(3)
    Object.defineProperty(result.current.containerRef, 'current', {
      value: container,
      writable: true,
    })

    // Navigate to first item
    act(() => {
      container.dispatchEvent(new KeyboardEvent('keydown', { key: 'ArrowDown', bubbles: true }))
    })
    // Press Enter
    act(() => {
      container.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', bubbles: true }))
    })
    expect(onSelect).toHaveBeenCalledWith(0)

    document.body.removeChild(container)
  })
})
