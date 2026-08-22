import { useEffect, useState } from 'react'
import { supabase } from '../../lib/supabaseClient'

export default function AdminAlunos() {
  const [students, setStudents] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => { load() }, [])

  async function load() {
    setLoading(true)
    const { data } = await supabase
      .from('students')
      .select('id, name, avatar_url, xp_total, level, created_at, profiles(email, full_name)')
      .order('created_at', { ascending: false })
    setStudents(data || [])
    setLoading(false)
  }

  return (
    <div>
      <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)] mb-6">Alunos</h1>

      {loading ? (
        <p className="text-[var(--color-ink)]/50">Carregando...</p>
      ) : students.length === 0 ? (
        <p className="text-[var(--color-ink)]/50">Nenhum aluno cadastrado ainda.</p>
      ) : (
        <div className="rounded-2xl bg-white border border-[var(--color-indigo-light)] overflow-hidden">
          <table className="w-full text-sm">
            <thead>
              <tr className="bg-[var(--color-bg)] text-left text-xs uppercase tracking-wide text-[var(--color-ink)]/50">
                <th className="p-3">Aluno</th>
                <th className="p-3">Responsável</th>
                <th className="p-3">Nível</th>
                <th className="p-3">XP</th>
              </tr>
            </thead>
            <tbody>
              {students.map((s) => (
                <tr key={s.id} className="border-t border-[var(--color-indigo-light)]">
                  <td className="p-3 flex items-center gap-2">
                    <span className="text-xl">{s.avatar_url || '🦁'}</span>
                    <span className="font-semibold">{s.name}</span>
                  </td>
                  <td className="p-3 text-[var(--color-ink)]/60">{s.profiles?.full_name} <span className="text-xs">({s.profiles?.email})</span></td>
                  <td className="p-3 font-mono-num">{s.level}</td>
                  <td className="p-3 font-mono-num">{s.xp_total}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
