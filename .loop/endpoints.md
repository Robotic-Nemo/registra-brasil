# Endpoint inventory (as of Run 132)

Regenerate / cross-check with:

```
find app/api -name 'route.ts' | sed 's|app/api/||; s|/route.ts||' | sort
```

## Scope × facet matrix

Scopes: **politico** · **partidos** · **estados** · **categorias**
Facets tracked: stats · sparkline.svg · severity.svg · politicos · sources · categorias · declaracoes · export

| facet             | politico | partidos | estados | categorias |
|-------------------|----------|----------|---------|------------|
| stats.json        | ✔        | ✔        | ✔       | ✔          |
| sparkline.svg     | ✔        | ✔        | ✔       | ✔          |
| severity.svg      | ✔        | ✔        | ✔       | ✔          |
| politicos.json    | —        | ✔        | ✔       | ✔          |
| sources.json      | ✔        | ✔        | ✔       | ✔          |
| categorias.json   | ✔        | ✔        | ✔       | —          |
| partidos.json     | —        | —        | —       | ✔          |
| declaracoes.json  | ✔        | ✔        | ✔       | ✔          |
| export            | ✔        | ✔        | ✔       | ✔          |
| feed.xml (RSS)    | ✔ (page) | ✔ (page) | ✔ (page)| ✔ (page)   |

Politico-only extras: `contradictions.json`, `fact-checks.json`,
`peers.json`, `similar.json`, `sparkline.json`, `timeline.json`,
`timeline.svg`.

## Gap-find

Scan the matrix above for `—` cells. Current open slots:

- `politico/:slug/politicos.json` — doesn't make sense (self)
- `categorias/:slug/categorias.json` — meta; skip unless hierarchies emerge
- `politico/:slug/partidos.json` — a career history would need schema; skip unless schema exists

## Top-level

- `/api/politicos.json` (directory)
- `/api/partidos.json`, `/api/estados.json`, `/api/categorias.json`
- `/api/fontes.json` (global source catalog)
- `/api/declaracoes.json` (top-level cursor list)
- `/api/fontes/[domain].json`
- `/api/declaracao/[id]/{route,cite.txt,cite.md,similar.json,revisions,fact-checks,context}.json`
- Rankings: `/api/ranking.json`, `/api/top-partidos.json`,
  `/api/top-estados.json`
- Feeds: `/api/recent.json`, `/api/destaques.json`,
  `/api/tendencias.json`, `/api/esta-semana.json`,
  `/api/historias.json`, `/api/aleatoria.json`
- Search: `/api/search.json`, `/api/search/facets.json`, `/api/v2/*`
- Exports: `/api/dump/*`, `/api/export`, `/api/declaracao/*/cite.*`
- Compare: `/api/comparar.json`
- Contradictions: `/api/contradicoes.json`, `/api/contradicoes/[id].json`
- Meta: `/api/openapi.json`, `/api/atualizacoes.json`,
  `/api/boletim.json`, `/api/crescimento.json`,
  `/api/transparencia.json`

## Directory of slug-space regexes

Lives in `conventions.md`. When adding a scope route, grep neighbors
to confirm the right regex family.

## What to build next (ideas shelf)

- CSV variants of scope `declaracoes.json` (`declaracoes.csv`)
- Atom variants of RSS feeds (.atom)
- `/api/politico/:slug/reactions.json` — aggregate reactions
- `/api/politico/:slug/monthly.json` — timeseries for dashboards
- `/api/v2/contradictions` — v2 cursor-paginated
- `/api/v2/politicians/:slug` + cursor v2 variants of scope feeds
- iCal feeds for agenda / destaques-do-dia
- RDF / JSON-LD variants of core entities (schema.org)
- Grafana-compatible `/api/metrics/*` endpoint
- Embed endpoints: `/api/embed/politico/:slug.html` card
