export type NotificationType = 'info' | 'success' | 'warning' | 'error'

export interface Notification {
  id: string
  type: NotificationType
  title: string
  message?: string
  timestamp: string
  read: boolean
  link?: string
  action?: {
    label: string
    href: string
  }
}

export interface NotificationPreferences {
  emailEnabled: boolean
  pushEnabled: boolean
  categories: {
    newStatements: boolean
    verifications: boolean
    disputes: boolean
    systemUpdates: boolean
  }
}

export interface ToastNotification {
  id: string
  type: NotificationType
  message: string
  duration?: number
  dismissible?: boolean
}
