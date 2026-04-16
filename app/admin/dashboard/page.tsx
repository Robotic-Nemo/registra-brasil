import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import {
  getDashboardMetrics,
  getWeeklyCounts,
  getPendingReviewItems,
  getRecentEditItems,
  getTopContributors,
  getStatementDateDistribution,
} from '@/lib/supabase/queries/dashboard'
import { DashboardChart } from '@/components/admin/DashboardChart'
import { DashboardMetrics } from '@/components/admin/DashboardMetrics'
import { PendingReviewList } from '@/components/admin/PendingReviewList'
import { RecentEditsTimeline } from '@/components/admin/RecentEditsTimeline'
import { TopContributors } from '@/components/admin/TopContributors'
import { ContentCalendar } from '@/components/admin/ContentCalendar'
import { SystemHealth } from '@/components/admin/SystemHealth'

export const dynamic = 'force-dynamic'

export default async function AdminDashboardPage() {
  const supabase = getSupabaseServiceClient()

  const [metrics, weeklyCounts, pendingItems, recentEdits, contributors, dateDist] =
    await Promise.all([
      getDashboardMetrics(supabase),
      getWeeklyCounts(supabase, 12),
      getPendingReviewItems(supabase, 10),
      getRecentEditItems(supabase, 10),
      getTopContributors(supabase, 5),
      getStatementDateDistribution(supabase),
    ])

  // Check DB connectivity
  const { error: dbError } = await supabase.from('statements').select('id', { head: true, count: 'exact' }).limit(1)
  const lastUpdated = recentEdits[0]?.reviewed_at ?? null

  return (
    <main className="max-w-6xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link
          href="/admin"
          className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors"
          aria-label="Voltar"
        >
          <ArrowLeft className="w-5 h-5 text-gray-500" />
        </Link>
        <div>
          <h1 className="text-xl font-bold text-gray-900">Dashboard</h1>
          <p className="text-sm text-gray-500">Visao geral do sistema</p>
        </div>
      </div>

      {/* Metrics */}
      <section className="mb-6">
        <DashboardMetrics metrics={metrics} />
      </section>

      {/* Chart + Calendar row */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
        <div className="lg:col-span-2">
          <DashboardChart data={weeklyCounts} />
        </div>
        <div>
          <ContentCalendar dateCounts={dateDist} />
        </div>
      </div>

      {/* Pending + Recent row */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
        <PendingReviewList items={pendingItems} />
        <RecentEditsTimeline items={recentEdits} />
      </div>

      {/* Contributors + System Health row */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <TopContributors contributors={contributors} />
        <SystemHealth
          dbConnected={!dbError}
          statementCount={metrics.totalStatements}
          cacheEnabled={true}
          lastUpdated={lastUpdated}
        />
      </div>
    </main>
  )
}
