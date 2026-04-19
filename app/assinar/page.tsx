import Link from 'next/link'
import type { Metadata } from 'next'
import { Rss, Mail, Bell, Calendar, History, BookOpen } from 'lucide-react'
import { getSupabaseServerClient } from '@/lib/supabase/server'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Assinar — Registra Brasil',
  description:
    'Todos os jeitos de acompanhar o Registra Brasil: RSS, Atom, boletim semanal por email, feeds específicos por político ou categoria.',
  alternates: { canonical: '/assinar' },
  openGraph: {
    title: 'Assinar — Registra Brasil',
    description: 'Todos os canais e feeds do Registra Brasil.',
    type: 'website',
    siteName: 'Registra Brasil',
  },
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

interface FeedRow {
  label: string
  description: string
  href: string
  format: string
}

const GLOBAL_FEEDS: FeedRow[] = [
  { label: 'Todas as declarações (RSS 2.0)', description: 'Tudo o que entra no acervo, verificado ou não.', href: '/feed.xml', format: 'RSS' },
  { label: 'Todas as declarações (Atom 1.0)', description: 'Mesma coisa, formato Atom.', href: '/atom.xml', format: 'Atom' },
]

const EDITORIAL_FEEDS: FeedRow[] = [
  { label: 'Declaração do dia', description: 'Uma seleção editorial por dia.', href: '/declaracao-do-dia/feed.xml', format: 'RSS' },
  { label: 'Agenda política', description: 'Próximos eventos selecionados pela equipe.', href: '/agenda/feed.xml', format: 'RSS' },
  { label: 'Registro editorial', description: 'Histórico público de revisões em declarações.', href: '/registro-editorial/feed.xml', format: 'RSS' },
]

const TOOLBELT_FEEDS: FeedRow[] = [
  { label: 'Busca salva (RSS)', description: 'Qualquer querystring de /buscar vira um feed. Use /api/saved-search/feed.xml?q=…&categoria=… para salvar uma busca específica.', href: '/api/saved-search/feed.xml', format: 'RSS' },
]

export default async function AssinarPage() {
  const supabase = await getSupabaseServerClient()
  const { data: topPolRaw } = await (supabase.from('politicians') as any)
    .select('slug, common_name, party, state')
    .eq('is_active', true)
    .order('common_name')
    .limit(400)
  const politicians = (topPolRaw ?? []) as Array<{ slug: string; common_name: string; party: string | null; state: string | null }>

  const { data: catRaw } = await (supabase.from('categories') as any)
    .select('slug, label_pt')
    .order('sort_order', { ascending: true })
  const categories = (catRaw ?? []) as Array<{ slug: string; label_pt: string }>

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <header className="mb-8">
        <p className="text-xs uppercase tracking-wider text-gray-500 dark:text-gray-400">
          Central de assinaturas
        </p>
        <h1 className="mt-1 flex items-center gap-2 text-3xl md:text-4xl font-bold text-gray-900 dark:text-gray-100">
          <Bell className="h-7 w-7 text-indigo-600" aria-hidden />
          Como acompanhar o Registra Brasil
        </h1>
        <p className="mt-2 max-w-2xl text-gray-600 dark:text-gray-300">
          Escolha o canal que melhor encaixa no seu fluxo: RSS, Atom, email,
          feed por político, feed por categoria, ou uma busca salva. Nenhum
          login é necessário para a maioria destes.
        </p>
      </header>

      <FeedSection
        title="Tudo do arquivo"
        icon={<Rss className="h-5 w-5 text-orange-500" />}
        rows={GLOBAL_FEEDS}
      />

      <FeedSection
        title="Curadoria editorial"
        icon={<BookOpen className="h-5 w-5 text-indigo-600" />}
        rows={EDITORIAL_FEEDS}
      />

      <Section
        title="Boletim semanal por email"
        icon={<Mail className="h-5 w-5 text-blue-600" />}
      >
        <p className="mb-3 text-sm text-gray-700 dark:text-gray-300">
          Toda segunda-feira, um resumo ranqueado por severidade e recência.
          Arquivo público:{' '}
          <Link href="/boletim" className="underline">/boletim</Link>.
        </p>
        <form
          action="/api/newsletter/subscribe"
          method="post"
          className="flex flex-col gap-2 sm:flex-row"
        >
          <input
            type="email"
            name="email"
            required
            placeholder="seu@email.com"
            className="flex-1 rounded border border-gray-300 bg-white px-3 py-2 text-sm dark:border-gray-700 dark:bg-gray-950"
          />
          <button
            type="submit"
            className="rounded bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700"
          >
            Inscrever
          </button>
        </form>
      </Section>

      <Section
        title="Feed por político"
        icon={<Rss className="h-5 w-5 text-orange-500" />}
      >
        <p className="mb-3 text-sm text-gray-700 dark:text-gray-300">
          Padrão da URL:{' '}
          <code className="rounded bg-gray-100 px-1 py-0.5 text-xs font-mono dark:bg-gray-800">
            {SITE_URL}/politico/&lt;slug&gt;/feed.xml
          </code>
        </p>
        {politicians.length > 0 && (
          <details>
            <summary className="cursor-pointer text-sm text-indigo-700 dark:text-indigo-300">
              Ver todos os {politicians.length} políticos ativos
            </summary>
            <ul className="mt-3 grid grid-cols-2 gap-1 text-xs sm:grid-cols-3 md:grid-cols-4">
              {politicians.map((p) => (
                <li key={p.slug}>
                  <a
                    href={`/politico/${p.slug}/feed.xml`}
                    className="inline-flex items-center gap-1 text-indigo-700 hover:underline dark:text-indigo-300"
                  >
                    <Rss className="h-2.5 w-2.5" />
                    {p.common_name} {p.party ? `(${p.party})` : ''}
                  </a>
                </li>
              ))}
            </ul>
          </details>
        )}
      </Section>

      <Section
        title="Feed por categoria"
        icon={<Rss className="h-5 w-5 text-orange-500" />}
      >
        <p className="mb-3 text-sm text-gray-700 dark:text-gray-300">
          Padrão da URL:{' '}
          <code className="rounded bg-gray-100 px-1 py-0.5 text-xs font-mono dark:bg-gray-800">
            {SITE_URL}/categorias/&lt;slug&gt;/feed.xml
          </code>
        </p>
        {categories.length > 0 && (
          <ul className="grid grid-cols-1 gap-1 text-sm sm:grid-cols-2">
            {categories.map((c) => (
              <li key={c.slug}>
                <a
                  href={`/categorias/${c.slug}/feed.xml`}
                  className="inline-flex items-center gap-1 text-indigo-700 hover:underline dark:text-indigo-300"
                >
                  <Rss className="h-3 w-3" />
                  {c.label_pt}
                </a>
              </li>
            ))}
          </ul>
        )}
      </Section>

      <FeedSection
        title="Ferramentas para jornalistas"
        icon={<History className="h-5 w-5 text-gray-700 dark:text-gray-300" />}
        rows={TOOLBELT_FEEDS}
      />

      <Section
        title="Redes sociais e repositórios"
        icon={<Calendar className="h-5 w-5 text-emerald-600" />}
      >
        <ul className="grid grid-cols-1 gap-2 text-sm sm:grid-cols-2">
          <li>
            <Link href="/dados" className="text-indigo-700 hover:underline dark:text-indigo-300">
              Dados abertos (dump completo)
            </Link>
          </li>
          <li>
            <Link href="/api-docs" className="text-indigo-700 hover:underline dark:text-indigo-300">
              API pública (REST + JSON)
            </Link>
          </li>
          <li>
            <Link href="/esta-semana" className="text-indigo-700 hover:underline dark:text-indigo-300">
              Recap semanal (HTML)
            </Link>
          </li>
          <li>
            <Link href="/crescimento" className="text-indigo-700 hover:underline dark:text-indigo-300">
              Crescimento do arquivo
            </Link>
          </li>
        </ul>
      </Section>

      <footer className="rounded-lg border border-gray-200 bg-gray-50 p-5 text-sm text-gray-600 dark:border-gray-800 dark:bg-gray-900/40 dark:text-gray-400">
        <p>
          Nenhum destes canais requer login. Para alertas em tempo real por
          email com critérios específicos, use{' '}
          <Link href="/meus-alertas" className="underline">/meus-alertas</Link>.
          Encontrou um feed quebrado?{' '}
          <Link href="/contato" className="underline">Avise a equipe</Link>.
        </p>
      </footer>
    </main>
  )
}

function Section({ title, icon, children }: { title: string; icon: React.ReactNode; children: React.ReactNode }) {
  return (
    <section className="mb-8 rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-800 dark:bg-gray-900">
      <h2 className="mb-3 flex items-center gap-2 text-lg font-semibold text-gray-900 dark:text-gray-100">
        {icon}
        {title}
      </h2>
      {children}
    </section>
  )
}

function FeedSection({ title, icon, rows }: { title: string; icon: React.ReactNode; rows: FeedRow[] }) {
  return (
    <Section title={title} icon={icon}>
      <ul className="divide-y divide-gray-100 dark:divide-gray-800">
        {rows.map((r) => (
          <li key={r.href} className="flex items-start gap-3 py-3">
            <span
              aria-hidden
              className="mt-0.5 shrink-0 rounded-full bg-orange-100 px-2 py-0.5 text-[10px] font-semibold text-orange-800 dark:bg-orange-950/40 dark:text-orange-200"
            >
              {r.format}
            </span>
            <div className="min-w-0 flex-1">
              <a
                href={r.href}
                className="font-medium text-indigo-700 hover:underline dark:text-indigo-300"
              >
                {r.label}
              </a>
              <p className="text-xs text-gray-600 dark:text-gray-400">{r.description}</p>
              <code className="text-[11px] text-gray-500 dark:text-gray-500">{r.href}</code>
            </div>
          </li>
        ))}
      </ul>
    </Section>
  )
}
