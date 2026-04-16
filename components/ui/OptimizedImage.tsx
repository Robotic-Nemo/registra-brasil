'use client'

import { useState } from 'react'
import Image, { type ImageProps } from 'next/image'

interface OptimizedImageProps extends Omit<ImageProps, 'onLoad' | 'onError'> {
  fallbackSrc?: string
}

/**
 * Image wrapper with blur-up placeholder and error fallback.
 */
export function OptimizedImage({ fallbackSrc, className = '', alt, ...props }: OptimizedImageProps) {
  const [loaded, setLoaded] = useState(false)
  const [error, setError] = useState(false)

  const src = error && fallbackSrc ? fallbackSrc : props.src

  return (
    <div className={`relative overflow-hidden ${className}`}>
      {!loaded && (
        <div className="absolute inset-0 bg-gray-200 dark:bg-gray-700 animate-pulse" aria-hidden="true" />
      )}
      <Image
        {...props}
        src={src}
        alt={alt}
        className={`transition-opacity duration-300 ${loaded ? 'opacity-100' : 'opacity-0'}`}
        loading="lazy"
        onLoad={() => setLoaded(true)}
        onError={() => setError(true)}
      />
    </div>
  )
}
