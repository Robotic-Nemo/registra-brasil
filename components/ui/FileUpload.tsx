'use client'

import { useState, useRef } from 'react'

interface FileUploadProps {
  accept?: string
  maxSizeMB?: number
  onFile: (file: File) => void
  label?: string
  className?: string
}

export function FileUpload({
  accept = '.csv,.json',
  maxSizeMB = 10,
  onFile,
  label = 'Selecionar arquivo',
  className = '',
}: FileUploadProps) {
  const [dragActive, setDragActive] = useState(false)
  const [error, setError] = useState('')
  const [fileName, setFileName] = useState('')
  const inputRef = useRef<HTMLInputElement>(null)

  const maxSize = maxSizeMB * 1024 * 1024

  const handleFile = (file: File) => {
    setError('')
    if (file.size > maxSize) {
      setError(`Arquivo muito grande (máx: ${maxSizeMB}MB)`)
      return
    }
    setFileName(file.name)
    onFile(file)
  }

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault()
    setDragActive(false)
    if (e.dataTransfer.files[0]) {
      handleFile(e.dataTransfer.files[0])
    }
  }

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files?.[0]) {
      handleFile(e.target.files[0])
    }
  }

  return (
    <div className={className}>
      <div
        className={`border-2 border-dashed rounded-lg p-6 text-center transition-colors cursor-pointer ${
          dragActive ? 'border-blue-500 bg-blue-50' : 'border-zinc-300 hover:border-zinc-400'
        }`}
        onDragOver={(e) => { e.preventDefault(); setDragActive(true) }}
        onDragLeave={() => setDragActive(false)}
        onDrop={handleDrop}
        onClick={() => inputRef.current?.click()}
        role="button"
        tabIndex={0}
        onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') inputRef.current?.click() }}
        aria-label={label}
      >
        <input
          ref={inputRef}
          type="file"
          accept={accept}
          onChange={handleChange}
          className="hidden"
          aria-hidden="true"
        />
        <div className="text-4xl mb-2">📁</div>
        <p className="text-sm text-zinc-600">
          {fileName ? (
            <span className="font-medium text-zinc-800">{fileName}</span>
          ) : (
            <>Arraste um arquivo ou <span className="text-blue-600 font-medium">clique para selecionar</span></>
          )}
        </p>
        <p className="text-xs text-zinc-400 mt-1">
          {accept} · máx. {maxSizeMB}MB
        </p>
      </div>
      {error && <p className="text-sm text-red-600 mt-1">{error}</p>}
    </div>
  )
}
