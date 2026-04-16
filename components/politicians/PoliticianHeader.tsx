import Image from 'next/image'
import type { Politician } from '@/types/database'
import { MapPin, ExternalLink, Building2 } from 'lucide-react'

interface PoliticianHeaderProps {
  politician: Politician
  statementCount: number
}

export function PoliticianHeader({ politician, statementCount }: PoliticianHeaderProps) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row gap-4">
      {politician.photo_url ? (
        <Image
          src={politician.photo_url}
          alt={politician.common_name}
          width={80}
          height={80}
          sizes="80px"
          className="w-20 h-20 rounded-full object-cover border-2 border-gray-200 flex-shrink-0"
          priority
          fetchPriority="high"
        />
      ) : (
        <div className="w-20 h-20 rounded-full bg-gray-200 flex items-center justify-center text-2xl font-bold text-gray-500 flex-shrink-0">
          {politician.common_name?.[0] ?? '?'}
        </div>
      )}

      <div className="flex-1">
        <h1 className="text-2xl font-bold text-gray-900">{politician.common_name}</h1>
        <p className="text-gray-500 text-sm">{politician.full_name}</p>

        <div className="flex flex-wrap items-center gap-3 mt-2 text-sm text-gray-600">
          <span className="bg-gray-100 px-2 py-1 rounded font-mono font-semibold">{politician.party}</span>
          {politician.state && (
            <span className="flex items-center gap-1">
              <MapPin className="w-3.5 h-3.5" />
              {politician.state}
            </span>
          )}
          {politician.role && (
            <span className="flex items-center gap-1">
              <Building2 className="w-3.5 h-3.5" />
              {politician.role}
            </span>
          )}
        </div>

        <div className="flex flex-wrap gap-2 mt-3">
          {politician.camara_id && (
            <a
              href={`https://www.camara.leg.br/deputados/${politician.camara_id}`}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline"
            >
              <ExternalLink className="w-3 h-3" />
              Câmara dos Deputados
            </a>
          )}
          {politician.senado_id && (
            <a
              href={`https://www25.senado.leg.br/web/senadores/senador/-/perfil/${politician.senado_id}`}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline"
            >
              <ExternalLink className="w-3 h-3" />
              Senado Federal
            </a>
          )}
          {politician.wikipedia_url && (
            <a
              href={politician.wikipedia_url}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-1 text-xs text-blue-600 hover:underline"
            >
              <ExternalLink className="w-3 h-3" />
              Wikipedia
            </a>
          )}
        </div>
      </div>

      <div className="flex-shrink-0 text-center">
        <p className="text-3xl font-bold text-red-600 tabular-nums">{statementCount}</p>
        <p className="text-xs text-gray-500">declaração{statementCount !== 1 ? 'ões' : ''} registrada{statementCount !== 1 ? 's' : ''}</p>
      </div>
    </div>
  )
}
