import { describe, test, expect } from 'vitest'
import { emailLayout, emailButton, escapeHtml } from '../templates'

describe('escapeHtml', () => {
  test('escapes &', () => {
    expect(escapeHtml('a & b')).toBe('a &amp; b')
  })
  test('escapes <', () => {
    expect(escapeHtml('<b>')).toBe('&lt;b&gt;')
  })
  test('escapes >', () => {
    expect(escapeHtml('a>b')).toBe('a&gt;b')
  })
  test('escapes "', () => {
    expect(escapeHtml('"quoted"')).toBe('&quot;quoted&quot;')
  })
  test('handles empty string', () => {
    expect(escapeHtml('')).toBe('')
  })
  test('escapes ampersand first', () => {
    expect(escapeHtml('&<')).toBe('&amp;&lt;')
  })
})

describe('emailLayout', () => {
  test('includes content in output', () => {
    const html = emailLayout('<p>Hello</p>')
    expect(html).toContain('<p>Hello</p>')
  })
  test('wraps as full HTML document', () => {
    const html = emailLayout('x')
    expect(html).toContain('<!DOCTYPE html>')
    expect(html).toContain('</html>')
  })
  test('includes pt-BR lang', () => {
    expect(emailLayout('x')).toContain('lang="pt-BR"')
  })
  test('escapes preheader', () => {
    const html = emailLayout('x', { preheader: '<script>' })
    expect(html).toContain('&lt;script&gt;')
  })
  test('omits preheader div when missing', () => {
    const html = emailLayout('x')
    expect(html).not.toContain('display:none;max-height:0')
  })
})

describe('emailButton', () => {
  test('contains href', () => {
    expect(emailButton('Click', 'https://x.com')).toContain('href="https://x.com"')
  })
  test('escapes button text', () => {
    expect(emailButton('<b>', 'https://x.com')).toContain('&lt;b&gt;')
  })
  test('uses default color', () => {
    expect(emailButton('X', '/')).toContain('#1d4ed8')
  })
  test('uses custom color', () => {
    expect(emailButton('X', '/', '#ff0000')).toContain('#ff0000')
  })
})
