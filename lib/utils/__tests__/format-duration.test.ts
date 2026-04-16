import { describe, test, expect } from 'vitest'
import { parseDuration, formatDuration, formatDurationLong } from '../format-duration'

describe('parseDuration', () => {
  test('parses zero', () => {
    expect(parseDuration(0)).toEqual({ days: 0, hours: 0, minutes: 0, seconds: 0 })
  })
  test('parses seconds', () => {
    expect(parseDuration(5000)).toEqual({ days: 0, hours: 0, minutes: 0, seconds: 5 })
  })
  test('parses minutes and seconds', () => {
    expect(parseDuration(65000)).toEqual({ days: 0, hours: 0, minutes: 1, seconds: 5 })
  })
  test('parses hours', () => {
    expect(parseDuration(3661000)).toEqual({ days: 0, hours: 1, minutes: 1, seconds: 1 })
  })
  test('parses days', () => {
    expect(parseDuration(90061000)).toEqual({ days: 1, hours: 1, minutes: 1, seconds: 1 })
  })
  test('handles negative input as absolute value', () => {
    expect(parseDuration(-5000)).toEqual({ days: 0, hours: 0, minutes: 0, seconds: 5 })
  })
})

describe('formatDuration', () => {
  test('zero ms', () => {
    expect(formatDuration(0)).toBe('0s')
  })
  test('5 seconds', () => {
    expect(formatDuration(5000)).toBe('5s')
  })
  test('1 min 5 sec', () => {
    expect(formatDuration(65000)).toBe('1min 5s')
  })
  test('1h 1min', () => {
    expect(formatDuration(3661000)).toBe('1h 1min')
  })
  test('1d 1h', () => {
    expect(formatDuration(90061000)).toBe('1d 1h')
  })
  test('truncates to 2 parts', () => {
    const result = formatDuration(90061000)
    expect(result.split(' ').length).toBeLessThanOrEqual(2)
  })
  test('less than 1 second returns 0s', () => {
    expect(formatDuration(500)).toBe('0s')
  })
})

describe('formatDurationLong', () => {
  test('zero', () => {
    expect(formatDurationLong(0)).toBe('0 segundos')
  })
  test('single second', () => {
    expect(formatDurationLong(1000)).toBe('1 segundo')
  })
  test('multiple seconds', () => {
    expect(formatDurationLong(5000)).toBe('5 segundos')
  })
  test('single minute', () => {
    expect(formatDurationLong(60000)).toBe('1 minuto')
  })
  test('minutes and seconds with "e" separator', () => {
    expect(formatDurationLong(65000)).toBe('1 minuto e 5 segundos')
  })
  test('three parts uses comma and "e"', () => {
    const result = formatDurationLong(3661000)
    expect(result).toContain(' e ')
    expect(result).toContain(', ')
  })
  test('single day', () => {
    expect(formatDurationLong(86400000)).toBe('1 dia')
  })
  test('multiple days', () => {
    expect(formatDurationLong(172800000)).toBe('2 dias')
  })
})
