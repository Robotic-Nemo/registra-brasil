import { describe, test, expect, vi } from 'vitest'
import { EventEmitter } from '../event-emitter'

type TestEvents = {
  message: string
  count: number
}

describe('EventEmitter', () => {
  test('on/emit delivers events to listeners', () => {
    const emitter = new EventEmitter<TestEvents>()
    const handler = vi.fn()
    emitter.on('message', handler)
    emitter.emit('message', 'hello')
    expect(handler).toHaveBeenCalledWith('hello')
  })

  test('on returns unsubscribe function', () => {
    const emitter = new EventEmitter<TestEvents>()
    const handler = vi.fn()
    const unsub = emitter.on('message', handler)
    unsub()
    emitter.emit('message', 'hello')
    expect(handler).not.toHaveBeenCalled()
  })

  test('off removes a specific listener', () => {
    const emitter = new EventEmitter<TestEvents>()
    const handler = vi.fn()
    emitter.on('message', handler)
    emitter.off('message', handler)
    emitter.emit('message', 'hello')
    expect(handler).not.toHaveBeenCalled()
  })

  test('supports multiple listeners', () => {
    const emitter = new EventEmitter<TestEvents>()
    const h1 = vi.fn()
    const h2 = vi.fn()
    emitter.on('message', h1)
    emitter.on('message', h2)
    emitter.emit('message', 'test')
    expect(h1).toHaveBeenCalledWith('test')
    expect(h2).toHaveBeenCalledWith('test')
  })

  test('once fires only once', () => {
    const emitter = new EventEmitter<TestEvents>()
    const handler = vi.fn()
    emitter.once('count', handler)
    emitter.emit('count', 1)
    emitter.emit('count', 2)
    expect(handler).toHaveBeenCalledTimes(1)
    expect(handler).toHaveBeenCalledWith(1)
  })

  test('removeAllListeners for specific event', () => {
    const emitter = new EventEmitter<TestEvents>()
    const h1 = vi.fn()
    const h2 = vi.fn()
    emitter.on('message', h1)
    emitter.on('count', h2)
    emitter.removeAllListeners('message')
    emitter.emit('message', 'test')
    emitter.emit('count', 1)
    expect(h1).not.toHaveBeenCalled()
    expect(h2).toHaveBeenCalled()
  })

  test('removeAllListeners without args clears all', () => {
    const emitter = new EventEmitter<TestEvents>()
    const h1 = vi.fn()
    const h2 = vi.fn()
    emitter.on('message', h1)
    emitter.on('count', h2)
    emitter.removeAllListeners()
    emitter.emit('message', 'test')
    emitter.emit('count', 1)
    expect(h1).not.toHaveBeenCalled()
    expect(h2).not.toHaveBeenCalled()
  })

  test('listener errors do not break other listeners', () => {
    const emitter = new EventEmitter<TestEvents>()
    const errorHandler = vi.fn(() => { throw new Error('boom') })
    const okHandler = vi.fn()
    // Suppress console.error
    const spy = vi.spyOn(console, 'error').mockImplementation(() => {})
    emitter.on('message', errorHandler)
    emitter.on('message', okHandler)
    emitter.emit('message', 'test')
    expect(okHandler).toHaveBeenCalled()
    spy.mockRestore()
  })
})
