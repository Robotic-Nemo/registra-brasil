import { describe, test, expect } from 'vitest'
import {
  parseYouTubeVideoId,
  buildWatchUrl,
  buildEmbedUrl,
  formatTimestamp,
  parseTimestamp,
} from '../youtube-url'

describe('parseYouTubeVideoId', () => {
  test('parses standard watch URL', () => {
    expect(parseYouTubeVideoId('https://www.youtube.com/watch?v=dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('parses youtu.be short URL', () => {
    expect(parseYouTubeVideoId('https://youtu.be/dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('parses mobile URL', () => {
    expect(parseYouTubeVideoId('https://m.youtube.com/watch?v=dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('parses music URL', () => {
    expect(parseYouTubeVideoId('https://music.youtube.com/watch?v=dQw4w9WgXcQ')).toBe('dQw4w9WgXcQ')
  })
  test('ignores extra query params', () => {
    expect(parseYouTubeVideoId('https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=10s')).toBe('dQw4w9WgXcQ')
  })
  test('returns null for invalid video id length', () => {
    expect(parseYouTubeVideoId('https://www.youtube.com/watch?v=abc')).toBeNull()
  })
  test('returns null for missing v param', () => {
    expect(parseYouTubeVideoId('https://www.youtube.com/watch')).toBeNull()
  })
  test('returns null for invalid URL', () => {
    expect(parseYouTubeVideoId('not-a-url')).toBeNull()
  })
  test('returns null for non-youtube URL', () => {
    expect(parseYouTubeVideoId('https://example.com/watch?v=dQw4w9WgXcQ')).toBeNull()
  })
  test('rejects video id with invalid characters', () => {
    expect(parseYouTubeVideoId('https://www.youtube.com/watch?v=dQw4w9WgX!@')).toBeNull()
  })
})

describe('buildWatchUrl', () => {
  test('builds URL without timestamp', () => {
    expect(buildWatchUrl('abc')).toBe('https://www.youtube.com/watch?v=abc')
  })
  test('builds URL with timestamp', () => {
    expect(buildWatchUrl('abc', 30)).toBe('https://www.youtube.com/watch?v=abc&t=30s')
  })
  test('floors fractional timestamps', () => {
    expect(buildWatchUrl('abc', 30.9)).toBe('https://www.youtube.com/watch?v=abc&t=30s')
  })
  test('clamps negative timestamps to zero', () => {
    expect(buildWatchUrl('abc', -10)).toBe('https://www.youtube.com/watch?v=abc&t=0s')
  })
  test('ignores null timestamp', () => {
    expect(buildWatchUrl('abc', null)).toBe('https://www.youtube.com/watch?v=abc')
  })
})

describe('buildEmbedUrl', () => {
  test('builds embed URL without timestamp', () => {
    expect(buildEmbedUrl('abc')).toBe('https://www.youtube.com/embed/abc?rel=0')
  })
  test('builds embed URL with start', () => {
    expect(buildEmbedUrl('abc', 30)).toBe('https://www.youtube.com/embed/abc?rel=0&start=30')
  })
  test('clamps negative start to 0', () => {
    expect(buildEmbedUrl('abc', -5)).toBe('https://www.youtube.com/embed/abc?rel=0&start=0')
  })
})

describe('formatTimestamp', () => {
  test('formats under an hour', () => {
    expect(formatTimestamp(65)).toBe('1:05')
  })
  test('formats over an hour', () => {
    expect(formatTimestamp(3665)).toBe('1:01:05')
  })
  test('zero returns 0:00', () => {
    expect(formatTimestamp(0)).toBe('0:00')
  })
  test('negative returns 0:00', () => {
    expect(formatTimestamp(-5)).toBe('0:00')
  })
  test('Infinity returns 0:00', () => {
    expect(formatTimestamp(Infinity)).toBe('0:00')
  })
  test('NaN returns 0:00', () => {
    expect(formatTimestamp(NaN)).toBe('0:00')
  })
  test('pads seconds', () => {
    expect(formatTimestamp(61)).toBe('1:01')
  })
})

describe('parseTimestamp', () => {
  test('parses HH:MM:SS', () => {
    expect(parseTimestamp('1:02:03')).toBe(3723)
  })
  test('parses MM:SS', () => {
    expect(parseTimestamp('1:30')).toBe(90)
  })
  test('parses plain seconds', () => {
    expect(parseTimestamp('45')).toBe(45)
  })
  test('returns null for invalid input', () => {
    expect(parseTimestamp('abc')).toBeNull()
  })
  test('returns null for negative parts', () => {
    expect(parseTimestamp('-1:00')).toBeNull()
  })
})
