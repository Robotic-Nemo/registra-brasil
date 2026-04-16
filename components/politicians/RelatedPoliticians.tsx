import { PoliticianCard } from './PoliticianCard'
import type { Politician } from '@/types/database'
import { Users } from 'lucide-react'

interface RelatedPoliticiansProps {
  politicians: Pick<Politician, 'slug' | 'common_name' | 'full_name' | 'party' | 'state' | 'photo_url'>[]
  label?: string
}

export function RelatedPoliticians({ politicians, label = 'Políticos do mesmo partido' }: RelatedPoliticiansProps) {
  if (politicians.length === 0) return null

  return (
    <section>
      <h2 className="font-semibold text-gray-900 mb-3 flex items-center gap-2 text-sm">
        <Users className="w-4 h-4 text-gray-400" />
        {label}
      </h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
        {politicians.map((p) => (
          <PoliticianCard key={p.slug} politician={p} />
        ))}
      </div>
    </section>
  )
}
