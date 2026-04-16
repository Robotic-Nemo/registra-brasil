'use client'

import { useRef, useCallback, useEffect } from 'react'

interface InfiniteScrollProps {
  children: React.ReactNode
  hasMore: boolean
  loading: boolean
  onLoadMore: () => void
  threshold?: number
  loader?: React.ReactNode
  endMessage?: React.ReactNode
  className?: string
}

export function InfiniteScroll({
  children,
  hasMore,
  loading,
  onLoadMore,
  threshold = 200,
  loader = <p className="text-center py-4 text-zinc-500 text-sm">Carregando...</p>,
  endMessage,
  className = '',
}: InfiniteScrollProps) {
  const observerRef = useRef<HTMLDivElement>(null)

  const handleObserver = useCallback(
    (entries: IntersectionObserverEntry[]) => {
      const [entry] = entries
      if (entry.isIntersecting && hasMore && !loading) {
        onLoadMore()
      }
    },
    [hasMore, loading, onLoadMore]
  )

  useEffect(() => {
    const el = observerRef.current
    if (!el) return

    const observer = new IntersectionObserver(handleObserver, {
      rootMargin: `${threshold}px`,
    })

    observer.observe(el)
    return () => observer.disconnect()
  }, [handleObserver, threshold])

  return (
    <div className={className}>
      {children}
      {loading && loader}
      {!hasMore && endMessage}
      <div ref={observerRef} className="h-1" aria-hidden="true" />
    </div>
  )
}
