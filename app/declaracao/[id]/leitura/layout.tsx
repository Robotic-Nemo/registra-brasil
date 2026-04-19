import type { ReactNode } from 'react'

/**
 * Standalone layout for the reader-mode / print-friendly view of a
 * statement. Hides the global Header/Footer chrome (from the root
 * layout's perspective this page still inherits the shell, but the
 * body here stretches to full width and the print stylesheet below
 * strips everything but the quote block).
 */
export default function ReaderLayout({ children }: { children: ReactNode }) {
  return (
    <div className="reader-mode min-h-screen bg-white text-gray-900 dark:bg-stone-50 dark:text-gray-900">
      <style>{`
        @media print {
          header, footer, nav, .no-print { display: none !important; }
          main { max-width: none !important; padding: 0 !important; }
          body { background: white !important; color: black !important; }
          a { color: black !important; text-decoration: underline !important; }
        }
      `}</style>
      {children}
    </div>
  )
}
