/**
 * @vitest-environment jsdom
 */
import { describe, test, expect, vi, beforeEach } from 'vitest'
import { renderHook, act } from '@testing-library/react'
import { useLocalStorage } from '../useLocalStorage'

describe('useLocalStorage', () => {
  beforeEach(() => {
    localStorage.clear()
  })

  test('returns default value initially', () => {
    const { result } = renderHook(() => useLocalStorage('key', 'default'))
    expect(result.current[0]).toBe('default')
  })

  test('reads stored value after mount', async () => {
    localStorage.setItem('key', JSON.stringify('stored'))
    const { result } = renderHook(() => useLocalStorage('key', 'default'))
    // useEffect runs asynchronously, wait for it
    await vi.waitFor(() => {
      expect(result.current[0]).toBe('stored')
    })
  })

  test('writes to localStorage when value is set', () => {
    const { result } = renderHook(() => useLocalStorage('key', 'default'))
    act(() => { result.current[1]('new-value') })
    expect(result.current[0]).toBe('new-value')
    expect(JSON.parse(localStorage.getItem('key')!)).toBe('new-value')
  })

  test('handles complex objects', () => {
    const { result } = renderHook(() => useLocalStorage('obj', { a: 1 }))
    act(() => { result.current[1]({ a: 2 }) })
    expect(result.current[0]).toEqual({ a: 2 })
  })

  test('handles corrupted localStorage gracefully', async () => {
    localStorage.setItem('bad', 'not-json{{{')
    const { result } = renderHook(() => useLocalStorage('bad', 'default'))
    // Should fall back to default on parse error
    expect(result.current[0]).toBe('default')
  })
})
