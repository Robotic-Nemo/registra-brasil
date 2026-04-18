import { notFound } from 'next/navigation'
import Link from 'next/link'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { Mail, ArrowLeft } from 'lucide-react'

export const revalidate = 3600

interface PageProps {
  params: Promise<{ week: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { week } = await params
  return {
    title: `Boletim — semana de ${week} — Registra Brasil`,
    description: `Resumo editorial da semana de ${week}.`,
    alternates: { canonical: `/boletim/${week}` },
  }
}

export default async function BoletimWeekPage({ params }: PageProps) {
  const { week } = await params
  if (!/^\d{4}-\d{2}-\d{2}$/.test(week)) notFound()

  const supabase = await getSupabaseServerClient()
  const { data } = await (supabase.from('newsletter_digests') as any)
    .select('subject, preview_text, html, recipient_count, sent_at, week_of')
    .eq('week_of', week)
    .not('sent_at', 'is', null)
    .maybeSingle()

  if (!data) notFound()

  return (
    <main className="max-w-2xl mx-auto px-4 py-10">
      <Breadcrumbs items={[
        { label: 'Boletim', href: '/boletim' },
        { label: `Semana de ${week}` },
      ]} />

      <Link href="/boletim" className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline mb-4">
        <ArrowLeft className="w-4 h-4" aria-hidden="true" /> Todos os boletins
      </Link>

      <header className="mb-6">
        <div className="flex items-center gap-3 mb-2">
          <Mail className="w-6 h-6 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">{data.subject}</h1>
        </div>
        <p className="text-xs text-gray-500">
          Enviado em {new Date(data.sent_at).toLocaleDateString('pt-BR')} para {data.recipient_count} assinantes
        </p>
      </header>

      {data.preview_text && (
        <p className="text-sm text-gray-700 mb-6 italic border-l-4 border-gray-200 pl-3">
          {data.preview_text}
        </p>
      )}

      {/* Render the archived HTML inside a sandboxed container. Content
          is internally produced (from /api/maintenance/weekly-digest
          using escapeHtml for every user-derived string). */}
      <article
        className="newsletter-archive bg-white border border-gray-200 rounded-lg p-6"
        dangerouslySetInnerHTML={{ __html: data.html ?? '' }}
      />
    </main>
  )
}
