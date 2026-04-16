import {
  TrendingUp, GraduationCap, Heart, Shield, Leaf, Building2, Landmark, Globe,
  Users, Palette, Microscope, Cpu, Trophy, Wheat, Zap, ShieldCheck, Scale,
  Briefcase, Home, Bus, Radio, Plane, Clock, AlertTriangle, Vote, DollarSign,
  Receipt, FileText, Activity, Monitor, Tag,
} from 'lucide-react'
import { getCategoryIconName } from '@/lib/constants/category-icons'

const ICON_MAP: Record<string, React.ElementType> = {
  TrendingUp, GraduationCap, Heart, Shield, Leaf, Building2, Landmark, Globe,
  Users, Palette, Microscope, Cpu, Trophy, Wheat, Zap, ShieldCheck, Scale,
  Briefcase, Home, Bus, Radio, Plane, Clock, AlertTriangle, Vote, DollarSign,
  Receipt, FileText, Activity, Monitor, Tag,
}

interface Props {
  slug: string
  size?: number
  className?: string
}

export function CategoryIcon({ slug, size = 16, className = '' }: Props) {
  const iconName = getCategoryIconName(slug)
  const IconComponent = ICON_MAP[iconName] ?? Tag

  return <IconComponent size={size} className={className} />
}
