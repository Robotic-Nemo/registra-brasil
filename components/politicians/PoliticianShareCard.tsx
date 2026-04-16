import type { Politician } from '@/types/database'
import type { PoliticianFullStats } from '@/lib/supabase/queries/politician-stats'
import { getPartyColor } from '@/lib/constants/party-colors'

interface PoliticianShareCardProps {
  politician: Pick<Politician, 'common_name' | 'full_name' | 'party' | 'state' | 'role'>
  stats: PoliticianFullStats
}

/**
 * A shareable stats card designed for social media screenshots.
 * Renders a summary of the politician's stats in a visually appealing format.
 */
export function PoliticianShareCard({ politician, stats }: PoliticianShareCardProps) {
  const partyColor = getPartyColor(politician.party)

  return (
    <div
      className="w-full max-w-lg mx-auto bg-white border border-gray-200 rounded-2xl overflow-hidden shadow-lg"
      data-testid="politician-share-card"
    >
      {/* Header bar with party color */}
      <div className="h-2" style={{ backgroundColor: partyColor }} />

      <div className="p-6">
        {/* Name and info */}
        <div className="mb-4">
          <h3 className="text-xl font-bold text-gray-900" translate="no">
            {politician.common_name}
          </h3>
          <p className="text-sm text-gray-500">
            {politician.party}
            {politician.state ? ` - ${politician.state}` : ''}
            {politician.role ? ` | ${politician.role}` : ''}
          </p>
        </div>

        {/* Stats grid */}
        <div className="grid grid-cols-2 gap-4">
          <StatBox label="Declaracoes" value={stats.totalStatements} />
          <StatBox label="Verificadas" value={stats.verifiedCount} />
          <StatBox label="Contestadas" value={stats.disputedCount} />
          {stats.mostCommonCategory && (
            <div className="bg-gray-50 rounded-lg p-3">
              <p className="text-xs text-gray-500 mb-1">Categoria principal</p>
              <div className="flex items-center gap-1.5">
                <span
                  className="w-2.5 h-2.5 rounded-full flex-shrink-0"
                  style={{ backgroundColor: stats.mostCommonCategory.color_hex }}
                />
                <p className="text-sm font-semibold text-gray-900 truncate">
                  {stats.mostCommonCategory.label_pt}
                </p>
              </div>
            </div>
          )}
        </div>

        {/* Date range */}
        {stats.dateRange && (
          <p className="text-xs text-gray-400 mt-4 text-center">
            Periodo: {new Date(stats.dateRange.earliest + 'T00:00:00').toLocaleDateString('pt-BR')} -{' '}
            {new Date(stats.dateRange.latest + 'T00:00:00').toLocaleDateString('pt-BR')}
          </p>
        )}

        {/* Branding */}
        <p className="text-xs text-gray-300 mt-3 text-center">registrabrasil.com.br</p>
      </div>
    </div>
  )
}

function StatBox({ label, value }: { label: string; value: number }) {
  return (
    <div className="bg-gray-50 rounded-lg p-3">
      <p className="text-xs text-gray-500 mb-1">{label}</p>
      <p className="text-2xl font-bold text-gray-900 tabular-nums">{value}</p>
    </div>
  )
}
