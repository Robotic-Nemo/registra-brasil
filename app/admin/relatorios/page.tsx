import Link from 'next/link'
import { ArrowLeft, BarChart3 } from 'lucide-react'
import { ReportBuilder } from '@/components/admin/ReportBuilder'

export const dynamic = 'force-dynamic'

export default function RelatoriosPage() {
  return (
    <main className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <BarChart3 className="w-5 h-5 text-indigo-600" />
            Relatorios
          </h1>
          <p className="text-sm text-gray-500">
            Gere relatorios personalizados sobre as declaracoes
          </p>
        </div>
      </div>

      <ReportBuilder />
    </main>
  )
}
