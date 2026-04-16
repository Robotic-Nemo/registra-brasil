import type { ReactNode } from 'react'

/**
 * Minimal embed layout — no header, footer, or navigation.
 * Used for embeddable widgets.
 */
export default function EmbedLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="pt-BR">
      <body className="bg-white dark:bg-zinc-900 p-0 m-0">
        {children}
      </body>
    </html>
  )
}
