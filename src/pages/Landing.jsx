import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'

export default function Landing() {
  const [courses, setCourses] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase.from('courses').select('*').eq('is_published', true).order('order_index')
      .then(({ data }) => { setCourses(data || []); setLoading(false) })
  }, [])

  return (
    <div className="min-h-screen bg-[var(--color-bg)]">
      <header className="max-w-6xl mx-auto flex items-center justify-between px-6 py-6">
        <Logo />
        <div className="flex gap-3">
          <Link to="/entrar" className="px-4 py-2 rounded-full font-semibold text-[var(--color-indigo)] hover:bg-[var(--color-indigo-light)] transition">
            Entrar
          </Link>
          <Link to="/cadastro" className="px-4 py-2 rounded-full font-semibold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">
            Criar conta
          </Link>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-6">
        <section className="pt-10 pb-16 grid md:grid-cols-2 gap-10 items-center">
          <div>
            <h1 className="font-display font-extrabold text-4xl md:text-5xl leading-tight text-[var(--color-ink)]">
              Aprender hoje para
              <span className="text-[var(--color-esmeralda)]"> transformar </span>
              o amanhã.
            </h1>
            <p className="mt-5 text-lg text-[var(--color-ink)]/70 max-w-md">
              Uma escola digital onde crianças e adolescentes aprendem sobre dinheiro, empreendedorismo
              e desenvolvimento pessoal brincando, praticando e criando projetos de verdade.
            </p>
            <div className="mt-8 flex gap-3">
              <Link to="/cadastro" className="px-6 py-3 rounded-full font-display font-bold bg-[var(--color-ambar)] text-[var(--color-indigo-dark)] hover:bg-[var(--color-ambar-dark)] transition shadow-lg shadow-[var(--color-ambar)]/30">
                Começar agora
              </Link>
            </div>
          </div>

          {/* Elemento de assinatura: trilha de progresso estilo mapa de jogo */}
          <div className="relative">
            <svg viewBox="0 0 320 380" className="w-full max-w-sm mx-auto">
              <path
                d="M 40 30 C 120 30, 20 100, 100 120 C 200 145, 40 180, 90 220 C 150 260, 260 220, 250 280 C 245 320, 160 320, 160 350"
                fill="none"
                stroke="var(--color-indigo-light)"
                strokeWidth="6"
                className="trilha-path"
              />
              {[
                { x: 40, y: 30, emoji: '💰' },
                { x: 100, y: 120, emoji: '🧠' },
                { x: 90, y: 220, emoji: '🐷' },
                { x: 250, y: 280, emoji: '🏪' },
                { x: 160, y: 350, emoji: '🏆' },
              ].map((p, i) => (
                <g key={i}>
                  <circle cx={p.x} cy={p.y} r="22" fill="white" stroke="var(--color-esmeralda)" strokeWidth="3" />
                  <text x={p.x} y={p.y + 7} textAnchor="middle" fontSize="20">{p.emoji}</text>
                </g>
              ))}
            </svg>
          </div>
        </section>

        <section className="py-14">
          <h2 className="font-display font-bold text-2xl text-[var(--color-indigo)] mb-1">Nossos Cursos</h2>
          <p className="text-[var(--color-ink)]/60 mb-8">Uma trilha de aprendizado que cresce com o aluno</p>

          {loading ? (
            <p className="text-[var(--color-ink)]/40">Carregando cursos...</p>
          ) : (
            <div className="grid sm:grid-cols-2 md:grid-cols-3 gap-4">
              {courses.map((c) => (
                <div key={c.id} className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5 hover:shadow-md hover:-translate-y-0.5 transition">
                  <div className="text-3xl mb-3">{c.icon}</div>
                  <div className="font-display font-semibold text-[var(--color-ink)]">{c.title}</div>
                  <div className="text-xs text-[var(--color-ink)]/50 mt-1">{c.description}</div>
                </div>
              ))}

              <div className="rounded-2xl border-2 border-dashed border-[var(--color-indigo-light)] p-5 flex flex-col items-center justify-center text-center text-[var(--color-ink)]/40">
                <div className="text-2xl mb-1">🔒</div>
                <div className="text-sm font-display font-semibold">Novos cursos em breve</div>
              </div>
            </div>
          )}
        </section>
      </main>

      <footer className="text-center py-8 text-sm text-[var(--color-ink)]/40">
        Escola Digital — feita para crianças, adolescentes e suas famílias.
      </footer>
    </div>
  )
}
