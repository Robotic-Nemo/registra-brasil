import type { Metadata } from 'next'
import { AdminSidebar } from '@/components/admin/AdminSidebar'
import { AdminMobileNav } from '@/components/admin/AdminMobileNav'

export const metadata: Metadata = {
  robots: {
    index: false,
    follow: false,
  },
}

/**
 * Admin routes share a persistent sidebar nav. Hidden on mobile
 * (lg:) so the existing per-page back links still serve narrow screens.
 */
export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex min-h-full">
      <AdminSidebar />
      <div className="flex-1 min-w-0">
        <AdminMobileNav />
        {children}
      </div>
    </div>
  )
}
