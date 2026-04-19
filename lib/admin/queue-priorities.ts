import type { SupabaseClient } from '@supabase/supabase-js'

export interface EditorialPriority {
  key: string
  severity: 'critical' | 'warn' | 'info'
  kind: 'retraction' | 'submission' | 'reaction' | 'link_broken' | 'unverified'
  title: string
  detail: string
  href: string
  ageDays: number | null
}

function ageText(iso: string | null | undefined): { text: string; days: number | null } {
  if (!iso) return { text: '', days: null }
  const days = Math.floor((Date.now() - new Date(iso).getTime()) / (24 * 60 * 60 * 1000))
  return { text: days < 1 ? '<1 dia' : `${days} dia${days === 1 ? '' : 's'}`, days }
}

function severityFromAge(days: number | null, warnAt: number, criticalAt: number): 'info' | 'warn' | 'critical' {
  if (days === null) return 'info'
  if (days >= criticalAt) return 'critical'
  if (days >= warnAt) return 'warn'
  return 'info'
}

/**
 * Build up to 5 top-priority editorial tasks, sorted by age-first then
 * criticality. Each priority is a deep-link into an admin sub-page
 * that will let the editor complete the action in one click.
 */
export async function getEditorialPriorities(supabase: SupabaseClient): Promise<EditorialPriority[]> {
  const out: EditorialPriority[] = []

  const [retraction, submission, reacted, broken, unverified] = await Promise.all([
    // Oldest pending retraction (SLA 10 days)
    (supabase.from('retraction_requests') as any)
      .select('id, created_at, claim, politicians:represents_politician_id(common_name)')
      .in('status', ['pending', 'in_review'])
      .order('created_at', { ascending: true })
      .limit(1)
      .maybeSingle(),
    // Oldest pending submission (SLA 10 days)
    (supabase.from('statement_submissions') as any)
      .select('id, created_at, summary, politicians(common_name), politician_name_raw')
      .eq('status', 'pending')
      .order('created_at', { ascending: true })
      .limit(1)
      .maybeSingle(),
    // Statement with most "erro" + "contestada" reactions in last 14 days
    (supabase.from('statement_reaction_counts') as any)
      .select('statement_id, erro, contestada, total')
      .order('erro', { ascending: false })
      .limit(5),
    // Oldest last-checked link that came back broken
    (supabase.from('statements') as any)
      .select('id, slug, summary, source_http_status, source_last_checked_at, politicians(common_name)')
      .gte('source_http_status', 400)
      .neq('verification_status', 'removed')
      .order('source_last_checked_at', { ascending: true })
      .limit(1)
      .maybeSingle(),
    // Oldest unverified statement still in review
    (supabase.from('statements') as any)
      .select('id, slug, summary, created_at, politicians(common_name)')
      .eq('verification_status', 'unverified')
      .order('created_at', { ascending: true })
      .limit(1)
      .maybeSingle(),
  ])

  if (retraction.data?.id) {
    const { text, days } = ageText(retraction.data.created_at)
    out.push({
      key: `retr-${retraction.data.id}`,
      severity: severityFromAge(days, 7, 10),
      kind: 'retraction',
      title: 'Pedido de retificação aguardando',
      detail: `${retraction.data.politicians?.common_name ?? 'Alvo não mapeado'} — ${String(retraction.data.claim ?? '').slice(0, 100)}…`,
      href: '/admin/retratacoes',
      ageDays: days,
    })
  }

  if (submission.data?.id) {
    const { days } = ageText(submission.data.created_at)
    const polName = submission.data.politicians?.common_name ?? submission.data.politician_name_raw ?? 'sem político'
    out.push({
      key: `sub-${submission.data.id}`,
      severity: severityFromAge(days, 7, 10),
      kind: 'submission',
      title: 'Submissão pública para triar',
      detail: `${polName}: ${String(submission.data.summary ?? '').slice(0, 100)}…`,
      href: '/admin/submissions?status=pending',
      ageDays: days,
    })
  }

  // Reaction-flagged statement
  const reactionRows = ((reacted.data ?? []) as Array<{ statement_id: string; erro: number; contestada: number; total: number }>)
  const topFlag = reactionRows.find((r) => (r.erro ?? 0) + (r.contestada ?? 0) >= 3)
  if (topFlag) {
    out.push({
      key: `rx-${topFlag.statement_id}`,
      severity: topFlag.erro >= 3 ? 'critical' : 'warn',
      kind: 'reaction',
      title: 'Declaração com muitas reações negativas',
      detail: `${topFlag.erro} reportes de erro · ${topFlag.contestada} contestações`,
      href: '/admin/reacoes?sort=erro',
      ageDays: null,
    })
  }

  if (broken.data?.id) {
    const { days } = ageText(broken.data.source_last_checked_at)
    out.push({
      key: `lk-${broken.data.id}`,
      severity: 'warn',
      kind: 'link_broken',
      title: `Link quebrado (HTTP ${broken.data.source_http_status})`,
      detail: `${broken.data.politicians?.common_name ?? '—'}: ${String(broken.data.summary ?? '').slice(0, 100)}…`,
      href: '/admin/links-quebrados',
      ageDays: days,
    })
  }

  if (unverified.data?.id) {
    const { days } = ageText(unverified.data.created_at)
    out.push({
      key: `uv-${unverified.data.id}`,
      severity: severityFromAge(days, 7, 14),
      kind: 'unverified',
      title: 'Declaração na fila de verificação',
      detail: `${unverified.data.politicians?.common_name ?? '—'}: ${String(unverified.data.summary ?? '').slice(0, 100)}…`,
      href: '/admin',
      ageDays: days,
    })
  }

  return out.sort((a, b) => {
    const sevOrder = { critical: 0, warn: 1, info: 2 } as const
    const s = sevOrder[a.severity] - sevOrder[b.severity]
    if (s !== 0) return s
    return (b.ageDays ?? 0) - (a.ageDays ?? 0)
  })
}
