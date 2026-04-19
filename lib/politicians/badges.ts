import { getSupabaseServiceClient } from '@/lib/supabase/server'

export interface Badge {
  id: string
  label: string
  tone: 'neutral' | 'good' | 'warn' | 'hot' | 'info'
  title: string
}

interface Input {
  politicianId: string
  partyHistory: Array<{ party?: string; from?: string; to?: string }> | null
  roleHistory: Array<{ role?: string; from?: string; to?: string }> | null
}

/**
 * Derives a small set of human-readable badges from the politician's
 * statement archive. Strictly computed — no hand-curated labels, so new
 * badges appear naturally as the archive evolves.
 */
export async function computeBadges(input: Input): Promise<Badge[]> {
  const supabase = getSupabaseServiceClient()
  const { data: rows } = await (supabase.from('statements') as any)
    .select('id, statement_date, verification_status, severity_score, primary_source_url, primary_source_type, youtube_video_id')
    .eq('politician_id', input.politicianId)
    .neq('verification_status', 'removed')
    .limit(15000)

  type Row = {
    id: string
    statement_date: string
    verification_status: string
    severity_score: number | null
    primary_source_url: string | null
    primary_source_type: string | null
    youtube_video_id: string | null
  }
  const all = (rows ?? []) as Row[]
  const badges: Badge[] = []

  const total = all.length
  if (total === 0) return []

  const verified = all.filter((s) => s.verification_status === 'verified').length
  const withVideo = all.filter((s) => s.youtube_video_id).length
  const sorted = [...all].sort((a, b) => a.statement_date.localeCompare(b.statement_date))
  const first = sorted[0]?.statement_date
  const last = sorted[sorted.length - 1]?.statement_date
  const firstYear = first ? Number(first.slice(0, 4)) : 0
  const lastYear = last ? Number(last.slice(0, 4)) : 0
  const spanYears = firstYear && lastYear ? lastYear - firstYear + 1 : 0

  if (total >= 500) badges.push({ id: 'prolific-500', label: '500+ declarações', tone: 'hot', title: 'Politician has more than 500 archived statements' })
  else if (total >= 100) badges.push({ id: 'prolific-100', label: '100+ declarações', tone: 'info', title: 'Politician has more than 100 archived statements' })

  const verifiedPct = verified / total
  if (verifiedPct >= 0.9 && total >= 10) {
    badges.push({ id: 'verified-90', label: '90%+ verificadas', tone: 'good', title: 'Mais de 90% das declarações têm status "verified"' })
  }

  if (spanYears >= 10) {
    badges.push({ id: 'decade', label: `${spanYears} anos no arquivo`, tone: 'neutral', title: `Primeira declaração em ${firstYear}, última em ${lastYear}` })
  } else if (spanYears >= 5) {
    badges.push({ id: 'half-decade', label: `${spanYears} anos no arquivo`, tone: 'neutral', title: `Primeira declaração em ${firstYear}, última em ${lastYear}` })
  }

  const videoShare = withVideo / total
  if (videoShare >= 0.3 && withVideo >= 20) {
    badges.push({ id: 'on-camera', label: 'Muito em vídeo', tone: 'info', title: `${Math.round(videoShare * 100)}% das declarações têm registro em vídeo` })
  }

  const highSeverity = all.filter((s) => (s.severity_score ?? 0) >= 4).length
  if (highSeverity >= 10) {
    badges.push({ id: 'high-severity', label: `${highSeverity} críticas`, tone: 'warn', title: 'Declarações de gravidade 4 ou 5' })
  }

  // Party history
  const partyCount = new Set(
    (input.partyHistory ?? []).map((p) => p.party).filter(Boolean),
  ).size
  if (partyCount >= 3) {
    badges.push({ id: 'multi-party', label: `${partyCount} partidos`, tone: 'neutral', title: 'Histórico partidário com múltiplas siglas' })
  }

  // Recent activity (last 30 days)
  const nowTs = Date.now()
  const recent = all.filter((s) => (nowTs - new Date(s.statement_date).getTime()) < 30 * 86400_000).length
  if (recent >= 10) {
    badges.push({ id: 'recent-active', label: `${recent} neste mês`, tone: 'hot', title: `${recent} declarações registradas nos últimos 30 dias` })
  }

  return badges
}

export const TONE_CLASS: Record<Badge['tone'], string> = {
  neutral: 'bg-gray-100 text-gray-800 border-gray-200 dark:bg-gray-800 dark:text-gray-200 dark:border-gray-700',
  good: 'bg-emerald-100 text-emerald-900 border-emerald-200 dark:bg-emerald-950/40 dark:text-emerald-200 dark:border-emerald-800',
  warn: 'bg-amber-100 text-amber-900 border-amber-200 dark:bg-amber-950/40 dark:text-amber-200 dark:border-amber-800',
  hot: 'bg-rose-100 text-rose-900 border-rose-200 dark:bg-rose-950/40 dark:text-rose-200 dark:border-rose-800',
  info: 'bg-sky-100 text-sky-900 border-sky-200 dark:bg-sky-950/40 dark:text-sky-200 dark:border-sky-800',
}
