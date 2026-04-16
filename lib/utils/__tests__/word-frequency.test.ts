import { describe, test, expect } from 'vitest'
import { getWordFrequencies, combineFrequencies } from '../word-frequency'

describe('getWordFrequencies', () => {
  test('extracts word frequencies', () => {
    const result = getWordFrequencies('política economia política saúde política')
    expect(result[0].word).toBe('politica')
    expect(result[0].count).toBe(3)
    expect(result[0].weight).toBe(1)
  })

  test('filters out stop words', () => {
    const result = getWordFrequencies('o presidente disse que a economia está muito boa')
    const words = result.map(w => w.word)
    expect(words).not.toContain('o')
    expect(words).not.toContain('que')
    expect(words).not.toContain('a')
  })

  test('respects minLength option', () => {
    const result = getWordFrequencies('ab cd efgh ijkl', { minLength: 4 })
    const words = result.map(w => w.word)
    expect(words).not.toContain('ab')
    expect(words).not.toContain('cd')
    expect(words).toContain('efgh')
  })

  test('respects maxWords option', () => {
    const text = 'word1 word2 word3 word4 word5 word6'
    const result = getWordFrequencies(text, { maxWords: 3 })
    expect(result.length).toBeLessThanOrEqual(3)
  })

  test('removes accents from words', () => {
    const result = getWordFrequencies('ação educação')
    const words = result.map(w => w.word)
    expect(words).toContain('acao')
    expect(words).toContain('educacao')
  })

  test('calculates weight relative to max', () => {
    const result = getWordFrequencies('foo foo bar')
    const fooEntry = result.find(w => w.word === 'foo')
    const barEntry = result.find(w => w.word === 'bar')
    expect(fooEntry?.weight).toBe(1)
    expect(barEntry?.weight).toBe(0.5)
  })

  test('handles empty text', () => {
    expect(getWordFrequencies('')).toEqual([])
  })
})

describe('combineFrequencies', () => {
  test('combines word frequencies from multiple texts', () => {
    const result = combineFrequencies(['política economia', 'política saúde'])
    expect(result[0].word).toBe('politica')
    expect(result[0].count).toBe(2)
  })

  test('handles empty array', () => {
    expect(combineFrequencies([])).toEqual([])
  })
})
