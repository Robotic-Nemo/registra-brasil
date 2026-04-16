'use client'

import { useState } from 'react'
import type { SocialPreviewData } from '@/lib/utils/social-preview'

type Platform = 'twitter' | 'facebook' | 'linkedin' | 'whatsapp'

interface SharePreviewProps {
  data: SocialPreviewData
  className?: string
}

const PLATFORM_LABELS: Record<Platform, string> = {
  twitter: 'Twitter/X',
  facebook: 'Facebook',
  linkedin: 'LinkedIn',
  whatsapp: 'WhatsApp',
}

/**
 * Preview component showing how content looks when shared on different platforms.
 */
export default function SharePreview({ data, className = '' }: SharePreviewProps) {
  const [platform, setPlatform] = useState<Platform>('twitter')

  return (
    <div className={`rounded-lg border border-gray-200 ${className}`}>
      <div className="flex gap-1 border-b border-gray-200 p-2">
        {(Object.keys(PLATFORM_LABELS) as Platform[]).map((p) => (
          <button
            key={p}
            onClick={() => setPlatform(p)}
            className={`rounded-md px-3 py-1 text-xs font-medium transition-colors ${
              platform === p
                ? 'bg-blue-100 text-blue-700'
                : 'text-gray-500 hover:bg-gray-100'
            }`}
          >
            {PLATFORM_LABELS[p]}
          </button>
        ))}
      </div>

      <div className="p-4">
        {platform === 'whatsapp' ? (
          <WhatsAppPreview data={data} />
        ) : (
          <CardPreview data={data} platform={platform} />
        )}
      </div>
    </div>
  )
}

function CardPreview({ data, platform }: { data: SocialPreviewData; platform: Platform }) {
  const showLargeImage = platform === 'twitter' || platform === 'linkedin'

  return (
    <div className="overflow-hidden rounded-lg border border-gray-200">
      {showLargeImage && (
        <div className="aspect-[1.91/1] bg-gray-100">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={data.image}
            alt=""
            className="h-full w-full object-cover"
          />
        </div>
      )}
      <div className="p-3">
        <p className="text-xs text-gray-500">{new URL(data.url).hostname}</p>
        <p className="mt-1 font-medium text-sm leading-snug line-clamp-2">{data.title}</p>
        <p className="mt-1 text-xs text-gray-600 line-clamp-2">{data.description}</p>
      </div>
    </div>
  )
}

function WhatsAppPreview({ data }: { data: SocialPreviewData }) {
  return (
    <div className="max-w-xs rounded-lg bg-green-50 p-3">
      <div className="overflow-hidden rounded border border-gray-200 bg-white">
        <div className="aspect-[1.91/1] bg-gray-100">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={data.image}
            alt=""
            className="h-full w-full object-cover"
          />
        </div>
        <div className="p-2">
          <p className="text-xs font-medium uppercase text-gray-500">
            {data.siteName}
          </p>
          <p className="mt-1 text-sm font-medium line-clamp-2">{data.title}</p>
          <p className="mt-1 text-xs text-gray-600 line-clamp-2">{data.description}</p>
        </div>
      </div>
    </div>
  )
}
