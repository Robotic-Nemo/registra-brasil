'use client'

/**
 * Dev-only breakpoint indicator showing the current Tailwind breakpoint.
 * Displayed in the bottom-left corner during development.
 */
export function BreakpointIndicator() {
  if (process.env.NODE_ENV !== 'development') return null

  return (
    <div
      className="fixed bottom-4 left-4 z-[9999] bg-gray-900 text-white text-xs font-mono px-2 py-1 rounded-md opacity-60 hover:opacity-100 transition-opacity"
      aria-hidden="true"
    >
      <span className="sm:hidden">xs</span>
      <span className="hidden sm:inline md:hidden">sm</span>
      <span className="hidden md:inline lg:hidden">md</span>
      <span className="hidden lg:inline xl:hidden">lg</span>
      <span className="hidden xl:inline 2xl:hidden">xl</span>
      <span className="hidden 2xl:inline">2xl</span>
    </div>
  )
}
