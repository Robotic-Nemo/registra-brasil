import { describe, test, expect } from 'vitest'
import { t, translations, ptBR } from '../translations'

describe('t (translation helper)', () => {
  test('returns translation for known key', () => {
    expect(t('common.loading')).toBe('Carregando...')
  })
  test('returns key for unknown key', () => {
    expect(t('unknown.key')).toBe('unknown.key')
  })
  test('supports parameter substitution', () => {
    expect(t('statements.byPolitician', 'pt', { name: 'Lula' })).toBe('Declaracoes de Lula')
  })
  test('falls back to pt for unknown locale', () => {
    expect(t('common.loading', 'fr')).toBe('Carregando...')
  })
  test('handles missing params gracefully', () => {
    expect(t('statements.byPolitician')).toContain('{name}')
  })
})

describe('translations export', () => {
  test('has pt locale', () => {
    expect(translations.pt).toBeDefined()
  })
  test('ptBR is non-empty', () => {
    expect(Object.keys(ptBR).length).toBeGreaterThan(10)
  })
})

describe('translation keys', () => {
  test.each([
    'common.loading', 'common.error', 'common.save', 'common.cancel',
    'nav.home', 'statements.recent', 'politicians.all',
  ])('has key %s', (key) => {
    expect(t(key)).not.toBe(key)
  })
})
