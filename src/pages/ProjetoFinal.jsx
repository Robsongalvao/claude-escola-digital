import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'
import { FINAL_ACHIEVEMENT_CODE } from '../lib/achievementsMap'

const CAMPOS = [
  { key: 'business_name', label: 'Nome do negócio', type: 'text', placeholder: 'Ex: Doces da Ana' },
  { key: 'product_service', label: 'Produto ou serviço', type: 'text', placeholder: 'O que você vai oferecer?' },
  { key: 'target_audience', label: 'Público-alvo', type: 'text', placeholder: 'Quem vai comprar de você?' },
  { key: 'problem_solved', label: 'Qual problema ele resolve', type: 'textarea', placeholder: 'Que necessidade ou desejo isso atende?' },
  { key: 'cost', label: 'Custo (R$)', type: 'number', placeholder: '0.00' },
  { key: 'sale_price', label: 'Preço de venda (R$)', type: 'number', placeholder: '0.00' },
  { key: 'marketing_strategy', label: 'Estratégia de divulgação', type: 'textarea', placeholder: 'Como as pessoas vão saber do seu negócio?' },
  { key: 'service_approach', label: 'Forma de atendimento', type: 'textarea', placeholder: 'Como você vai tratar seus clientes?' },
  { key: 'social_post_text', label: 'Publicação para rede social (fictícia)', type: 'textarea', placeholder: 'Escreva um post de apresentação do seu negócio' },
]

export default function ProjetoFinal() {
  const { studentId } = useParams()
  const navigate = useNavigate()
  const [student, setStudent] = useState(null)
  const [course, setCourse] = useState(null)
  const [form, setForm] = useState(Object.fromEntries(CAMPOS.map((c) => [c.key, ''])))
  const [existing, setExisting] = useState(null)
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)

  useEffect(() => { load() }, [studentId])

  async function load() {
    setLoading(true)
    const { data: st } = await supabase.from('students').select('*').eq('id', studentId).single()
    setStudent(st)

    const { data: c } = await supabase.from('courses').select('id, title').eq('slug', 'educacao-financeira-empreendedorismo').single()
    setCourse(c)

    if (c) {
      const { data: proj } = await supabase.from('student_projects').select('*').eq('student_id', studentId).eq('course_id', c.id).maybeSingle()
      if (proj) {
        setExisting(proj)
        setForm({
          business_name: proj.business_name || '',
          product_service: proj.product_service || '',
          target_audience: proj.target_audience || '',
          problem_solved: proj.problem_solved || '',
          cost: proj.cost ?? '',
          sale_price: proj.sale_price ?? '',
          marketing_strategy: proj.marketing_strategy || '',
          service_approach: proj.service_approach || '',
          social_post_text: proj.social_post_text || '',
        })
      }
    }
    setLoading(false)
  }

  const lucro = form.sale_price && form.cost ? (Number(form.sale_price) - Number(form.cost)).toFixed(2) : null
  const preenchido = CAMPOS.every((c) => String(form[c.key]).trim().length > 0)

  async function submit(e) {
    e.preventDefault()
    setSaving(true)

    const payload = {
      student_id: studentId,
      course_id: course.id,
      ...form,
      cost: Number(form.cost),
      sale_price: Number(form.sale_price),
      profit_estimate: Number(form.sale_price) - Number(form.cost),
      submitted_at: new Date().toISOString(),
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

    const { data: ach } = await supabase.from('achievements').select('id').eq('code', FINAL_ACHIEVEMENT_CODE).single()
    if (ach) {
      await supabase.from('student_achievements').insert({ student_id: studentId, achievement_id: ach.id }).select()
    }

    setSaving(false)
    navigate(`/aluno/${studentId}/certificado`)
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]"><p className="font-display text-[var(--color-ink)]/50">Carregando...</p></div>
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-2xl mx-auto flex items-center justify-between px-6 py-6">
        <button onClick={() => navigate(`/aluno/${studentId}`)} className="text-sm font-semibold text-[var(--color-indigo)]">← Trilha</button>
        <Logo size="sm" />
      </header>

      <main className="max-w-2xl mx-auto px-6 pb-16">
        <div className="text-center mb-6">
          <div className="text-4xl mb-2">🚀</div>
          <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">Projeto Final: Meu Primeiro Negócio</h1>
          <p className="text-sm text-[var(--color-ink)]/60 mt-1">Você aprendeu, praticou e planejou. Agora é hora de criar!</p>
        </div>

        <form onSubmit={submit} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5 space-y-4">
          {CAMPOS.map((campo) => (
            <div key={campo.key}>
              <label className="text-sm font-semibold text-[var(--color-ink)]">{campo.label}</label>
              {campo.type === 'textarea' ? (
                <textarea required value={form[campo.key]} placeholder={campo.placeholder}
                  onChange={(e) => setForm((f) => ({ ...f, [campo.key]: e.target.value }))}
                  className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 text-sm" rows={3} />
              ) : (
                <input required type={campo.type} value={form[campo.key]} placeholder={campo.placeholder}
                  onChange={(e) => setForm((f) => ({ ...f, [campo.key]: e.target.value }))}
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
            {saving ? 'Salvando...' : existing ? 'Atualizar projeto e ver certificado' : 'Concluir curso e gerar certificado 🎓'}
          </button>
        </form>
      </main>
    </div>
  )
}
