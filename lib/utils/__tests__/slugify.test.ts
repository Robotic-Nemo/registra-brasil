import { describe, test, expect } from 'vitest'
import { slugify } from '../slugify'

describe('slugify', () => {
  test('converts basic text to slug', () => {
    expect(slugify('Hello World')).toBe('hello-world')
  })

  test('handles Portuguese accents', () => {
    expect(slugify('ação')).toBe('acao')
    expect(slugify('saúde')).toBe('saude')
    expect(slugify('coração')).toBe('coracao')
    expect(slugify('eleição')).toBe('eleicao')
  })

  test('handles cedilla', () => {
    expect(slugify('preço')).toBe('preco')
  })

  test('removes special characters', () => {
    expect(slugify('hello! @world#')).toBe('hello-world')
  })

  test('collapses multiple hyphens', () => {
    expect(slugify('a - - b')).toBe('a-b')
  })

  test('removes leading and trailing hyphens', () => {
    expect(slugify('  hello  ')).toBe('hello')
    expect(slugify('-hello-')).toBe('hello')
  })

  test('returns "sem-titulo" for empty string', () => {
    expect(slugify('')).toBe('sem-titulo')
  })

  test('returns "sem-titulo" for string with only special characters', () => {
    expect(slugify('!@#$%')).toBe('sem-titulo')
  })

  test('handles numbers', () => {
    expect(slugify('item 123')).toBe('item-123')
  })

  test('handles mixed content', () => {
    expect(slugify('São Paulo é Legal!')).toBe('sao-paulo-e-legal')
  })
})
