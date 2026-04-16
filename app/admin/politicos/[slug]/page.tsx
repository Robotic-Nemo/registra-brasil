import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import type { Politician } from '@/types/database'
import { EditPoliticianClient } from './EditPoliticianClient'

export const dynamic = 'force-dynamic'

interface PageProps {
  params: Promise<{ slug: string }>
}

export default async function EditPoliticianPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data, error } = await supabase
    .from('politicians')
    .select('*')
    .eq('slug', slug)
    .single()

  if (error || !data) notFound()

  return <EditPoliticianClient politician={data as Politician} />
}
