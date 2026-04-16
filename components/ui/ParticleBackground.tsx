'use client'

import { useEffect, useRef } from 'react'

interface ParticleBackgroundProps {
  /** Number of particles */
  count?: number
  /** Particle color */
  color?: string
  /** Max particle size in pixels */
  maxSize?: number
  /** Base speed multiplier */
  speed?: number
  className?: string
}

interface Particle {
  x: number
  y: number
  size: number
  vx: number
  vy: number
  opacity: number
}

/**
 * Subtle animated particle background. Renders on a canvas element.
 * Uses requestAnimationFrame for smooth animation.
 */
export function ParticleBackground({
  count = 30,
  color = '59, 130, 246',
  maxSize = 3,
  speed = 0.3,
  className = '',
}: ParticleBackgroundProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    const canvas = canvasRef.current
    if (!canvas) return

    const ctx = canvas.getContext('2d')
    if (!ctx) return

    let animationId: number
    let particles: Particle[] = []

    function resize() {
      if (!canvas) return
      canvas.width = canvas.offsetWidth * window.devicePixelRatio
      canvas.height = canvas.offsetHeight * window.devicePixelRatio
      if (!ctx) return
      ctx.scale(window.devicePixelRatio, window.devicePixelRatio)
    }

    function createParticles() {
      if (!canvas) return
      const w = canvas.offsetWidth
      const h = canvas.offsetHeight
      particles = Array.from({ length: count }, () => ({
        x: Math.random() * w,
        y: Math.random() * h,
        size: Math.random() * maxSize + 1,
        vx: (Math.random() - 0.5) * speed,
        vy: (Math.random() - 0.5) * speed,
        opacity: Math.random() * 0.5 + 0.1,
      }))
    }

    function animate() {
      if (!canvas || !ctx) return
      const w = canvas.offsetWidth
      const h = canvas.offsetHeight

      ctx.clearRect(0, 0, w, h)

      for (const p of particles) {
        p.x += p.vx
        p.y += p.vy

        // Wrap around
        if (p.x < 0) p.x = w
        if (p.x > w) p.x = 0
        if (p.y < 0) p.y = h
        if (p.y > h) p.y = 0

        ctx.beginPath()
        ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2)
        ctx.fillStyle = `rgba(${color}, ${p.opacity})`
        ctx.fill()
      }

      animationId = requestAnimationFrame(animate)
    }

    resize()
    createParticles()
    animate()

    window.addEventListener('resize', resize)

    return () => {
      cancelAnimationFrame(animationId)
      window.removeEventListener('resize', resize)
    }
  }, [count, color, maxSize, speed])

  return (
    <canvas
      ref={canvasRef}
      className={`pointer-events-none ${className}`}
      aria-hidden="true"
    />
  )
}
