import Image from 'next/image'
import type { Politician } from '@/types/database'
import { MapPin, ExternalLink, Building2, Rss } from 'lucide-react'

interface PoliticianHeaderProps {
  politician: Politician
  statementCount: number
}

export function PoliticianHeader({ politician, statementCount }: PoliticianHeaderProps) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl p-6 flex flex-col sm:flex-row gap-4">
      {politician.photo_url ? (
        <figure className="flex flex-col items-center flex-shrink-0">
          <Image
            src={politician.photo_url}
            alt={politician.common_name}
            width={80}
            height={80}
            sizes="80px"
            className="w-20 h-20 rounded-full object-cover border-2 border-gray-200"
            priority
            fetchPriority="high"
            unoptimized
          />
          {politician.photo_source_url && (
            <figcaption className="text-[10px] text-gray-500 mt-1">
              Foto:{' '}
              <a
                href={politician.photo_source_url}
                target="_blank"
                rel="noopener noreferrer"
                className="underline hover:text-gray-700"
              >
                {politician.photo_license === 'wikimedia' ? 'Wikipedia' : 'fonte'}
              </a>
            </figcaption>
          )}
        </figure>
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
          <a
            href={`/politico/${politician.slug}/feed.xml`}
            rel="alternate"
            type="application/rss+xml"
            className="inline-flex items-center gap-1 text-xs text-orange-600 hover:underline"
            aria-label={`Feed RSS de ${politician.common_name}`}
          >
            <Rss className="w-3 h-3" />
            RSS
          </a>
          <a
            href={`/politico/${politician.slug}/dossie`}
            className="inline-flex items-center gap-1 text-xs text-gray-700 hover:underline"
            aria-label={`Dossiê imprimível de ${politician.common_name}`}
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true"><path d="M6 9V2h12v7"/><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"/><path d="M6 14h12v8H6z"/></svg>
            Dossiê
          </a>
        </div>
      </div>

      <div className="flex-shrink-0 text-center">
        <p className="text-3xl font-bold text-red-600 tabular-nums">{statementCount}</p>
        <p className="text-xs text-gray-500">declaração{statementCount !== 1 ? 'ões' : ''} registrada{statementCount !== 1 ? 's' : ''}</p>
      </div>
    </div>
  )
}
