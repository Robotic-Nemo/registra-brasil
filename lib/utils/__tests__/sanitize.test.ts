import { describe, test, expect } from 'vitest'
import { sanitizeHtml } from '../sanitize'

describe('sanitizeHtml', () => {
  test('strips basic HTML tags', () => {
    expect(sanitizeHtml('<b>bold</b>')).toBe('bold')
  })

  test('strips script tags', () => {
    expect(sanitizeHtml('<script>alert("xss")</script>')).toBe('alert("xss")')
  })

  test('strips nested tags', () => {
    expect(sanitizeHtml('<div><p>hello</p></div>')).toBe('hello')
  })

  test('handles self-closing tags', () => {
    expect(sanitizeHtml('line1<br/>line2')).toBe('line1line2')
  })

  test('decodes HTML entities', () => {
    expect(sanitizeHtml('a &amp; b &lt; c')).toBe('a & b < c')
  })

  test('decodes &gt; entity', () => {
    expect(sanitizeHtml('x &gt; y')).toBe('x > y')
  })

  test('decodes &quot; entity', () => {
    expect(sanitizeHtml('&quot;hello&quot;')).toBe('"hello"')
  })

  test('decodes &#039; entity', () => {
    expect(sanitizeHtml("it&#039;s")).toBe("it's")
  })

  test('decodes &nbsp;', () => {
    expect(sanitizeHtml('hello&nbsp;world')).toBe('hello world')
  })

  test('strips tags revealed by entity decoding (encoded XSS)', () => {
    expect(sanitizeHtml('&lt;script&gt;alert(1)&lt;/script&gt;')).toBe('alert(1)')
  })

  test('handles empty string', () => {
    expect(sanitizeHtml('')).toBe('')
  })

  test('passes through plain text unchanged', () => {
    expect(sanitizeHtml('just text')).toBe('just text')
  })

  test('strips img tags with onerror (XSS vector)', () => {
    expect(sanitizeHtml('<img src=x onerror=alert(1)>')).toBe('')
  })

  test('strips svg/onload XSS', () => {
    expect(sanitizeHtml('<svg onload=alert(1)>')).toBe('')
  })

  test('strips event handler attributes inside tags', () => {
    expect(sanitizeHtml('<div onclick="evil()">click</div>')).toBe('click')
  })
})
