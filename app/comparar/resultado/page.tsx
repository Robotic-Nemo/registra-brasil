import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getPoliticianCompareData } from '@/lib/supabase/queries/compare'
import { buildCategoryComparison, interleaveStatements } from '@/lib/utils/compare'
import { CompareStats } from '@/components/compare/CompareStats'
import { CompareTable } from '@/components/compare/CompareTable'
import { CompareChart } from '@/components/compare/CompareChart'
import { CompareTimeline } from '@/components/compare/CompareTimeline'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import Link from 'next/link'
import type { Metadata } from 'next'

export const revalidate = 3600

export const metadata: Metadata = {
  title: 'Resultado da Comparacao — Registra Brasil',
  description: 'Comparacao detalhada entre dois politicos brasileiros.',
  alternates: { canonical: '/comparar/resultado' },
}

interface PageProps {
  searchParams: Promise<{ a?: string; b?: string }>
}

export default async function CompareResultPage({ searchParams }: PageProps) {
  const params = await searchParams
  const idA = params.a
  const idB = params.b

  if (!idA || !idB) {
    return (
      <main className="max-w-3xl mx-auto px-4 py-8">
        <p className="text-center text-gray-500 py-12">
          Selecione dois politicos para comparar.{' '}
          <Link href="/comparar" className="text-blue-600 hover:underline">
            Voltar
          </Link>
        </p>
      </main>
    )
  }

  const supabase = getSupabaseServiceClient()
  const [dataA, dataB] = await Promise.all([
    getPoliticianCompareData(supabase, idA),
    getPoliticianCompareData(supabase, idB),
  ])

  if (!dataA || !dataB) {
    return (
      <main className="max-w-3xl mx-auto px-4 py-8">
        <p className="text-center text-gray-500 py-12">
          Um ou mais politicos nao foram encontrados.{' '}
          <Link href="/comparar" className="text-blue-600 hover:underline">
            Voltar
          </Link>
        </p>
      </main>
    )
  }

  const categories = buildCategoryComparison(dataA, dataB)
  const interleaved = interleaveStatements(dataA, dataB)

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Comparar', href: '/comparar' },
          { label: `${dataA.name} vs ${dataB.name}` },
        ]}
      />

      <h1 className="text-2xl font-bold text-gray-900 mb-2">
        {dataA.name} vs {dataB.name}
      </h1>
      <p className="text-gray-600 mb-6">
        Comparacao detalhada de declaracoes verificadas.
      </p>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Resumo</h2>
        <CompareStats a={dataA} b={dataB} />
      </section>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Por categoria</h2>
        <CompareChart a={dataA} b={dataB} categories={categories} />
      </section>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Tabela detalhada</h2>
        <CompareTable a={dataA} b={dataB} categories={categories} />
      </section>

      <section className="mb-8">
        <h2 className="font-semibold text-gray-900 text-lg mb-4">Declaracoes recentes</h2>
        <CompareTimeline statements={interleaved} a={dataA} b={dataB} />
      </section>

      <div className="text-center">
        <Link
          href="/comparar"
          className="text-sm text-blue-600 hover:underline"
        >
          Fazer outra comparacao
        </Link>
      </div>
    </main>
  )
}
