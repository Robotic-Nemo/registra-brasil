/**
 * shields.io-style SVG badge renderer, edge-runtime friendly.
 * Used by /api/badge/* to produce label|value badges that embed
 * cleanly in READMEs and dashboards via `<img src=...>`.
 *
 * Approximates Verdana 11px text width without a metrics table
 * so we stay portable on the edge (no canvas, no @resvg).
 */

function esc(s: string): string {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}

function textWidth(s: string): number {
  let w = 0
  for (const ch of s) {
    if (/[A-Z]/.test(ch)) w += 8
    else if (/[a-z0-9]/.test(ch)) w += 7
    else if (ch === ' ') w += 4
    else w += 6
  }
  return w
}

export function isHexColor(s: string): boolean {
  return /^#[0-9a-f]{3,8}$/i.test(s)
}

export function renderBadge(label: string, value: string, color = '#d97706'): string {
  const pad = 6
  const lw = textWidth(label) + pad * 2
  const vw = textWidth(value) + pad * 2
  const total = lw + vw
  const h = 20

  return `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${total}" height="${h}" role="img" aria-label="${esc(label)}: ${esc(value)}">
  <title>${esc(label)}: ${esc(value)}</title>
  <linearGradient id="s" x2="0" y2="100%">
    <stop offset="0" stop-opacity=".1" stop-color="#bbb"/>
    <stop offset="1" stop-opacity=".1"/>
  </linearGradient>
  <clipPath id="r"><rect width="${total}" height="${h}" rx="3" fill="#fff"/></clipPath>
  <g clip-path="url(#r)">
    <rect width="${lw}" height="${h}" fill="#555"/>
    <rect x="${lw}" width="${vw}" height="${h}" fill="${color}"/>
    <rect width="${total}" height="${h}" fill="url(#s)"/>
  </g>
  <g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" font-size="11">
    <text x="${lw / 2}" y="14" fill="#010101" fill-opacity=".3">${esc(label)}</text>
    <text x="${lw / 2}" y="13">${esc(label)}</text>
    <text x="${lw + vw / 2}" y="14" fill="#010101" fill-opacity=".3">${esc(value)}</text>
    <text x="${lw + vw / 2}" y="13">${esc(value)}</text>
  </g>
</svg>`
}

export function badgeHeaders(): ResponseInit {
  return {
    headers: {
      'Content-Type': 'image/svg+xml; charset=utf-8',
      'Cache-Control': 'public, max-age=1800, s-maxage=3600, stale-while-revalidate=86400',
    },
  }
}
