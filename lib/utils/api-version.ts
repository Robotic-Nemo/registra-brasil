import { NextRequest, NextResponse } from 'next/server'

export const CURRENT_API_VERSION = 'v1'
export const SUPPORTED_VERSIONS = ['v1'] as const

export type ApiVersion = (typeof SUPPORTED_VERSIONS)[number]

/**
 * Extract API version from request header or query param
 */
export function getApiVersion(request: NextRequest): ApiVersion {
  const headerVersion = request.headers.get('X-API-Version')
  const queryVersion = request.nextUrl.searchParams.get('api_version')

  const version = (headerVersion ?? queryVersion ?? CURRENT_API_VERSION) as ApiVersion

  if (!SUPPORTED_VERSIONS.includes(version)) {
    return CURRENT_API_VERSION
  }

  return version
}

/**
 * Add API version headers to response
 */
export function withApiVersionHeaders(
  response: NextResponse,
  version: ApiVersion = CURRENT_API_VERSION
): NextResponse {
  response.headers.set('X-API-Version', version)
  response.headers.set('X-API-Supported-Versions', SUPPORTED_VERSIONS.join(', '))
  return response
}

/**
 * Create a deprecation response
 */
export function apiDeprecated(
  message: string,
  sunsetDate: string
): NextResponse {
  return NextResponse.json(
    {
      error: 'deprecated',
      message,
      sunset_date: sunsetDate,
    },
    {
      status: 410,
      headers: {
        'Sunset': sunsetDate,
        'Deprecation': 'true',
      },
    }
  )
}
