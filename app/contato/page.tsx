import type { Metadata } from 'next'
import Link from 'next/link'
import { Code2, MessageSquare, Clock, AlertTriangle } from 'lucide-react'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Contato — Registra Brasil',
  description: 'Canais de contato do Registra Brasil: correções, sugestões e reportes de problemas.',
  alternates: { canonical: '/contato' },
}

export default function ContatoPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Contato</h1>

      <p className="text-sm text-gray-700 mb-8 leading-relaxed">
        Tem sugestões, correções ou dúvidas? Use um dos canais abaixo. Valorizamos feedback da
        comunidade para manter o arquivo preciso, acessível e bem-intencionado.
      </p>

      <div className="grid gap-6 sm:grid-cols-2">
        <a
          href="https://github.com/Robotic-Nemo/registra-brasil/issues/new"
          rel="noopener noreferrer"
          target="_blank"
          className="group bg-white border border-gray-200 rounded-xl p-5 space-y-3 hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        >
          <div className="flex items-center gap-2 text-blue-700">
            <Code2 className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">Abrir issue no GitHub</h2>
          </div>
          <p className="text-sm text-gray-600">
            Canal principal para bugs, pedidos de funcionalidades, correções factuais e
            reportes de acessibilidade. Público e auditável por qualquer pessoa.
          </p>
          <span className="inline-block text-xs text-blue-700 group-hover:underline">
            github.com/Robotic-Nemo/registra-brasil
          </span>
        </a>

        <Link
          href="/retratacoes"
          className="group bg-white border border-gray-200 rounded-xl p-5 space-y-3 hover:border-blue-400 hover:shadow-sm transition-all focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-1 focus-visible:ring-blue-500"
        >
          <div className="flex items-center gap-2 text-amber-700">
            <AlertTriangle className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">Direito de resposta</h2>
          </div>
          <p className="text-sm text-gray-600">
            Agentes citados podem solicitar retificação, inclusão de esclarecimento ou remoção
            editorial pelos critérios descritos em <span className="underline">/termos §6</span>.
            Retratações ficam registradas publicamente.
          </p>
        </Link>

        <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <div className="flex items-center gap-2 text-blue-700">
            <Clock className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">Tempo de resposta</h2>
          </div>
          <p className="text-sm text-gray-600">
            Respondemos em até 5 dias úteis para pedidos gerais e em até 10 dias úteis para
            pedidos formais de correção editorial. Questões de segurança têm prioridade imediata.
          </p>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <div className="flex items-center gap-2 text-blue-700">
            <MessageSquare className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">O que reportar</h2>
          </div>
          <ul className="text-sm text-gray-600 list-disc pl-5 space-y-1">
            <li>Atribuição incorreta de declaração</li>
            <li>Links de fontes quebrados</li>
            <li>Informação desatualizada sobre político</li>
            <li>Problemas de acessibilidade</li>
            <li>Erros técnicos ou de exibição</li>
            <li>Sugestão de funcionalidade</li>
          </ul>
        </div>
      </div>

      <aside className="mt-10 bg-blue-50 border border-blue-200 rounded-lg p-5 text-sm text-blue-900">
        <strong>Descobriu uma vulnerabilidade de segurança?</strong> Divulgue responsavelmente
        abrindo uma{' '}
        <a
          href="https://github.com/Robotic-Nemo/registra-brasil/security/advisories/new"
          rel="noopener noreferrer"
          target="_blank"
          className="underline font-medium"
        >
          advisory privada no GitHub
        </a>{' '}
        antes de qualquer divulgação pública. Agradecemos seu cuidado.
      </aside>
    </main>
  )
}
