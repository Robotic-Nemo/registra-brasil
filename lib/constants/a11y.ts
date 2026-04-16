/**
 * Accessibility constants following WCAG 2.1 guidelines.
 */

/** Minimum contrast ratios per WCAG 2.1 */
export const CONTRAST_RATIOS = {
  /** Normal text AA: 4.5:1 */
  AA_NORMAL: 4.5,
  /** Large text AA: 3:1 */
  AA_LARGE: 3,
  /** Normal text AAA: 7:1 */
  AAA_NORMAL: 7,
  /** Large text AAA: 4.5:1 */
  AAA_LARGE: 4.5,
  /** UI components and graphical objects: 3:1 */
  UI_COMPONENT: 3,
} as const

/** Focus ring styles for consistent focus indicators */
export const FOCUS_STYLES = {
  /** Default focus ring for most elements */
  DEFAULT: 'focus-visible:outline-2 focus-visible:outline-blue-500 focus-visible:outline-offset-2',
  /** Focus ring for dark backgrounds */
  LIGHT: 'focus-visible:outline-2 focus-visible:outline-white focus-visible:outline-offset-2',
  /** Focus ring for input elements */
  INPUT: 'focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-1',
} as const

/** Minimum touch target sizes per WCAG 2.5.5 (enhanced) */
export const TOUCH_TARGETS = {
  /** Minimum size in px (WCAG 2.5.8 Level AA) */
  MIN: 24,
  /** Recommended size in px (WCAG 2.5.5 Level AAA) */
  RECOMMENDED: 44,
} as const

/** Animation timing for reduced motion */
export const MOTION = {
  /** Standard animation duration */
  DURATION: '200ms',
  /** Reduced motion duration (near-instant) */
  REDUCED_DURATION: '0ms',
  /** Standard easing */
  EASING: 'cubic-bezier(0.4, 0, 0.2, 1)',
} as const

/** ARIA landmark roles */
export const LANDMARKS = {
  BANNER: 'banner',
  NAVIGATION: 'navigation',
  MAIN: 'main',
  COMPLEMENTARY: 'complementary',
  CONTENTINFO: 'contentinfo',
  SEARCH: 'search',
  FORM: 'form',
  REGION: 'region',
} as const
