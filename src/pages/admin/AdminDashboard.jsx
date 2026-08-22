import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabaseClient'

export default function AdminDashboard() {
  const [stats, setStats] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => { load() }, [])

  async function load() {
    setLoading(true)
    const [courses, students, modules, lessonsCompleted, families] = await Promise.all([
      supabase.from('courses').select('*', { count: 'exact', head: true }),
      supabase.from('students').select('*', { count: 'exact', head: true }),
      supabase.from('modules').select('*', { count: 'exact', head: true }),
      supabase.from('student_progress').select('*', { count: 'exact', head: true }).eq('status', 'concluido'),
      supabase.from('profiles').select('*', { count: 'exact', head: true }).eq('role', 'responsavel'),
    ])
    setStats({
      cursos: courses.count || 0,
      modulos: modules.count || 0,
      alunos: students.count || 0,
      familias: families.count || 0,
      aulasConcluidas: lessonsCompleted.count || 0,
    })
    setLoading(false)
  }

  const cards = stats && [
    { label: 'Cursos', value: stats.cursos, emoji: '📚' },
    { label: 'Módulos', value: stats.modulos, emoji: '🧩' },
    { label: 'Famílias cadastradas', value: stats.familias, emoji: '👨‍👩‍👧' },
    { label: 'Alunos (perfis)', value: stats.alunos, emoji: '🧒' },
    { label: 'Aulas concluídas (total)', value: stats.aulasConcluidas, emoji: '✅' },
  ]

  return (
    <div>
      <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)] mb-6">Visão geral</h1>
      {loading ? (
        <p className="text-[var(--color-ink)]/50">Carregando...</p>
      ) : (
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
          {cards.map((c) => (
            <div key={c.label} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5">
              <div className="text-2xl mb-2">{c.emoji}</div>
              <div className="font-mono-num text-2xl font-bold text-[var(--color-indigo)]">{c.value}</div>
              <div className="text-xs text-[var(--color-ink)]/50 mt-1">{c.label}</div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
