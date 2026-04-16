import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { YearSelector } from '@/components/timeline/YearSelector'
import { MonthGroup } from '@/components/timeline/MonthGroup'
import { Breadcrumbs } from '@/components/ui/Breadcrumbs'
import type { Metadata } from 'next'

interface PageProps {
  params: Promise<{ year: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { year } = await params
  return {
    title: `Linha do Tempo ${year} — Registra Brasil`,
    description: `Declaracoes verificadas de politicos brasileiros em ${year}.`,
    alternates: { canonical: `/linha-do-tempo/${year}` },
  }
}

export const revalidate = 1800

const MONTH_NAMES = [
  'Janeiro', 'Fevereiro', 'Marco', 'Abril', 'Maio', 'Junho',
  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
]

export default async function YearTimelinePage({ params }: PageProps) {
  const { year: yearStr } = await params
  const year = parseInt(yearStr)

  if (isNaN(year) || year < 2000 || year > 2100) {
    return (
      <main className="max-w-3xl mx-auto px-4 py-8">
        <p className="text-center text-gray-500 py-12">Ano invalido.</p>
      </main>
    )
  }

  const supabase = getSupabaseServiceClient()

  // Get available years
  const { data: yearData } = await supabase
    .from('statements')
    .select('statement_date')
    .eq('verification_status', 'verified')
    .order('statement_date', { ascending: true })

  const availableYears = [...new Set(
    ((yearData ?? []) as { statement_date: string }[])
      .map((r) => parseInt(r.statement_date.slice(0, 4)))
      .filter((y) => !isNaN(y))
  )].sort()

  // Get statements for the year
  const { data: statements } = await supabase
    .from('statements')
    .select('id, summary, statement_date, politicians!inner(slug, common_name, party)')
    .eq('verification_status', 'verified')
    .gte('statement_date', `${year}-01-01`)
    .lte('statement_date', `${year}-12-31`)
    .order('statement_date', { ascending: false })

  type StmtRow = {
    id: string
    summary: string
    statement_date: string
    politicians: { slug: string; common_name: string; party: string }
  }

  const stmts = (statements ?? []) as unknown as StmtRow[]

  // Group by month
  const grouped = new Map<string, StmtRow[]>()
  for (const s of stmts) {
    const monthKey = s.statement_date.slice(0, 7)
    const existing = grouped.get(monthKey) ?? []
    existing.push(s)
    grouped.set(monthKey, existing)
  }

  const months = Array.from(grouped.entries()).sort((a, b) => b[0].localeCompare(a[0]))

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <Breadcrumbs
        items={[
          { label: 'Linha do Tempo', href: '/linha-do-tempo' },
          { label: String(year) },
        ]}
      />
      <h1 className="text-2xl font-bold text-gray-900 mb-4">Linha do Tempo — {year}</h1>

      <div className="mb-6">
        <YearSelector years={availableYears} currentYear={year} />
      </div>

      <p className="text-sm text-gray-500 mb-6">
        {stmts.length} {stmts.length === 1 ? 'declaracao' : 'declaracoes'} em {year}
      </p>

      {months.length === 0 ? (
        <p className="text-center text-gray-500 py-12">Nenhuma declaracao encontrada em {year}.</p>
      ) : (
        <div className="space-y-6">
          {months.map(([monthKey, entries]) => {
            const monthIdx = parseInt(monthKey.split('-')[1]) - 1
            return (
              <MonthGroup
                key={monthKey}
                monthKey={monthKey}
                monthLabel={`${MONTH_NAMES[monthIdx]} ${year}`}
                entries={entries.map((e) => ({
                  id: e.id,
                  summary: e.summary,
                  statement_date: e.statement_date,
                  politician_name: e.politicians.common_name,
                  politician_slug: e.politicians.slug,
                  politician_party: e.politicians.party,
                }))}
              />
            )
          })}
        </div>
      )}
    </main>
  )
}
