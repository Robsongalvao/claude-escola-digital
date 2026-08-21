import { useState } from 'react'

export default function ActivityRenderer({ activity, onComplete }) {
  const config = activity.config
  const tipo = config.tipo

  if (tipo === 'escolha_multipla_com_consequencia') return <EscolhaComConsequencia config={config} onComplete={onComplete} />
  if (tipo === 'classificacao' || tipo === 'checklist_situacoes') return <Classificacao config={config} onComplete={onComplete} />
  if (tipo === 'distribuicao_valor') return <DistribuicaoValor config={config} onComplete={onComplete} />
  if (tipo === 'formulario_calculado') return <FormularioCalculado config={config} onComplete={onComplete} />
  if (tipo === 'desafio_streak') return <DesafioStreak config={config} onComplete={onComplete} />
  if (tipo === 'formulario_projeto') return <FormularioProjeto config={config} onComplete={onComplete} />
  if (tipo === 'calculadora') return <Calculadora config={config} onComplete={onComplete} />
  if (tipo === 'simulacao_dialogo' || tipo === 'simulacao_dialogo_avaliada') return <SimulacaoDialogo config={config} onComplete={onComplete} />

  return <button onClick={onComplete} className="btn-primary">Continuar</button>
}

const cardCls = "rounded-2xl bg-white border border-[var(--color-indigo-light)] p-5"
const btnPrimary = "w-full py-3 rounded-full font-display font-bold bg-[var(--color-esmeralda)] text-white hover:bg-[var(--color-esmeralda-dark)] transition"

function EscolhaComConsequencia({ config, onComplete }) {
  const [chosen, setChosen] = useState(null)
  return (
    <div className={cardCls}>
      <div className="space-y-3">
        {config.opcoes.map((op, i) => (
          <button key={i} onClick={() => setChosen(i)}
            className={`w-full text-left p-4 rounded-xl border-2 transition ${chosen === i ? 'border-[var(--color-esmeralda)] bg-[var(--color-esmeralda-light)]' : 'border-[var(--color-indigo-light)]'}`}>
            <div className="font-semibold text-sm">{op.texto}</div>
            {chosen === i && <div className="text-xs text-[var(--color-ink)]/60 mt-2">{op.consequencia}</div>}
          </button>
        ))}
      </div>
      {chosen !== null && <button onClick={onComplete} className={`${btnPrimary} mt-4`}>Continuar</button>}
    </div>
  )
}

function Classificacao({ config, onComplete }) {
  const situacoes = config.situacoes
  const [idx, setIdx] = useState(0)
  const [feedback, setFeedback] = useState(null)
  const atual = situacoes[idx]

  function responder(resposta) {
    const correto = resposta === atual.resposta
    setFeedback(correto ? 'certo' : 'errado')
  }

  function proximo() {
    setFeedback(null)
    if (idx + 1 < situacoes.length) setIdx(idx + 1)
    else onComplete()
  }

  if (config.tipo === 'checklist_situacoes') {
    return (
      <div className={cardCls}>
        <p className="text-xs text-[var(--color-ink)]/50 mb-2">Situação {idx + 1} de {situacoes.length}</p>
        <p className="font-display font-semibold mb-3">"{atual}"</p>
        <div className="space-y-2 mb-4">
          {config.perguntas_checklist.map((p, i) => <div key={i} className="text-sm text-[var(--color-ink)]/70">☐ {p}</div>)}
        </div>
        <button onClick={proximo} className={btnPrimary}>{idx + 1 < situacoes.length ? 'Próxima situação' : 'Concluir atividade'}</button>
      </div>
    )
  }

  return (
    <div className={cardCls}>
      <p className="text-xs text-[var(--color-ink)]/50 mb-2">Situação {idx + 1} de {situacoes.length}</p>
      <p className="font-display font-semibold mb-4">{atual.item}</p>
      {feedback === null ? (
        <div className="flex gap-3">
          <button onClick={() => responder('necessidade')} className="flex-1 py-3 rounded-xl border-2 border-[var(--color-indigo-light)] font-semibold hover:border-[var(--color-esmeralda)]">Necessidade</button>
          <button onClick={() => responder('desejo')} className="flex-1 py-3 rounded-xl border-2 border-[var(--color-indigo-light)] font-semibold hover:border-[var(--color-ambar)]">Desejo</button>
        </div>
      ) : (
        <div>
          <p className={`font-semibold mb-3 ${feedback === 'certo' ? 'text-[var(--color-esmeralda-dark)]' : 'text-[var(--color-coral)]'}`}>
            {feedback === 'certo' ? '✓ Isso mesmo!' : `✗ Na verdade, isso é: ${atual.resposta}`}
          </p>
          <button onClick={proximo} className={btnPrimary}>{idx + 1 < situacoes.length ? 'Próxima situação' : 'Concluir atividade'}</button>
        </div>
      )}
    </div>
  )
}

function DistribuicaoValor({ config, onComplete }) {
  const [valores, setValores] = useState(Object.fromEntries(config.categorias.map((c) => [c, 0])))
  const total = Object.values(valores).reduce((a, b) => a + b, 0)
  const restante = config.valor_total - total

  function setCat(cat, val) {
    setValores((v) => ({ ...v, [cat]: Math.max(0, Number(val) || 0) }))
  }

  return (
    <div className={cardCls}>
      <p className="text-sm text-[var(--color-ink)]/60 mb-4">{config.instrucao}</p>
      <div className="space-y-3">
        {config.categorias.map((cat) => (
          <div key={cat} className="flex items-center justify-between gap-3">
            <label className="font-semibold text-sm w-24">{cat}</label>
            <input type="number" min="0" value={valores[cat]} onChange={(e) => setCat(cat, e.target.value)}
              className="flex-1 rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 font-mono-num" />
          </div>
        ))}
      </div>
      <p className={`mt-4 text-sm font-mono-num font-semibold ${restante === 0 ? 'text-[var(--color-esmeralda-dark)]' : restante < 0 ? 'text-[var(--color-coral)]' : 'text-[var(--color-ink)]/60'}`}>
        Restante: R$ {restante.toFixed(2)}
      </p>
      <button disabled={restante !== 0} onClick={onComplete} className={`${btnPrimary} mt-4 disabled:opacity-40`}>Concluir orçamento</button>
    </div>
  )
}

function FormularioCalculado({ config, onComplete }) {
  const [custo, setCusto] = useState('')
  const [porMes, setPorMes] = useState('')
  const [objetivo, setObjetivo] = useState('')
  const meses = custo && porMes && Number(porMes) > 0 ? Math.ceil(Number(custo) / Number(porMes)) : null

  return (
    <div className={cardCls}>
      <div className="space-y-3">
        <div>
          <label className="text-sm font-semibold">O que você deseja realizar?</label>
          <input value={objetivo} onChange={(e) => setObjetivo(e.target.value)} className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2" />
        </div>
        <div>
          <label className="text-sm font-semibold">Quanto custa (R$)?</label>
          <input type="number" value={custo} onChange={(e) => setCusto(e.target.value)} className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 font-mono-num" />
        </div>
        <div>
          <label className="text-sm font-semibold">Quanto consegue guardar por mês (R$)?</label>
          <input type="number" value={porMes} onChange={(e) => setPorMes(e.target.value)} className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2 font-mono-num" />
        </div>
      </div>
      {meses && <p className="mt-4 text-[var(--color-esmeralda-dark)] font-display font-bold">🎯 Você vai precisar de {meses} {meses === 1 ? 'mês' : 'meses'}!</p>}
      <button disabled={!meses} onClick={onComplete} className={`${btnPrimary} mt-4 disabled:opacity-40`}>Salvar objetivo</button>
    </div>
  )
}

function DesafioStreak({ config, onComplete }) {
  const [escolha, setEscolha] = useState(null)
  const [dias, setDias] = useState(new Set())
  const total = escolha === 'Desafio dos 7 dias' ? 7 : 30

  if (!escolha) {
    return (
      <div className={cardCls}>
        <p className="text-sm text-[var(--color-ink)]/60 mb-4">{config.instrucao}</p>
        <div className="flex gap-3">
          {config.opcoes_desafio.map((op) => (
            <button key={op} onClick={() => setEscolha(op)} className="flex-1 py-3 rounded-xl border-2 border-[var(--color-indigo-light)] font-semibold hover:border-[var(--color-esmeralda)]">{op}</button>
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className={cardCls}>
      <p className="font-display font-semibold mb-3">{escolha}</p>
      <div className="grid grid-cols-7 gap-2 mb-4">
        {Array.from({ length: total }, (_, i) => i + 1).map((d) => (
          <button key={d} onClick={() => setDias((s) => { const n = new Set(s); n.has(d) ? n.delete(d) : n.add(d); return n })}
            className={`aspect-square rounded-lg text-xs font-bold ${dias.has(d) ? 'bg-[var(--color-esmeralda)] text-white' : 'bg-[var(--color-bg)] text-[var(--color-ink)]/40'}`}>
            {d}
          </button>
        ))}
      </div>
      <button onClick={onComplete} className={btnPrimary}>Assumir esse compromisso</button>
    </div>
  )
}

function FormularioProjeto({ config, onComplete }) {
  const [dados, setDados] = useState(Object.fromEntries(config.campos.map((c) => [c, ''])))
  const preenchido = Object.values(dados).every((v) => v.trim().length > 0)

  return (
    <div className={cardCls}>
      {config.aviso && <p className="text-xs bg-[var(--color-ambar-light)] text-[var(--color-ambar-dark)] rounded-xl p-3 mb-4">⚠️ {config.aviso}</p>}
      <div className="space-y-3">
        {config.campos.map((campo) => (
          <div key={campo}>
            <label className="text-sm font-semibold">{campo}</label>
            <input value={dados[campo]} onChange={(e) => setDados((d) => ({ ...d, [campo]: e.target.value }))}
              className="mt-1 w-full rounded-xl border border-[var(--color-indigo-light)] px-3 py-2" />
          </div>
        ))}
      </div>
      <button disabled={!preenchido} onClick={onComplete} className={`${btnPrimary} mt-4 disabled:opacity-40`}>Salvar</button>
    </div>
  )
}

function Calculadora({ config, onComplete }) {
  const [precos, setPrecos] = useState({})
  const todosPreenchidos = config.produtos_ficticios.every((p) => precos[p.nome] > 0)

  return (
    <div className={cardCls}>
      <p className="text-sm text-[var(--color-ink)]/60 mb-4">{config.instrucao}</p>
      <div className="space-y-3">
        {config.produtos_ficticios.map((p) => {
          const preco = Number(precos[p.nome] || 0)
          const lucro = preco - p.custo
          return (
            <div key={p.nome} className="rounded-xl bg-[var(--color-bg)] p-3">
              <div className="flex justify-between text-sm font-semibold mb-2">
                <span>{p.nome}</span>
                <span className="font-mono-num text-[var(--color-ink)]/50">custo: R$ {p.custo.toFixed(2)}</span>
              </div>
              <input type="number" placeholder="Seu preço de venda" value={precos[p.nome] || ''}
                onChange={(e) => setPrecos((s) => ({ ...s, [p.nome]: e.target.value }))}
                className="w-full rounded-lg border border-[var(--color-indigo-light)] px-3 py-1.5 font-mono-num text-sm" />
              {preco > 0 && (
                <p className={`text-xs mt-1 font-mono-num font-semibold ${lucro >= 0 ? 'text-[var(--color-esmeralda-dark)]' : 'text-[var(--color-coral)]'}`}>
                  {lucro >= 0 ? `Lucro: R$ ${lucro.toFixed(2)}` : `Prejuízo: R$ ${Math.abs(lucro).toFixed(2)}`}
                </p>
              )}
            </div>
          )
        })}
      </div>
      <button disabled={!todosPreenchidos} onClick={onComplete} className={`${btnPrimary} mt-4 disabled:opacity-40`}>Concluir</button>
    </div>
  )
}

function SimulacaoDialogo({ config, onComplete }) {
  const situacoes = config.situacoes
  const [idx, setIdx] = useState(0)
  const [respondido, setRespondido] = useState(null)
  const atual = situacoes[idx]

  function proximo() {
    setRespondido(null)
    if (idx + 1 < situacoes.length) setIdx(idx + 1)
    else onComplete()
  }

  return (
    <div className={cardCls}>
      <p className="text-xs text-[var(--color-ink)]/50 mb-2">Situação {idx + 1} de {situacoes.length}</p>
      <div className="rounded-xl bg-[var(--color-indigo-light)] p-3 mb-4">
        <p className="text-sm">💬 <strong>Cliente:</strong> "{atual.cliente}"</p>
      </div>
      {respondido === null ? (
        <div className="space-y-2">
          {atual.opcoes.map((op, i) => (
            <button key={i} onClick={() => setRespondido(i)} className="w-full text-left p-3 rounded-xl border-2 border-[var(--color-indigo-light)] text-sm hover:border-[var(--color-esmeralda)]">{op}</button>
          ))}
        </div>
      ) : (
        <div>
          <p className={`font-semibold text-sm mb-3 ${respondido === atual.correta ? 'text-[var(--color-esmeralda-dark)]' : 'text-[var(--color-coral)]'}`}>
            {respondido === atual.correta ? '✓ Ótima resposta!' : `A melhor resposta seria: "${atual.opcoes[atual.correta]}"`}
          </p>
          <button onClick={proximo} className={btnPrimary}>{idx + 1 < situacoes.length ? 'Próxima situação' : 'Concluir simulação'}</button>
        </div>
      )}
    </div>
  )
}
