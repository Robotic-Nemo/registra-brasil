import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'
import { ComparisonChart } from '@/components/stats/ComparisonChart'
import { buildCategoryComparison } from '@/lib/utils/compare'

interface Props {
  a: PoliticianCompareData
  b: PoliticianCompareData
}

export function CompareCategories({ a, b }: Props) {
  const categories = buildCategoryComparison(a, b)

  return (
    <ComparisonChart
      items={categories.map((c) => ({
        label: c.label,
        valueA: c.countA,
        valueB: c.countB,
      }))}
      labelA={a.name}
      labelB={b.name}
      colorA="#3b82f6"
      colorB="#ef4444"
      maxItems={12}
    />
  )
}
