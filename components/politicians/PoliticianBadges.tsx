import type { Badge } from '@/lib/politicians/badges'
import { TONE_CLASS } from '@/lib/politicians/badges'

export function PoliticianBadges({ badges }: { badges: Badge[] }) {
  if (badges.length === 0) return null
  return (
    <section aria-label="Distintivos do arquivo" className="mt-3 flex flex-wrap gap-1.5">
      {badges.map((b) => (
        <span
          key={b.id}
          title={b.title}
          className={`inline-flex items-center rounded-full border px-2 py-0.5 text-[11px] font-medium ${TONE_CLASS[b.tone]}`}
        >
          {b.label}
        </span>
      ))}
    </section>
  )
}
