import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import ActivityRenderer from '../components/activities/ActivityRenderer'
import QuizRunner from '../components/QuizRunner'
import { supabase } from '../lib/supabaseClient'
import { ACHIEVEMENT_BY_MODULE_TITLE, TOTAL_MODULES, FINAL_ACHIEVEMENT_CODE } from '../lib/achievementsMap'

const STEPS = ['introducao', 'explicacao', 'atividade', 'quiz', 'resultado']

export default function Aula() {
  const { studentId, lessonId } = useParams()
  const navigate = useNavigate()
  const [step, setStep] = useState(0)
  const [lesson, setLesson] = useState(null)
  const [moduleTitle, setModuleTitle] = useState('')
  const [activity, setActivity] = useState(null)
  const [quiz, setQuiz] = useState(null)
  const [loading, setLoading] = useState(true)
  const [score, setScore] = useState(null)
  const [newAchievements, setNewAchievements] = useState([])
  const [saving, setSaving] = useState(false)

  useEffect(() => { load() }, [lessonId])

  async function load() {
    setLoading(true)
    setStep(0)
    setScore(null)

    const { data: lessonData } = await supabase
      .from('lessons')
      .select('*, modules(title)')
      .eq('id', lessonId)
      .single()
    setLesson(lessonData)
    setModuleTitle(lessonData?.modules?.title || '')

    const { data: activityData } = await supabase.from('activities').select('*').eq('lesson_id', lessonId).order('order_index').limit(1).single()
    setActivity(activityData)

    const { data: quizData } = await supabase.from('quizzes').select('id, title').eq('lesson_id', lessonId).single()
    if (quizData) {
      const { data: questions } = await supabase.from('quiz_questions').select('*').eq('quiz_id', quizData.id).order('order_index')
      setQuiz({ ...quizData, questions: questions || [] })
    }

    setLoading(false)
  }

  async function finalizarQuiz(quizScore) {
    setScore(quizScore)
    setSaving(true)

    await supabase.from('student_progress').upsert({
      student_id: studentId,
      lesson_id: lessonId,
      status: 'concluido',
      score: quizScore,
      completed_at: new Date().toISOString(),
    }, { onConflict: 'student_id,lesson_id' })

    const { data: student } = await supabase.from('students').select('xp_total, level').eq('id', studentId).single()
    const novoXp = (student?.xp_total || 0) + (lesson?.xp_reward || 20)
    const novoLevel = Math.floor(novoXp / 100) + 1
    await supabase.from('students').update({ xp_total: novoXp, level: novoLevel }).eq('id', studentId)

    const codigosParaGanhar = ACHIEVEMENT_BY_MODULE_TITLE[moduleTitle] || []
    const desbloqueadas = []
    for (const code of codigosParaGanhar) {
      const { data: ach } = await supabase.from('achievements').select('id').eq('code', code).single()
      if (ach) {
        const { error } = await supabase.from('student_achievements').insert({ student_id: studentId, achievement_id: ach.id })
        if (!error) desbloqueadas.push(code)
      }
    }

    const { count } = await supabase.from('student_progress').select('*', { count: 'exact', head: true }).eq('student_id', studentId).eq('status', 'concluido')
    if (count >= TOTAL_MODULES) {
      const { data: finalAch } = await supabase.from('achievements').select('id').eq('code', FINAL_ACHIEVEMENT_CODE).single()
      if (finalAch) {
        const { error } = await supabase.from('student_achievements').insert({ student_id: studentId, achievement_id: finalAch.id })
        if (!error) desbloqueadas.push(FINAL_ACHIEVEMENT_CODE)
      }
    }

    setNewAchievements(desbloqueadas)
    setSaving(false)
    setStep(4)
  }

  if (loading || !lesson) {
    return <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]"><p className="font-display text-[var(--color-ink)]/50">Carregando...</p></div>
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-2xl mx-auto flex items-center justify-between px-6 py-6">
        <button onClick={() => navigate(`/aluno/${studentId}`)} className="text-sm font-semibold text-[var(--color-indigo)]">← Trilha</button>
        <Logo size="sm" />
      </header>

      <main className="max-w-2xl mx-auto px-6 pb-16">
        <div className="mb-6">
          <p className="text-xs font-semibold text-[var(--color-esmeralda-dark)] uppercase tracking-wide">{moduleTitle}</p>
          <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">{lesson.title}</h1>
          <div className="flex gap-1.5 mt-3">
            {STEPS.map((s, i) => (
              <div key={s} className={`h-1.5 flex-1 rounded-full ${i <= step ? 'bg-[var(--color-esmeralda)]' : 'bg-[var(--color-indigo-light)]'}`} />
            ))}
          </div>
        </div>

        {step === 0 && (
          <div className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5">
            <div className="text-3xl mb-3">👋</div>
            <p className="text-[var(--color-ink)] leading-relaxed whitespace-pre-line">{lesson.introduction}</p>
            <button onClick={() => setStep(1)} className="w-full mt-5 py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">Vamos aprender!</button>
          </div>
        )}

        {step === 1 && (
          <div className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5">
            <p className="text-[var(--color-ink)] leading-relaxed whitespace-pre-line">{lesson.content}</p>
            <button onClick={() => setStep(2)} className="w-full mt-5 py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">
              {activity ? 'Ir para a atividade' : 'Ir para o quiz'}
            </button>
          </div>
        )}

        {step === 2 && activity && (
          <div>
            <p className="font-display font-bold text-lg text-[var(--color-indigo)] mb-3">🎮 {activity.title}</p>
            <ActivityRenderer activity={activity} onComplete={() => setStep(3)} />
          </div>
        )}

        {step === 3 && quiz && quiz.questions.length > 0 && (
          <div>
            <p className="font-display font-bold text-lg text-[var(--color-indigo)] mb-3">📝 {quiz.title}</p>
            <QuizRunner questions={quiz.questions} onFinish={finalizarQuiz} />
            {saving && <p className="text-center text-sm text-[var(--color-ink)]/50 mt-3">Salvando seu progresso...</p>}
          </div>
        )}

        {step === 4 && (
          <div className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-6 text-center">
            <div className="text-5xl mb-3">🎉</div>
            <p className="font-display font-bold text-xl text-[var(--color-indigo)] mb-1">Parabéns! Você concluiu mais uma etapa.</p>
            <p className="text-sm text-[var(--color-ink)]/60 mb-4">Continue avançando!</p>
            <p className="font-mono-num text-lg font-bold text-[var(--color-ambar-dark)] mb-1">Acertos: {score}%</p>
            <p className="font-mono-num text-sm text-[var(--color-esmeralda-dark)] mb-4">+{lesson.xp_reward} XP</p>

            {newAchievements.length > 0 && (
              <div className="bg-[var(--color-ambar-light)] rounded-xl p-4 mb-4">
                <p className="text-sm font-semibold text-[var(--color-ambar-dark)] mb-1">🏅 Nova conquista desbloqueada!</p>
                <p className="text-xs text-[var(--color-ink)]/60">Confira no seu perfil</p>
              </div>
            )}

            <button onClick={() => navigate(`/aluno/${studentId}`)} className="w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">
              Voltar para a trilha
            </button>
          </div>
        )}
      </main>
    </div>
  )
}
