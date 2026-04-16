/**
 * @vitest-environment jsdom
 */
import { describe, test, expect } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useToggle } from '../useToggle'

describe('useToggle', () => {
  test('starts with initial value (default false)', () => {
    const { result } = renderHook(() => useToggle())
    expect(result.current[0]).toBe(false)
  })

  test('starts with custom initial value', () => {
    const { result } = renderHook(() => useToggle(true))
    expect(result.current[0]).toBe(true)
  })

  test('toggle flips the value', () => {
    const { result } = renderHook(() => useToggle(false))
    act(() => { result.current[1]() }) // toggle
    expect(result.current[0]).toBe(true)
    act(() => { result.current[1]() }) // toggle again
    expect(result.current[0]).toBe(false)
  })

  test('set sets a specific value', () => {
    const { result } = renderHook(() => useToggle(false))
    act(() => { result.current[2](true) }) // set
    expect(result.current[0]).toBe(true)
    act(() => { result.current[2](false) }) // set
    expect(result.current[0]).toBe(false)
  })
})
