/**
 * Throttle function — limits how often a function can be called
 */
export function throttle<T extends (...args: Parameters<T>) => void>(
  fn: T,
  intervalMs: number
): (...args: Parameters<T>) => void {
  let lastCallTime = 0
  let timeoutId: ReturnType<typeof setTimeout> | null = null

  return (...args: Parameters<T>) => {
    const now = Date.now()
    const timeSinceLastCall = now - lastCallTime

    if (timeSinceLastCall >= intervalMs) {
      lastCallTime = now
      fn(...args)
    } else if (!timeoutId) {
      timeoutId = setTimeout(() => {
        lastCallTime = Date.now()
        timeoutId = null
        fn(...args)
      }, intervalMs - timeSinceLastCall)
    }
  }
}

/**
 * Throttle with leading and trailing options
 */
export function throttleAdvanced<T extends (...args: unknown[]) => void>(
  fn: T,
  intervalMs: number,
  options: { leading?: boolean; trailing?: boolean } = {}
): ((...args: Parameters<T>) => void) & { cancel: () => void } {
  const { leading = true, trailing = true } = options
  let lastCallTime = 0
  let timeoutId: ReturnType<typeof setTimeout> | null = null
  let lastArgs: unknown[] | null = null

  function throttled(...args: unknown[]) {
    const now = Date.now()
    const remaining = intervalMs - (now - lastCallTime)

    if (remaining <= 0) {
      if (timeoutId) {
        clearTimeout(timeoutId)
        timeoutId = null
      }
      lastCallTime = now
      if (leading) fn(...args)
    } else {
      lastArgs = args
      if (!timeoutId && trailing) {
        timeoutId = setTimeout(() => {
          lastCallTime = Date.now()
          timeoutId = null
          if (lastArgs) fn(...lastArgs)
          lastArgs = null
        }, remaining)
      }
    }
  }

  throttled.cancel = () => {
    if (timeoutId) {
      clearTimeout(timeoutId)
      timeoutId = null
    }
    lastArgs = null
  }

  return throttled as ((...args: Parameters<T>) => void) & { cancel: () => void }
}
