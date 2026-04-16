'use client'

import { useState } from 'react'
import Image from 'next/image'
import { buildEmbedUrl } from '@/lib/utils/youtube-url'
import { Play } from 'lucide-react'

// Valid YouTube video IDs are 11 alphanumeric chars (plus - and _)
const VALID_VIDEO_ID = /^[a-zA-Z0-9_-]{11}$/

interface YouTubeEmbedProps {
  videoId: string
  timestampSec?: number | null
  thumbnailUrl?: string
  title?: string
}

export function YouTubeEmbed({ videoId, timestampSec, thumbnailUrl, title }: YouTubeEmbedProps) {
  const [playing, setPlaying] = useState(false)
  const [thumbFailed, setThumbFailed] = useState(false)

  // Guard: don't render if videoId is malformed
  if (!videoId || !VALID_VIDEO_ID.test(videoId)) return null

  // Prefer the provided URL; fall back to the default/HQ CDN image; finally an in-component placeholder.
  const thumb = thumbnailUrl ?? `https://img.youtube.com/vi/${videoId}/mqdefault.jpg`

  const descId = `yt-desc-${videoId}`

  if (playing) {
    return (
      <div className="relative w-full aspect-video rounded-lg overflow-hidden">
        <span id={descId} className="sr-only">
          {title ? `Vídeo do YouTube: ${title}` : 'Vídeo do YouTube incorporado'}
        </span>
        <iframe
          src={`${buildEmbedUrl(videoId, timestampSec)}&autoplay=1`}
          title={title ?? 'Vídeo'}
          aria-describedby={descId}
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
      {thumbFailed ? (
        <div className="absolute inset-0 bg-zinc-800 flex items-center justify-center text-zinc-400 text-xs">
          Prévia indisponível
        </div>
      ) : (
        <Image
          src={thumb}
          alt={title ?? 'Thumbnail do vídeo'}
          fill
          className="object-cover"
          sizes="(max-width: 768px) 100vw, 672px"
          unoptimized={!thumbnailUrl} // YouTube CDN images — no need to re-optimize
          onError={() => setThumbFailed(true)}
        />
      )}
      <div className="absolute inset-0 bg-black/30 group-hover:bg-black/40 transition-colors flex items-center justify-center">
        <div className="bg-red-600 rounded-full p-4 group-hover:scale-110 transition-transform">
          <Play className="w-8 h-8 text-white fill-white" />
        </div>
      </div>
    </button>
  )
}
