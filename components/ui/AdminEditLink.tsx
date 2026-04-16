'use client'

import Link from 'next/link'
import { Pencil } from 'lucide-react'
import { useEffect, useState } from 'react'

interface AdminEditLinkProps {
  statementId: string
}

export function AdminEditLink({ statementId }: AdminEditLinkProps) {
  const [isAdmin, setIsAdmin] = useState(false)

  useEffect(() => {
    const hasAdminSession = document.cookie
      .split(';')
      .some((c) => c.trim().startsWith('admin_session='))
    setIsAdmin(hasAdminSession)
  }, [])

  if (!isAdmin) return null

  return (
    <Link
      href={`/admin/editar/${statementId}`}
      className="inline-flex items-center gap-1 text-xs text-amber-600 hover:text-amber-800 bg-amber-50 hover:bg-amber-100 border border-amber-200 px-2 py-1 rounded transition-colors"
      title="Editar declaração (admin)"
    >
      <Pencil className="w-3 h-3" />
      Editar
    </Link>
  )
}
