'use server'

import { cookies } from 'next/headers'
import { revalidatePath } from 'next/cache'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { deriveSessionToken, timingSafeEqual, SESSION_COOKIE } from '@/lib/auth/session'
import { parseCsv } from '@/lib/import/csv-parse'
import { validateRow, type NormalizedImportRow } from '@/lib/import/validate-statement'

async function assertAdmin() {
  const s = process.env.ADMIN_SECRET
  if (!s) throw new Error('Unauthorized')
  const c = await cookies()
  const t = c.get(SESSION_COOKIE)?.value
  if (!t) throw new Error('Unauthorized')
  if (!timingSafeEqual(t, await deriveSessionToken(s))) throw new Error('Unauthorized')
}

async function sha256Hex(input: string): Promise<string> {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(input))
  return Array.from(new Uint8Array(buf)).map((b) => b.toString(16).padStart(2, '0')).join('')
}

export interface ImportPreviewResult {
  totalLines: number
  okRows: Array<{ line: number; row: NormalizedImportRow; politician_id: string | null; politician_label: string }>
  errorRows: Array<{ line: number; errors: string[] }>
  parseErrors: string[]
  checksum: string
  alreadyImported: boolean
}

export async function previewImport(csvText: string, filename: string): Promise<ImportPreviewResult> {
  await assertAdmin()
  const supabase = getSupabaseServiceClient()

  const checksum = await sha256Hex(csvText)

  const { data: existing } = await (supabase.from('import_batches') as any)
    .select('id')
    .eq('checksum', checksum)
    .maybeSingle()
  const alreadyImported = Boolean(existing?.id)

  const parsed = parseCsv(csvText)
  const okRows: ImportPreviewResult['okRows'] = []
  const errorRows: ImportPreviewResult['errorRows'] = []

  // Resolve politicians in one round-trip per slug + one per common_name.
  const allSlugs = new Set<string>()
  const allNames = new Set<string>()
  const validations = parsed.rows.map((r, i) => validateRow(r, i + 2)) // +2: header line + 1-indexed
  for (const v of validations) {
    if (!v.ok || !v.row) continue
    const lk = v.row.politician_lookup
    if ('slug' in lk) allSlugs.add(lk.slug)
    else allNames.add(lk.common_name.toLowerCase())
  }

  const bySlug = new Map<string, { id: string; common_name: string }>()
  if (allSlugs.size) {
    const { data } = await (supabase.from('politicians') as any)
      .select('id, slug, common_name')
      .in('slug', [...allSlugs])
    for (const p of (data ?? []) as { id: string; slug: string; common_name: string }[]) {
      bySlug.set(p.slug, { id: p.id, common_name: p.common_name })
    }
  }
  const byName = new Map<string, { id: string; common_name: string }>()
  if (allNames.size) {
    const { data } = await (supabase.from('politicians') as any)
      .select('id, common_name')
    for (const p of (data ?? []) as { id: string; common_name: string }[]) {
      byName.set(p.common_name.toLowerCase(), { id: p.id, common_name: p.common_name })
    }
  }

  for (const v of validations) {
    if (!v.ok || !v.row) {
      errorRows.push({ line: v.lineNumber, errors: v.errors })
      continue
    }
    const lk = v.row.politician_lookup
    let match: { id: string; common_name: string } | undefined
    let label = ''
    if ('slug' in lk) {
      match = bySlug.get(lk.slug)
      label = lk.slug
    } else {
      match = byName.get(lk.common_name.toLowerCase())
      label = lk.common_name
    }

    okRows.push({
      line: v.lineNumber,
      row: v.row,
      politician_id: match?.id ?? null,
      politician_label: match?.common_name ?? label,
    })
  }

  return {
    totalLines: parsed.rows.length,
    okRows,
    errorRows,
    parseErrors: parsed.errors,
    checksum,
    alreadyImported,
  }
}

export async function commitImport(
  csvText: string,
  filename: string,
  note?: string,
): Promise<{ batchId: string; created: number; skipped: number; errored: number }> {
  await assertAdmin()
  const preview = await previewImport(csvText, filename)
  if (preview.alreadyImported) {
    throw new Error('Este arquivo já foi importado antes (mesmo checksum).')
  }

  const supabase = getSupabaseServiceClient()

  const { data: batch, error: batchErr } = await (supabase.from('import_batches') as any)
    .insert({
      source_filename: filename.slice(0, 200),
      source_mime: 'text/csv',
      source_size: csvText.length,
      checksum: preview.checksum,
      row_count_total: preview.totalLines,
      status: 'committed',
      note: note?.slice(0, 500) ?? null,
      created_by: 'admin',
    })
    .select('id')
    .single()

  if (batchErr || !batch) throw new Error(batchErr?.message ?? 'Failed to create batch')

  const batchId = batch.id as string

  // Resolve category slugs once (the set is small — 20ish) for join inserts.
  const allCats = [...new Set(preview.okRows.flatMap((r) => r.row.category_slugs))]
  const categoryIdBySlug = new Map<string, string>()
  if (allCats.length) {
    const { data: cats } = await (supabase.from('categories') as any)
      .select('id, slug')
      .in('slug', allCats)
    for (const c of (cats ?? []) as { id: string; slug: string }[]) {
      categoryIdBySlug.set(c.slug, c.id)
    }
  }

  let created = 0
  let skipped = 0
  let errored = 0
  const errorLog: Array<{ line: number; message: string }> = []

  for (const ok of preview.okRows) {
    if (!ok.politician_id) {
      skipped++
      errorLog.push({ line: ok.line, message: `Político não encontrado: ${ok.politician_label}` })
      continue
    }
    const r = ok.row
    const { data: inserted, error } = await (supabase.from('statements') as any)
      .insert({
        politician_id: ok.politician_id,
        summary: r.summary,
        full_quote: r.full_quote,
        context: r.context,
        statement_date: r.statement_date,
        venue: r.venue,
        event_name: r.event_name,
        primary_source_url: r.primary_source_url,
        primary_source_type: r.primary_source_type,
        verification_status: r.verification_status,
        severity_score: r.severity_score,
        import_batch_id: batchId,
        editor_notes: `Imported from ${filename.slice(0, 100)}`,
      })
      .select('id')
      .single()

    if (error || !inserted) {
      errored++
      errorLog.push({ line: ok.line, message: error?.message ?? 'unknown' })
      continue
    }

    if (r.category_slugs.length > 0) {
      const rows = r.category_slugs
        .map((slug, i) => ({
          statement_id: inserted.id,
          category_id: categoryIdBySlug.get(slug),
          is_primary: i === 0,
        }))
        .filter((x) => x.category_id)
      if (rows.length > 0) {
        await (supabase.from('statement_categories') as any).insert(rows)
      }
    }
    created++
  }

  // Add error rows from preview
  for (const er of preview.errorRows) {
    errorLog.push({ line: er.line, message: er.errors.join('; ') })
    errored++
  }

  await (supabase.from('import_batches') as any)
    .update({
      row_count_created: created,
      row_count_skipped: skipped,
      row_count_errored: errored,
      error_log: errorLog.length ? errorLog : null,
    })
    .eq('id', batchId)

  revalidatePath('/admin')
  revalidatePath('/admin/importar')

  return { batchId, created, skipped, errored }
}
