'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { estimateReadingTimeMinutes, referencedStatementIds } from '@/lib/stories/render'

async function assertAdmin() {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
}

const SLUG_RE = /^[a-z0-9][a-z0-9-]*[a-z0-9]$/

export async function upsertStory(input: {
  id?: string
  slug: string
  title: string
  subtitle?: string
  author?: string
  body_markdown: string
  hero_statement_id?: string
  cover_image_url?: string
  is_published: boolean
}) {
  await assertAdmin()
  if (!SLUG_RE.test(input.slug)) throw new Error('Slug inválido.')
  if (input.title.length < 3) throw new Error('Título muito curto.')

  const reading_time_min = estimateReadingTimeMinutes(input.body_markdown)
  const supabase = getSupabaseServiceClient()

  const row: Record<string, unknown> = {
    slug: input.slug,
    title: input.title.trim(),
    subtitle: input.subtitle?.trim() || null,
    author: input.author?.trim() || null,
    body_markdown: input.body_markdown,
    hero_statement_id: input.hero_statement_id || null,
    cover_image_url: input.cover_image_url?.trim() || null,
    reading_time_min,
    is_published: input.is_published,
    published_at: input.is_published ? new Date().toISOString() : null,
    updated_at: new Date().toISOString(),
  }

  let storyId: string
  if (input.id) {
    const { error } = await (supabase.from('stories') as any).update(row).eq('id', input.id)
    if (error) throw new Error(error.message)
    storyId = input.id
  } else {
    const { data, error } = await (supabase.from('stories') as any).insert(row).select('id').single()
    if (error || !data) throw new Error(error?.message ?? 'Falha ao criar')
    storyId = data.id
  }

  // Sync story_statements join (only the ones embedded in body).
  const embedIds = referencedStatementIds(input.body_markdown)
  await (supabase.from('story_statements') as any).delete().eq('story_id', storyId)
  if (embedIds.length > 0) {
    const rows = embedIds.map((statement_id, i) => ({ story_id: storyId, statement_id, position: i }))
    await (supabase.from('story_statements') as any).insert(rows)
  }

  revalidatePath('/historias')
  revalidatePath(`/historia/${input.slug}`)
  revalidatePath('/admin/historias')
  redirect(`/admin/historias/${input.slug}`)
}

export async function deleteStory(id: string, slug: string) {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('stories') as any).delete().eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/historias')
  revalidatePath(`/historia/${slug}`)
  redirect('/admin/historias')
}
