import Link from 'next/link'

interface AdminHeaderProps {
  title: string
  description?: string
  action?: {
    label: string
    href: string
  }
}

export function AdminHeader({ title, description, action }: AdminHeaderProps) {
  return (
    <div className="flex items-start justify-between mb-6">
      <div>
        <h1 className="text-2xl font-bold text-zinc-900">{title}</h1>
        {description && (
          <p className="text-sm text-zinc-500 mt-1">{description}</p>
        )}
      </div>
      {action && (
        <Link
          href={action.href}
          className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
        >
          {action.label}
        </Link>
      )}
    </div>
  )
}
