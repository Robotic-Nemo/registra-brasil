/**
 * Check if source URLs are accessible.
 */

export interface LinkCheckResult {
  url: string
  accessible: boolean
  statusCode: number | null
  redirectUrl: string | null
  error: string | null
  checkedAt: string
}

/**
 * Check if a single URL is accessible.
 */
export async function checkLink(url: string, timeoutMs = 10_000): Promise<LinkCheckResult> {
  const checkedAt = new Date().toISOString()

  try {
    const controller = new AbortController()
    const timer = setTimeout(() => controller.abort(), timeoutMs)

    const response = await fetch(url, {
      method: 'HEAD',
      signal: controller.signal,
      redirect: 'follow',
    })

    clearTimeout(timer)

    const redirectUrl = response.redirected ? response.url : null

    return {
      url,
      accessible: response.ok,
      statusCode: response.status,
      redirectUrl,
      error: null,
      checkedAt,
    }
  } catch (err) {
    // If HEAD fails, try GET (some servers reject HEAD requests)
    try {
      const controller = new AbortController()
      const timer = setTimeout(() => controller.abort(), timeoutMs)

      const response = await fetch(url, {
        method: 'GET',
        signal: controller.signal,
        redirect: 'follow',
        headers: { Range: 'bytes=0-0' },
      })

      clearTimeout(timer)

      return {
        url,
        accessible: response.ok || response.status === 206,
        statusCode: response.status,
        redirectUrl: response.redirected ? response.url : null,
        error: null,
        checkedAt,
      }
    } catch (getErr) {
      return {
        url,
        accessible: false,
        statusCode: null,
        redirectUrl: null,
        error: getErr instanceof Error ? getErr.message : 'Unknown error',
        checkedAt,
      }
    }
  }
}

/**
 * Check multiple URLs in parallel with concurrency limit.
 */
export async function checkLinks(
  urls: string[],
  options: { concurrency?: number; timeoutMs?: number } = {}
): Promise<LinkCheckResult[]> {
  const { concurrency = 5, timeoutMs = 10_000 } = options
  const results: LinkCheckResult[] = []
  const queue = [...urls]

  async function worker() {
    while (queue.length > 0) {
      const url = queue.shift()
      if (!url) break
      const result = await checkLink(url, timeoutMs)
      results.push(result)
    }
  }

  const workers = Array.from({ length: Math.min(concurrency, urls.length) }, () => worker())
  await Promise.all(workers)

  return results
}

/**
 * Classify a URL's domain to help with source type inference.
 */
export function classifySourceDomain(url: string): string {
  try {
    const hostname = new URL(url).hostname.replace(/^www\./, '')

    const domainMap: Record<string, string> = {
      'gov.br': 'governo',
      'camara.leg.br': 'camara',
      'senado.leg.br': 'senado',
      'youtube.com': 'video',
      'youtu.be': 'video',
      'twitter.com': 'rede_social',
      'x.com': 'rede_social',
      'instagram.com': 'rede_social',
      'facebook.com': 'rede_social',
      'globo.com': 'midia',
      'uol.com.br': 'midia',
      'folha.uol.com.br': 'midia',
      'estadao.com.br': 'midia',
    }

    for (const [domain, type] of Object.entries(domainMap)) {
      if (hostname === domain || hostname.endsWith(`.${domain}`)) {
        return type
      }
    }

    return 'outro'
  } catch {
    return 'desconhecido'
  }
}
