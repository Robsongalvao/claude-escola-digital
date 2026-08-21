import { useState } from 'react'

export default function QuizRunner({ questions, onFinish }) {
  const [idx, setIdx] = useState(0)
  const [selected, setSelected] = useState(null)
  const [acertos, setAcertos] = useState(0)
  const atual = questions[idx]

  function responder(opIdx) {
    setSelected(opIdx)
    if (opIdx === atual.correct_option) setAcertos((a) => a + 1)
  }

  function proximo() {
    if (idx + 1 < questions.length) {
      setIdx(idx + 1)
      setSelected(null)
    } else {
      const score = Math.round((acertos / questions.length) * 100)
      onFinish(score)
    }
  }

  const correto = selected === atual.correct_option

  return (
    <div className="rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5">
      <p className="text-xs text-[var(--color-ink)]/50 mb-2">Pergunta {idx + 1} de {questions.length}</p>
      <p className="font-display font-semibold mb-4">{atual.question}</p>

      <div className="space-y-2">
        {atual.options.map((op, i) => {
          const isSelected = selected === i
          const showCorrect = selected !== null && i === atual.correct_option
          return (
            <button key={i} disabled={selected !== null} onClick={() => responder(i)}
              className={`w-full text-left p-3 rounded-xl border-2 text-sm transition ${
                showCorrect ? 'border-[var(--color-esmeralda)] bg-[var(--color-esmeralda-light)]' :
                isSelected ? 'border-[var(--color-coral)] bg-red-50' :
                'border-[var(--color-indigo-light)]'
              }`}>
              {op}
            </button>
          )
        })}
      </div>

      {selected !== null && (
        <div className="mt-4">
          <p className={`text-sm font-semibold mb-3 ${correto ? 'text-[var(--color-esmeralda-dark)]' : 'text-[var(--color-coral)]'}`}>
            {correto ? '✓ Correto!' : `✗ A resposta certa é: ${atual.options[atual.correct_option]}`}
          </p>
          <button onClick={proximo} className="w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition">
            {idx + 1 < questions.length ? 'Próxima pergunta' : 'Ver resultado'}
          </button>
        </div>
      )}
    </div>
  )
}
