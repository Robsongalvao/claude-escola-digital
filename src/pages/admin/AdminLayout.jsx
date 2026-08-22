import { NavLink, Outlet, useNavigate } from 'react-router-dom'
import Logo from '../../components/Logo'
import { useAuth } from '../../context/AuthContext'

const NAV = [
  { to: '/admin', label: 'Visão geral', end: true },
  { to: '/admin/cursos', label: 'Cursos' },
  { to: '/admin/alunos', label: 'Alunos' },
]

export default function AdminLayout() {
  const { profile, signOut } = useAuth()
  const navigate = useNavigate()

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="border-b border-[var(--color-indigo-light)] bg-white">
        <div className="max-w-5xl mx-auto flex items-center justify-between px-6 py-4">
          <div className="flex items-center gap-6">
            <Logo size="sm" />
            <span className="text-xs font-semibold uppercase tracking-wide text-[var(--color-ambar-dark)] bg-[var(--color-ambar-light)] px-2 py-1 rounded-full">
              {profile?.role === 'admin' ? 'Admin' : 'Professor'}
            </span>
          </div>
          <div className="flex items-center gap-4">
            <button onClick={() => navigate('/painel')} className="text-sm font-semibold text-[var(--color-indigo)]">Área da família</button>
            <button onClick={signOut} className="text-sm font-semibold text-[var(--color-coral)]">Sair</button>
          </div>
        </div>
        <nav className="max-w-5xl mx-auto flex gap-1 px-6">
          {NAV.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              end={item.end}
              className={({ isActive }) =>
                `px-4 py-2.5 text-sm font-display font-semibold border-b-2 transition ${
                  isActive ? 'border-[var(--color-esmeralda)] text-[var(--color-esmeralda-dark)]' : 'border-transparent text-[var(--color-ink)]/50 hover:text-[var(--color-ink)]'
                }`
              }
            >
              {item.label}
            </NavLink>
          ))}
        </nav>
      </header>

      <main className="max-w-5xl mx-auto px-6 py-8">
        <Outlet />
      </main>
    </div>
  )
}
