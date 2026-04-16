import { getSupabaseServerClient } from '@/lib/supabase/server'
import { CompareSelector } from './CompareSelector'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Comparar Políticos — Registra Brasil',
  description: 'Compare declarações registradas de diferentes políticos brasileiros.',
  alternates: { canonical: '/comparar' },
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

interface PageProps {
  searchParams: Promise<{ ids?: string | string[] }>
}

export default async function ComparePage({ searchParams }: PageProps) {
  const params = await searchParams
  const rawIds = params.ids

  // Normalise to an array of strings
  const idList: string[] = rawIds
    ? (Array.isArray(rawIds) ? rawIds : rawIds.split(',').map((s) => s.trim())).filter(Boolean)
    : []

  // Validate each provided ID is a well-formed UUID
  const validIds = idList.filter((id) => UUID_RE.test(id))

  // If the caller supplied IDs but fewer than 2 are valid, show an error message
  // early so the user knows what's wrong before the full selector loads.
  const idsProvided = idList.length > 0
  const insufficientIds = idsProvided && validIds.length < 2
  const supabase = await getSupabaseServerClient()

  const [{ data: politicians }, { data: countRows }, { data: catRows }] = await Promise.all([
    supabase
      .from('politicians')
      .select('id, slug, common_name, party, state, photo_url')
      .eq('is_active', true)
      .order('common_name'),
    supabase
      .from('statements')
      .select('politician_id')
      .eq('verification_status', 'verified'),
    supabase
      .from('statement_categories')
      .select('statements!inner(politician_id, verification_status), categories(slug, label_pt, color_hex)')
      .eq('statements.verification_status', 'verified'),
  ])

  const countMap: Record<string, number> = {}
  for (const row of (countRows ?? []) as { politician_id: string }[]) {
    countMap[row.politician_id] = (countMap[row.politician_id] ?? 0) + 1
  }

  // Build per-politician category counts: { politicianId: { categorySlug: { count, label, color } } }
  const categoryMap: Record<string, Record<string, { count: number; label: string; color: string }>> = {}
  try {
    for (const row of (catRows ?? []) as unknown as { statements: { politician_id: string; verification_status: string } | null; categories: { slug: string; label_pt: string; color_hex: string } | null }[]) {
      const pid = row.statements?.politician_id
      const cat = row.categories
      if (!pid || !cat?.slug) continue
      if (!categoryMap[pid]) categoryMap[pid] = {}
      if (!categoryMap[pid][cat.slug]) categoryMap[pid][cat.slug] = { count: 0, label: cat.label_pt, color: cat.color_hex }
      categoryMap[pid][cat.slug].count++
    }
  } catch (err) {
    console.error('[ComparePage] Failed to build categoryMap:', err)
  }

  const pols = ((politicians ?? []) as { id: string; slug: string; common_name: string; party: string; state: string | null; photo_url: string | null }[])
    .filter((p) => (countMap[p.id] ?? 0) > 0)

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <Breadcrumbs items={[{ label: 'Comparar' }]} />
      <h1 className="text-2xl font-bold text-gray-900 mb-2">Comparar politicos</h1>
      <p className="text-gray-500 text-sm mb-8">
        Selecione dois políticos para comparar suas declarações registradas.
      </p>
      {insufficientIds && (
        <div
          role="alert"
          className="mb-6 flex items-center gap-3 rounded-lg border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800"
        >
          <span aria-hidden="true">⚠️</span>
          <span>
            {validIds.length === 0
              ? 'Nenhum ID válido fornecido. '
              : 'Apenas um político identificado. '}
            Selecione pelo menos 2 políticos para comparar.
          </span>
        </div>
      )}
      <CompareSelector
        politicians={pols}
        countMap={countMap}
        categoryMap={categoryMap}
        initialIds={validIds.slice(0, 2) as [string?, string?]}
      />
    </main>
  )
}
