import { describe, test, expect, vi, beforeEach, afterEach } from 'vitest'
import { MemoryCache, globalCache } from '../cache'

describe('MemoryCache', () => {
  let cache: MemoryCache<string>

  beforeEach(() => {
    vi.useFakeTimers()
    cache = new MemoryCache<string>(60, 100)
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  describe('get / set', () => {
    test('stores and retrieves a value', () => {
      cache.set('key', 'value')
      expect(cache.get('key')).toBe('value')
    })

    test('returns undefined for missing key', () => {
      expect(cache.get('nonexistent')).toBeUndefined()
    })

    test('returns undefined for expired entry', () => {
      cache.set('key', 'value', 1) // 1 second TTL
      vi.advanceTimersByTime(2000)
      expect(cache.get('key')).toBeUndefined()
    })

    test('uses custom TTL per entry', () => {
      cache.set('short', 'val', 1)
      cache.set('long', 'val', 300)
      vi.advanceTimersByTime(2000)
      expect(cache.get('short')).toBeUndefined()
      expect(cache.get('long')).toBe('val')
    })
  })

  describe('has', () => {
    test('returns true for existing non-expired key', () => {
      cache.set('key', 'value')
      expect(cache.has('key')).toBe(true)
    })

    test('returns false for missing key', () => {
      expect(cache.has('missing')).toBe(false)
    })

    test('returns false for expired key', () => {
      cache.set('key', 'value', 1)
      vi.advanceTimersByTime(2000)
      expect(cache.has('key')).toBe(false)
    })
  })

  describe('delete', () => {
    test('removes an entry', () => {
      cache.set('key', 'value')
      cache.delete('key')
      expect(cache.get('key')).toBeUndefined()
    })
  })

  describe('clear', () => {
    test('removes all entries', () => {
      cache.set('a', '1')
      cache.set('b', '2')
      cache.clear()
      expect(cache.get('a')).toBeUndefined()
      expect(cache.get('b')).toBeUndefined()
    })
  })

  describe('getOrSet', () => {
    test('returns cached value if present', async () => {
      cache.set('key', 'cached')
      const fn = vi.fn(async () => 'computed')
      const result = await cache.getOrSet('key', fn)
      expect(result).toBe('cached')
      expect(fn).not.toHaveBeenCalled()
    })

    test('computes and caches value if missing', async () => {
      const result = await cache.getOrSet('key', async () => 'computed')
      expect(result).toBe('computed')
      expect(cache.get('key')).toBe('computed')
    })

    test('deduplicates concurrent calls (stampede protection)', async () => {
      vi.useRealTimers()
      const localCache = new MemoryCache<string>(60, 100)
      const fn = vi.fn(async () => {
        await new Promise(r => setTimeout(r, 10))
        return 'value'
      })
      const [r1, r2] = await Promise.all([
        localCache.getOrSet('key', fn),
        localCache.getOrSet('key', fn),
      ])
      expect(r1).toBe('value')
      expect(r2).toBe('value')
      expect(fn).toHaveBeenCalledTimes(1)
      vi.useFakeTimers()
    })
  })

  describe('eviction', () => {
    test('evicts oldest entry when at capacity', () => {
      const small = new MemoryCache<string>(300, 2)
      small.set('first', '1')
      small.set('second', '2')
      small.set('third', '3') // evicts 'first'
      expect(small.get('first')).toBeUndefined()
      expect(small.get('second')).toBe('2')
      expect(small.get('third')).toBe('3')
    })
  })

  describe('prune', () => {
    test('removes expired entries and returns count', () => {
      cache.set('a', '1', 1)
      cache.set('b', '2', 1)
      cache.set('c', '3', 300)
      vi.advanceTimersByTime(2000)
      const removed = cache.prune()
      expect(removed).toBe(2)
    })

    test('keeps non-expired entries', () => {
      cache.set('a', '1', 300)
      vi.advanceTimersByTime(100)
      cache.prune()
      expect(cache.get('a')).toBe('1')
    })
  })

  describe('size', () => {
    test('returns count of non-expired entries', () => {
      cache.set('a', '1', 1)
      cache.set('b', '2', 300)
      vi.advanceTimersByTime(2000)
      expect(cache.size).toBe(1)
    })
  })

  describe('keys', () => {
    test('returns array of non-expired keys', () => {
      cache.set('a', '1', 1)
      cache.set('b', '2', 300)
      vi.advanceTimersByTime(2000)
      expect(cache.keys()).toEqual(['b'])
    })
  })
})

describe('globalCache', () => {
  test('is a MemoryCache instance', () => {
    expect(globalCache).toBeInstanceOf(MemoryCache)
  })
})
