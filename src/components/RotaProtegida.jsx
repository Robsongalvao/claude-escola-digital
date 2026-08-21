import { Navigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

export default function RotaProtegida({ children }) {
  const { session, loading } = useAuth()

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]">
        <p className="text-[var(--color-ink)]/50 font-display">Carregando...</p>
      </div>
    )
  }

  if (!session) return <Navigate to="/entrar" replace />

  return children
}
