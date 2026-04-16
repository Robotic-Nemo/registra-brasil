'use client'

interface MarqueeProps {
  children: React.ReactNode
  speed?: number
  pauseOnHover?: boolean
  className?: string
}

export function Marquee({
  children,
  speed = 30,
  pauseOnHover = true,
  className = '',
}: MarqueeProps) {
  return (
    <div
      className={`overflow-hidden ${className}`}
      style={{ maskImage: 'linear-gradient(to right, transparent, black 10%, black 90%, transparent)' }}
    >
      <div
        className={`flex gap-8 whitespace-nowrap animate-[marquee_var(--duration)_linear_infinite] ${
          pauseOnHover ? 'hover:[animation-play-state:paused]' : ''
        }`}
        style={{ '--duration': `${speed}s` } as React.CSSProperties}
      >
        {children}
        {/* Duplicate for seamless loop */}
        {children}
      </div>
      <style>{`
        @keyframes marquee {
          0% { transform: translateX(0); }
          100% { transform: translateX(-50%); }
        }
      `}</style>
    </div>
  )
}
