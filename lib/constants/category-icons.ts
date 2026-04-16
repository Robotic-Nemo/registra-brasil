/**
 * Map of category slugs to Lucide icon names.
 * Used for visual indicators alongside category labels.
 */
export const CATEGORY_ICONS: Record<string, string> = {
  economia: 'TrendingUp',
  educacao: 'GraduationCap',
  saude: 'Heart',
  seguranca: 'Shield',
  'meio-ambiente': 'Leaf',
  infraestrutura: 'Building2',
  politica: 'Landmark',
  'politica-externa': 'Globe',
  'direitos-humanos': 'Users',
  cultura: 'Palette',
  ciencia: 'Microscope',
  tecnologia: 'Cpu',
  esporte: 'Trophy',
  agricultura: 'Wheat',
  energia: 'Zap',
  defesa: 'ShieldCheck',
  justica: 'Scale',
  trabalho: 'Briefcase',
  habitacao: 'Home',
  transporte: 'Bus',
  comunicacao: 'Radio',
  turismo: 'Plane',
  previdencia: 'Clock',
  corrupcao: 'AlertTriangle',
  eleicoes: 'Vote',
  orcamento: 'DollarSign',
  tributacao: 'Receipt',
  'reforma-politica': 'FileText',
  pandemia: 'Activity',
  'governo-digital': 'Monitor',
}

/**
 * Get the icon name for a category slug.
 * Returns a default icon if the slug is not mapped.
 */
export function getCategoryIconName(slug: string): string {
  return CATEGORY_ICONS[slug] ?? 'Tag'
}
