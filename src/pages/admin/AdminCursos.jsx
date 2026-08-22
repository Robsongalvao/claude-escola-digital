import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabaseClient'

export default function AdminCursos() {
  const [courses, setCourses] = useState([])
  const [selectedCourse, setSelectedCourse] = useState(null)
  const [modules, setModules] = useState([])
  const [expandedModule, setExpandedModule] = useState(null)
  const [lessonsByModule, setLessonsByModule] = useState({})
  const [loading, setLoading] = useState(true)
  const [showNewModule, setShowNewModule] = useState(false)
  const [showNewLessonFor, setShowNewLessonFor] = useState(null)
  const [editingLesson, setEditingLesson] = useState(null)

  useEffect(() => { loadCourses() }, [])

  async function loadCourses() {
    setLoading(true)
    const { data } = await supabase.from('courses').select('*').order('order_index')
    setCourses(data || [])
    if (data && data.length > 0 && !selectedCourse) {
      setSelectedCourse(data[0].id)
      loadModules(data[0].id)
    } else {
      setLoading(false)
    }
  }

  async function loadModules(courseId) {
    setLoading(true)
    const { data } = await supabase.from('modules').select('*').eq('course_id', courseId).order('order_index')
    setModules(data || [])
    setLoading(false)
  }

  async function toggleModule(moduleId) {
    if (expandedModule === moduleId) {
      setExpandedModule(null)
      return
    }
    setExpandedModule(moduleId)
    if (!lessonsByModule[moduleId]) {
      const { data } = await supabase.from('lessons').select('*').eq('module_id', moduleId).order('order_index')
      setLessonsByModule((prev) => ({ ...prev, [moduleId]: data || [] }))
    }
  }

  async function refreshLessons(moduleId) {
    const { data } = await supabase.from('lessons').select('*').eq('module_id', moduleId).order('order_index')
    setLessonsByModule((prev) => ({ ...prev, [moduleId]: data || [] }))
  }

  async function deleteModule(moduleId) {
    if (!confirm('Excluir este módulo? Isso vai apagar todas as aulas dentro dele.')) return
    await supabase.from('modules').delete().eq('id', moduleId)
    loadModules(selectedCourse)
  }

  async function deleteLesson(lessonId, moduleId) {
    if (!confirm('Excluir esta aula?')) return
    await supabase.from('lessons').delete().eq('id', lessonId)
    refreshLessons(moduleId)
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">Cursos</h1>
      </div>

      {selectedCourse && (
        <>
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-display font-semibold text-lg text-[var(--color-ink)]">
              {courses.find((c) => c.id === selectedCourse)?.title}
            </h2>
            <button onClick={() => setShowNewModule(true)}
              className="px-4 py-2 rounded-full text-sm font-display font-bold bg-[var(--color-ambar)] text-[var(--color-indigo-dark)] hover:bg-[var(--color-ambar-dark)] transition">
              + Novo módulo
            </button>
          </div>

          {showNewModule && (
            <NewModuleForm courseId={selectedCourse} nextOrder={modules.length + 1}
              onCancel={() => setShowNewModule(false)}
              onCreated={() => { setShowNewModule(false); loadModules(selectedCourse) }} />
          )}

          {loading ? (
            <p className="text-[var(--color-ink)]/50">Carregando...</p>
          ) : (
            <div className="space-y-3 mt-4">
              {modules.map((mod) => (
                <div key={mod.id} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] overflow-hidden">
                  <div className="flex items-center gap-3 p-4">
                    <button onClick={() => toggleModule(mod.id)} className="flex-1 text-left flex items-center gap-3">
                      <span className="w-7 h-7 rounded-full bg-[var(--color-indigo-light)] flex items-center justify-center text-xs font-bold text-[var(--color-indigo)]">{mod.order_index}</span>
                      <div>
                        <div className="font-display font-semibold text-[var(--color-ink)]">{mod.title}</div>
                        <div className="text-xs text-[var(--color-ink)]/50">{mod.description}</div>
                      </div>
                    </button>
                    <button onClick={() => deleteModule(mod.id)} className="text-xs font-semibold text-[var(--color-coral)] shrink-0">Excluir</button>
                    <button onClick={() => toggleModule(mod.id)} className="text-[var(--color-ink)]/40 shrink-0">{expandedModule === mod.id ? '▲' : '▼'}</button>
                  </div>

                  {expandedModule === mod.id && (
                    <div className="border-t border-[var(--color-indigo-light)] p-4 bg-[var(--color-bg)]">
                      {(lessonsByModule[mod.id] || []).map((lesson) => (
                        <div key={lesson.id} className="flex items-center justify-between bg-white rounded-xl border border-[var(--color-indigo-light)] p-3 mb-2">
                          <div>
                            <div className="font-semibold text-sm">{lesson.title}</div>
                            <div className="text-xs text-[var(--color-ink)]/50">+{lesson.xp_reward} XP</div>
                          </div>
                          <div className="flex gap-3">
                            <button onClick={() => setEditingLesson(lesson)} className="text-xs font-semibold text-[var(--color-esmeralda-dark)]">Editar</button>
                            <button onClick={() => deleteLesson(lesson.id, mod.id)} className="text-xs font-semibold text-[var(--color-coral)]">Excluir</button>
                          </div>
                        </div>
                      ))}

                      {showNewLessonFor === mod.id ? (
                        <NewLessonForm moduleId={mod.id} nextOrder={(lessonsByModule[mod.id]?.length || 0) + 1}
                          onCancel={() => setShowNewLessonFor(null)}
                          onCreated={() => { setShowNewLessonFor(null); refreshLessons(mod.id) }} />
                      ) : (
                        <button onClick={() => setShowNewLessonFor(mod.id)} className="text-sm font-semibold text-[var(--color-esmeralda-dark)] mt-1">+ Adicionar aula</button>
                      )}
                    </div>
                  )}
                </div>
              ))}
            </div>
          )}
        </>
      )}

      {editingLesson && (
        <EditLessonModal lesson={editingLesson} onClose={() => setEditingLesson(null)}
          onSaved={() => { setEditingLesson(null); refreshLessons(editingLesson.module_id) }} />
      )}
    </div>
  )
}

const inputCls = "mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 text-sm"
const btnPrimary = "px-4 py-2 rounded-full text-sm font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition"

function NewModuleForm({ courseId, nextOrder, onCancel, onCreated }) {
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [saving, setSaving] = useState(false)

  async function submit(e) {
    e.preventDefault()
    setSaving(true)
    await supabase.from('modules').insert({ course_id: courseId, title, description, order_index: nextOrder })
    setSaving(false)
    onCreated()
  }

  return (
    <form onSubmit={submit} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-4 mb-4 space-y-3">
      <div>
        <label className="text-xs font-semibold">Título do módulo</label>
        <input required value={title} onChange={(e) => setTitle(e.target.value)} className={inputCls} />
      </div>
      <div>
        <label className="text-xs font-semibold">Descrição</label>
        <input value={description} onChange={(e) => setDescription(e.target.value)} className={inputCls} />
      </div>
      <div className="flex gap-2">
        <button type="button" onClick={onCancel} className="px-4 py-2 rounded-full text-sm font-semibold text-[var(--color-ink)]/60">Cancelar</button>
        <button disabled={saving} type="submit" className={btnPrimary}>{saving ? 'Salvando...' : 'Criar módulo'}</button>
      </div>
    </form>
  )
}

function NewLessonForm({ moduleId, nextOrder, onCancel, onCreated }) {
  const [form, setForm] = useState({ title: '', introduction: '', content: '', examples: '', xp_reward: 20 })
  const [saving, setSaving] = useState(false)

  async function submit(e) {
    e.preventDefault()
    setSaving(true)
    await supabase.from('lessons').insert({ module_id: moduleId, order_index: nextOrder, ...form })
    setSaving(false)
    onCreated()
  }

  return (
    <form onSubmit={submit} className="rounded-xl bg-white border border-[var(--color-indigo-light)] p-4 mt-2 space-y-3">
      <div>
        <label className="text-xs font-semibold">Título da aula</label>
        <input required value={form.title} onChange={(e) => setForm((f) => ({ ...f, title: e.target.value }))} className={inputCls} />
      </div>
      <div>
        <label className="text-xs font-semibold">Introdução</label>
        <textarea value={form.introduction} onChange={(e) => setForm((f) => ({ ...f, introduction: e.target.value }))} className={inputCls} rows={2} />
      </div>
      <div>
        <label className="text-xs font-semibold">Explicação (conteúdo)</label>
        <textarea value={form.content} onChange={(e) => setForm((f) => ({ ...f, content: e.target.value }))} className={inputCls} rows={4} />
      </div>
      <div>
        <label className="text-xs font-semibold">XP de recompensa</label>
        <input type="number" value={form.xp_reward} onChange={(e) => setForm((f) => ({ ...f, xp_reward: Number(e.target.value) }))} className={inputCls} />
      </div>
      <div className="flex gap-2">
        <button type="button" onClick={onCancel} className="px-4 py-2 rounded-full text-sm font-semibold text-[var(--color-ink)]/60">Cancelar</button>
        <button disabled={saving} type="submit" className={btnPrimary}>{saving ? 'Salvando...' : 'Criar aula'}</button>
      </div>
    </form>
  )
}

function EditLessonModal({ lesson, onClose, onSaved }) {
  const [form, setForm] = useState({ title: lesson.title, introduction: lesson.introduction || '', content: lesson.content || '', xp_reward: lesson.xp_reward })
  const [saving, setSaving] = useState(false)

  async function submit(e) {
    e.preventDefault()
    setSaving(true)
    await supabase.from('lessons').update(form).eq('id', lesson.id)
    setSaving(false)
    onSaved()
  }

  return (
    <div className="fixed inset-0 bg-black/30 flex items-center justify-center px-6 z-50 overflow-y-auto py-10">
      <div className="bg-white rounded-3xl p-6 w-full max-w-lg">
        <h2 className="font-display font-bold text-lg text-[var(--color-indigo)] mb-4">Editar aula</h2>
        <form onSubmit={submit} className="space-y-3">
          <div>
            <label className="text-xs font-semibold">Título</label>
            <input required value={form.title} onChange={(e) => setForm((f) => ({ ...f, title: e.target.value }))} className={inputCls} />
          </div>
          <div>
            <label className="text-xs font-semibold">Introdução</label>
            <textarea value={form.introduction} onChange={(e) => setForm((f) => ({ ...f, introduction: e.target.value }))} className={inputCls} rows={2} />
          </div>
          <div>
            <label className="text-xs font-semibold">Explicação (conteúdo)</label>
            <textarea value={form.content} onChange={(e) => setForm((f) => ({ ...f, content: e.target.value }))} className={inputCls} rows={6} />
          </div>
          <div>
            <label className="text-xs font-semibold">XP de recompensa</label>
            <input type="number" value={form.xp_reward} onChange={(e) => setForm((f) => ({ ...f, xp_reward: Number(e.target.value) }))} className={inputCls} />
          </div>
          <div className="flex gap-2 pt-2">
            <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-full text-sm font-semibold text-[var(--color-ink)]/60">Cancelar</button>
            <button disabled={saving} type="submit" className={`flex-1 py-2.5 rounded-full text-sm font-display font-bold bg-[var(--color-esmeralda)] text-white`}>{saving ? 'Salvando...' : 'Salvar alterações'}</button>
          </div>
        </form>
      </div>
    </div>
  )
}
