import type { Metadata } from 'next'
import Link from 'next/link'
import { getSupabaseServerClient } from '@/lib/supabase/server'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import { buildTransparencyReport } from '@/lib/utils/transparency'
import { Shield, Scale, Inbox, History, FolderKanban, Flag } from 'lucide-react'

export const revalidate = 1800

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

export const metadata: Metadata = {
  title: 'Transparência — Registra Brasil',
  description: 'Métricas editoriais públicas do Registra Brasil: correções, retratações, submissões, reações e importações ao longo do tempo.',
  alternates: {
    canonical: '/transparencia',
    types: { 'application/json': '/api/transparencia.json' },
  },
  openGraph: {
    title: 'Transparência — Registra Brasil',
    description: 'Métricas editoriais públicas do arquivo.',
    type: 'website',
    url: `${SITE_URL}/transparencia`,
  },
}

function pct(n: number): string {
  return `${Math.round(n * 100)}%`
}

export default async function TransparenciaPage() {
  const supabase = await getSupabaseServerClient()
  const report = await buildTransparencyReport(supabase)

  const maxMonthly = Math.max(
    1,
    ...report.monthly.flatMap((m) => [m.revisions, m.new_statements, m.submissions_received, m.retractions_opened]),
  )

  return (
    <main className="max-w-4xl mx-auto px-4 py-10">
      <Breadcrumbs items={[{ label: 'Transparência' }]} />

      <header className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <Shield className="w-7 h-7 text-blue-700" aria-hidden="true" />
          <h1 className="text-2xl font-bold text-gray-900">Transparência editorial</h1>
        </div>
        <p className="text-sm text-gray-700 max-w-3xl leading-relaxed">
          Indicadores públicos de atividade editorial do Registra Brasil. Atualizado a cada 30
          minutos. Esta mesma base está disponível como JSON aberto em{' '}
          <a href="/api/transparencia.json" className="underline text-blue-700">/api/transparencia.json</a>{' '}
          (licença CC BY 4.0).
        </p>
        <p className="text-xs text-gray-500 mt-2">
          Geração: {new Date(report.generated_at).toLocaleString('pt-BR')}
        </p>
      </header>

      {/* Top-level totals */}
      <section className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-10">
        {[
          { label: 'Declarações', value: report.totals.statements, color: 'text-blue-700' },
          { label: 'Verificadas', value: report.totals.verified, color: 'text-green-700' },
          { label: 'Contestadas', value: report.totals.disputed, color: 'text-orange-700' },
          { label: 'Removidas', value: report.totals.removed, color: 'text-red-700' },
          { label: 'Políticos ativos', value: report.totals.politicians, color: 'text-gray-800' },
          { label: 'Categorias', value: report.totals.categories, color: 'text-gray-800' },
          { label: 'Checagens externas', value: report.totals.fact_checks, color: 'text-gray-800' },
          { label: 'Reações do público', value: Object.values(report.reactions).reduce((a, b) => a + b, 0), color: 'text-gray-800' },
        ].map((s) => (
          <div key={s.label} className="bg-white border border-gray-200 rounded-lg p-4 text-center">
            <p className={`text-2xl font-bold tabular-nums ${s.color}`}>{s.value.toLocaleString('pt-BR')}</p>
            <p className="text-xs text-gray-500 mt-1">{s.label}</p>
          </div>
        ))}
      </section>

      {/* Accountability sections */}
      <section className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-10">
        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <History className="w-4 h-4 text-blue-700" />
            Correções e revisões
          </h2>
          <p className="text-xs text-gray-600 mb-3">
            Toda edição em uma declaração publicada gera um registro público. Últimos 30 dias:
            <strong className="ml-1">{report.revisions.last_30_days}</strong> mudanças.
          </p>
          <p className="text-lg font-bold text-gray-900 tabular-nums">{report.revisions.total.toLocaleString('pt-BR')}</p>
          <p className="text-xs text-gray-500 mb-3">revisões registradas no total</p>
          <ul className="text-xs text-gray-700 space-y-1">
            {report.revisions.by_actor.slice(0, 5).map((a) => (
              <li key={a.actor} className="flex justify-between">
                <span>{a.actor}</span>
                <span className="tabular-nums">{a.count}</span>
              </li>
            ))}
          </ul>
          <Link href="/atualizacoes" className="inline-block mt-3 text-xs text-blue-700 hover:underline">Ver log completo →</Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <Scale className="w-4 h-4 text-amber-700" />
            Direito de resposta / retratações
          </h2>
          <p className="text-xs text-gray-600 mb-3">
            Pedidos públicos de correção ou resposta (CF art. 5º V / Lei 13.188/2015).
            Últimos 30 dias: <strong>{report.retractions.last_30_days}</strong>.
          </p>
          <p className="text-lg font-bold text-gray-900 tabular-nums">{report.retractions.total.toLocaleString('pt-BR')}</p>
          <p className="text-xs text-gray-500 mb-3">pedidos totais</p>
          <ul className="text-xs text-gray-700 space-y-1">
            {Object.entries(report.retractions.by_status).map(([k, v]) => (
              <li key={k} className="flex justify-between">
                <span>{k}</span>
                <span className="tabular-nums">{v}</span>
              </li>
            ))}
          </ul>
          <Link href="/retratacoes" className="inline-block mt-3 text-xs text-blue-700 hover:underline">Ver histórico →</Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <Inbox className="w-4 h-4 text-green-700" />
            Submissões públicas
          </h2>
          <p className="text-xs text-gray-600 mb-3">
            Sugestões de declarações enviadas pelo público. Taxa de aceitação:{' '}
            <strong>{pct(report.submissions.acceptance_rate)}</strong> (aprovadas sobre decididas).
          </p>
          <p className="text-lg font-bold text-gray-900 tabular-nums">{report.submissions.total.toLocaleString('pt-BR')}</p>
          <p className="text-xs text-gray-500 mb-3">submissões totais · {report.submissions.last_30_days} nos últimos 30 dias</p>
          <ul className="text-xs text-gray-700 space-y-1">
            {Object.entries(report.submissions.by_status).map(([k, v]) => (
              <li key={k} className="flex justify-between">
                <span>{k}</span>
                <span className="tabular-nums">{v}</span>
              </li>
            ))}
          </ul>
          <Link href="/sugerir" className="inline-block mt-3 text-xs text-blue-700 hover:underline">Enviar sugestão →</Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <Flag className="w-4 h-4 text-red-700" />
            Reações do público
          </h2>
          <p className="text-xs text-gray-600 mb-3">
            Cada leitor pode classificar uma declaração em até 4 categorias (importante, contestada, fora de contexto, erro).
          </p>
          <ul className="text-xs text-gray-700 space-y-1">
            {Object.entries(report.reactions).map(([k, v]) => (
              <li key={k} className="flex justify-between">
                <span>{k.replace(/_/g, ' ')}</span>
                <span className="tabular-nums">{v}</span>
              </li>
            ))}
            {Object.keys(report.reactions).length === 0 && (
              <li className="text-gray-500">Nenhuma reação registrada ainda.</li>
            )}
          </ul>
          <Link href="/buscar" className="inline-block mt-3 text-xs text-blue-700 hover:underline">Explorar declarações →</Link>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5 md:col-span-2">
          <h2 className="text-sm font-semibold text-gray-900 mb-3 flex items-center gap-2">
            <FolderKanban className="w-4 h-4 text-purple-700" />
            Importações em lote
          </h2>
          <div className="grid grid-cols-3 gap-3 text-center text-sm">
            <div>
              <p className="text-xl font-bold tabular-nums text-gray-900">{report.imports.total_batches.toLocaleString('pt-BR')}</p>
              <p className="text-xs text-gray-500">lotes</p>
            </div>
            <div>
              <p className="text-xl font-bold tabular-nums text-green-700">{report.imports.rows_created.toLocaleString('pt-BR')}</p>
              <p className="text-xs text-gray-500">declarações criadas por lote</p>
            </div>
            <div>
              <p className="text-xl font-bold tabular-nums text-red-700">{report.imports.batches_reverted.toLocaleString('pt-BR')}</p>
              <p className="text-xs text-gray-500">lotes revertidos</p>
            </div>
          </div>
        </div>
      </section>

      {/* Monthly activity bars */}
      <section className="mb-10">
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Últimos 12 meses</h2>
        <div className="bg-white border border-gray-200 rounded-xl p-5 overflow-x-auto">
          <table className="w-full text-xs">
            <thead>
              <tr className="text-left text-gray-500 uppercase">
                <th className="py-1 pr-3">Mês</th>
                <th className="py-1 pr-3">Novas</th>
                <th className="py-1 pr-3">Revisões</th>
                <th className="py-1 pr-3">Submissões</th>
                <th className="py-1 pr-3">Retratações</th>
                <th className="py-1">Atividade</th>
              </tr>
            </thead>
            <tbody>
              {report.monthly.map((m) => {
                const total = m.new_statements + m.revisions + m.submissions_received + m.retractions_opened
                return (
                  <tr key={m.month} className="border-t border-gray-100">
                    <td className="py-1.5 pr-3 font-mono">{m.month}</td>
                    <td className="py-1.5 pr-3 tabular-nums">{m.new_statements}</td>
                    <td className="py-1.5 pr-3 tabular-nums">{m.revisions}</td>
                    <td className="py-1.5 pr-3 tabular-nums">{m.submissions_received}</td>
                    <td className="py-1.5 pr-3 tabular-nums">{m.retractions_opened}</td>
                    <td className="py-1.5">
                      <div className="h-2 bg-gray-100 rounded-full overflow-hidden w-40" aria-label={`${total} eventos`}>
                        <div className="h-full bg-gradient-to-r from-blue-400 to-blue-700" style={{ width: `${(total / (maxMonthly * 4)) * 100}%` }} />
                      </div>
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      </section>

      <footer className="text-xs text-gray-500 border-t border-gray-200 pt-4">
        Dados colhidos diretamente do banco público. Nenhum indicador é calculado offline; se
        você encontrar números diferentes em outros lugares do site, esta é a versão autoritária.
      </footer>
    </main>
  )
}
