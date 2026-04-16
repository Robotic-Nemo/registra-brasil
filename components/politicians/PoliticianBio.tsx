import type { Politician } from '@/types/database'
import { ExternalLink, Clock, Users } from 'lucide-react'
import { getPartyColor } from '@/lib/constants/party-colors'

interface PoliticianBioProps {
  politician: Politician
}

function formatDate(dateStr: string): string {
  const d = new Date(dateStr + 'T00:00:00')
  return d.toLocaleDateString('pt-BR', { month: 'short', year: 'numeric' })
}

export function PoliticianBio({ politician }: PoliticianBioProps) {
  const externalLinks: { label: string; url: string }[] = []

  if (politician.wikipedia_url) {
    externalLinks.push({ label: 'Wikipedia', url: politician.wikipedia_url })
  }
  if (politician.tse_id) {
    externalLinks.push({
      label: 'TSE',
      url: `https://divulgacandcontas.tse.jus.br/divulga/#/candidato/${politician.tse_id}`,
    })
  }
  if (politician.camara_id) {
    externalLinks.push({
      label: 'Câmara dos Deputados',
      url: `https://www.camara.leg.br/deputados/${politician.camara_id}`,
    })
  }
  if (politician.senado_id) {
    externalLinks.push({
      label: 'Senado Federal',
      url: `https://www25.senado.leg.br/web/senadores/senador/-/${politician.senado_id}`,
    })
  }

  const hasPartyHistory = politician.party_history && politician.party_history.length > 0
  const hasRoleHistory = politician.role_history && politician.role_history.length > 0
  const hasContent = hasPartyHistory || hasRoleHistory || externalLinks.length > 0

  if (!hasContent) return null

  return (
    <section className="bg-white border border-gray-200 rounded-xl p-6 space-y-6">
      <h2 className="text-lg font-semibold text-gray-900">Biografia</h2>

      {/* Party History Timeline */}
      {hasPartyHistory && (
        <div>
          <h3 className="flex items-center gap-2 text-sm font-medium text-gray-700 mb-3">
            <Users className="w-4 h-4" />
            Historico partidario
          </h3>
          <div className="relative pl-4 border-l-2 border-gray-200 space-y-3">
            {politician.party_history.map((entry, i) => (
              <div key={`${entry.party}-${entry.from}-${i}`} className="relative">
                <span
                  className="absolute -left-[calc(0.5rem+1px)] top-1 w-3 h-3 rounded-full border-2 border-white"
                  style={{ backgroundColor: getPartyColor(entry.party) }}
                />
                <div className="ml-2">
                  <span className="font-medium text-gray-900" translate="no">
                    {entry.party}
                  </span>
                  <span className="text-sm text-gray-500 ml-2">
                    {formatDate(entry.from)}
                    {entry.to ? ` — ${formatDate(entry.to)}` : ' — atual'}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Role History Timeline */}
      {hasRoleHistory && (
        <div>
          <h3 className="flex items-center gap-2 text-sm font-medium text-gray-700 mb-3">
            <Clock className="w-4 h-4" />
            Cargos
          </h3>
          <div className="relative pl-4 border-l-2 border-gray-200 space-y-3">
            {politician.role_history.map((entry, i) => (
              <div key={`${entry.role}-${entry.from}-${i}`} className="relative">
                <span className="absolute -left-[calc(0.5rem+1px)] top-1 w-3 h-3 rounded-full border-2 border-white bg-blue-500" />
                <div className="ml-2">
                  <span className="font-medium text-gray-900">{entry.role}</span>
                  <span className="text-sm text-gray-500 ml-2">
                    {formatDate(entry.from)}
                    {entry.to ? ` — ${formatDate(entry.to)}` : ' — atual'}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* External Links */}
      {externalLinks.length > 0 && (
        <div>
          <h3 className="text-sm font-medium text-gray-700 mb-2">Links externos</h3>
          <div className="flex flex-wrap gap-2">
            {externalLinks.map((link) => (
              <a
                key={link.label}
                href={link.url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-1.5 text-sm text-blue-600 hover:text-blue-800 bg-blue-50 px-3 py-1.5 rounded-lg transition-colors"
              >
                <ExternalLink className="w-3.5 h-3.5" />
                {link.label}
              </a>
            ))}
          </div>
        </div>
      )}
    </section>
  )
}
