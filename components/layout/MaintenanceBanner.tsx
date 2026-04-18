import { AlertTriangle, Info, AlertOctagon } from 'lucide-react'
import { getMaintenanceBanner } from '@/lib/utils/db-settings'

const TONE_CLASSES: Record<'info' | 'warn' | 'critical', string> = {
  info: 'bg-blue-50 border-blue-200 text-blue-900',
  warn: 'bg-amber-50 border-amber-200 text-amber-900',
  critical: 'bg-red-50 border-red-200 text-red-900',
}

/**
 * Renders a dismissible-via-admin-setting banner when the site-wide
 * `maintenance_banner` setting is enabled. Zero per-request cost when
 * disabled (cached). Placed under the header so it scrolls with
 * content rather than sticking.
 */
export async function MaintenanceBanner() {
  const banner = await getMaintenanceBanner().catch(() => null)
  if (!banner) return null

  const toneKey = (['info', 'warn', 'critical'] as const).includes(banner.tone) ? banner.tone : 'info'
  const tone = TONE_CLASSES[toneKey]
  const Icon = banner.tone === 'critical' ? AlertOctagon : banner.tone === 'warn' ? AlertTriangle : Info

  return (
    <div role="status" aria-live="polite" className={`border-b ${tone} px-4 py-2 text-sm`}>
      <div className="max-w-7xl mx-auto flex items-start gap-2">
        <Icon className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
        <span>{banner.text}</span>
      </div>
    </div>
  )
}
