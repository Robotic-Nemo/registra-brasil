/**
 * Test render helper with common providers.
 *
 * Note: This requires @testing-library/react and jsdom to be installed.
 * Update the vitest config to use environment: 'jsdom' for component tests.
 *
 * @example
 * ```ts
 * import { renderWithProviders } from '@/lib/test-utils/render'
 * import { MyComponent } from '@/components/MyComponent'
 *
 * test('renders correctly', () => {
 *   const { getByText } = renderWithProviders(<MyComponent />)
 *   expect(getByText('Hello')).toBeTruthy()
 * })
 * ```
 */

// Re-export everything from @testing-library/react
export { render, screen, fireEvent, waitFor, act } from '@testing-library/react'

// We do not wrap in providers yet since the app uses no context providers
// that need to be present in every test. This file serves as a future
// extension point: when a theme/auth/i18n provider is added, wrap here
// and all tests get it for free.
