'use client'

import dynamic from 'next/dynamic'

const ShareCard = dynamic(
  () => import('./ShareCard').then((mod) => ({ default: mod.ShareCard })),
  { ssr: false, loading: () => <div className="h-8 w-32 bg-gray-100 rounded animate-pulse" /> }
)

interface Props {
  url: string
  text: string
}

export function LazyShareCard(props: Props) {
  return <ShareCard {...props} />
}
