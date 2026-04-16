import type { Metadata } from 'next'
import { Mail, Clock, MessageSquare } from 'lucide-react'

export const dynamic = 'force-static'

export const metadata: Metadata = {
  title: 'Contato — Registra Brasil',
  description: 'Entre em contato com a equipe do Registra Brasil.',
  alternates: { canonical: '/contato' },
}

export default function ContatoPage() {
  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <h1 className="text-2xl font-bold text-gray-900 mb-6">Contato</h1>

      <p className="text-sm text-gray-700 mb-8 leading-relaxed">
        Tem sugestões, correções ou dúvidas? Entre em contato conosco. Valorizamos o feedback da
        comunidade para manter o arquivo preciso e acessível.
      </p>

      <div className="grid gap-6 sm:grid-cols-2">
        <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <div className="flex items-center gap-2 text-blue-700">
            <Mail className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">E-mail</h2>
          </div>
          <p className="text-sm text-gray-600">
            Para questões gerais, correções ou sugestões:
          </p>
          <a
            href="mailto:contato@registrabrasil.com.br"
            className="inline-block text-sm text-blue-700 underline font-medium"
          >
            contato@registrabrasil.com.br
          </a>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <div className="flex items-center gap-2 text-blue-700">
            <Clock className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">Tempo de resposta</h2>
          </div>
          <p className="text-sm text-gray-600">
            Fazemos o possível para responder em até 5 dias úteis. Correções factuais têm
            prioridade.
          </p>
        </div>

        <div className="bg-white border border-gray-200 rounded-xl p-5 space-y-3 sm:col-span-2">
          <div className="flex items-center gap-2 text-blue-700">
            <MessageSquare className="w-5 h-5" aria-hidden="true" />
            <h2 className="font-semibold text-gray-900">O que pode reportar</h2>
          </div>
          <ul className="text-sm text-gray-600 list-disc pl-5 space-y-1">
            <li>Declarações atribuídas incorretamente</li>
            <li>Links de fontes quebrados ou incorretos</li>
            <li>Informações desatualizadas sobre políticos</li>
            <li>Problemas de acessibilidade no site</li>
            <li>Sugestões de novas funcionalidades</li>
            <li>Erros técnicos ou de exibição</li>
          </ul>
        </div>
      </div>
    </main>
  )
}
