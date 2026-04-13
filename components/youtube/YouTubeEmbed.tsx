'use client'

import { useState } from 'react'
import { buildEmbedUrl } from '@/lib/utils/youtube-url'
import { Play } from 'lucide-react'

interface YouTubeEmbedProps {
  videoId: string
  timestampSec?: number | null
  thumbnailUrl?: string
  title?: string
}

export function YouTubeEmbed({ videoId, timestampSec, thumbnailUrl, title }: YouTubeEmbedProps) {
  const [playing, setPlaying] = useState(false)
  const thumb = thumbnailUrl ?? `https://img.youtube.com/vi/${videoId}/mqdefault.jpg`

  if (playing) {
    return (
      <div className="relative w-full aspect-video rounded-lg overflow-hidden">
        <iframe
          src={`${buildEmbedUrl(videoId, timestampSec)}&autoplay=1`}
          title={title ?? 'Vídeo'}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
          className="absolute inset-0 w-full h-full"
        />
      </div>
    )
  }

  return (
    <button
      onClick={() => setPlaying(true)}
      className="relative w-full aspect-video rounded-lg overflow-hidden group"
      aria-label={`Reproduzir: ${title ?? 'vídeo'}`}
    >
      <img src={thumb} alt={title ?? 'Thumbnail'} className="w-full h-full object-cover" />
      <div className="absolute inset-0 bg-black/30 group-hover:bg-black/40 transition-colors flex items-center justify-center">
        <div className="bg-red-600 rounded-full p-4 group-hover:scale-110 transition-transform">
          <Play className="w-8 h-8 text-white fill-white" />
        </div>
      </div>
    </button>
  )
}
