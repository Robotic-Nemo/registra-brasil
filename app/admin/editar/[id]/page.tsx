import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getStatementBySlug, getStatementById } from '@/lib/supabase/queries/statements'
import { EditStatementForm } from './EditStatementForm'

export const dynamic = 'force-dynamic'

interface PageProps {
  params: Promise<{ id: string }>
}

export default async function EditStatementPage({ params }: PageProps) {
  const { id } = await params
  const supabase = getSupabaseServiceClient()

  const statement = await getStatementBySlug(supabase, id) ?? await getStatementById(supabase, id)
  if (!statement) notFound()

  // Fetch all categories for the form
  const { data: allCategories } = await supabase
    .from('categories')
    .select('slug, label_pt')
    .order('label_pt')

  // Fetch all politicians for the dropdown
  const { data: allPoliticians } = await supabase
    .from('politicians')
    .select('slug, common_name')
    .eq('is_active', true)
    .order('common_name')

  const selectedCategories = statement.statement_categories.map((sc) => sc.categories.slug)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Editar declaração</h1>
      <EditStatementForm
        statement={{
          id: statement.id,
          slug: statement.slug,
          summary: statement.summary,
          full_quote: statement.full_quote ?? '',
          context: statement.context ?? '',
          statement_date: statement.statement_date,
          statement_date_approx: statement.statement_date_approx,
          primary_source_url: statement.primary_source_url,
          primary_source_type: statement.primary_source_type,
          youtube_timestamp_sec: statement.youtube_timestamp_sec,
          transcript_excerpt: statement.transcript_excerpt ?? '',
          venue: statement.venue ?? '',
          event_name: statement.event_name ?? '',
          editor_notes: statement.editor_notes ?? '',
          politician_slug: statement.politicians.slug,
          severity_score: statement.severity_score ?? null,
        }}
        selectedCategories={selectedCategories}
        allCategories={(allCategories ?? []) as { slug: string; label_pt: string }[]}
        allPoliticians={(allPoliticians ?? []) as { slug: string; common_name: string }[]}
      />
    </main>
  )
}
