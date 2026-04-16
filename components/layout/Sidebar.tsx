import type { ReactNode } from 'react'

interface SidebarProps {
  children: ReactNode
  sidebar: ReactNode
  className?: string
  sidebarPosition?: 'left' | 'right'
}

/**
 * Responsive sidebar layout with main content and a side panel.
 * On mobile, sidebar stacks below the main content.
 */
export function Sidebar({
  children,
  sidebar,
  className = '',
  sidebarPosition = 'right',
}: SidebarProps) {
  const mainContent = (
    <div className="flex-1 min-w-0">{children}</div>
  )

  const sidePanel = (
    <aside className="w-full lg:w-72 xl:w-80 flex-shrink-0">
      {sidebar}
    </aside>
  )

  return (
    <div className={`flex flex-col lg:flex-row gap-8 ${className}`}>
      {sidebarPosition === 'left' ? (
        <>
          {sidePanel}
          {mainContent}
        </>
      ) : (
        <>
          {mainContent}
          {sidePanel}
        </>
      )}
    </div>
  )
}
