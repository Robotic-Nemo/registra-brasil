import { describe, test, expect } from 'vitest'
import {
  getAvailableTransitions,
  isValidTransition,
  getTransition,
  statusToStage,
  stageToStatus,
  getStageColor,
} from '../workflow'

describe('statusToStage', () => {
  test('verified → verified', () => {
    expect(statusToStage('verified')).toBe('verified')
  })
  test('disputed → disputed', () => {
    expect(statusToStage('disputed')).toBe('disputed')
  })
  test('removed → removed', () => {
    expect(statusToStage('removed')).toBe('removed')
  })
  test('unverified → draft', () => {
    expect(statusToStage('unverified')).toBe('draft')
  })
  test('unknown → draft', () => {
    expect(statusToStage('random')).toBe('draft')
  })
})

describe('stageToStatus', () => {
  test('verified → verified', () => {
    expect(stageToStatus('verified')).toBe('verified')
  })
  test('disputed → disputed', () => {
    expect(stageToStatus('disputed')).toBe('disputed')
  })
  test('draft → unverified', () => {
    expect(stageToStatus('draft')).toBe('unverified')
  })
  test('review → unverified', () => {
    expect(stageToStatus('review')).toBe('unverified')
  })
})

describe('getStageColor', () => {
  test('returns color classes for each stage', () => {
    const stages = ['draft', 'review', 'verified', 'disputed', 'removed'] as const
    for (const stage of stages) {
      const c = getStageColor(stage)
      expect(c.text).toContain('text-')
      expect(c.bg).toContain('bg-')
      expect(c.border).toContain('border-')
    }
  })
})

describe('getAvailableTransitions / isValidTransition / getTransition', () => {
  test('returns array for any stage', () => {
    const transitions = getAvailableTransitions('draft')
    expect(Array.isArray(transitions)).toBe(true)
  })

  test('isValidTransition returns boolean', () => {
    expect(typeof isValidTransition('draft', 'review')).toBe('boolean')
  })

  test('getTransition returns null for invalid transition', () => {
    expect(getTransition('verified' as any, 'nonsense' as any)).toBeNull()
  })
})
