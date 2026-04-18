'use client'

import { FormEvent, useId, useState, useTransition } from 'react'
import { Loader2, Save, Trash2, AlertCircle, Eye } from 'lucide-react'
import { upsertStory, deleteStory } from '../actions'
import { parseStoryBody, estimateReadingTimeMinutes } from '@/lib/stories/render'

interface Story {
  id: string
  slug: string
  title: string
  subtitle: string | null
  author: string | null
  body_markdown: string
  hero_statement_id: string | null
  cover_image_url: string | null
  is_published: boolean
}

export function StoryEditor({ story }: { story: Story | null }) {
  const [body, setBody] = useState(story?.body_markdown ?? '')
  const [pending, start] = useTransition()
  const [err, setErr] = useState<string | null>(null)
  const [preview, setPreview] = useState(false)

  const slugId = useId()
  const titleId = useId()
  const subId = useId()
  const authorId = useId()
  const heroId = useId()
  const coverId = useId()
  const pubId = useId()
  const bodyId = useId()

  function onSubmit(e: FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setErr(null)
    const form = new FormData(e.currentTarget)
    start(async () => {
      try {
        await upsertStory({
          id: story?.id,
          slug: form.get('slug') as string,
          title: form.get('title') as string,
          subtitle: (form.get('subtitle') as string) || undefined,
          author: (form.get('author') as string) || undefined,
          body_markdown: body,
          hero_statement_id: (form.get('hero_statement_id') as string) || undefined,
          cover_image_url: (form.get('cover_image_url') as string) || undefined,
          is_published: form.get('is_published') === 'on',
        })
      } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  function onDelete() {
    if (!story) return
    if (!confirm(`Excluir "${story.title}"? Essa ação não pode ser desfeita.`)) return
    start(async () => {
      try { await deleteStory(story.id, story.slug) } catch (e) {
        setErr(e instanceof Error ? e.message : 'Erro')
      }
    })
  }

  const inputCls = 'w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500'
  const labelCls = 'block text-sm font-medium text-gray-700 mb-1'
  const blocks = parseStoryBody(body)
  const minutes = estimateReadingTimeMinutes(body)

  return (
    <form onSubmit={onSubmit} className="space-y-5">
      {err && (
        <div className="bg-red-50 border border-red-200 rounded p-3 flex gap-2 text-sm text-red-900">
          <AlertCircle className="w-4 h-4 flex-shrink-0 mt-0.5" aria-hidden="true" />
          <span>{err}</span>
        </div>
      )}

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor={slugId} className={labelCls}>Slug *</label>
          <input id={slugId} name="slug" type="text" required pattern="[a-z0-9][a-z0-9-]*[a-z0-9]" defaultValue={story?.slug ?? ''} className={inputCls} placeholder="contradicao-sobre-privatizacoes" />
        </div>
        <div>
          <label htmlFor={authorId} className={labelCls}>Autoria</label>
          <input id={authorId} name="author" type="text" maxLength={200} defaultValue={story?.author ?? ''} className={inputCls} />
        </div>
      </div>

      <div>
        <label htmlFor={titleId} className={labelCls}>Título *</label>
        <input id={titleId} name="title" type="text" required minLength={3} maxLength={200} defaultValue={story?.title ?? ''} className={inputCls} />
      </div>

      <div>
        <label htmlFor={subId} className={labelCls}>Subtítulo</label>
        <input id={subId} name="subtitle" type="text" maxLength={300} defaultValue={story?.subtitle ?? ''} className={inputCls} />
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
          <label htmlFor={coverId} className={labelCls}>URL da capa</label>
          <input id={coverId} name="cover_image_url" type="url" defaultValue={story?.cover_image_url ?? ''} className={inputCls} />
        </div>
        <div>
          <label htmlFor={heroId} className={labelCls}>UUID da declaração-destaque</label>
          <input id={heroId} name="hero_statement_id" type="text" defaultValue={story?.hero_statement_id ?? ''} className={inputCls} placeholder="opcional" />
        </div>
      </div>

      <div>
        <div className="flex items-center justify-between mb-1">
          <label htmlFor={bodyId} className={labelCls}>Corpo (Markdown)</label>
          <div className="flex items-center gap-3">
            <span className="text-xs text-gray-500">{minutes} min · {blocks.length} blocos</span>
            <button type="button" onClick={() => setPreview((p) => !p)} className="text-xs text-blue-700 hover:underline inline-flex items-center gap-1">
              <Eye className="w-3.5 h-3.5" aria-hidden="true" /> {preview ? 'Editar' : 'Pré-visualizar'}
            </button>
          </div>
        </div>
        {preview ? (
          <div className="border border-gray-200 rounded-lg p-4 bg-white min-h-40 text-sm space-y-2">
            {blocks.map((b, i) => {
              if (b.kind === 'h2') return <h2 key={i} className="text-xl font-bold">{b.text}</h2>
              if (b.kind === 'h3') return <h3 key={i} className="text-lg font-semibold">{b.text}</h3>
              if (b.kind === 'p') return <p key={i}>{b.inlines.map((x) => (x.t === 'bold' ? `**${x.value}**` : x.t === 'italic' ? `_${x.value}_` : x.t === 'link' ? `[${x.value}](${x.href})` : x.value)).join('')}</p>
              if (b.kind === 'quote') return <blockquote key={i} className="border-l-4 border-gray-300 pl-3 italic">{b.inlines.map((x) => x.t === 'text' ? x.value : '').join('')}</blockquote>
              if (b.kind === 'statement') return <div key={i} className="bg-blue-50 border border-blue-200 rounded p-2 font-mono text-xs">embed: {b.id}</div>
              if (b.kind === 'hr') return <hr key={i} className="my-3 border-gray-200" />
              return null
            })}
          </div>
        ) : (
          <textarea
            id={bodyId}
            value={body}
            onChange={(e) => setBody(e.target.value)}
            rows={20}
            className={`${inputCls} font-mono text-xs`}
            placeholder="## Seção 1&#10;&#10;Texto corrido com **negrito** e _itálico_ e [link](https://…).&#10;&#10;{{statement:UUID-AQUI}}&#10;&#10;Mais comentário editorial depois do embed."
          />
        )}
        <p className="text-xs text-gray-500 mt-1">
          Suportado: <code>## H2</code>, <code>### H3</code>, parágrafos separados por linha em branco, <code>&gt;</code> blockquote, <code>**bold**</code>, <code>_itálico_</code>, <code>[link](url)</code>, <code>---</code> separador, <code>&#123;&#123;statement:UUID&#125;&#125;</code> embed.
        </p>
      </div>

      <label htmlFor={pubId} className="inline-flex items-center gap-2 text-sm">
        <input id={pubId} name="is_published" type="checkbox" defaultChecked={story?.is_published ?? false} className="rounded" />
        Publicar
      </label>

      <div className="flex gap-2">
        <button
          type="submit"
          disabled={pending}
          className="inline-flex items-center gap-1.5 px-4 py-2 bg-blue-600 hover:bg-blue-700 disabled:bg-blue-400 text-white text-sm font-medium rounded-lg"
        >
          {pending ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
          Salvar
        </button>
        {story && (
          <button type="button" onClick={onDelete} disabled={pending} className="inline-flex items-center gap-1.5 px-4 py-2 bg-red-100 hover:bg-red-200 text-red-800 text-sm font-medium rounded-lg">
            <Trash2 className="w-4 h-4" /> Excluir
          </button>
        )}
      </div>
    </form>
  )
}
