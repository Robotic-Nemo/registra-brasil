/**
 * Custom Next.js image loader for Supabase Storage.
 * Generates optimized image URLs using Supabase's image transformation API.
 */

interface ImageLoaderParams {
  src: string
  width: number
  quality?: number
}

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL ?? ''

export function supabaseImageLoader({ src, width, quality }: ImageLoaderParams): string {
  // If the src is a full Supabase Storage URL, apply transformations
  if (src.startsWith(SUPABASE_URL) && src.includes('/storage/v1/object/public/')) {
    const transformUrl = src.replace(
      '/storage/v1/object/public/',
      '/storage/v1/render/image/public/'
    )
    return `${transformUrl}?width=${width}&quality=${quality ?? 75}`
  }

  // For relative or other URLs, return as-is with width param
  if (src.startsWith('/')) return `${src}?w=${width}&q=${quality ?? 75}`

  return src
}

/** Default image loader for next.config image configuration */
export default function imageLoader(params: ImageLoaderParams): string {
  return supabaseImageLoader(params)
}
