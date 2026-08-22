import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'

export default function TrilhaAluno() {
  const { studentId } = useParams()
  const navigate = useNavigate()
  const [student, setStudent] = useState(null)
  const [modules, setModules] = useState([])
  const [progressByLesson, setProgressByLesson] = useState({})
  const [courseId, setCourseId] = useState(null)
  const [projectSubmitted, setProjectSubmitted] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => { load() }, [studentId])

  async function load() {
    setLoading(true)
    const { data: st } = await supabase.from('students').select('*').eq('id', studentId).single()
    setStudent(st)

    const { data: course } = await supabase
      .from('courses')
      .select('id, title')
      .eq('slug', 'educacao-financeira-empreendedorismo')
      .single()

    if (course) {
      setCourseId(course.id)
      const { data: mods } = await supabase
        .from('modules')
        .select('id, title, description, order_index, lessons(id, title, xp_reward, order_index)')
        .eq('course_id', course.id)
        .order('order_index')
      setModules(mods || [])

      const { data: proj } = await supabase.from('student_projects').select('id').eq('student_id', studentId).eq('course_id', course.id).maybeSingle()
      setProjectSubmitted(!!proj)
    }

    const { data: progress } = await supabase
      .from('student_progress')
      .select('lesson_id, status, score')
      .eq('student_id', studentId)
    const map = {}
    ;(progress || []).forEach((p) => { map[p.lesson_id] = p })
    setProgressByLesson(map)
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

        <h2 className="font-display font-bold text-lg text-[var(--color-indigo)] mb-4">💰 Educação Financeira e Empreendedorismo</h2>

        <ol className="space-y-3">
          {modules.map((mod, idx) => {
            const lesson = mod.lessons?.[0]
            const prog = lesson ? progressByLesson[lesson.id] : null
            const concluido = prog?.status === 'concluido'
            const anteriorConcluido = idx === 0 || (() => {
              const prevLesson = modules[idx - 1]?.lessons?.[0]
              return prevLesson && progressByLesson[prevLesson.id]?.status === 'concluido'
            })()
            const bloqueado = !anteriorConcluido && !concluido

            return (
              <li key={mod.id}>
                <button
                  disabled={bloqueado || !lesson}
                  onClick={() => navigate(`/aluno/${studentId}/aula/${lesson.id}`)}
                  className={`w-full text-left flex items-center gap-4 rounded-2xl border p-4 transition ${
                    bloqueado
                      ? 'border-[var(--color-indigo-light)] bg-white/50 opacity-50 cursor-not-allowed'
                      : concluido
                      ? 'border-[var(--color-esmeralda)] bg-[var(--color-esmeralda-light)]'
                      : 'border-[var(--color-indigo-light)] bg-white hover:shadow-md'
                  }`}
                >
                  <div className={`w-10 h-10 rounded-full flex items-center justify-center font-display font-bold text-sm shrink-0 ${
                    concluido ? 'bg-[var(--color-esmeralda)] text-white' : bloqueado ? 'bg-[var(--color-indigo-light)] text-[var(--color-ink)]/40' : 'bg-[var(--color-ambar-light)] text-[var(--color-ambar-dark)]'
                  }`}>
                    {concluido ? '✓' : bloqueado ? '🔒' : idx + 1}
                  </div>
                  <div className="flex-1">
                    <div className="font-display font-semibold text-[var(--color-ink)]">{mod.title}</div>
                    <div className="text-xs text-[var(--color-ink)]/50">{mod.description}</div>
                  </div>
                  {lesson && <span className="text-xs font-mono-num text-[var(--color-ambar-dark)] shrink-0">+{lesson.xp_reward} XP</span>}
                </button>
              </li>
            )
          })}

          {(() => {
            const todosConcluidos = modules.length > 0 && modules.every((m) => {
              const l = m.lessons?.[0]
              return l && progressByLesson[l.id]?.status === 'concluido'
            })
            const bloqueado = !todosConcluidos

            return (
              <li>
                <button
                  disabled={bloqueado}
                  onClick={() => navigate(projectSubmitted ? `/aluno/${studentId}/certificado` : `/aluno/${studentId}/projeto-final`)}
                  className={`w-full text-left flex items-center gap-4 rounded-2xl border-2 p-4 transition ${
                    bloqueado
                      ? 'border-[var(--color-indigo-light)] bg-white/50 opacity-50 cursor-not-allowed'
                      : projectSubmitted
                      ? 'border-[var(--color-ambar)] bg-[var(--color-ambar-light)]'
                      : 'border-dashed border-[var(--color-ambar)] bg-white hover:shadow-md'
                  }`}
                >
                  <div className={`w-10 h-10 rounded-full flex items-center justify-center text-lg shrink-0 ${
                    projectSubmitted ? 'bg-[var(--color-ambar)]' : bloqueado ? 'bg-[var(--color-indigo-light)]' : 'bg-[var(--color-ambar-light)]'
                  }`}>
                    {projectSubmitted ? '🎓' : bloqueado ? '🔒' : '🚀'}
                  </div>
                  <div className="flex-1">
                    <div className="font-display font-semibold text-[var(--color-ink)]">
                      {projectSubmitted ? 'Ver certificado' : 'Projeto Final: Meu Primeiro Negócio'}
                    </div>
                    <div className="text-xs text-[var(--color-ink)]/50">
                      {projectSubmitted ? 'Parabéns, curso concluído!' : 'Junte tudo o que aprendeu e conclua o curso'}
                    </div>
                  </div>
                </button>
              </li>
            )
          })()}
        </ol>
      </main>
    </div>
  )
}
