import Link from 'next/link'
import { ArrowLeft, Settings } from 'lucide-react'
import { getSupabaseServiceClient } from '@/lib/supabase/server'
import { SettingsEditor } from './SettingsEditor'

export const dynamic = 'force-dynamic'

interface SettingRow {
  key: string
  value: unknown
  description: string | null
  updated_at: string
  updated_by: string | null
}

export default async function SiteSettingsPage() {
  const supabase = getSupabaseServiceClient()
  const { data } = await (supabase.from('site_settings') as any)
    .select('key, value, description, updated_at, updated_by')
    .order('key')

  const rows = (data ?? []) as SettingRow[]

  return (
    <main className="max-w-3xl mx-auto px-4 py-8">
      <div className="flex items-center gap-3 mb-6">
        <Link href="/admin" className="p-1.5 rounded hover:bg-gray-100"><ArrowLeft className="w-5 h-5 text-gray-500" /></Link>
        <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
          <Settings className="w-5 h-5 text-blue-700" />
          Configurações do site
        </h1>
      </div>

      <p className="text-sm text-gray-600 mb-6">
        Valores persistidos na tabela <code>site_settings</code> e lidos por
        <code className="mx-1">getSetting(key, fallback)</code> com cache de 60s. Mudanças aqui
        aparecem no site sem redeploy.
      </p>

      <SettingsEditor rows={rows} />
    </main>
  )
}
