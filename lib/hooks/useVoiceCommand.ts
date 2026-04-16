'use client'

import { useState, useCallback, useRef, useEffect } from 'react'

interface UseVoiceCommandOptions {
  language?: string
  onResult?: (transcript: string) => void
  onError?: (error: string) => void
}

interface SpeechRecognitionEvent {
  results: { [index: number]: { [index: number]: { transcript: string } } }
}

interface SpeechRecognitionErrorEvent {
  error: string
}

interface SpeechRecognitionInstance {
  continuous: boolean
  interimResults: boolean
  lang: string
  start: () => void
  stop: () => void
  abort: () => void
  onresult: ((e: SpeechRecognitionEvent) => void) | null
  onerror: ((e: SpeechRecognitionErrorEvent) => void) | null
  onend: (() => void) | null
}

/**
 * Experimental voice command hook using Web Speech API.
 */
export function useVoiceCommand(options: UseVoiceCommandOptions = {}) {
  const { language = 'pt-BR', onResult, onError } = options
  const [listening, setListening] = useState(false)
  const [transcript, setTranscript] = useState('')
  const [supported, setSupported] = useState(false)
  const recognitionRef = useRef<SpeechRecognitionInstance | null>(null)

  useEffect(() => {
    const win = window as unknown as { SpeechRecognition?: new () => SpeechRecognitionInstance; webkitSpeechRecognition?: new () => SpeechRecognitionInstance }
    const SpeechRecognition = win.SpeechRecognition || win.webkitSpeechRecognition
    setSupported(!!SpeechRecognition)

    if (SpeechRecognition) {
      const recognition = new SpeechRecognition()
      recognition.continuous = false
      recognition.interimResults = false
      recognition.lang = language
      recognitionRef.current = recognition
    }

    return () => {
      recognitionRef.current?.abort()
    }
  }, [language])

  const startListening = useCallback(() => {
    const recognition = recognitionRef.current
    if (!recognition) return

    recognition.onresult = (e: SpeechRecognitionEvent) => {
      const text = e.results[0][0].transcript
      setTranscript(text)
      onResult?.(text)
    }

    recognition.onerror = (e: SpeechRecognitionErrorEvent) => {
      setListening(false)
      onError?.(e.error)
    }

    recognition.onend = () => {
      setListening(false)
    }

    try {
      recognition.start()
      setListening(true)
    } catch {
      // Already started or not available
    }
  }, [onResult, onError])

  const stopListening = useCallback(() => {
    recognitionRef.current?.stop()
    setListening(false)
  }, [])

  return { listening, transcript, supported, startListening, stopListening }
}
