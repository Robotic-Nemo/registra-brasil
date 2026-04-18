'use client'

import { FormEvent, useState, useTransition, useId } from 'react'
import { Loader2, Save, Trash2, AlertCircle } from 'lucide-react'
import { upsertCollection, setCollectionMembers, deleteCollection } from '../actions'

interface Collection {
  id: string
  slug: string
  title: string
  subtitle: string | null
  description: string | null
  cover_image_url: string | null
  is_published: boolean
}

interface Member {
  statement_id: string
  position: number
  statement_slug: string | null
  summary: string
}

interface Props {
  collection: Collection | null
  initialMembers: Member[]
}

export function CollectionEditor({ collection, initialMembers }: Props) {
  const [saving, startSaving] = useTransition()
  const [membersSaving, startMembersSaving] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState<string | null>(null)
  const [unresolved, setUnresolved] = useState<string[]>([])

  // Members textarea initialized from current membership (slug preferred, fallback uuid).
  const initialText = initialMembers
    .map((m) => m.statement_slug ?? m.statement_id)
    .join('\n')
  const [membersText, setMembersText] = useState(initialText)

  const slugId = useId()
  const titleId = useId()
  const subId = useId()
  const descId = useId()
  const coverId = useId()
  const pubId = useId()
  const membId = useId()

  function onMetaSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    const form = new FormData(e.currentTarget)
    setErr(null)
    setOk(null)
    startSaving(async () => {
      try {
        await upsertCollection({
          id: collection?.id,
          slug: form.get('slug') as string,
          title: form.get('title') as string,
          subtitle: (form.get('subtitle') as string) || undefined,
          description: (form.get('description') as string) || undefined,
          cover_image_url: (form.get('cover_image_url') as string) || undefined,
          is_published: form.get('is_published') === 'on',
        })
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  function onMembersSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    if (!collection) return
    setErr(null)
    setOk(null)
    setUnresolved([])
    const lines = membersText.split('\n').map((s) => s.trim()).filter(Boolean)
    startMembersSaving(async () => {
      try {
        const res = await setCollectionMembers(collection.id, lines)
        setUnresolved(res.unresolved)
        setOk(
          res.unresolved.length === 0
            ? `Salvo: ${lines.length - res.unresolved.length} declarações.`
            : `Salvo parcialmente: ${res.unresolved.length} não encontradas.`,
        )
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  function onDelete() {
    if (!collection) return
    if (!confirm(`Excluir coleção "${collection.title}"? Os membros são desfeitos; as declarações permanecem.`)) return
    startSaving(async () => {
      try {
        await deleteCollection(collection.id, collection.slug)
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:border-transparent'
  const labelCls = 'block text-sm font-medium text-gray-700 mb-1'

  return (
    <div className="flex flex-col gap-8">
      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-3 flex gap-2 text-sm text-red-900">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}
      {ok && <div className="bg-green-50 border border-green-200 rounded p-3 text-sm text-green-900">{ok}</div>}

      <form onSubmit={onMetaSubmit} className="bg-white border border-gray-200 rounded-xl p-5 space-y-4">
        <h2 className="font-semibold text-gray-900">Metadados</h2>

        <div>
          <label htmlFor={slugId} className={labelCls}>Slug * <span className="text-xs text-gray-500">(URL)</span></label>
          <input id={slugId} name="slug" type="text" required pattern="[a-z0-9][a-z0-9-]*[a-z0-9]" defaultValue={collection?.slug ?? ''} className={inputCls} placeholder="promessas-de-campanha-2022" />
        </div>

        <div>
          <label htmlFor={titleId} className={labelCls}>Título *</label>
          <input id={titleId} name="title" type="text" required minLength={3} maxLength={200} defaultValue={collection?.title ?? ''} className={inputCls} />
        </div>

        <div>
          <label htmlFor={subId} className={labelCls}>Subtítulo (1 linha)</label>
          <input id={subId} name="subtitle" type="text" maxLength={200} defaultValue={collection?.subtitle ?? ''} className={inputCls} />
        </div>

        <div>
          <label htmlFor={descId} className={labelCls}>Descrição</label>
          <textarea id={descId} name="description" rows={4} defaultValue={collection?.description ?? ''} className={inputCls} />
        </div>

        <div>
          <label htmlFor={coverId} className={labelCls}>URL da capa (opcional)</label>
          <input id={coverId} name="cover_image_url" type="url" defaultValue={collection?.cover_image_url ?? ''} className={inputCls} />
        </div>

        <label htmlFor={pubId} className="inline-flex items-center gap-2 text-sm">
          <input id={pubId} name="is_published" type="checkbox" defaultChecked={collection?.is_published ?? false} className="rounded" />
          Publicada (visível em /colecoes)
        </label>

        <div className="flex gap-2">
          <button
            type="submit"
            disabled={saving}
            className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg"
          >
            {saving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
            Salvar metadados
          </button>
          {collection && (
            <button
              type="button"
              onClick={onDelete}
              disabled={saving}
              className="inline-flex items-center gap-1.5 px-4 py-2 bg-red-100 hover:bg-red-200 text-red-800 text-sm font-medium rounded-lg"
            >
              <Trash2 className="w-4 h-4" />
              Excluir
            </button>
          )}
        </div>
      </form>

      {collection && (
        <form onSubmit={onMembersSubmit} className="bg-white border border-gray-200 rounded-xl p-5 space-y-3">
          <h2 className="font-semibold text-gray-900">Declarações na coleção</h2>
          <p className="text-xs text-gray-600">
            Um identificador por linha — aceita <code>slug</code> ou UUID. A ordem das linhas define
            a ordem exibida ao público.
          </p>
          <textarea
            id={membId}
            value={membersText}
            onChange={(e) => setMembersText(e.target.value)}
            rows={12}
            className={`${inputCls} font-mono text-xs`}
            placeholder="lula-amazonia-2023-07-15&#10;bolsonaro-vacina-2021-03-10&#10;..."
          />
          {unresolved.length > 0 && (
            <div className="bg-amber-50 border border-amber-200 rounded p-2 text-xs text-amber-900">
              <strong>Não encontradas:</strong> {unresolved.join(', ')}
            </div>
          )}
          <button
            type="submit"
            disabled={membersSaving}
            className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg"
          >
            {membersSaving ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
            Salvar membros
          </button>
        </form>
      )}
    </div>
  )
}
