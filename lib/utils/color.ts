/** Convert hex color to RGB tuple */
export function hexToRgb(hex: string): [number, number, number] | null {
  const cleaned = hex.replace('#', '')
  if (cleaned.length !== 6) return null
  const num = parseInt(cleaned, 16)
  return [(num >> 16) & 255, (num >> 8) & 255, num & 255]
}

/** Calculate relative luminance (WCAG 2.0) */
export function luminance(r: number, g: number, b: number): number {
  const [rs, gs, bs] = [r, g, b].map((c) => {
    const s = c / 255
    return s <= 0.03928 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4)
  })
  return 0.2126 * rs + 0.7152 * gs + 0.0722 * bs
}

/** Calculate contrast ratio between two hex colors (WCAG) */
export function contrastRatio(hex1: string, hex2: string): number {
  const rgb1 = hexToRgb(hex1)
  const rgb2 = hexToRgb(hex2)
  if (!rgb1 || !rgb2) return 1

  const l1 = luminance(...rgb1)
  const l2 = luminance(...rgb2)
  const lighter = Math.max(l1, l2)
  const darker = Math.min(l1, l2)

  return (lighter + 0.05) / (darker + 0.05)
}

/** Returns 'white' or 'black' for best text contrast on the given background */
export function textColorForBg(bgHex: string): '#ffffff' | '#000000' {
  const rgb = hexToRgb(bgHex)
  if (!rgb) return '#000000'
  return luminance(...rgb) > 0.179 ? '#000000' : '#ffffff'
}
