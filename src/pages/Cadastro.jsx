import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { useAuth } from '../context/AuthContext'

export default function Cadastro() {
  const { signUp } = useAuth()
  const navigate = useNavigate()
  const [fullName, setFullName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState(null)
  const [loadingSubmit, setLoadingSubmit] = useState(false)
  const [confirmarEmail, setConfirmarEmail] = useState(false)

  async function handleSubmit(e) {
    e.preventDefault()
    setError(null)
    setLoadingSubmit(true)
    const { error, needsEmailConfirmation } = await signUp({ email, password, fullName })
    setLoadingSubmit(false)
    if (error) {
      setError(traduzErro(error.message))
      return
    }
    if (needsEmailConfirmation) {
      setConfirmarEmail(true)
      return
    }
    navigate('/painel')
  }

  if (confirmarEmail) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] px-6">
        <div className="w-full max-w-sm text-center">
          <div className="flex justify-center mb-8"><Logo /></div>
          <div className="bg-white rounded-3xl border border-[var(--color-indigo-light)] p-7 shadow-sm">
            <div className="text-4xl mb-3">📬</div>
            <h1 className="font-display font-bold text-xl text-[var(--color-indigo)] mb-2">Confirme seu e-mail</h1>
            <p className="text-sm text-[var(--color-ink)]/60">
              Enviamos um link de confirmação para <strong>{email}</strong>. Clique nele para ativar sua conta e depois entre normalmente.
            </p>
            <Link to="/entrar" className="inline-block mt-5 font-semibold text-[var(--color-esmeralda-dark)]">Ir para o login</Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] px-6">
      <div className="w-full max-w-sm">
        <div className="flex justify-center mb-8"><Logo /></div>
        <div className="bg-white rounded-3xl border border-[var(--color-indigo-light)] p-7 shadow-sm">
          <h1 className="font-display font-bold text-xl text-[var(--color-indigo)] mb-1">Criar conta de responsável</h1>
          <p className="text-sm text-[var(--color-ink)]/60 mb-6">Depois você cadastra o perfil do seu filho ou filha dentro da conta.</p>

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="text-sm font-semibold text-[var(--color-ink)]">Seu nome</label>
              <input required value={fullName} onChange={(e) => setFullName(e.target.value)}
                className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
            </div>
            <div>
              <label className="text-sm font-semibold text-[var(--color-ink)]">E-mail</label>
              <input required type="email" value={email} onChange={(e) => setEmail(e.target.value)}
                className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
            </div>
            <div>
              <label className="text-sm font-semibold text-[var(--color-ink)]">Senha</label>
              <input required type="password" minLength={6} value={password} onChange={(e) => setPassword(e.target.value)}
                className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
            </div>

            {error && <p className="text-sm text-[var(--color-coral)]">{error}</p>}

            <button disabled={loadingSubmit} type="submit"
              className="w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition disabled:opacity-60">
              {loadingSubmit ? 'Criando conta...' : 'Criar conta'}
            </button>
          </form>

          <p className="text-sm text-center mt-5 text-[var(--color-ink)]/60">
            Já tem conta? <Link to="/entrar" className="font-semibold text-[var(--color-esmeralda-dark)]">Entrar</Link>
          </p>
        </div>
      </div>
    </div>
  )
}

function traduzErro(msg) {
  if (msg.includes('already registered')) return 'Esse e-mail já está cadastrado.'
  if (msg.includes('Password')) return 'A senha precisa ter pelo menos 6 caracteres.'
  return 'Não foi possível criar a conta. Tente novamente.'
}
