'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'
import { PoliticianForm, type PoliticianFormData } from '@/components/admin/PoliticianForm'
import { updatePolitician } from '@/lib/supabase/mutations/politicians'
import type { Politician } from '@/types/database'

interface Props {
  politician: Politician
}

export function EditPoliticianClient({ politician }: Props) {
  const router = useRouter()
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function handleSubmit(data: PoliticianFormData) {
    setSaving(true)
    setError(null)

    const result = await updatePolitician(politician.id, data)
    if (result.success) {
      router.push('/admin/politicos')
      router.refresh()
    } else {
      setError(result.error)
    }
    setSaving(false)
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <div className="flex items-center gap-3 mb-8">
        <Link
          href="/admin/politicos"
          className="text-gray-400 hover:text-gray-600 transition-colors"
        >
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Editar: {politician.common_name}
          </h1>
          <p className="text-sm text-gray-500">Altere as informacoes do politico.</p>
        </div>
      </div>

      {error && (
        <div className="bg-red-50 text-red-700 px-4 py-3 rounded-lg mb-6 text-sm">
          {error}
        </div>
      )}

      <div className="bg-white border border-gray-200 rounded-lg p-6">
        <PoliticianForm
          politician={politician}
          onSubmit={handleSubmit}
          isLoading={saving}
        />
      </div>
    </main>
  )
}
