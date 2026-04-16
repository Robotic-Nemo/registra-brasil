import type { PoliticianCompareData } from '@/lib/supabase/queries/compare'
import type { CategoryComparison } from '@/lib/utils/compare'

interface Props {
  a: PoliticianCompareData
  b: PoliticianCompareData
  categories: CategoryComparison[]
}

export function CompareTable({ a, b, categories }: Props) {
  return (
    <div className="bg-white border border-gray-200 rounded-xl overflow-hidden">
      <table className="w-full text-sm">
        <thead>
          <tr className="bg-gray-50">
            <th className="text-left px-4 py-3 font-medium text-gray-600">Categoria</th>
            <th className="text-right px-4 py-3 font-medium text-blue-600">{a.name}</th>
            <th className="text-right px-4 py-3 font-medium text-red-600">{b.name}</th>
            <th className="text-right px-4 py-3 font-medium text-gray-500">Diferenca</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100">
          {categories.map((cat) => {
            const diff = cat.countA - cat.countB
            return (
              <tr key={cat.slug} className="hover:bg-gray-50 transition-colors">
                <td className="px-4 py-2">
                  <div className="flex items-center gap-2">
                    <div className="w-2.5 h-2.5 rounded-full" style={{ backgroundColor: cat.color }} />
                    <span className="text-gray-800">{cat.label}</span>
                  </div>
                </td>
                <td className="text-right px-4 py-2 tabular-nums text-gray-900 font-medium">
                  {cat.countA}
                </td>
                <td className="text-right px-4 py-2 tabular-nums text-gray-900 font-medium">
                  {cat.countB}
                </td>
                <td className="text-right px-4 py-2 tabular-nums">
                  <span className={diff > 0 ? 'text-blue-600' : diff < 0 ? 'text-red-600' : 'text-gray-400'}>
                    {diff > 0 ? '+' : ''}{diff}
                  </span>
                </td>
              </tr>
            )
          })}
          <tr className="bg-gray-50 font-semibold">
            <td className="px-4 py-2 text-gray-800">Total</td>
            <td className="text-right px-4 py-2 tabular-nums text-blue-700">{a.totalStatements}</td>
            <td className="text-right px-4 py-2 tabular-nums text-red-700">{b.totalStatements}</td>
            <td className="text-right px-4 py-2 tabular-nums text-gray-600">
              {a.totalStatements - b.totalStatements > 0 ? '+' : ''}
              {a.totalStatements - b.totalStatements}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  )
}
