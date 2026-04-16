import { describe, test, expect } from 'vitest'
import {
  WEBHOOK_EVENT_DESCRIPTIONS,
  ALL_WEBHOOK_EVENTS,
  WEBHOOK_EVENT_CATEGORIES,
  buildEventPayload,
  isValidWebhookEvent,
} from '../events'

describe('WEBHOOK_EVENT_DESCRIPTIONS', () => {
  test('contains statement.created', () => {
    expect(WEBHOOK_EVENT_DESCRIPTIONS['statement.created']).toBeDefined()
  })

  test('all events have descriptions', () => {
    for (const event of ALL_WEBHOOK_EVENTS) {
      expect(WEBHOOK_EVENT_DESCRIPTIONS[event]).toBeTruthy()
    }
  })
})

describe('WEBHOOK_EVENT_CATEGORIES', () => {
  test('statement category has all statement events', () => {
    expect(WEBHOOK_EVENT_CATEGORIES.statement.length).toBeGreaterThan(0)
    for (const e of WEBHOOK_EVENT_CATEGORIES.statement) {
      expect(e.startsWith('statement.')).toBe(true)
    }
  })

  test('politician category has politician events', () => {
    for (const e of WEBHOOK_EVENT_CATEGORIES.politician) {
      expect(e.startsWith('politician.')).toBe(true)
    }
  })
})

describe('buildEventPayload', () => {
  test('includes id, event, timestamp, data, api_version', () => {
    const p = buildEventPayload('statement.created', { foo: 'bar' })
    expect(p.id).toMatch(/^[0-9a-f-]{36}$/)
    expect(p.event).toBe('statement.created')
    expect(p.timestamp).toMatch(/T/)
    expect(p.data).toEqual({ foo: 'bar' })
    expect(p.api_version).toBe('v2')
  })

  test('each payload has unique id', () => {
    const a = buildEventPayload('statement.created', {})
    const b = buildEventPayload('statement.created', {})
    expect(a.id).not.toBe(b.id)
  })
})

describe('isValidWebhookEvent', () => {
  test('true for valid event', () => {
    expect(isValidWebhookEvent('statement.created')).toBe(true)
  })
  test('false for invalid event', () => {
    expect(isValidWebhookEvent('fake.event')).toBe(false)
  })
  test('false for empty', () => {
    expect(isValidWebhookEvent('')).toBe(false)
  })
})
