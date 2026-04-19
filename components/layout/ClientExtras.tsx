'use client'

import dynamic from 'next/dynamic'

const KeyboardShortcuts = dynamic(
  () => import('@/components/ui/KeyboardShortcuts').then(m => ({ default: m.KeyboardShortcuts })),
  { ssr: false }
)
const BackToTop = dynamic(
  () => import('@/components/ui/BackToTop').then(m => ({ default: m.BackToTop })),
  { ssr: false }
)
const CookieConsent = dynamic(
  () => import('@/components/ui/CookieConsent').then(m => ({ default: m.CookieConsent })),
  { ssr: false }
)
const PWARegister = dynamic(
  () => import('@/components/layout/PWARegister').then(m => ({ default: m.PWARegister })),
  { ssr: false }
)
const CommandPalette = dynamic(
  () => import('@/components/ui/CommandPalette').then(m => ({ default: m.CommandPalette })),
  { ssr: false }
)
const ReportIssueButton = dynamic(
  () => import('@/components/feedback/ReportIssueButton').then(m => ({ default: m.ReportIssueButton })),
  { ssr: false }
)

export function ClientExtras() {
  return (
    <>
      <KeyboardShortcuts />
      <BackToTop />
      <CookieConsent />
      <PWARegister />
      <CommandPalette />
      <ReportIssueButton />
    </>
  )
}
