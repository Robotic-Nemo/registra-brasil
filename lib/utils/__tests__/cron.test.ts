import { describe, test, expect } from 'vitest'
import { SCHEDULES, getNextCronRun, describeCron } from '../cron'

describe('SCHEDULES', () => {
  test('contains basic schedules', () => {
    expect(SCHEDULES.everyMinute).toBe('* * * * *')
    expect(SCHEDULES.daily).toBe('0 0 * * *')
  })
})

describe('getNextCronRun', () => {
  test('returns null for invalid expression', () => {
    expect(getNextCronRun('invalid')).toBeNull()
  })

  test('returns Date for */5 pattern', () => {
    const result = getNextCronRun('*/5 * * * *', new Date('2024-01-01T00:02:00'))
    expect(result).toBeInstanceOf(Date)
  })

  test('returns Date for specific hour:minute', () => {
    const result = getNextCronRun('0 9 * * *', new Date('2024-01-01T00:00:00'))
    expect(result).toBeInstanceOf(Date)
  })
})

describe('describeCron', () => {
  test('describes known schedule', () => {
    expect(describeCron('* * * * *')).toBe('A cada minuto')
  })
  test('describes daily', () => {
    expect(describeCron('0 0 * * *')).toContain('Diariamente')
  })
  test('echoes unknown expression', () => {
    expect(describeCron('1 2 3 4 5')).toBe('1 2 3 4 5')
  })
})
