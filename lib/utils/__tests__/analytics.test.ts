import { describe, test, expect, vi } from 'vitest'
import { trackEvent, trackPageView, trackSearch } from '../analytics'

describe('analytics (stub)', () => {
  test('trackEvent does not throw', () => {
    expect(() => trackEvent('page_view')).not.toThrow()
  })
  test('trackEvent accepts properties', () => {
    expect(() => trackEvent('search', { query: 'x', count: 10 })).not.toThrow()
  })
  test('trackPageView delegates to trackEvent', () => {
    const spy = vi.spyOn(console, 'debug').mockImplementation(() => {})
    trackPageView('/test', 'https://ref.com')
    spy.mockRestore()
  })
  test('trackSearch delegates to trackEvent', () => {
    expect(() => trackSearch('lula', 42)).not.toThrow()
  })
})
