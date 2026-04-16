import { describe, test, expect } from 'vitest'
import { buildTwitterShareUrl, truncateForTweet, buildStatementTweetUrl } from '../twitter'

describe('buildTwitterShareUrl', () => {
  test('builds with text only', () => {
    const url = buildTwitterShareUrl({ text: 'Hello' })
    expect(url).toContain('twitter.com/intent/tweet')
    expect(url).toContain('text=Hello')
  })
  test('includes URL param', () => {
    const url = buildTwitterShareUrl({ text: 'hi', url: 'https://ex.com' })
    expect(url).toContain('url=https')
  })
  test('joins hashtags with comma', () => {
    const url = buildTwitterShareUrl({ text: 'hi', hashtags: ['a', 'b'] })
    expect(url).toContain('hashtags=a%2Cb')
  })
  test('omits via when not provided', () => {
    expect(buildTwitterShareUrl({ text: 'hi' })).not.toContain('via=')
  })
  test('includes via when provided', () => {
    expect(buildTwitterShareUrl({ text: 'hi', via: 'user' })).toContain('via=user')
  })
})

describe('truncateForTweet', () => {
  test('returns short text unchanged', () => {
    expect(truncateForTweet('hello')).toBe('hello')
  })
  test('truncates long text', () => {
    const long = 'x'.repeat(300)
    const result = truncateForTweet(long)
    expect(result.length).toBeLessThanOrEqual(280)
    expect(result.endsWith('\u2026')).toBe(true)
  })
  test('accounts for URL length', () => {
    const long = 'x'.repeat(280)
    const result = truncateForTweet(long, 'https://x.com')
    expect(result.length).toBeLessThan(280)
  })
})

describe('buildStatementTweetUrl', () => {
  test('includes politician name and summary', () => {
    const url = buildStatementTweetUrl({
      summary: 'Test statement',
      politicianName: 'Lula',
      url: 'https://ex.com/s',
    })
    // URLSearchParams encodes spaces as '+'. Replace for a readable check.
    const readable = decodeURIComponent(url).replace(/\+/g, ' ')
    expect(readable).toContain('Lula')
    expect(readable).toContain('Test statement')
  })
  test('includes RegistraBrasil hashtag', () => {
    const url = buildStatementTweetUrl({
      summary: 's', politicianName: 'P', url: 'https://ex.com',
    })
    expect(url).toContain('RegistraBrasil')
  })
})
