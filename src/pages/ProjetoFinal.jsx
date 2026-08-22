import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'
import { FINAL_ACHIEVEMENT_BY_COURSE_SLUG } from '../lib/achievementsMap'
import { PROJECT_TEMPLATES, DEFAULT_TEMPLATE } from '../lib/projectTemplates'

export default function ProjetoFinal() {
  const { studentId, courseSlug } = useParams()
  const navigate = useNavigate()
  const template = PROJECT_TEMPLATES[courseSlug] || DEFAULT_TEMPLATE
  const [student, setStudent] = useState(null)
  const [course, setCourse] = useState(null)
  const [form, setForm] = useState(Object.fromEntries(template.fields.map((f) => [f.db, ''])))
  const [existing, setExisting] = useState(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)

  useEffect(() => { load() }, [studentId, courseSlug])

  async function load() {
    setLoading(true)
    const { data: st } = await supabase.from('students').select('*').eq('id', studentId).single()
    setStudent(st)

    const { data: c } = await supabase.from('courses').select('id, title').eq('slug', courseSlug).single()
    setCourse(c)

    if (c) {
      const { data: proj } = await supabase.from('student_projects').select('*').eq('student_id', studentId).eq('course_id', c.id).maybeSingle()
      if (proj) {
        setExisting(proj)
        const filled = {}
        template.fields.forEach((f) => { filled[f.db] = proj[f.db] ?? '' })
        setForm(filled)
      }
    }
    setLoading(false)
  }

  const lucro = template.showProfitCalc && form.sale_price && form.cost
    ? (Number(form.sale_price) - Number(form.cost)).toFixed(2)
    : null
  const preenchido = template.fields.every((f) => String(form[f.db]).trim().length > 0)

  async function submit(e) {
    e.preventDefault()
    setSaving(true)

    const payload = { student_id: studentId, course_id: course.id, ...form, submitted_at: new Date().toISOString() }
    if (template.showProfitCalc) {
      payload.cost = Number(form.cost)
      payload.sale_price = Number(form.sale_price)
      payload.profit_estimate = Number(form.sale_price) - Number(form.cost)
    }

    if (existing) {
      await supabase.from('student_projects').update(payload).eq('id', existing.id)
    } else {
      await supabase.from('student_projects').insert(payload)
    }

    const { data: cert } = await supabase.from('certificates').select('id').eq('student_id', studentId).eq('course_id', course.id).maybeSingle()
    if (!cert) {
      await supabase.from('certificates').insert({ student_id: studentId, course_id: course.id })
    }

    const achievementCode = FINAL_ACHIEVEMENT_BY_COURSE_SLUG[courseSlug]
    if (achievementCode) {
      const { data: ach } = await supabase.from('achievements').select('id').eq('code', achievementCode).single()
      if (ach) {
        await supabase.from('student_achievements').insert({ student_id: studentId, achievement_id: ach.id }).select()
      }
    }

    setSaving(false)
    navigate(`/aluno/${studentId}/curso/${courseSlug}/certificado`)
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]"><p className="font-display text-[var(--color-ink)]/50">Carregando...</p></div>
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-2xl mx-auto flex items-center justify-between px-6 py-6">
        <button onClick={() => navigate(`/aluno/${studentId}/curso/${courseSlug}`)} className="text-sm font-semibold text-[var(--color-indigo)]">← Trilha</button>
        <Logo size="sm" />
      </header>

      <main className="max-w-2xl mx-auto px-6 pb-16">
        <div className="text-center mb-6">
          <div className="text-4xl mb-2">{template.emoji}</div>
          <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">{template.title}</h1>
          <p className="text-sm text-[var(--color-ink)]/60 mt-1">{template.subtitle}</p>
        </div>

        <form onSubmit={submit} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5 space-y-4">
          {template.fields.map((campo) => (
            <div key={campo.db}>
              <label className="text-sm font-semibold text-[var(--color-ink)]">{campo.label}</label>
              {campo.type === 'textarea' ? (
                <textarea required value={form[campo.db]} placeholder={campo.placeholder}
                  onChange={(e) => setForm((f) => ({ ...f, [campo.db]: e.target.value }))}
                  className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 text-sm" rows={3} />
              ) : (
                <input required type={campo.type} value={form[campo.db]} placeholder={campo.placeholder}
                  onChange={(e) => setForm((f) => ({ ...f, [campo.db]: e.target.value }))}
                  className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 text-sm font-mono-num" />
              )}
            </div>
          ))}

          {lucro !== null && (
            <div className={`rounded-xl p-3 text-sm font-mono-num font-semibold ${Number(lucro) >= 0 ? 'bg-[var(--color-esmeralda-light)] text-[var(--color-esmeralda-dark)]' : 'bg-red-50 text-[var(--color-coral)]'}`}>
              {Number(lucro) >= 0 ? `Lucro estimado: R$ ${lucro}` : `Atenção: prejuízo de R$ ${Math.abs(lucro)}`}
            </div>
          )}

          <button disabled={!preenchido || saving} type="submit"
            className="w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition disabled:opacity-40">
            {saving ? 'Salvando...' : existing ? 'Atualizar projeto e ver certificado' : template.submitLabel}
          </button>
        </form>
      </main>
    </div>
  )
}
