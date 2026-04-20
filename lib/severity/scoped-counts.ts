import { SEVERITIES, type SeverityDef } from './labels'

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export interface SeverityBucket {
  level: SeverityDef['level']
  label: string
  short: string
  description: string
  count: number
  url: string
}

/**
 * Run the 5 per-severity head-counts in parallel against a PostgREST
 * query-factory. Returns the canonical bucket shape used by
 * /api/severidade.json + scoped (party/UF/category) variants.
 *
 * The factory receives the severity level and must return a PostgREST
 * builder already scoped to `statements` with `head: true` selected —
 * e.g. `(sb.from('statements') as any).select('id',{count:'exact',head:true}).eq('severity_score', level)`.
 */
export async function countBySeverity(
  make: (level: SeverityDef['level']) => Promise<{ count: number | null }>,
): Promise<{ buckets: SeverityBucket[]; total: number }> {
  const buckets = await Promise.all(
    SEVERITIES.map(async (def) => {
      const { count } = await make(def.level)
      return {
        level: def.level,
        label: def.label,
        short: def.short,
        description: def.description,
        count: Number(count ?? 0),
        url: `${SITE_URL}/severidade/${def.level}`,
      }
    }),
  )
  const total = buckets.reduce((a, b) => a + b.count, 0)
  return { buckets, total }
}
