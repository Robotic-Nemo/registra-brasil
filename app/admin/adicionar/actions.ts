'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { parseYouTubeVideoId } from '@/lib/utils/youtube-url'
import { slugify } from '@/lib/utils/slugify'
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

export async function submitStatement(
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
  await assertAuthenticated()
  const supabase = getSupabaseServiceClient()

  const politicianSlug = formData.get('politician_slug') as string
  const summary = formData.get('summary') as string
  const fullQuote = formData.get('full_quote') as string
  const context = formData.get('context') as string
  const statementDate = formData.get('statement_date') as string
  const dateApprox = formData.get('statement_date_approx') === 'on'
  const primarySourceUrl = formData.get('primary_source_url') as string
  const primarySourceType = formData.get('primary_source_type') as string
  const timestampRaw = formData.get('youtube_timestamp_sec') as string
  const transcriptExcerpt = formData.get('transcript_excerpt') as string
  const venue = formData.get('venue') as string
  const eventName = formData.get('event_name') as string
  const editorNotes = formData.get('editor_notes') as string
  const submittedBy = formData.get('submitted_by') as string
  const categorySlugList = formData.getAll('categories') as string[]
  const severityRaw = formData.get('severity_score')
  const severityScore: number | null = (() => {
    if (severityRaw === null || severityRaw === '' || severityRaw === 'auto') return null
    const n = Number(severityRaw)
    if (!Number.isFinite(n) || n < 1 || n > 5) return null
    return Math.floor(n)
  })()

  // Validate required fields
  if (!politicianSlug || !summary || !statementDate || !primarySourceUrl) {
    return { ok: false, message: 'Campos obrigatórios faltando.' }
  }
  if (!categorySlugList.length) {
    return { ok: false, message: 'Selecione pelo menos uma categoria.' }
  }

  // Validate URL format
  try {
    new URL(primarySourceUrl)
  } catch {
    return { ok: false, message: 'URL da fonte primária inválida.' }
  }

  // Validate date format (YYYY-MM-DD)
  if (!/^\d{4}-\d{2}-\d{2}$/.test(statementDate)) {
    return { ok: false, message: 'Data inválida. Use o formato AAAA-MM-DD.' }
  }

  // Validate source type against known enum values
  const VALID_SOURCE_TYPES = new Set([
    'youtube_video', 'youtube_live_archive', 'camara_tv', 'senado_tv',
    'diario_oficial', 'transcript_pdf', 'news_article', 'social_media_post', 'other',
  ])
  if (!VALID_SOURCE_TYPES.has(primarySourceType)) {
    return { ok: false, message: 'Tipo de fonte inválido.' }
  }

  // Look up politician
  const { data: politician, error: polErr } = await supabase
    .from('politicians')
    .select('id')
    .eq('slug', politicianSlug)
    .single()

  if (polErr || !politician) {
    return { ok: false, message: `Político "${politicianSlug}" não encontrado.` }
  }

  // Look up categories
  const { data: cats } = await supabase
    .from('categories')
    .select('id, slug')
    .in('slug', categorySlugList)

  if (!cats?.length) {
    return { ok: false, message: 'Categorias não encontradas.' }
  }

  // Extract YouTube video ID
  const youtubeVideoId = parseYouTubeVideoId(primarySourceUrl) ?? null
  const timestampSec = timestampRaw ? parseInt(timestampRaw, 10) : null
  if (timestampSec !== null && (isNaN(timestampSec) || timestampSec < 0 || timestampSec > 86400)) {
    return { ok: false, message: 'Timestamp inválido (deve ser entre 0 e 86400 segundos).' }
  }

  // Generate unique slug — check DB for collisions and append suffix if needed
  const baseSlug = slugify(`${politicianSlug} ${summary.slice(0, 50)} ${statementDate}`)
  let finalSlug = baseSlug
  let attempt = 0
  while (true) {
    const { data: existing } = await supabase
      .from('statements')
      .select('id')
      .eq('slug', finalSlug)
      .maybeSingle()
    if (!existing) break
    attempt++
    finalSlug = `${baseSlug}-${attempt}`
    if (attempt > 20) {
      finalSlug = `${baseSlug}-${Date.now()}`
      break
    }
  }

  // Insert statement
  const { data: statement, error: stmtErr } = await supabase
    .from('statements')
    .insert({
      politician_id: (politician as any).id,
      summary: summary.trim(),
      full_quote: fullQuote?.trim() || null,
      context: context?.trim() || null,
      verification_status: 'unverified',
      statement_date: statementDate,
      statement_date_approx: dateApprox,
      primary_source_url: primarySourceUrl.trim(),
      primary_source_type: primarySourceType,
      youtube_video_id: youtubeVideoId,
      youtube_timestamp_sec: timestampSec,
      transcript_excerpt: transcriptExcerpt?.trim() || null,
      venue: venue?.trim() || null,
      event_name: eventName?.trim() || null,
      editor_notes: editorNotes?.trim() || null,
      submitted_by: submittedBy?.trim() || null,
      severity_score: severityScore,
      slug: finalSlug,
    } as any)
    .select('id')
    .single()

  if (stmtErr || !statement) {
    console.error('Statement insert error:', stmtErr)
    return { ok: false, message: `Erro ao salvar: ${stmtErr?.message ?? 'desconhecido'}` }
  }

  // Insert category relations — first slug in list is primary
  const stmtRecord = statement as any
  const catRows = (cats as any[]).map((cat: { id: string; slug: string }) => ({
    statement_id: stmtRecord.id,
    category_id: cat.id,
    is_primary: cat.slug === categorySlugList[0],
  }))

  const { error: catErr } = await supabase.from('statement_categories').insert(catRows as any)

  if (catErr) {
    console.error('Category insert error:', catErr)
    return { ok: false, message: `Declaração salva (ID: ${stmtRecord.id}), mas as categorias falharam ao salvar. Tente adicionar as categorias manualmente.` }
  }

  revalidatePath('/')
  revalidatePath('/declaracoes-recentes')
  revalidatePath('/buscar')

  return {
    ok: true,
    message: `Declaração salva com status "não verificado". ID: ${stmtRecord.id}`,
  }
}
