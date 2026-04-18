import { NextRequest } from 'next/server'

export const runtime = 'edge'
export const revalidate = 86400

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? 'https://registrabrasil.com.br'

/**
 * OpenSearch 1.1 description document. Browsers that discover
 * <link rel="search" type="application/opensearchdescription+xml">
 * offer "Add Registra Brasil as a search engine" — typing "rb lula"
 * from the address bar searches the acervo directly.
 */
export async function GET(_req: NextRequest) {
  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">
  <ShortName>Registra Brasil</ShortName>
  <Description>Buscar declarações de políticos brasileiros no acervo Registra Brasil</Description>
  <InputEncoding>UTF-8</InputEncoding>
  <Language>pt-BR</Language>
  <Image width="16" height="16" type="image/x-icon">${SITE_URL}/favicon.ico</Image>
  <Image width="512" height="512" type="image/png">${SITE_URL}/icon</Image>
  <Url type="text/html" method="get" template="${SITE_URL}/buscar?q={searchTerms}"/>
  <Url type="application/opensearchdescription+xml" rel="self" template="${SITE_URL}/opensearch.xml"/>
  <moz:SearchForm xmlns:moz="http://www.mozilla.org/2006/browser/search/">${SITE_URL}/buscar</moz:SearchForm>
</OpenSearchDescription>
`
  return new Response(xml, {
    headers: {
      'Content-Type': 'application/opensearchdescription+xml; charset=utf-8',
      'Cache-Control': 'public, s-maxage=86400, max-age=86400',
    },
  })
}
