'use client'

import { useState, useRef, useEffect } from 'react'

interface ProgressiveImageProps {
  /** The full-resolution image source. */
  src: string
  /** A low-quality placeholder image (tiny, blurred). */
  placeholderSrc?: string
  /** Alt text for the image. */
  alt: string
  /** Width in pixels. */
  width?: number
  /** Height in pixels. */
  height?: number
  /** Additional CSS class names. */
  className?: string
  /** CSS object-fit value. Defaults to 'cover'. */
  objectFit?: 'cover' | 'contain' | 'fill' | 'none'
  /** Blur amount in pixels for the placeholder. Defaults to 20. */
  blurAmount?: number
  /** Transition duration in ms. Defaults to 500. */
  transitionDuration?: number
}

/**
 * Image component with a blur-up progressive loading effect.
 * Shows a blurred low-quality placeholder (LQIP) while the full
 * image loads, then transitions smoothly to the sharp version.
 */
export function ProgressiveImage({
  src,
  placeholderSrc,
  alt,
  width,
  height,
  className = '',
  objectFit = 'cover',
  blurAmount = 20,
  transitionDuration = 500,
}: ProgressiveImageProps) {
  const [loaded, setLoaded] = useState(false)
  const [inView, setInView] = useState(false)
  const containerRef = useRef<HTMLDivElement>(null)

  // Intersection observer for lazy loading
  useEffect(() => {
    const el = containerRef.current
    if (!el) return

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setInView(true)
          observer.disconnect()
        }
      },
      { rootMargin: '200px' }
    )

    observer.observe(el)
    return () => observer.disconnect()
  }, [])

  // Preload full image once in view
  useEffect(() => {
    if (!inView) return

    const img = new Image()
    img.onload = () => setLoaded(true)
    img.src = src
  }, [inView, src])

  const containerStyle: React.CSSProperties = {
    position: 'relative',
    overflow: 'hidden',
    ...(width ? { width } : {}),
    ...(height ? { height } : {}),
  }

  const placeholderStyle: React.CSSProperties = {
    position: 'absolute',
    inset: 0,
    width: '100%',
    height: '100%',
    objectFit,
    filter: `blur(${blurAmount}px)`,
    transform: 'scale(1.1)', // Prevent blur edges from showing
    transition: `opacity ${transitionDuration}ms ease-in-out`,
    opacity: loaded ? 0 : 1,
  }

  const imageStyle: React.CSSProperties = {
    width: '100%',
    height: '100%',
    objectFit,
    transition: `opacity ${transitionDuration}ms ease-in-out`,
    opacity: loaded ? 1 : 0,
  }

  // Fallback placeholder: a gray background
  const fallbackBg: React.CSSProperties = {
    position: 'absolute',
    inset: 0,
    backgroundColor: '#e5e7eb',
    transition: `opacity ${transitionDuration}ms ease-in-out`,
    opacity: loaded ? 0 : 1,
  }

  return (
    <div ref={containerRef} className={className} style={containerStyle}>
      {/* Placeholder layer */}
      {placeholderSrc ? (
        <img
          src={placeholderSrc}
          alt=""
          aria-hidden="true"
          style={placeholderStyle}
        />
      ) : (
        <div style={fallbackBg} aria-hidden="true" />
      )}

      {/* Full image */}
      {inView && (
        <img
          src={src}
          alt={alt}
          width={width}
          height={height}
          style={imageStyle}
          loading="lazy"
          decoding="async"
        />
      )}
    </div>
  )
}
