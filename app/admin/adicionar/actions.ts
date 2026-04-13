'use server'

import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { parseYouTubeVideoId } from '@/lib/utils/youtube-url'
import { slugify } from '@/lib/utils/slugify'

export async function submitStatement(
  formData: FormData
): Promise<{ ok: boolean; message: string }> {
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
  const submittedBy = formData.get('submitted_by') as string
  const categorySlugList = formData.getAll('categories') as string[]

  // Validate required fields
  if (!politicianSlug || !summary || !statementDate || !primarySourceUrl) {
    return { ok: false, message: 'Campos obrigatórios faltando.' }
  }
  if (!categorySlugList.length) {
    return { ok: false, message: 'Selecione pelo menos uma categoria.' }
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

  // Generate slug
  const baseSlug = slugify(`${politicianSlug} ${summary.slice(0, 50)} ${statementDate}`)

  // Insert statement
  const { data: statement, error: stmtErr } = await supabase
    .from('statements')
    .insert({
      politician_id: politician.id,
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
      submitted_by: submittedBy?.trim() || null,
      slug: baseSlug,
    })
    .select('id')
    .single()

  if (stmtErr || !statement) {
    console.error('Statement insert error:', stmtErr)
    return { ok: false, message: `Erro ao salvar: ${stmtErr?.message ?? 'desconhecido'}` }
  }

  // Insert category relations — first slug in list is primary
  const catRows = cats.map((cat: { id: string; slug: string }) => ({
    statement_id: statement.id,
    category_id: cat.id,
    is_primary: cat.slug === categorySlugList[0],
  }))

  const { error: catErr } = await supabase.from('statement_categories').insert(catRows)

  if (catErr) {
    console.error('Category insert error:', catErr)
    return { ok: false, message: 'Declaração salva, mas categorias falharam.' }
  }

  return {
    ok: true,
    message: `Declaração salva com status "não verificado". ID: ${statement.id}`,
  }
}
