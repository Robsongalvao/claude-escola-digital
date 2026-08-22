import { Navigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

export default function RotaAdmin({ children }) {
  const { session, profile, loading } = useAuth()

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]">
        <p className="text-[var(--color-ink)]/50 font-display">Carregando...</p>
      </div>
    )
  }

  if (!session) return <Navigate to="/entrar" replace />

  if (!profile || !['admin', 'professor'].includes(profile.role)) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] px-6">
        <div className="text-center">
          <div className="text-4xl mb-3">🔒</div>
          <p className="font-display font-bold text-[var(--color-indigo)] mb-1">Acesso restrito</p>
          <p className="text-sm text-[var(--color-ink)]/60">Essa área é exclusiva para administradores e professores.</p>
        </div>
      </div>
    )
  }

  return children
}
