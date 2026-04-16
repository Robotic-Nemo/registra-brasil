import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SourceTimeline } from '@/components/statements/SourceTimeline'
import { FactCheckSummary } from '@/components/statements/FactCheckSummary'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import Link from 'next/link'
import type { Metadata } from 'next'
import type { SecondarySource, VerificationStatus } from '@/types/database'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  return {
    title: `Fontes da Declaracao — Registra Brasil`,
    description: `Fontes e verificacao da declaracao ${id}.`,
    alternates: { canonical: `/declaracao/${id}/fontes` },
  }
}

export default async function FontesPage({ params }: PageProps) {
  const { id } = await params
  const supabase = getSupabaseServiceClient()

  const { data: statement } = await supabase
    .from('statements')
    .select('id, summary, primary_source_url, primary_source_type, secondary_sources, verification_status, reviewed_by, reviewed_at, editor_notes, created_at, politicians!inner(common_name, slug)')
    .eq('id', id)
    .single()

  if (!statement) notFound()

  const stmt = statement as unknown as {
    id: string
    summary: string
    primary_source_url: string
    primary_source_type: string
    secondary_sources: SecondarySource[] | null
    verification_status: VerificationStatus
    reviewed_by: string | null
    reviewed_at: string | null
    editor_notes: string | null
    created_at: string
    politicians: { common_name: string; slug: string }
  }

  const sourceCount = 1 + (stmt.secondary_sources?.length ?? 0)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: stmt.politicians.common_name, href: `/politico/${stmt.politicians.slug}` },
          { label: 'Declaracao', href: `/declaracao/${stmt.id}` },
          { label: 'Fontes' },
        ]}
      />

      <h1 className="text-2xl font-bold text-gray-900 mb-2">Fontes e Verificacao</h1>
      <p className="text-sm text-gray-600 mb-6 line-clamp-2">{stmt.summary}</p>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Resumo da verificacao</h2>
        <FactCheckSummary
          status={stmt.verification_status}
          reviewedBy={stmt.reviewed_by}
          reviewedAt={stmt.reviewed_at}
          editorNotes={stmt.editor_notes}
          sourceCount={sourceCount}
        />
      </section>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Linha do tempo de fontes</h2>
        <SourceTimeline
          primarySourceUrl={stmt.primary_source_url}
          primarySourceType={stmt.primary_source_type}
          secondarySources={stmt.secondary_sources}
          createdAt={stmt.created_at}
        />
      </section>

      <div className="text-center">
        <Link
          href={`/declaracao/${stmt.id}`}
          className="text-sm text-blue-600 hover:underline"
        >
          Voltar para a declaracao
        </Link>
      </div>
    </main>
  )
}
