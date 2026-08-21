import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { useAuth } from '../context/AuthContext'

export default function Login() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState(null)
  const [loadingSubmit, setLoadingSubmit] = useState(false)

  async function handleSubmit(e) {
    e.preventDefault()
    setError(null)
    setLoadingSubmit(true)
    const { error } = await signIn({ email, password })
    setLoadingSubmit(false)
    if (error) {
      setError('E-mail ou senha incorretos.')
      return
    }
    navigate('/painel')
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] px-6">
      <div className="w-full max-w-sm">
        <div className="flex justify-center mb-8"><Logo /></div>
        <div className="bg-white rounded-3xl border border-[var(--color-indigo-light)] p-7 shadow-sm">
          <h1 className="font-display font-bold text-xl text-[var(--color-indigo)] mb-6">Entrar na sua conta</h1>

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="text-sm font-semibold text-[var(--color-ink)]">E-mail</label>
              <input required type="email" value={email} onChange={(e) => setEmail(e.target.value)}
                className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
            </div>
            <div>
              <label className="text-sm font-semibold text-[var(--color-ink)]">Senha</label>
              <input required type="password" value={password} onChange={(e) => setPassword(e.target.value)}
                className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-4 py-2.5 outline-none focus:ring-2 focus:ring-[var(--color-esmeralda)]" />
            </div>

            {error && <p className="text-sm text-[var(--color-coral)]">{error}</p>}

            <button disabled={loadingSubmit} type="submit"
              className="w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition disabled:opacity-60">
              {loadingSubmit ? 'Entrando...' : 'Entrar'}
            </button>
          </form>

          <p className="text-sm text-center mt-5 text-[var(--color-ink)]/60">
            Não tem conta? <Link to="/cadastro" className="font-semibold text-[var(--color-esmeralda-dark)]">Criar conta</Link>
          </p>
        </div>
      </div>
    </div>
  )
}
