'use client'

import { useState } from 'react'
import { Bell, X, Check, AlertTriangle, Info } from 'lucide-react'
import type { Notification, NotificationType } from '@/types/notification'

interface AdminNotificationsProps {
  notifications: Notification[]
  pendingCount: number
}

const ICON_MAP: Record<NotificationType, typeof Info> = {
  info: Info,
  success: Check,
  warning: AlertTriangle,
  error: AlertTriangle,
}

const COLOR_MAP: Record<NotificationType, string> = {
  info: 'text-blue-500 bg-blue-50',
  success: 'text-green-500 bg-green-50',
  warning: 'text-yellow-500 bg-yellow-50',
  error: 'text-red-500 bg-red-50',
}

export function AdminNotifications({ notifications, pendingCount }: AdminNotificationsProps) {
  const [open, setOpen] = useState(false)

  return (
    <div className="relative">
      <button
        onClick={() => setOpen(!open)}
        className="relative p-2 rounded-lg hover:bg-gray-100 transition-colors"
        aria-label={`Notificacoes (${pendingCount} pendentes)`}
      >
        <Bell className="w-5 h-5 text-gray-600" />
        {pendingCount > 0 && (
          <span className="absolute -top-0.5 -right-0.5 w-4 h-4 bg-red-500 text-white text-[10px] font-bold rounded-full flex items-center justify-center">
            {pendingCount > 9 ? '9+' : pendingCount}
          </span>
        )}
      </button>

      {open && (
        <>
          {/* Backdrop */}
          <div className="fixed inset-0 z-40" onClick={() => setOpen(false)} />

          {/* Dropdown */}
          <div className="absolute right-0 top-full mt-2 w-80 bg-white border border-gray-200 rounded-xl shadow-lg z-50 max-h-96 overflow-y-auto">
            <div className="px-4 py-3 border-b border-gray-100 flex items-center justify-between">
              <p className="text-sm font-semibold text-gray-700">Notificacoes</p>
              <button
                onClick={() => setOpen(false)}
                className="p-1 rounded hover:bg-gray-100 transition-colors"
              >
                <X className="w-4 h-4 text-gray-400" />
              </button>
            </div>

            {notifications.length === 0 ? (
              <div className="px-4 py-8 text-center">
                <p className="text-sm text-gray-500">Nenhuma notificacao.</p>
              </div>
            ) : (
              <ul className="divide-y divide-gray-50">
                {notifications.map((n) => {
                  const Icon = ICON_MAP[n.type]
                  const colors = COLOR_MAP[n.type]
                  const [textColor, bgColor] = colors.split(' ')
                  return (
                    <li key={n.id} className={`px-4 py-3 ${n.read ? '' : 'bg-blue-50/30'}`}>
                      <div className="flex items-start gap-2.5">
                        <div className={`p-1 rounded ${bgColor} shrink-0 mt-0.5`}>
                          <Icon className={`w-3.5 h-3.5 ${textColor}`} />
                        </div>
                        <div className="min-w-0 flex-1">
                          <p className="text-sm font-medium text-gray-900">{n.title}</p>
                          {n.message && (
                            <p className="text-xs text-gray-500 mt-0.5 line-clamp-2">{n.message}</p>
                          )}
                          <p className="text-[10px] text-gray-400 mt-1">
                            {new Date(n.timestamp).toLocaleString('pt-BR')}
                          </p>
                        </div>
                      </div>
                    </li>
                  )
                })}
              </ul>
            )}
          </div>
        </>
      )}
    </div>
  )
}
