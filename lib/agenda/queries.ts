import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface PoliticalEvent {
  id: string
  title: string
  summary: string
  body: string | null
  event_date: string
  event_end_date: string | null
  location: string | null
  source_url: string | null
  kind: string
  politician_id: string | null
  is_published: boolean
  created_at: string
  updated_at: string
  politician?: { slug: string; common_name: string } | null
}

const EMBED = `*, politicians:politician_id ( slug, common_name )`

type Raw = Omit<PoliticalEvent, 'politician'> & {
  politicians?: { slug: string; common_name: string } | null
}

function shape(r: Raw): PoliticalEvent {
  return { ...r, politician: r.politicians ?? null }
}

export async function listEvents(
  scope: 'upcoming' | 'past' | 'all' = 'upcoming',
  limit = 80,
): Promise<PoliticalEvent[]> {
  const supabase = getSupabaseServiceClient()
  const now = new Date().toISOString()
  let q = (supabase.from('political_events') as any).select(EMBED).eq('is_published', true)
  if (scope === 'upcoming') q = q.gte('event_date', now).order('event_date', { ascending: true })
  else if (scope === 'past') q = q.lt('event_date', now).order('event_date', { ascending: false })
  else q = q.order('event_date', { ascending: false })
  const { data, error } = await q.limit(limit)
  if (error) throw error
  return ((data ?? []) as Raw[]).map(shape)
}

export const EVENT_KINDS: Array<{ id: string; label: string }> = [
  { id: 'votacao', label: 'Votação' },
  { id: 'cpi', label: 'CPI' },
  { id: 'debate', label: 'Debate' },
  { id: 'discurso', label: 'Discurso' },
  { id: 'decreto', label: 'Decreto' },
  { id: 'audiencia', label: 'Audiência' },
  { id: 'reuniao', label: 'Reunião' },
  { id: 'comissao', label: 'Comissão' },
  { id: 'agenda_oficial', label: 'Agenda oficial' },
  { id: 'other', label: 'Outro' },
]

export function kindLabel(id: string): string {
  return EVENT_KINDS.find((k) => k.id === id)?.label ?? id
}
