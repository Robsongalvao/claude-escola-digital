import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import Logo from '../components/Logo'
import { supabase } from '../lib/supabaseClient'

export default function Certificado() {
  const { studentId, courseSlug } = useParams()
  const navigate = useNavigate()
  const [student, setStudent] = useState(null)
  const [certificate, setCertificate] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => { load() }, [studentId])

  async function load() {
    setLoading(true)
    const { data: st } = await supabase.from('students').select('*').eq('id', studentId).single()
    setStudent(st)

    const { data: c } = await supabase.from('courses').select('id, title').eq('slug', courseSlug).single()
    if (c) {
      const { data: cert } = await supabase.from('certificates').select('*').eq('student_id', studentId).eq('course_id', c.id).maybeSingle()
      setCertificate(cert ? { ...cert, courseTitle: c.title } : null)
    }
    setLoading(false)
  }

  if (loading) {
    return <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)]"><p className="font-display text-[var(--color-ink)]/50">Carregando...</p></div>
  }

  if (!certificate) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-[var(--color-bg)] px-6 text-center">
        <div>
          <div className="text-4xl mb-3">🔒</div>
          <p className="font-display font-bold text-[var(--color-indigo)] mb-2">Certificado ainda não disponível</p>
          <p className="text-sm text-[var(--color-ink)]/60 mb-5">Complete o Projeto Final para desbloquear o certificado.</p>
          <button onClick={() => navigate(`/aluno/${studentId}/curso/${courseSlug}`)} className="px-5 py-2.5 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white">Voltar para a trilha</button>
        </div>
      </div>
    )
  }

  const dataEmissao = new Date(certificate.issued_at).toLocaleDateString('pt-BR', { day: '2-digit', month: 'long', year: 'numeric' })

  return (
    <div className="min-h-screen bg-[var(--color-bg)] px-6 py-10 print:bg-white print:py-0">
      <div className="max-w-2xl mx-auto flex items-center justify-between mb-6 print:hidden">
        <button onClick={() => navigate(`/aluno/${studentId}/curso/${courseSlug}`)} className="text-sm font-semibold text-[var(--color-indigo)]">← Trilha</button>
        <button onClick={() => window.print()} className="px-4 py-2 rounded-full text-sm font-display font-bold bg-[var(--color-ambar)] text-[var(--color-indigo-dark)]">Imprimir / Salvar PDF</button>
      </div>

      <div className="max-w-2xl mx-auto bg-white rounded-3xl border-4 border-[var(--color-ambar)] p-10 text-center relative overflow-hidden print:border-2 print:rounded-none">
        <div className="absolute -top-10 -right-10 text-9xl opacity-5">🏆</div>
        <div className="flex justify-center mb-6"><Logo /></div>

        <p className="text-xs uppercase tracking-widest text-[var(--color-ink)]/40 font-semibold">Certificado de Conclusão</p>
        <div className="text-5xl my-6">🎓</div>

        <p className="text-[var(--color-ink)]/60">Certificamos que</p>
        <h1 className="font-display font-extrabold text-3xl text-[var(--color-indigo)] my-2">{student?.name}</h1>
        <p className="text-[var(--color-ink)]/60">concluiu com sucesso o curso</p>
        <h2 className="font-display font-bold text-xl text-[var(--color-esmeralda-dark)] my-2">{certificate.courseTitle}</h2>

        <p className="text-sm text-[var(--color-ink)]/60 mt-6 max-w-md mx-auto leading-relaxed">
          Concluiu todos os módulos do curso e o Projeto Final, colocando em prática tudo o que aprendeu ao longo da jornada.
        </p>

        <div className="mt-8 pt-6 border-t border-[var(--color-indigo-light)] flex items-center justify-center gap-2 text-xs text-[var(--color-ink)]/40">
          <span>Emitido em {dataEmissao}</span>
        </div>

        <p className="mt-6 font-display font-semibold text-[var(--color-ambar-dark)]">Parabéns, jovem empreendedor(a)! 🚀</p>
      </div>
    </div>
  )
}
