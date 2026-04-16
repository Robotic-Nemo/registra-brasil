'use client'

import { useState } from 'react'
import Link from 'next/link'
import { ArrowLeft, Plus, GripVertical, Pencil, Trash2, Save, X } from 'lucide-react'
import type { Category } from '@/types/database'
import { updateCategory, createCategory, deleteCategory } from '@/lib/supabase/mutations/categories'
import type { CategoryInput } from '@/lib/supabase/mutations/categories'
import { useRouter } from 'next/navigation'

const SEVERITY_LABELS: Record<number, string> = {
  1: 'Baixa',
  2: 'Media',
  3: 'Alta',
  4: 'Critica',
}

const SEVERITY_COLORS: Record<number, string> = {
  1: 'bg-blue-100 text-blue-700',
  2: 'bg-yellow-100 text-yellow-700',
  3: 'bg-orange-100 text-orange-700',
  4: 'bg-red-100 text-red-700',
}

interface EditingCategory {
  id?: string
  label_pt: string
  slug: string
  color_hex: string
  severity: 1 | 2 | 3 | 4
  description: string
  label_en: string
  icon: string
  parent_id: string
  sort_order: number
}

interface Props {
  initialCategories: Category[]
}

export function CategoriasClient({ initialCategories }: Props) {
  const router = useRouter()
  const [categories, setCategories] = useState<Category[]>(initialCategories)
  const [editing, setEditing] = useState<EditingCategory | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)

  function startNew() {
    setEditing({
      label_pt: '',
      slug: '',
      color_hex: '#6B7280',
      severity: 1,
      description: '',
      label_en: '',
      icon: '',
      parent_id: '',
      sort_order: categories.length,
    })
  }

  function startEdit(cat: Category) {
    setEditing({
      id: cat.id,
      label_pt: cat.label_pt,
      slug: cat.slug,
      color_hex: cat.color_hex,
      severity: cat.severity,
      description: cat.description ?? '',
      label_en: cat.label_en ?? '',
      icon: cat.icon ?? '',
      parent_id: cat.parent_id ?? '',
      sort_order: cat.sort_order,
    })
  }

  async function handleSave() {
    if (!editing) return
    setSaving(true)
    setError(null)

    const input: CategoryInput = {
      label_pt: editing.label_pt,
      slug: editing.slug,
      color_hex: editing.color_hex,
      severity: editing.severity,
      description: editing.description || null,
      label_en: editing.label_en || null,
      icon: editing.icon || null,
      parent_id: editing.parent_id || null,
      sort_order: editing.sort_order,
    }

    const result = editing.id
      ? await updateCategory(editing.id, input)
      : await createCategory(input)

    if (result.success) {
      setEditing(null)
      router.refresh()
    } else {
      setError(result.error)
    }
    setSaving(false)
  }

  async function handleDelete(id: string) {
    if (!confirm('Tem certeza que deseja excluir esta categoria?')) return
    const result = await deleteCategory(id)
    if (result.success) {
      router.refresh()
    } else {
      setError(result.error)
    }
  }

  return (
    <main className="max-w-3xl mx-auto px-4 py-12">
      <div className="flex items-center justify-between mb-8">
        <div className="flex items-center gap-3">
          <Link
            href="/admin"
            className="text-gray-400 hover:text-gray-600 transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Categorias</h1>
            <p className="text-sm text-gray-500">{categories.length} categorias</p>
          </div>
        </div>
        <button
          onClick={startNew}
          className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 transition-colors"
        >
          <Plus className="w-4 h-4" />
          Nova categoria
        </button>
      </div>

      {error && (
        <div className="bg-red-50 text-red-700 px-4 py-3 rounded-lg mb-6 text-sm">
          {error}
        </div>
      )}

      {/* Edit/Create form */}
      {editing && (
        <div className="bg-white border border-blue-200 rounded-lg p-6 mb-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">
            {editing.id ? 'Editar Categoria' : 'Nova Categoria'}
          </h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nome (PT) *</label>
              <input
                type="text"
                value={editing.label_pt}
                onChange={(e) => setEditing({ ...editing, label_pt: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Slug *</label>
              <input
                type="text"
                value={editing.slug}
                onChange={(e) => setEditing({ ...editing, slug: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nome (EN)</label>
              <input
                type="text"
                value={editing.label_en}
                onChange={(e) => setEditing({ ...editing, label_en: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Cor (hex)</label>
              <div className="flex items-center gap-2">
                <input
                  type="color"
                  value={editing.color_hex}
                  onChange={(e) => setEditing({ ...editing, color_hex: e.target.value })}
                  className="w-10 h-10 rounded border border-gray-300 cursor-pointer"
                />
                <input
                  type="text"
                  value={editing.color_hex}
                  onChange={(e) => setEditing({ ...editing, color_hex: e.target.value })}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                />
              </div>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Severidade</label>
              <select
                value={editing.severity}
                onChange={(e) => setEditing({ ...editing, severity: Number(e.target.value) as 1 | 2 | 3 | 4 })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {[1, 2, 3, 4].map((s) => (
                  <option key={s} value={s}>{s} - {SEVERITY_LABELS[s]}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Icone</label>
              <input
                type="text"
                value={editing.icon}
                onChange={(e) => setEditing({ ...editing, icon: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="nome-do-icone"
              />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 mb-1">Descricao</label>
              <textarea
                value={editing.description}
                onChange={(e) => setEditing({ ...editing, description: e.target.value })}
                rows={2}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
            </div>
          </div>
          <div className="flex justify-end gap-2 mt-4">
            <button
              onClick={() => setEditing(null)}
              className="flex items-center gap-1.5 px-4 py-2 text-gray-600 hover:text-gray-800 text-sm"
            >
              <X className="w-4 h-4" />
              Cancelar
            </button>
            <button
              onClick={handleSave}
              disabled={saving || !editing.label_pt || !editing.slug}
              className="flex items-center gap-1.5 px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 transition-colors"
            >
              <Save className="w-4 h-4" />
              {saving ? 'Salvando...' : 'Salvar'}
            </button>
          </div>
        </div>
      )}

      {/* Category list */}
      <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
        <ul className="divide-y divide-gray-100">
          {categories.map((cat) => (
            <li key={cat.id} className="px-4 py-3 flex items-center gap-3 hover:bg-gray-50 transition-colors">
              <GripVertical className="w-4 h-4 text-gray-300" />
              <span
                className="w-4 h-4 rounded-full flex-shrink-0"
                style={{ backgroundColor: cat.color_hex }}
              />
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium text-gray-900">{cat.label_pt}</p>
                <p className="text-xs text-gray-500">/{cat.slug}</p>
              </div>
              <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${SEVERITY_COLORS[cat.severity]}`}>
                {SEVERITY_LABELS[cat.severity]}
              </span>
              <button
                onClick={() => startEdit(cat)}
                className="p-1.5 text-gray-400 hover:text-blue-600 transition-colors"
                title="Editar"
              >
                <Pencil className="w-4 h-4" />
              </button>
              <button
                onClick={() => handleDelete(cat.id)}
                className="p-1.5 text-gray-400 hover:text-red-600 transition-colors"
                title="Excluir"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </li>
          ))}
        </ul>
        {categories.length === 0 && (
          <div className="text-center py-12 text-gray-500 text-sm">
            Nenhuma categoria cadastrada.
          </div>
        )}
      </div>
    </main>
  )
}
