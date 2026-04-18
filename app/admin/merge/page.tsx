import Link from 'next/link'
import { notFound, redirect } from 'next/navigation'
import { ArrowLeft, Merge } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { MergeForm } from './MergeForm'

export const dynamic = 'force-dynamic'

interface PageProps {
  searchParams: Promise<{ a?: string; b?: string }>
}

const UUID_RE = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

const FIELDS_TO_PICK = [
  { key: 'summary', label: 'Resumo' },
  { key: 'full_quote', label: 'Citação literal' },
  { key: 'context', label: 'Contexto' },
  { key: 'statement_date', label: 'Data' },
  { key: 'venue', label: 'Local' },
  { key: 'event_name', label: 'Evento' },
  { key: 'verification_status', label: 'Status de verificação' },
  { key: 'primary_source_url', label: 'URL da fonte' },
  { key: 'primary_source_type', label: 'Tipo de fonte' },
  { key: 'severity_score', label: 'Severidade' },
  { key: 'minors_involved', label: 'Envolve menores' },
  { key: 'editor_notes', label: 'Notas editoriais' },
] as const

export default async function MergePage({ searchParams }: PageProps) {
  const { a, b } = await searchParams
  if (!a || !b || !UUID_RE.test(a) || !UUID_RE.test(b)) {
    redirect('/admin/duplicatas')
  }
  if (a === b) notFound()

  const supabase = getSupabaseServiceClient()
  const [aRes, bRes] = await Promise.all([
    (supabase.from('statements') as any)
      .select('id, slug, summary, full_quote, context, statement_date, venue, event_name, verification_status, severity_score, minors_involved, primary_source_url, primary_source_type, editor_notes, created_at, politicians(id, slug, common_name, party, state)')
      .eq('id', a).maybeSingle(),
    (supabase.from('statements') as any)
      .select('id, slug, summary, full_quote, context, statement_date, venue, event_name, verification_status, severity_score, minors_involved, primary_source_url, primary_source_type, editor_notes, created_at, politicians(id, slug, common_name, party, state)')
      .eq('id', b).maybeSingle(),
  ])

  if (!aRes.data || !bRes.data) notFound()

  const aStmt = aRes.data
  const bStmt = bRes.data

  const fields = FIELDS_TO_PICK.map((f) => ({
    key: f.key,
    label: f.label,
    a: (aStmt as any)[f.key] ?? null,
    b: (bStmt as any)[f.key] ?? null,
    differ: JSON.stringify((aStmt as any)[f.key] ?? null) !== JSON.stringify((bStmt as any)[f.key] ?? null),
  }))

  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin/duplicatas" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Merge className="w-5 h-5 text-purple-700" />
          Mesclar declarações
        </h1>
      </div>

      <p className="text-sm text-gray-600 mb-6 max-w-3xl">
        Escolha a declaração que permanece (<strong>A</strong> ou <strong>B</strong>) e, para cada
        campo que difere, qual valor usar. Secundárias (checagens externas, reações, coleções,
        histórias, retratações) são migradas para a declaração retida. A outra é marcada como{' '}
        <code>removed</code> com nota apontando para a retida.
      </p>

      <MergeForm a={aStmt} b={bStmt} fields={fields} />
    </main>
  )
}
