'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'

async function assertAdmin() {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const SLUG_RE = /^[a-z0-9][a-z0-9-]*[a-z0-9]$/

async function resolveCategoryId(supabase: any, categorySlug: string): Promise<string> {
  if (!SLUG_RE.test(categorySlug)) throw new Error('Slug de categoria inválido.')
  const { data } = await supabase.from('categories').select('id').eq('slug', categorySlug).maybeSingle()
  if (!data?.id) throw new Error('Categoria não encontrada.')
  return data.id
}

/**
 * Bulk-add a category to N statements. Idempotent: rows that already
 * have the (statement_id, category_id) pair are skipped by the unique
 * PK. `isPrimary=true` only applies to rows that don't already have a
 * primary category (to avoid two primaries per statement).
 */
export async function bulkAddCategory(
  ids: string[],
  categorySlug: string,
  isPrimary: boolean = false,
): Promise<{ added: number; skipped: number }> {
  await assertAdmin()
  if (!Array.isArray(ids) || ids.length === 0) throw new Error('Nenhum ID selecionado.')
  if (ids.length > 200) throw new Error('Limite de 200 itens por lote.')
  if (!ids.every((i) => UUID_RE.test(i))) throw new Error('ID inválido.')

  const supabase = getSupabaseServiceClient()
  const categoryId = await resolveCategoryId(supabase, categorySlug)

  // If requesting primary assignment, find which target statements already
  // have *any* primary category — those stay non-primary for this slug.
  let withPrimary = new Set<string>()
  if (isPrimary) {
    const { data: existing } = await (supabase.from('statement_categories') as any)
      .select('statement_id')
      .in('statement_id', ids)
      .eq('is_primary', true)
    withPrimary = new Set(((existing ?? []) as { statement_id: string }[]).map((r) => r.statement_id))
  }

  const rows = ids.map((id) => ({
    statement_id: id,
    category_id: categoryId,
    is_primary: isPrimary && !withPrimary.has(id),
  }))

  // upsert → existing pair means no-op; new pair inserted.
  const { error, count } = await (supabase.from('statement_categories') as any)
    .upsert(rows, { onConflict: 'statement_id,category_id', ignoreDuplicates: true, count: 'exact' })
  if (error) throw new Error(error.message)

  revalidatePath('/admin')
  return { added: count ?? 0, skipped: ids.length - (count ?? 0) }
}

/**
 * Bulk-remove a category from N statements. Never removes the primary
 * category (editors should re-assign another primary first).
 */
export async function bulkRemoveCategory(
  ids: string[],
  categorySlug: string,
): Promise<{ removed: number; skippedPrimary: number }> {
  await assertAdmin()
  if (!Array.isArray(ids) || ids.length === 0) throw new Error('Nenhum ID selecionado.')
  if (ids.length > 200) throw new Error('Limite de 200 itens por lote.')
  if (!ids.every((i) => UUID_RE.test(i))) throw new Error('ID inválido.')

  const supabase = getSupabaseServiceClient()
  const categoryId = await resolveCategoryId(supabase, categorySlug)

  // Detect primary pairs we need to preserve.
  const { data: primary } = await (supabase.from('statement_categories') as any)
    .select('statement_id')
    .in('statement_id', ids)
    .eq('category_id', categoryId)
    .eq('is_primary', true)
  const skipIds = new Set(((primary ?? []) as { statement_id: string }[]).map((r) => r.statement_id))
  const removeIds = ids.filter((id) => !skipIds.has(id))

  if (removeIds.length === 0) {
    return { removed: 0, skippedPrimary: skipIds.size }
  }

  const { error, count } = await (supabase.from('statement_categories') as any)
    .delete({ count: 'exact' })
    .in('statement_id', removeIds)
    .eq('category_id', categoryId)

  if (error) throw new Error(error.message)
  revalidatePath('/admin')
  return { removed: count ?? 0, skippedPrimary: skipIds.size }
}
