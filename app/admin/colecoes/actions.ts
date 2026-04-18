'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAdmin() {
  const secret = process.env.ADMIN_SECRET
  if (!secret) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  const expected = await deriveSessionToken(secret)
  if (!timingSafeEqual(t, expected)) throw new Error('Unauthorized')
}

const SLUG_RE = /^[a-z0-9][a-z0-9-]*[a-z0-9]$/

export async function upsertCollection(input: {
  id?: string
  slug: string
  title: string
  subtitle?: string
  description?: string
  cover_image_url?: string
  is_published: boolean
}) {
  await assertAdmin()
  if (!SLUG_RE.test(input.slug)) throw new Error('Slug inválido')
  if (input.title.length < 3 || input.title.length > 200) throw new Error('Título deve ter 3–200 caracteres')

  const supabase = getSupabaseServiceClient()
  const row = {
    slug: input.slug,
    title: input.title.trim(),
    subtitle: input.subtitle?.trim() || null,
    description: input.description?.trim() || null,
    cover_image_url: input.cover_image_url?.trim() || null,
    is_published: input.is_published,
    published_at: input.is_published ? new Date().toISOString() : null,
    updated_at: new Date().toISOString(),
  }

  if (input.id) {
    const { error } = await (supabase.from('collections') as any).update(row).eq('id', input.id)
    if (error) throw new Error(error.message)
  } else {
    const { error } = await (supabase.from('collections') as any).insert(row)
    if (error) throw new Error(error.message)
  }

  revalidatePath('/colecoes')
  revalidatePath(`/colecao/${input.slug}`)
  revalidatePath('/admin/colecoes')
  redirect(`/admin/colecoes/${input.slug}`)
}

/**
 * Replace the full membership of a collection with the given list of
 * statement identifiers (uuids or slugs). Position follows input order.
 * Returns the identifiers that couldn't be resolved so the editor can
 * fix typos.
 */
export async function setCollectionMembers(
  collectionId: string,
  identifiers: string[],
): Promise<{ unresolved: string[] }> {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()

  const cleaned = [...new Set(identifiers.map((s) => s.trim()).filter(Boolean))]
  if (cleaned.length === 0) {
    await (supabase.from('collection_statements') as any).delete().eq('collection_id', collectionId)
    revalidatePath('/admin/colecoes')
    return { unresolved: [] }
  }

  const uuidRe = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
  const uuids = cleaned.filter((s) => uuidRe.test(s))
  const slugs = cleaned.filter((s) => !uuidRe.test(s))

  const orClauses: string[] = []
  if (uuids.length) orClauses.push(`id.in.(${uuids.join(',')})`)
  if (slugs.length) orClauses.push(`slug.in.(${slugs.map((s) => `"${s}"`).join(',')})`)

  const { data: found } = await (supabase.from('statements') as any)
    .select('id, slug')
    .or(orClauses.join(','))

  const resolved = new Map<string, string>()
  for (const row of (found ?? []) as { id: string; slug: string | null }[]) {
    resolved.set(row.id, row.id)
    if (row.slug) resolved.set(row.slug, row.id)
  }

  const orderedIds = cleaned.map((c) => resolved.get(c)).filter(Boolean) as string[]
  const unresolved = cleaned.filter((c) => !resolved.has(c))

  // Replace membership atomically (delete + insert inside a single
  // statement set). We can't use a DB transaction via supabase-js, so
  // run sequentially — brief window where the collection shows empty
  // during the swap, but collections are editorial/low-traffic.
  await (supabase.from('collection_statements') as any).delete().eq('collection_id', collectionId)
  if (orderedIds.length > 0) {
    const rows = orderedIds.map((statement_id, i) => ({
      collection_id: collectionId,
      statement_id,
      position: i,
    }))
    const { error } = await (supabase.from('collection_statements') as any).insert(rows)
    if (error) throw new Error(error.message)
  }

  revalidatePath('/admin/colecoes')
  return { unresolved }
}

export async function deleteCollection(id: string, slug: string) {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()
  const { error } = await (supabase.from('collections') as any).delete().eq('id', id)
  if (error) throw new Error(error.message)
  revalidatePath('/colecoes')
  revalidatePath(`/colecao/${slug}`)
  redirect('/admin/colecoes')
}
