import { describe, test, expect } from 'vitest'
import {
  getStatementEmbedUrl,
  getPoliticianEmbedUrl,
  getStatementIframeCode,
  getPoliticianIframeCode,
  getOEmbedUrl,
} from '../embed'

describe('getStatementEmbedUrl', () => {
  test('includes id', () => {
    expect(getStatementEmbedUrl('abc')).toContain('/embed/declaracao/abc')
  })
})

describe('getPoliticianEmbedUrl', () => {
  test('includes slug', () => {
    expect(getPoliticianEmbedUrl('lula')).toContain('/embed/politico/lula')
  })
})

describe('getStatementIframeCode', () => {
  test('contains iframe', () => {
    const code = getStatementIframeCode('abc')
    expect(code).toContain('<iframe')
    expect(code).toContain('/embed/declaracao/abc')
  })
  test('uses default dimensions', () => {
    const code = getStatementIframeCode('abc')
    expect(code).toContain('600px')
    expect(code).toContain('300px')
  })
  test('respects custom dimensions (numeric)', () => {
    const code = getStatementIframeCode('x', { width: 800, height: 400 })
    expect(code).toContain('800px')
    expect(code).toContain('400px')
  })
  test('respects custom dimensions (string)', () => {
    const code = getStatementIframeCode('x', { width: '100%', height: '50vh' })
    expect(code).toContain('100%')
    expect(code).toContain('50vh')
  })
  test('escapes HTML in id', () => {
    const code = getStatementIframeCode('<script>')
    expect(code).not.toContain('<script>')
  })
})

describe('getPoliticianIframeCode', () => {
  test('uses default dimensions', () => {
    expect(getPoliticianIframeCode('lula')).toContain('400px')
  })
})

describe('getOEmbedUrl', () => {
  test('encodes statement URL', () => {
    expect(getOEmbedUrl('https://ex.com/s')).toContain('url=https%3A%2F%2Fex.com%2Fs')
  })
})
