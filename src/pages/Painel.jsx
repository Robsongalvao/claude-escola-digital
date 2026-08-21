import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { useAuth } from '../context/AuthContext'
import { supabase } from '../lib/supabaseClient'

const AVATARES = ['🦁', '🐼', '🦊', '🐸', '🐧', '🦉', '🐢', '🦄']

export default function Painel() {
  const { profile, signOut } = useAuth()
  const navigate = useNavigate()
  const [students, setStudents] = useState([])
  const [loadingList, setLoadingList] = useState(true)
  const [showForm, setShowForm] = useState(false)

  useEffect(() => {
    if (profile) loadStudents()
  }, [profile])

  async function loadStudents() {
    setLoadingList(true)
    const { data } = await supabase.from('students').select('*').eq('responsavel_id', profile.id).order('created_at')
    setStudents(data || [])
    setLoadingList(false)
  }

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-5xl mx-auto flex items-center justify-between px-6 py-6">
        <Logo size="sm" />
        <div className="flex items-center gap-4">
          <span className="text-sm text-[var(--color-ink)]/60">Olá, {profile?.full_name?.split(' ')[0]}</span>
          <button onClick={signOut} className="text-sm font-semibold text-[var(--color-coral)]">Sair</button>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-6 pb-16">
        <div className="flex items-center justify-between mb-6">
          <h1 className="font-display font-bold text-2xl text-[var(--color-indigo)]">Meus filhos</h1>
          <button onClick={() => setShowForm(true)}
            className="px-5 py-2.5 rounded-full font-display font-bold bg-[var(--color-ambar)] text-[var(--color-indigo-dark)] hover:bg-[var(--color-ambar-dark)] transition">
            + Adicionar filho
          </button>
        </div>

        {loadingList ? (
          <p className="text-[var(--color-ink)]/50">Carregando...</p>
        ) : students.length === 0 && !showForm ? (
          <div className="rounded-3xl border-2 border-dashed border-[var(--color-indigo-light)] p-12 text-center">
            <div className="text-5xl mb-3">👨‍👩‍👧</div>
            <p className="font-display font-semibold text-[var(--color-indigo)] mb-1">Nenhum perfil cadastrado ainda</p>
            <p className="text-sm text-[var(--color-ink)]/60 mb-5">Crie o primeiro perfil para começar a jornada de aprendizado.</p>
            <button onClick={() => setShowForm(true)}
              className="px-5 py-2.5 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">
              Adicionar filho
            </button>
          </div>
        ) : (
          <div className="grid sm:grid-cols-2 md:grid-cols-3 gap-4">
            {students.map((s) => (
              <button key={s.id} onClick={() => navigate(`/aluno/${s.id}`)}
                className="text-left rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5 hover:shadow-md hover:-translate-y-0.5 transition">
                <div className="text-4xl mb-2">{s.avatar_url || '🦁'}</div>
                <div className="font-display font-bold text-[var(--color-ink)]">{s.name}</div>
                <div className="text-xs text-[var(--color-ink)]/50 mt-1">Nível {s.level} · {s.xp_total} XP</div>
              </button>
            ))}
          </div>
        )}

        {showForm && (
          <AddChildForm
            responsavelId={profile.id}
            onClose={() => setShowForm(false)}
            onCreated={() => { setShowForm(false); loadStudents() }}
          />
        )}
      </main>
    </div>
  )
}

function AddChildForm({ responsavelId, onClose, onCreated }) {
  const [name, setName] = useState('')
  const [birthDate, setBirthDate] = useState('')
  const [avatar, setAvatar] = useState(AVATARES[0])
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  async function handleSubmit(e) {
    e.preventDefault()
    setSaving(true)
    setError(null)
    const { error } = await supabase.from('students').insert({
      responsavel_id: responsavelId,
      name,
      birth_date: birthDate || null,
      avatar_url: avatar,
    })
    setSaving(false)
    if (error) {
      setError('Não foi possível salvar. Tente novamente.')
      return
    }
    onCreated()
  }

  return (
    <div className="fixed inset-0 bg-black/30 flex items-center justify-center px-6 z-50">
      <div className="bg-white rounded-3xl p-7 w-full max-w-sm">
        <h2 className="font-display font-bold text-xl text-[var(--color-indigo)] mb-5">Novo perfil de aluno</h2>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="text-sm font-semibold">Nome</label>
            <input required value={name} onChange={(e) => setName(e.target.value)}
              className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
          </div>
          <div>
            <label className="text-sm font-semibold">Data de nascimento</label>
            <input type="date" value={birthDate} onChange={(e) => setBirthDate(e.target.value)}
              className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
          </div>
          <div>
            <label className="text-sm font-semibold">Avatar</label>
            <div className="mt-2 flex gap-2 flex-wrap">
              {AVATARES.map((a) => (
                <button type="button" key={a} onClick={() => setAvatar(a)}
                  className={`text-2xl w-11 h-11 rounded-xl border-2 transition ${avatar === a ? 'border-[var(--color-esmeralda)] bg-[var(--color-esmeralda-light)]' : 'border-transparent bg-[var(--color-bg)]'}`}>
                  {a}
                </button>
              ))}
            </div>
          </div>

          {error && <p className="text-sm text-[var(--color-coral)]">{error}</p>}

          <div className="flex gap-3 pt-2">
            <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-full font-semibold text-[var(--color-ink)]/60">
              Cancelar
            </button>
            <button disabled={saving} type="submit"
              className="flex-1 py-2.5 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white disabled:opacity-60">
              {saving ? 'Salvando...' : 'Salvar'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
