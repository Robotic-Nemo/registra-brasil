'use client'

import { useEffect } from 'react'

/**
 * Dynamically updates the document title on the client side.
 * Restores the previous title on unmount.
 */
export function useDocumentTitle(title: string) {
  useEffect(() => {
    const previous = document.title
    document.title = title
    return () => { document.title = previous }
  }, [title])
}
