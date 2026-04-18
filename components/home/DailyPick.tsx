import Link from 'next/link'
import Image from 'next/image'
import { Sparkles } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { getTodaysPick } from '@/lib/supabase/queries/daily-pick'

/**
 * "Declaração do dia" — editorial pick rendered as a hero card. Uses
 * the fallback logic in the query helper, so it only returns null if
 * the archive has literally zero eligible statements.
 */
export async function DailyPick() {
  const supabase = getSupabaseServiceClient()
  const pick = await getTodaysPick(supabase).catch(() => null)
  if (!pick) return null

  const s = pick.statement
  const pol = s.politicians
  const body = s.full_quote ?? s.summary
  const trimmed = body.length > 280 ? body.slice(0, 277) + '…' : body

  return (
    <section aria-labelledby="daily-pick-heading" className="bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-2xl p-6 md:p-8">
      <div className="flex items-center gap-2 mb-3">
        <Sparkles className="w-5 h-5 text-blue-700" aria-hidden="true" />
        <h2 id="daily-pick-heading" className="text-sm font-semibold uppercase tracking-wider text-blue-900">
          Declaração do dia
        </h2>
        {pick.isManual && (
          <span className="text-[10px] font-medium px-1.5 py-0.5 rounded bg-blue-200 text-blue-900">curadoria</span>
        )}
      </div>

      {pick.curatorNote && (
        <p className="text-sm text-blue-900 italic mb-4">&ldquo;{pick.curatorNote}&rdquo;</p>
      )}

      <div className="flex items-start gap-4">
        {pol?.photo_url && (
          <Image
            src={pol.photo_url}
            alt=""
            width={64}
            height={64}
            unoptimized
            className="w-16 h-16 rounded-full object-cover border-2 border-white flex-shrink-0"
          />
        )}
        <div className="flex-1 min-w-0">
          {pol && (
            <p className="text-sm text-blue-900 font-semibold mb-1">
              <Link href={`/politico/${pol.slug}`} className="hover:underline">
                {pol.common_name}
              </Link>{' '}
              <span className="text-blue-700">({pol.party}{pol.state ? '-' + pol.state : ''})</span>
            </p>
          )}
          <blockquote className="text-gray-900 text-lg md:text-xl leading-snug font-medium mb-3">
            &ldquo;{trimmed}&rdquo;
          </blockquote>
          <div className="flex items-center gap-3 text-xs text-blue-800">
            <time dateTime={s.statement_date}>{s.statement_date}</time>
            {s.severity_score && <span>· severidade {s.severity_score}</span>}
            <Link href={`/declaracao/${s.slug ?? s.id}`} className="ml-auto text-blue-700 hover:text-blue-900 hover:underline font-medium">
              Ver completa →
            </Link>
          </div>
        </div>
      </div>

      <p className="text-[11px] text-blue-700 mt-4 border-t border-blue-200 pt-3">
        <Link href="/declaracao-do-dia" className="hover:underline">Ver arquivo de picks anteriores →</Link>
      </p>
    </section>
  )
}
