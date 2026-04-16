import { describe, test } from 'vitest'
import { daysAgo, startOfMonth, startOfYear, isWithinDays, DATE_PRESETS } from '../date-ranges'

describe('daysAgo', () => {
  test.todo('returns ISO date string N days in the past')
  test.todo('returns today for 0 days ago')
  test.todo('returns correct format YYYY-MM-DD')
})

describe('startOfMonth', () => {
  test.todo('returns first day of current month')
  test.todo('returns correct ISO date format')
})

describe('startOfYear', () => {
  test.todo('returns January 1st of current year')
  test.todo('returns correct format YYYY-01-01')
})

describe('isWithinDays', () => {
  test.todo('returns true for date within range')
  test.todo('returns false for date outside range')
  test.todo('handles edge case at boundary')
})

describe('DATE_PRESETS', () => {
  test.todo('contains expected preset ranges')
  test.todo('each preset has label and days properties')
})
