import { notFound } from 'next/navigation'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import EmbedPolitician from '@/components/embed/EmbedPolitician'

interface PageProps {
  params: Promise<{ slug: string }>
}

export default async function EmbedPoliticianPage({ params }: PageProps) {
  const { slug } = await params
  const supabase = getSupabaseServiceClient()

  const { data: politician } = await supabase
    .from('politicians')
    .select('id, slug, common_name, full_name, party, state, role, photo_url')
    .eq('slug', slug)
    .single()

  if (!politician) notFound()

  const pol = politician as unknown as {
    id: string; slug: string; common_name: string; full_name: string;
    party: string; state: string | null; role: string | null; photo_url: string | null
  }

  // Get statement count
  const { count } = await supabase
    .from('statements')
    .select('id', { count: 'exact', head: true })
    .eq('politician_id', pol.id)
    .eq('verification_status', 'verified')

  return (
    <div className="max-w-[400px] mx-auto">
      <EmbedPolitician politician={pol} statementCount={count ?? 0} />
    </div>
  )
}
