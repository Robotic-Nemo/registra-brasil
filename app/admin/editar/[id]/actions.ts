'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAuthenticated() {
  const adminSecret = process.env.ADMIN_SECRET
  if (!adminSecret) throw new Error('Unauthorized')
  const cookieStore = await cookies()
  const token = cookieStore.get(SESSION_COOKIE)?.value
  if (!token) throw new Error('Unauthorized')
  const expectedToken = await deriveSessionToken(adminSecret)
  if (!timingSafeEqual(token, expectedToken)) throw new Error('Unauthorized')
}

export async function updateStatement(
  statementId: string,
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
  await assertAuthenticated()
  const supabase = getSupabaseServiceClient()

  const summary = (formData.get('summary') as string)?.trim()
  const fullQuote = (formData.get('full_quote') as string)?.trim() || null
  const context = (formData.get('context') as string)?.trim() || null
  const statementDate = formData.get('statement_date') as string
  const dateApprox = formData.get('statement_date_approx') === 'on'
  const primarySourceUrl = (formData.get('primary_source_url') as string)?.trim()
  const primarySourceType = formData.get('primary_source_type') as string
  const timestampRaw = formData.get('youtube_timestamp_sec') as string
  const transcriptExcerpt = (formData.get('transcript_excerpt') as string)?.trim() || null
  const venue = (formData.get('venue') as string)?.trim() || null
  const eventName = (formData.get('event_name') as string)?.trim() || null
  const editorNotes = (formData.get('editor_notes') as string)?.trim() || null
  const categorySlugList = formData.getAll('categories') as string[]
  const severityRaw = formData.get('severity_score')
  const severityScore: number | null = (() => {
    if (severityRaw === null || severityRaw === '' || severityRaw === 'auto') return null
    const n = Number(severityRaw)
    if (!Number.isFinite(n) || n < 1 || n > 5) return null
    return Math.floor(n)
  })()

  if (!summary || !statementDate || !primarySourceUrl) {
    return { ok: false, message: 'Campos obrigatórios faltando.' }
  }

  if (!/^\d{4}-\d{2}-\d{2}$/.test(statementDate)) {
    return { ok: false, message: 'Data inválida.' }
  }

  try { new URL(primarySourceUrl) } catch {
    return { ok: false, message: 'URL da fonte primária inválida.' }
  }

  // Validate source type against known enum values
  const VALID_SOURCE_TYPES = new Set([
    'youtube_video', 'youtube_live_archive', 'camara_tv', 'senado_tv',
    'diario_oficial', 'transcript_pdf', 'news_article', 'social_media_post', 'other',
  ])
  if (!VALID_SOURCE_TYPES.has(primarySourceType)) {
    return { ok: false, message: 'Tipo de fonte inválido.' }
  }

  if (!categorySlugList.length) {
    return { ok: false, message: 'Selecione pelo menos uma categoria.' }
  }

  const timestampSec = timestampRaw ? parseInt(timestampRaw, 10) : null
  if (timestampSec !== null && (isNaN(timestampSec) || timestampSec < 0 || timestampSec > 86400)) {
    return { ok: false, message: 'Timestamp inválido.' }
  }

  // Update statement
  const { error: updateErr } = await (supabase
    .from('statements') as any)
    .update({
      summary,
      full_quote: fullQuote,
      context,
      statement_date: statementDate,
      statement_date_approx: dateApprox,
      primary_source_url: primarySourceUrl,
      primary_source_type: primarySourceType,
      youtube_timestamp_sec: timestampSec,
      transcript_excerpt: transcriptExcerpt,
      venue,
      event_name: eventName,
      editor_notes: editorNotes,
      severity_score: severityScore,
    })
    .eq('id', statementId)

  if (updateErr) {
    return { ok: false, message: `Erro: ${updateErr.message}` }
  }

  // Update categories: delete old, insert new
  const { data: cats } = await supabase
    .from('categories')
    .select('id, slug')
    .in('slug', categorySlugList)

  if (!cats?.length) {
    return { ok: false, message: 'Categorias não encontradas.' }
  }

  await supabase.from('statement_categories').delete().eq('statement_id', statementId)

  const catRows = cats.map((cat: { id: string; slug: string }) => ({
    statement_id: statementId,
    category_id: cat.id,
    is_primary: cat.slug === categorySlugList[0],
  }))

  await supabase.from('statement_categories').insert(catRows as any)

  revalidatePath('/')
  revalidatePath('/declaracoes-recentes')
  revalidatePath('/buscar')
  revalidatePath('/admin')

  return { ok: true, message: 'Declaração atualizada.' }
}
