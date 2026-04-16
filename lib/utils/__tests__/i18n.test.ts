import { describe, test, expect } from 'vitest'
import { plural, formatNumberPtBR, formatPercentPtBR, LABELS, pluralLabel, dateRangeLabel } from '../i18n'

describe('plural', () => {
  test('singular when count is 1', () => {
    expect(plural(1, 'item', 'itens')).toBe('1 item')
  })
  test('plural when count > 1', () => {
    expect(plural(5, 'item', 'itens')).toBe('5 itens')
  })
  test('plural when count is 0', () => {
    expect(plural(0, 'item', 'itens')).toBe('0 itens')
  })
  test('plural when count is negative', () => {
    expect(plural(-1, 'item', 'itens')).toBe('-1 itens')
  })
})

describe('formatNumberPtBR', () => {
  test('formats small number', () => {
    expect(formatNumberPtBR(100)).toBe('100')
  })
  test('formats thousands with dot', () => {
    expect(formatNumberPtBR(1000)).toMatch(/1.000/)
  })
  test('formats millions', () => {
    expect(formatNumberPtBR(1000000)).toMatch(/1.000.000/)
  })
})

describe('formatPercentPtBR', () => {
  test('uses comma as decimal separator', () => {
    expect(formatPercentPtBR(12.5)).toBe('12,5%')
  })
  test('zero decimals', () => {
    expect(formatPercentPtBR(10, 0)).toBe('10%')
  })
  test('custom decimals', () => {
    expect(formatPercentPtBR(33.333, 2)).toBe('33,33%')
  })
})

describe('pluralLabel', () => {
  test('statements singular', () => {
    expect(pluralLabel('statements', 1)).toBe('1 declaração')
  })
  test('statements plural', () => {
    expect(pluralLabel('statements', 3)).toBe('3 declarações')
  })
  test('politicians plural', () => {
    expect(pluralLabel('politicians', 10)).toBe('10 políticos')
  })
})

describe('dateRangeLabel', () => {
  test('both dates', () => {
    expect(dateRangeLabel('2024-01-01', '2024-12-31')).toBe('de 2024-01-01 até 2024-12-31')
  })
  test('only from', () => {
    expect(dateRangeLabel('2024-01-01', undefined)).toBe('a partir de 2024-01-01')
  })
  test('only to', () => {
    expect(dateRangeLabel(undefined, '2024-12-31')).toBe('até 2024-12-31')
  })
  test('neither', () => {
    expect(dateRangeLabel(undefined, undefined)).toBe('todo o período')
  })
})

describe('LABELS', () => {
  test('has expected keys', () => {
    expect(LABELS.statements).toBeDefined()
    expect(LABELS.politicians).toBeDefined()
    expect(LABELS.categories).toBeDefined()
    expect(LABELS.sources).toBeDefined()
    expect(LABELS.results).toBeDefined()
  })
})
