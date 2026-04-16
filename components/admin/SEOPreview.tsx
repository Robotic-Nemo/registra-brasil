'use client'

import { Search } from 'lucide-react'

interface SEOPreviewProps {
  title: string
  description: string
  url: string
  type?: 'statement' | 'politician'
}

export function SEOPreview({ title, description, url, type = 'statement' }: SEOPreviewProps) {
  const truncatedTitle = title.length > 60 ? title.slice(0, 57) + '...' : title
  const truncatedDesc = description.length > 155 ? description.slice(0, 152) + '...' : description

  return (
    <div className="bg-white border border-gray-200 rounded-xl p-5">
      <div className="flex items-center gap-2 mb-3">
        <Search className="w-4 h-4 text-gray-500" />
        <h3 className="text-sm font-semibold text-gray-700">Preview de busca</h3>
        <span className="text-[10px] text-gray-400 bg-gray-100 px-1.5 py-0.5 rounded">
          {type === 'statement' ? 'Declaracao' : 'Politico'}
        </span>
      </div>

      {/* Google-like preview */}
      <div className="bg-white rounded-lg p-4 border border-gray-100">
        <div className="mb-1">
          <p className="text-xs text-green-700 font-mono truncate">{url}</p>
        </div>
        <h4 className="text-lg text-blue-800 hover:underline cursor-pointer mb-1 line-clamp-1">
          {truncatedTitle}
        </h4>
        <p className="text-sm text-gray-600 line-clamp-2">{truncatedDesc}</p>
      </div>

      {/* Character counts */}
      <div className="flex gap-4 mt-3 text-[10px] text-gray-400">
        <span className={title.length > 60 ? 'text-yellow-600' : ''}>
          Titulo: {title.length}/60 caracteres
        </span>
        <span className={description.length > 155 ? 'text-yellow-600' : ''}>
          Descricao: {description.length}/155 caracteres
        </span>
      </div>

      {/* Social media card preview */}
      <div className="mt-4">
        <p className="text-xs font-medium text-gray-500 mb-2">Card social (Twitter/Facebook)</p>
        <div className="border border-gray-200 rounded-lg overflow-hidden max-w-sm">
          <div className="h-24 bg-gradient-to-r from-blue-100 to-blue-50 flex items-center justify-center">
            <span className="text-2xl font-bold text-blue-300">RB</span>
          </div>
          <div className="p-3">
            <p className="text-[10px] text-gray-500 uppercase">{new URL(url).hostname}</p>
            <p className="text-sm font-semibold text-gray-900 line-clamp-1">{truncatedTitle}</p>
            <p className="text-xs text-gray-500 line-clamp-2">{truncatedDesc}</p>
          </div>
        </div>
      </div>
    </div>
  )
}
