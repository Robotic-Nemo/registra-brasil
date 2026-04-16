import { describe, test, expect } from 'vitest'
import {
  groupAndCount,
  aggregateTimeSeries,
  toPercentages,
  getChartColors,
  getTimeSeriesRange,
  fillTimeSeriesGaps,
} from '../chart-data'

describe('groupAndCount', () => {
  test('counts and sorts descending', () => {
    const items = ['a', 'b', 'a', 'a', 'b', 'c']
    const result = groupAndCount(items, (s) => s)
    expect(result[0]).toEqual({ label: 'a', value: 3 })
    expect(result[1]).toEqual({ label: 'b', value: 2 })
    expect(result[2]).toEqual({ label: 'c', value: 1 })
  })
  test('empty array returns empty', () => {
    expect(groupAndCount([], (x) => String(x))).toEqual([])
  })
})

describe('aggregateTimeSeries', () => {
  test('aggregates by day', () => {
    const items = [
      { d: '2024-01-01' }, { d: '2024-01-01' }, { d: '2024-01-02' },
    ]
    const result = aggregateTimeSeries(items, (i) => i.d, 'day')
    expect(result[0]).toEqual({ date: '2024-01-01', value: 2 })
    expect(result[1]).toEqual({ date: '2024-01-02', value: 1 })
  })
  test('aggregates by month', () => {
    const items = [{ d: '2024-01-15' }, { d: '2024-01-20' }]
    const result = aggregateTimeSeries(items, (i) => i.d, 'month')
    expect(result).toHaveLength(1)
    expect(result[0].date).toBe('2024-01')
    expect(result[0].value).toBe(2)
  })
  test('skips empty dates', () => {
    const items = [{ d: '' }, { d: '2024-01-01' }]
    const result = aggregateTimeSeries(items, (i) => i.d)
    expect(result).toHaveLength(1)
  })
})

describe('toPercentages', () => {
  test('calculates percentages', () => {
    const r = toPercentages([
      { label: 'a', value: 50 },
      { label: 'b', value: 50 },
    ])
    expect(r[0].pct).toBe(50)
    expect(r[1].pct).toBe(50)
  })
  test('total 0 returns 0 pct', () => {
    const r = toPercentages([{ label: 'a', value: 0 }])
    expect(r[0].pct).toBe(0)
  })
})

describe('getChartColors', () => {
  test('returns array of colors', () => {
    expect(getChartColors(3)).toHaveLength(3)
  })
  test('cycles palette', () => {
    const colors = getChartColors(20)
    expect(colors[0]).toBe(colors[15])
  })
  test('0 returns empty', () => {
    expect(getChartColors(0)).toEqual([])
  })
})

describe('getTimeSeriesRange', () => {
  test('empty returns 0/0', () => {
    expect(getTimeSeriesRange([])).toEqual({ min: 0, max: 0 })
  })
  test('finds min/max', () => {
    const r = getTimeSeriesRange([
      { date: '1', value: 5 }, { date: '2', value: 10 }, { date: '3', value: 3 },
    ])
    expect(r.min).toBe(3)
    expect(r.max).toBe(10)
  })
})

describe('fillTimeSeriesGaps', () => {
  test('fills missing days with 0', () => {
    const data = [{ date: '2024-01-01', value: 1 }, { date: '2024-01-03', value: 2 }]
    const result = fillTimeSeriesGaps(data, '2024-01-01', '2024-01-03', 'day')
    expect(result).toHaveLength(3)
    expect(result[1].value).toBe(0)
  })
})
