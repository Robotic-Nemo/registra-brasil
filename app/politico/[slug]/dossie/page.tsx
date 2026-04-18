import { notFound } from 'next/navigation'
import Link from 'next/link'
import Image from 'next/image'
import type { Metadata } from 'next'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { getPoliticianBySlug } from '@/lib/supabase/queries/politicians'
import { Printer, ArrowLeft, ExternalLink } from 'lucide-react'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()
  const p = await getPoliticianBySlug(supabase, slug)
  if (!p) return { title: 'Dossiê não encontrado' }
  return {
    title: `Dossiê: ${p.common_name} — Registra Brasil`,
    description: `Dossiê completo de ${p.common_name} (${p.party}${p.state ? '-' + p.state : ''}): todas as declarações registradas com fontes primárias, pronto para impressão.`,
    alternates: { canonical: `/politico/${slug}/dossie` },
    robots: { index: true, follow: true },
  }
}

interface StatementRow {
  id: string
  slug: string | null
  summary: string
  full_quote: string | null
  context: string | null
  statement_date: string
  venue: string | null
  event_name: string | null
  verification_status: string
  severity_score: number | null
  primary_source_url: string
  primary_source_type: string
  statement_categories: Array<{ is_primary: boolean; categories: { slug: string; label_pt: string } | null }>
}

export default async function DossierPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = await getSupabaseServerClient()

  const politician = await getPoliticianBySlug(supabase, slug)
  if (!politician) notFound()

  const { data: stRows } = await (supabase.from('statements') as any)
    .select('id, slug, summary, full_quote, context, statement_date, venue, event_name, verification_status, severity_score, primary_source_url, primary_source_type, statement_categories(is_primary, categories(slug, label_pt))')
    .eq('politician_id', politician.id)
    .neq('verification_status', 'removed')
    .order('statement_date', { ascending: false })
    .limit(1000)

  const statements = (stRows ?? []) as StatementRow[]

  const catTally = new Map<string, number>()
  let verifiedCount = 0
  let disputedCount = 0
  for (const s of statements) {
    if (s.verification_status === 'verified') verifiedCount++
    else if (s.verification_status === 'disputed') disputedCount++
    for (const sc of s.statement_categories) {
      if (sc.is_primary && sc.categories) {
        catTally.set(sc.categories.label_pt, (catTally.get(sc.categories.label_pt) ?? 0) + 1)
      }
    }
  }
  const topCategories = [...catTally.entries()].sort((a, b) => b[1] - a[1]).slice(0, 8)

  const firstDate = statements[statements.length - 1]?.statement_date
  const lastDate = statements[0]?.statement_date

  return (
    <main className="dossier max-w-3xl mx-auto px-4 py-8 print:py-6 print:max-w-none print:px-0">
      <style
        // Print styles: full-width, black ink, no nav/footer, single-column.
        dangerouslySetInnerHTML={{
          __html: `
            @page { size: A4; margin: 18mm 14mm; }
            @media print {
              body { background: white !important; color: #000 !important; font-size: 10.5pt; line-height: 1.45; }
              header[role="banner"], footer[role="contentinfo"], nav, .no-print { display: none !important; }
              a { color: #000; text-decoration: none; }
              a[href]::after { content: " (" attr(href) ")"; font-size: 9pt; color: #333; word-break: break-all; }
              .dossier { max-width: none !important; margin: 0 !important; padding: 0 !important; }
              .dossier h1 { font-size: 18pt; margin-bottom: 4pt; }
              .dossier h2 { font-size: 13pt; margin-top: 12pt; border-bottom: 0.5pt solid #000; }
              .dossier .statement { page-break-inside: avoid; border: 0 !important; padding: 6pt 0 !important; border-bottom: 0.3pt solid #999 !important; box-shadow: none !important; border-radius: 0 !important; }
              .dossier .statement blockquote { border-left: 1.5pt solid #444; padding-left: 6pt; }
              .dossier .cat-tag { display: inline-block; border: 0.4pt solid #333; padding: 0.3pt 2pt; margin: 0 2pt 2pt 0; font-size: 8.5pt; color: #333; background: white !important; }
              .dossier .card { border: 0.4pt solid #000 !important; padding: 6pt !important; background: white !important; box-shadow: none !important; border-radius: 0 !important; }
              .dossier img.photo { filter: grayscale(100%); }
            }
          `,
        }}
      />

      <div className="no-print flex items-center justify-between gap-3 mb-4">
        <Link href={`/politico/${politician.slug}`} className="inline-flex items-center gap-1 text-sm text-blue-700 hover:underline">
          <ArrowLeft className="w-4 h-4" aria-hidden="true" /> Voltar ao perfil
        </Link>
        <form action="javascript:window.print()">
          <button type="submit" className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded">
            <Printer className="w-4 h-4" aria-hidden="true" />
            Imprimir / Salvar PDF
          </button>
        </form>
      </div>

      <header className="mb-6 print:mb-4">
        <p className="text-xs text-gray-500 uppercase tracking-wider mb-1">Dossiê público</p>
        <h1 className="text-3xl font-bold text-gray-900">Dossiê de {politician.common_name}</h1>
        <p className="text-sm text-gray-600 mt-2">
          Arquivo completo das declarações registradas em <strong>Registra Brasil</strong>, com
          ligação a fontes primárias. Gerado em{' '}
          {new Date().toLocaleDateString('pt-BR', { day: '2-digit', month: 'long', year: 'numeric' })}.
        </p>
      </header>

      <section className="card bg-white border border-gray-200 rounded-xl p-5 mb-6">
        <div className="flex items-start gap-4">
          {politician.photo_url ? (
            <Image
              src={politician.photo_url}
              alt=""
              width={96}
              height={96}
              unoptimized
              className="photo w-24 h-24 rounded-full object-cover border border-gray-200 flex-shrink-0"
            />
          ) : (
            <div className="w-24 h-24 rounded-full bg-gray-100 flex items-center justify-center text-3xl font-bold text-gray-400 flex-shrink-0">
              {politician.common_name?.[0] ?? '?'}
            </div>
          )}
          <div className="flex-1">
            <p className="text-xl font-bold text-gray-900">{politician.full_name}</p>
            <p className="text-sm text-gray-700">
              {politician.party}{politician.state ? `-${politician.state}` : ''}
              {politician.role ? ` · ${politician.role}` : ''}
            </p>
            <dl className="mt-3 grid grid-cols-2 gap-x-6 gap-y-1 text-xs text-gray-700">
              <div><dt className="uppercase tracking-wider text-gray-500">Declarações</dt><dd className="tabular-nums">{statements.length}</dd></div>
              <div><dt className="uppercase tracking-wider text-gray-500">Verificadas</dt><dd className="tabular-nums">{verifiedCount}</dd></div>
              <div><dt className="uppercase tracking-wider text-gray-500">Contestadas</dt><dd className="tabular-nums">{disputedCount}</dd></div>
              <div><dt className="uppercase tracking-wider text-gray-500">Período coberto</dt><dd>{firstDate ? firstDate + ' a ' + lastDate : '—'}</dd></div>
            </dl>
            {politician.wikipedia_url && (
              <a href={politician.wikipedia_url} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1 mt-3 text-xs text-blue-700 hover:underline">
                <ExternalLink className="w-3 h-3" aria-hidden="true" /> Wikipedia
              </a>
            )}
          </div>
        </div>
      </section>

      {topCategories.length > 0 && (
        <section className="mb-6">
          <h2 className="text-sm font-semibold text-gray-900 uppercase tracking-wider mb-2">Categorias mais frequentes</h2>
          <ul className="flex flex-wrap gap-2">
            {topCategories.map(([label, count]) => (
              <li key={label} className="cat-tag inline-flex items-center gap-1 text-xs px-2 py-1 bg-blue-50 border border-blue-200 text-blue-900 rounded">
                {label} <span className="tabular-nums text-blue-700">· {count}</span>
              </li>
            ))}
          </ul>
        </section>
      )}

      <h2 className="text-lg font-bold text-gray-900 mt-6 mb-4">Declarações registradas ({statements.length})</h2>

      <ol className="flex flex-col gap-4">
        {statements.map((s, i) => (
          <li key={s.id} className="statement bg-white border border-gray-200 rounded-lg p-4">
            <div className="flex items-center justify-between gap-3 mb-2 text-xs text-gray-500">
              <span className="tabular-nums">#{i + 1} · {s.statement_date}</span>
              <div className="flex items-center gap-2">
                {s.severity_score && <span className="tabular-nums">severidade {s.severity_score}</span>}
                <span className={`font-medium ${s.verification_status === 'verified' ? 'text-green-700' : s.verification_status === 'disputed' ? 'text-amber-700' : 'text-gray-700'}`}>
                  {s.verification_status}
                </span>
              </div>
            </div>

            <p className="text-gray-900 font-medium mb-2">{s.summary}</p>

            {s.full_quote && (
              <blockquote className="border-l-2 border-gray-300 pl-3 italic text-gray-700 text-sm mb-2">
                “{s.full_quote}”
              </blockquote>
            )}

            {s.context && (
              <p className="text-xs text-gray-600 mb-2"><strong>Contexto:</strong> {s.context}</p>
            )}

            {(s.venue || s.event_name) && (
              <p className="text-xs text-gray-500 mb-2">
                {s.venue}
                {s.venue && s.event_name && ' — '}
                {s.event_name}
              </p>
            )}

            {s.statement_categories.length > 0 && (
              <div className="flex flex-wrap gap-1 mb-2">
                {s.statement_categories
                  .filter((sc) => sc.categories)
                  .map((sc, idx) => (
                    <span key={idx} className={`cat-tag text-[10px] px-1.5 py-0.5 rounded border ${sc.is_primary ? 'bg-blue-100 text-blue-900 border-blue-200' : 'bg-gray-100 text-gray-700 border-gray-200'}`}>
                      {sc.categories!.label_pt}
                    </span>
                  ))}
              </div>
            )}

            <p className="text-xs break-all">
              <span className="text-gray-500">Fonte ({s.primary_source_type}):</span>{' '}
              <a href={s.primary_source_url} target="_blank" rel="noopener noreferrer" className="text-blue-700 hover:underline">
                {s.primary_source_url}
              </a>
            </p>
            <p className="text-[11px] text-gray-400 mt-1 no-print">
              <Link href={`/declaracao/${s.slug ?? s.id}`} className="hover:underline">Permalink</Link>
            </p>
          </li>
        ))}
      </ol>

      <footer className="mt-10 pt-4 border-t border-gray-200 text-xs text-gray-500">
        <p>
          Dossiê gerado automaticamente a partir do acervo público do Registra Brasil
          (<a href={SITE_URL} className="text-blue-700 hover:underline">{SITE_URL}</a>).
          Cada declaração é ligada à sua fonte primária; dúvidas ou pedidos de correção podem ser
          feitos em <a href="/retratacoes/solicitar" className="text-blue-700 hover:underline">/retratacoes/solicitar</a>.
        </p>
        <p className="mt-1">
          Licença CC BY 4.0. Cite &ldquo;Registra Brasil&rdquo; + URL permanente ao redistribuir.
        </p>
      </footer>
    </main>
  )
}
