'use client'

import { useEffect, useRef, useState } from 'react'
import { Volume2, VolumeX, Pause, Play } from 'lucide-react'

interface Props {
  text: string
  lang?: string
}

/**
 * Accessibility/convenience control that reads a statement aloud using
 * the browser's native SpeechSynthesis API. No network calls — the
 * synthesis voice comes from the OS. Falls back to hidden if the
 * browser doesn't support SpeechSynthesis.
 */
export function ReadAloudButton({ text, lang = 'pt-BR' }: Props) {
  const [supported, setSupported] = useState<boolean | null>(null)
  const [state, setState] = useState<'idle' | 'playing' | 'paused'>('idle')
  const utterRef = useRef<SpeechSynthesisUtterance | null>(null)

  useEffect(() => {
    setSupported(typeof window !== 'undefined' && 'speechSynthesis' in window)
    return () => {
      if (typeof window !== 'undefined') window.speechSynthesis.cancel()
    }
  }, [])

  if (supported === false) return null

  function start() {
    if (!supported) return
    window.speechSynthesis.cancel()
    const u = new SpeechSynthesisUtterance(text)
    u.lang = lang
    u.rate = 1
    u.pitch = 1
    u.onend = () => setState('idle')
    u.onerror = () => setState('idle')
    utterRef.current = u
    window.speechSynthesis.speak(u)
    setState('playing')
  }

  function toggle() {
    if (!supported) return
    if (state === 'idle') return start()
    if (state === 'playing') {
      window.speechSynthesis.pause()
      setState('paused')
      return
    }
    window.speechSynthesis.resume()
    setState('playing')
  }

  function stop() {
    if (!supported) return
    window.speechSynthesis.cancel()
    setState('idle')
  }

  const label =
    state === 'idle' ? 'Ouvir em voz alta' :
    state === 'playing' ? 'Pausar narração' : 'Retomar narração'

  return (
    <div className="inline-flex items-center gap-1 text-xs">
      <button
        type="button"
        onClick={toggle}
        className="inline-flex items-center gap-1 rounded-full border border-gray-300 bg-white px-2.5 py-1 text-gray-700 hover:border-indigo-400 hover:text-indigo-700 focus:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 dark:hover:border-indigo-500"
        aria-label={label}
      >
        {state === 'idle' && <Volume2 className="h-3 w-3" aria-hidden />}
        {state === 'playing' && <Pause className="h-3 w-3" aria-hidden />}
        {state === 'paused' && <Play className="h-3 w-3" aria-hidden />}
        {state === 'idle' ? 'Ouvir' : state === 'playing' ? 'Pausar' : 'Retomar'}
      </button>
      {state !== 'idle' && (
        <button
          type="button"
          onClick={stop}
          aria-label="Parar narração"
          className="inline-flex items-center gap-1 rounded-full border border-gray-300 bg-white px-2 py-1 text-gray-600 hover:border-rose-300 hover:text-rose-700 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-400"
        >
          <VolumeX className="h-3 w-3" aria-hidden />
        </button>
      )}
    </div>
  )
}
