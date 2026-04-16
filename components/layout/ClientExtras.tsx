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

export function ClientExtras() {
  return (
    <>
      <KeyboardShortcuts />
      <BackToTop />
    </>
  )
}
