import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'

export default function CursosAluno() {
  const { studentId } = useParams()
  const navigate = useNavigate()
  const [student, setStudent] = useState(null)
  const [courses, setCourses] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => { load() }, [studentId])

  async function load() {
    setLoading(true)
    const { data: st } = await supabase.from('students').select('*').eq('id', studentId).single()
    setStudent(st)

    const { data: c } = await supabase.from('courses').select('*').eq('is_published', true).order('order_index')
    setCourses(c || [])
    setLoading(false)
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]"><p className="font-display text-[var(--color-ink)]/50">Carregando...</p></div>
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-3xl mx-auto flex items-center justify-between px-6 py-6">
        <button onClick={() => navigate('/painel')} className="text-sm font-semibold text-[var(--color-indigo)]">← Voltar</button>
        <Logo size="sm" />
      </header>

      <main className="max-w-3xl mx-auto px-6 pb-16">
        <div className="flex items-center gap-4 mb-8">
          <div className="text-5xl">{student?.avatar_url || '🦁'}</div>
          <div>
            <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">{student?.name}</h1>
            <p className="text-sm text-[var(--color-ink)]/60">Nível {student?.level} · {student?.xp_total} XP</p>
          </div>
        </div>

        <h2 className="font-display font-bold text-lg text-[var(--color-indigo)] mb-4">Meus cursos</h2>

        <div className="grid sm:grid-cols-2 gap-4">
          {courses.map((c) => (
            <button key={c.id} onClick={() => navigate(`/aluno/${studentId}/curso/${c.slug}`)}
              className="text-left rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5 hover:shadow-md hover:-translate-y-0.5 transition">
              <div className="text-3xl mb-2">{c.icon}</div>
              <div className="font-display font-bold text-[var(--color-ink)]">{c.title}</div>
              <div className="text-xs text-[var(--color-ink)]/50 mt-1">{c.description}</div>
            </button>
          ))}

          <div className="rounded-2xl border-2 border-dashed border-[var(--color-indigo-light)] p-5 flex flex-col items-center justify-center text-center text-[var(--color-ink)]/40">
            <div className="text-2xl mb-1">🔒</div>
            <div className="text-sm font-display font-semibold">Novos cursos em breve</div>
          </div>
        </div>
      </main>
    </div>
  )
}
