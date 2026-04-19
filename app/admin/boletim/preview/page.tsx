import Link from 'next/link'
import { ArrowLeft, Mail, CheckCircle2, AlertTriangle } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { buildWeeklyDigest } from '@/lib/newsletter/build-digest'

export const dynamic = 'force-dynamic'

function fmtWhen(iso: string | null): string {
  if (!iso) return '—'
  return new Date(iso).toLocaleString('pt-BR', {
    year: 'numeric', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

export default async function AdminDigestPreviewPage() {
  const digest = await buildWeeklyDigest()
  const supabase = getSupabaseServiceClient()

  const [existingRes, subsRes] = await Promise.all([
    (supabase.from('newsletter_digests') as any)
      .select('id, sent_at, recipient_count, subject')
      .eq('week_of', digest.weekOf)
      .maybeSingle(),
    (supabase.from('newsletter_subscribers') as any)
      .select('id', { count: 'exact', head: true })
      .eq('is_confirmed', true),
  ])

  const existing = existingRes.data as
    | { id: string; sent_at: string | null; recipient_count: number; subject: string }
    | null
  const subscriberCount = Number(subsRes.count ?? 0)

  return (
    <main className="max-w-5xl mx-auto px-4 py-6">
      <nav className="mb-4 text-sm">
        <Link
          href="/admin"
          className="inline-flex items-center gap-1 text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-100"
        >
          <ArrowLeft className="h-4 w-4" /> Admin
        </Link>
      </nav>
      <header className="mb-6 flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-2">
          <Mail className="h-5 w-5 text-indigo-600" aria-hidden />
          <h1 className="text-2xl font-bold text-gray-900 dark:text-gray-100">
            Preview do boletim — semana de {digest.weekOf}
          </h1>
        </div>
      </header>

      <section className="mb-6 grid grid-cols-1 gap-3 md:grid-cols-3">
        <Stat label="Itens selecionados" value={digest.items.length.toString()} />
        <Stat label="Inscritos confirmados" value={subscriberCount.toLocaleString('pt-BR')} />
        <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
            Status desta semana
          </dt>
          {existing?.sent_at ? (
            <dd className="mt-1 flex items-center gap-1 text-sm font-medium text-emerald-700 dark:text-emerald-300">
              <CheckCircle2 className="h-4 w-4" />
              Já enviado em {fmtWhen(existing.sent_at)} para {existing.recipient_count} destinatário(s)
            </dd>
          ) : existing ? (
            <dd className="mt-1 flex items-center gap-1 text-sm font-medium text-amber-700 dark:text-amber-300">
              <AlertTriangle className="h-4 w-4" />
              Digest registrado mas não enviado
            </dd>
          ) : (
            <dd className="mt-1 text-sm text-gray-700 dark:text-gray-300">
              Pendente — será enviado pelo cron de segunda-feira
            </dd>
          )}
        </div>
      </section>

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Assunto + pré-cabeçalho
        </h2>
        <p className="mb-1 rounded border border-gray-200 bg-gray-50 px-3 py-2 text-sm dark:border-gray-800 dark:bg-gray-950">
          <strong>De:</strong> Registra Brasil &lt;boletim@registrabrasil.com.br&gt;<br />
          <strong>Assunto:</strong> {digest.subject}
        </p>
        <p className="text-xs italic text-gray-600 dark:text-gray-400">
          Pré-header: {digest.preview}
        </p>
      </section>

      <section className="mb-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
        <h2 className="mb-2 text-sm font-semibold text-gray-900 dark:text-gray-100">
          Itens ranqueados
        </h2>
        {digest.items.length === 0 ? (
          <p className="text-sm text-gray-500">
            Nenhuma declaração criada nos últimos 7 dias. O cron vai{' '}
            <code>skipped=no_statements_this_week</code> e não gerar email.
          </p>
        ) : (
          <ol className="flex flex-col gap-1.5 text-sm">
            {digest.items.map((it) => (
              <li key={it.id} className="flex items-baseline gap-2">
                <span className="shrink-0 tabular-nums text-xs text-gray-500 dark:text-gray-400">
                  {it.score.toFixed(2)}
                </span>
                <Link
                  href={`/declaracao/${it.slug ?? it.id}`}
                  className="min-w-0 flex-1 truncate text-indigo-700 hover:underline dark:text-indigo-300"
                >
                  {it.politician?.common_name ? `${it.politician.common_name}: ` : ''}
                  {it.summary}
                </Link>
                <span className="shrink-0 text-xs text-gray-500 dark:text-gray-400">
                  sev {it.severity_score ?? '—'} · {it.statement_date}
                </span>
              </li>
            ))}
          </ol>
        )}
        <p className="mt-3 text-[11px] text-gray-500 dark:text-gray-500">
          Score = <code>severidade × exp(-idade_dias / 4)</code>. Decaimento
          aproxima meia-vida de ~2,8 dias — uma declaração de segunda pesa
          menos do que uma de sexta.
        </p>
      </section>

      <section className="rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
        <div className="flex items-center justify-between border-b border-gray-100 px-4 py-2 dark:border-gray-800">
          <h2 className="text-sm font-semibold text-gray-900 dark:text-gray-100">
            Preview HTML
          </h2>
          <span className="text-xs text-gray-500">largura de referência: 600px</span>
        </div>
        <iframe
          title="Preview do boletim"
          srcDoc={digest.html}
          sandbox=""
          className="w-full"
          style={{ height: '900px', border: 0 }}
        />
      </section>

      <footer className="mt-6 text-xs text-gray-500 dark:text-gray-500">
        Esta página é reexecutada a cada request — recarregue após aprovar
        uma nova declaração para ver como o ranking muda. O envio real
        acontece às 10h37 (horário de Brasília) da segunda-feira pelo cron{' '}
        <code>/api/maintenance/weekly-digest</code>.
      </footer>
    </main>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
      <dt className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">{label}</dt>
      <dd className="mt-1 text-2xl font-bold tabular-nums text-gray-900 dark:text-gray-100">{value}</dd>
    </div>
  )
}
