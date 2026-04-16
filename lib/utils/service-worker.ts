/**
 * Service worker registration utility.
 * Registers the service worker in production only.
 */

export function registerServiceWorker(): void {
  if (typeof window === 'undefined') return
  if (!('serviceWorker' in navigator)) return
  if (process.env.NODE_ENV !== 'production') return

  window.addEventListener('load', () => {
    navigator.serviceWorker
      .register('/sw.js')
      .then((registration) => {
        console.debug('[SW] Registered:', registration.scope)

        registration.addEventListener('updatefound', () => {
          const newWorker = registration.installing
          if (!newWorker) return
          newWorker.addEventListener('statechange', () => {
            if (newWorker.state === 'activated' && navigator.serviceWorker.controller) {
              console.debug('[SW] New content available, refresh for update')
            }
          })
        })
      })
      .catch((error) => {
        console.error('[SW] Registration failed:', error)
      })
  })
}

export function unregisterServiceWorker(): void {
  if (typeof window === 'undefined') return
  if (!('serviceWorker' in navigator)) return

  navigator.serviceWorker.ready.then((registration) => {
    registration.unregister()
  })
}
