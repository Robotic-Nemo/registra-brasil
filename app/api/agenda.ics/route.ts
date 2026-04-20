import { NextRequest } from 'next/server'
import { checkRateLimit, getRateLimitKey } from '@/lib/utils/rate-limit'
import { listEvents, kindLabel } from '@/lib/agenda/queries'

export const runtime = 'nodejs'
export const revalidate = 900

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'
const PRODID = '-//Registra Brasil//Agenda//PT-BR'

// Fold per RFC 5545: lines >75 octets must be split with CRLF + space.
function fold(line: string): string {
  if (line.length <= 73) return line
  const out: string[] = []
  let rest = line
  while (rest.length > 73) {
    out.push(rest.slice(0, 73))
    rest = rest.slice(73)
  }
  out.push(rest)
  return out.join('\r\n ')
}

// Escape per RFC 5545 §3.3.11 (text value).
function esc(s: string | null | undefined): string {
  if (!s) return ''
  return s
    .replace(/\\/g, '\\\\')
    .replace(/;/g, '\\;')
    .replace(/,/g, '\\,')
    .replace(/\n/g, '\\n')
    .replace(/\r/g, '')
}

function toUtcStamp(iso: string): string {
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return ''
  const pad = (n: number) => String(n).padStart(2, '0')
  return (
    d.getUTCFullYear().toString() +
    pad(d.getUTCMonth() + 1) +
    pad(d.getUTCDate()) +
    'T' +
    pad(d.getUTCHours()) +
    pad(d.getUTCMinutes()) +
    pad(d.getUTCSeconds()) +
    'Z'
  )
}

/**
 * GET /api/agenda.ics — iCal (RFC 5545) feed of political events.
 * Mirrors /api/agenda.json but for calendar subscribers.
 *   ?escopo=upcoming|past|all (default upcoming)
 *   ?limite=1..500 (default 200)
 */
export async function GET(request: NextRequest) {
  const rl = checkRateLimit(getRateLimitKey(request, 'agenda-ics'), {
    limit: 30, windowMs: 60_000,
  })
  if (!rl.allowed) return new Response('rate limited', { status: 429 })

  const scopeRaw = request.nextUrl.searchParams.get('escopo') ?? 'upcoming'
  const scope: 'upcoming' | 'past' | 'all' =
    scopeRaw === 'past' || scopeRaw === 'all' ? scopeRaw : 'upcoming'
  const lim = Math.max(1, Math.min(500, Number(request.nextUrl.searchParams.get('limite')) || 200))

  const events = await listEvents(scope, lim)
  const now = toUtcStamp(new Date().toISOString())

  const lines: string[] = [
    'BEGIN:VCALENDAR',
    'VERSION:2.0',
    fold(`PRODID:${PRODID}`),
    'CALSCALE:GREGORIAN',
    'METHOD:PUBLISH',
    fold('X-WR-CALNAME:Registra Brasil — Agenda'),
    fold('X-WR-CALDESC:Eventos políticos curados.'),
  ]

  for (const e of events) {
    const dtstart = toUtcStamp(e.event_date)
    const dtend = e.event_end_date ? toUtcStamp(e.event_end_date) : ''
    if (!dtstart) continue
    const url = `${SITE_URL}/agenda#${e.id}`
    const summary = e.politician
      ? `${e.title} — ${e.politician.common_name}`
      : e.title
    const descLines = [
      e.summary,
      e.body,
      `Categoria: ${kindLabel(e.kind)}`,
      e.source_url ? `Fonte: ${e.source_url}` : '',
      `Permalink: ${url}`,
    ].filter(Boolean).join('\\n')

    lines.push('BEGIN:VEVENT')
    lines.push(fold(`UID:${e.id}@registrabrasil.com.br`))
    lines.push(`DTSTAMP:${toUtcStamp(e.updated_at ?? e.created_at) || now}`)
    lines.push(`DTSTART:${dtstart}`)
    if (dtend) lines.push(`DTEND:${dtend}`)
    lines.push(fold(`SUMMARY:${esc(summary)}`))
    lines.push(fold(`DESCRIPTION:${esc(descLines)}`))
    if (e.location) lines.push(fold(`LOCATION:${esc(e.location)}`))
    lines.push(fold(`URL:${url}`))
    lines.push(fold(`CATEGORIES:${esc(kindLabel(e.kind))}`))
    lines.push('END:VEVENT')
  }
  lines.push('END:VCALENDAR')

  const body = lines.join('\r\n') + '\r\n'
  const etag = `W/"agenda-ics-${scope}-${events.length}-${events[0]?.updated_at?.replace(/\D/g, '') ?? 'empty'}"`
  if (request.headers.get('if-none-match') === etag) {
    return new Response(null, { status: 304, headers: { ETag: etag } })
  }

  return new Response(body, {
    headers: {
      'Content-Type': 'text/calendar; charset=utf-8',
      'Content-Disposition': 'inline; filename="registra-brasil-agenda.ics"',
      'Cache-Control': 'public, max-age=600, s-maxage=900, stale-while-revalidate=3600',
      ETag: etag,
    },
  })
}
