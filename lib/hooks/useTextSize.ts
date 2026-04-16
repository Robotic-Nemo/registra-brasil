'use client'

import { useCallback } from 'react'
import { useLocalStorage } from './useLocalStorage'

export type TextSizeLevel = 'small' | 'normal' | 'large' | 'xlarge'

const SIZE_MAP: Record<TextSizeLevel, string> = {
  small: '14px',
  normal: '16px',
  large: '18px',
  xlarge: '20px',
}

const LEVELS: TextSizeLevel[] = ['small', 'normal', 'large', 'xlarge']
const STORAGE_KEY = 'registra-brasil:text-size'

export function useTextSize() {
  const [size, setSize] = useLocalStorage<TextSizeLevel>(STORAGE_KEY, 'normal')

  const increase = useCallback(() => {
    const idx = LEVELS.indexOf(size)
    if (idx < LEVELS.length - 1) setSize(LEVELS[idx + 1])
  }, [size, setSize])

  const decrease = useCallback(() => {
    const idx = LEVELS.indexOf(size)
    if (idx > 0) setSize(LEVELS[idx - 1])
  }, [size, setSize])

  const reset = useCallback(() => {
    setSize('normal')
  }, [setSize])

  const fontSize = SIZE_MAP[size] || '16px'

  return { size, fontSize, increase, decrease, reset, setSize }
}
