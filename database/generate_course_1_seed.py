#!/usr/bin/env python3
# Gera SQL de seed para um novo curso completo (curso + modulos + aulas + atividades + quiz + conquistas)
import json, sys

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "inteligencia-desenvolvimento-pessoal",
  "title": "Inteligência e Desenvolvimento Pessoal",
  "description": "Autoconhecimento, confiança, hábitos e mentalidade de crescimento para a vida.",
  "icon": "🧠",
  "order_index": 2,
}

MODULES = [
  {
    "titulo": "Quem sou eu?",
    "descricao": "Descobrindo pontos fortes e o que te torna único.",
    "aula": {
      "title": "Descobrindo meus pontos fortes",
      "introduction": "Você já imaginou como seu celular consegue reconhecer sua voz? Pois é — seu cérebro faz coisas ainda mais incríveis, e hoje você vai descobrir algumas delas sobre você mesmo!",
      "content": "Autoconhecimento é entender quem você é: o que você gosta, no que você é bom, e no que ainda está aprendendo. Todo mundo tem PONTOS FORTES (coisas que já fazemos bem ou com facilidade) e PONTOS A DESENVOLVER (coisas que ainda estamos aprendendo). Isso não é sobre ser perfeito — é sobre se conhecer de verdade. Quando você sabe seus pontos fortes, fica mais fácil escolher em que investir seu tempo e energia. E quando você identifica o que quer melhorar, fica mais fácil traçar um caminho pra isso, ao invés de simplesmente se sentir mal por não saber algo ainda.\n\nVocê sabia? Cientistas descobriram que pessoas que reconhecem seus próprios pontos fortes tendem a se sentir mais confiantes e motivadas no dia a dia — isso se chama autoconhecimento, e é uma habilidade que se treina, igual um músculo.\n\nPergunta para pensar: Se um amigo tivesse que descrever 3 coisas boas sobre você, o que ele diria?\n\nDesafio: Pergunte a 2 pessoas da sua confiança (família ou amigos) o que elas acham que você faz bem. Anote as respostas — às vezes os outros percebem coisas em nós que nem notamos sozinhos!\n\nResumo: Autoconhecimento é entender seus pontos fortes e o que você quer desenvolver. Isso ajuda a crescer com mais direção e confiança.",
      "example": "Um aluno pode ser ótimo em desenhar, mas ainda estar aprendendo a falar em público. Os dois são igualmente importantes de reconhecer — um ponto forte pra valorizar, e um ponto a desenvolver pra treinar.",
      "activity_title": "Meu mapa de pontos fortes",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["3 coisas que eu faço bem", "1 coisa que eu quero aprender ou melhorar", "Uma vez que me senti orgulhoso(a) de mim mesmo(a)"]
      },
      "quiz": [
        {"q": "O que é autoconhecimento?", "opcoes": ["Saber tudo sobre qualquer assunto", "Entender quem você é, seus pontos fortes e o que quer desenvolver", "Ser sempre o melhor da turma", "Nunca errar"], "correta": 1},
        {"q": "Ter um 'ponto a desenvolver' significa:", "opcoes": ["Que você é ruim nisso pra sempre", "Algo que você ainda está aprendendo", "Um defeito que não tem solução", "Algo que não importa"], "correta": 1},
        {"q": "Por que é útil reconhecer seus pontos fortes?", "opcoes": ["Para se achar melhor que os outros", "Para saber onde investir tempo e energia com mais confiança", "Não serve pra nada", "Só serve para adultos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Confiança em mim mesmo",
    "descricao": "Construindo segurança para tentar coisas novas.",
    "aula": {
      "title": "De onde vem a confiança?",
      "introduction": "Você já sentiu medo de tentar algo novo com medo de errar? Isso é super normal — e hoje vamos entender como a confiança realmente se constrói.",
      "content": "Confiança não é nascer sabendo fazer tudo certo. Confiança é acreditar que você é capaz de aprender e tentar, mesmo que ainda não saiba fazer perfeitamente. Ela cresce toda vez que você tenta algo, mesmo com medo, e percebe que consegue lidar com o resultado — seja ele um acerto ou um aprendizado. Muita gente pensa que primeiro precisa ficar confiante para depois agir, mas geralmente é o contrário: é AGINDO que a confiança aparece. Cada pequena vitória (terminar uma tarefa difícil, apresentar um trabalho, tentar um esporte novo) constrói um pouco mais de confiança para o próximo desafio.\n\nVocê sabia? Muitos atletas e artistas famosos falam sobre o medo que sentiam antes de começar — a diferença é que eles agiram apesar do medo, não porque o medo tinha desaparecido.\n\nPergunta para pensar: Qual foi a última vez que você tentou algo com medo e, no final, se sentiu orgulhoso de ter tentado?\n\nDesafio: Essa semana, tente fazer uma coisa pequena que você andava evitando por insegurança (levantar a mão em aula, convidar alguém pra brincar, tentar um esporte novo).\n\nResumo: Confiança se constrói agindo, não esperando o medo desaparecer. Cada tentativa, mesmo com erro, fortalece sua confiança para a próxima.",
      "example": "Uma criança que tem medo de andar de bicicleta só constrói confiança de verdade quando sobe na bicicleta e tenta, mesmo cambaleando no início.",
      "activity_title": "Minha próxima pequena vitória",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Esperar sentir 100% de confiança antes de tentar algo novo", "consequencia": "Você pode esperar muito tempo — a confiança completa geralmente só vem depois de tentar."},
          {"texto": "Tentar mesmo com um pouco de medo, sabendo que errar faz parte", "consequencia": "Essa é a forma mais rápida de realmente construir confiança de verdade."},
          {"texto": "Desistir na primeira dificuldade", "consequencia": "Isso impede que a confiança tenha a chance de crescer."}
        ]
      },
      "quiz": [
        {"q": "Como a confiança geralmente se constrói?", "opcoes": ["Nascendo com ela", "Agindo e tentando, mesmo com medo", "Evitando qualquer desafio", "Sendo perfeito desde o início"], "correta": 1},
        {"q": "Sentir medo antes de tentar algo novo é:", "opcoes": ["Um sinal de fraqueza", "Normal, e não impede a pessoa de agir", "Algo que só crianças sentem", "Prova de que não deve tentar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Disciplina e Hábitos",
    "descricao": "Como pequenas ações repetidas criam grandes resultados.",
    "aula": {
      "title": "O poder dos pequenos hábitos",
      "introduction": "Você sabia que escovar os dentes hoje é fácil porque você já fez isso centenas de vezes? Isso é o poder de um hábito!",
      "content": "HÁBITO é uma ação que se repete tanto que passa a acontecer quase sem esforço. DISCIPLINA é a capacidade de continuar fazendo algo importante mesmo quando não estamos com vontade. A boa notícia é que disciplina fica mais fácil quando vira hábito — no início dá trabalho, mas repetindo todo dia (ou toda semana) no mesmo horário e contexto, o cérebro vai automatizando aquilo. Grandes resultados quase sempre vêm de pequenas ações repetidas com constância, e não de um esforço enorme feito uma vez só.\n\nVocê sabia? Estudos mostram que hábitos levam, em média, algumas semanas para começar a ficar mais automáticos — por isso é normal que os primeiros dias pareçam mais difíceis.\n\nPergunta para pensar: Qual hábito pequeno, se você fizesse todo dia, poderia fazer diferença grande daqui a um ano?\n\nDesafio: Escolha um hábito pequeno (ler 10 minutos, arrumar a mochila à noite, beber mais água) e tente fazer por 7 dias seguidos.\n\nResumo: Disciplina fica mais fácil quando vira hábito. Pequenas ações repetidas com constância geram grandes resultados ao longo do tempo.",
      "example": "Um aluno que estuda 15 minutos todo dia, mesmo sem vontade às vezes, aprende muito mais ao longo do ano do que alguém que só estuda bastante na véspera da prova.",
      "activity_title": "Desafio de 7 dias de hábito",
      "activity_config": {
        "tipo": "desafio_streak",
        "opcoes_desafio": ["Desafio dos 7 dias"],
        "instrucao": "Escolha um pequeno hábito e marque visualmente cada dia em que você conseguiu cumprir."
      },
      "quiz": [
        {"q": "O que é um hábito?", "opcoes": ["Uma ação feita uma única vez", "Uma ação repetida que se torna quase automática", "Algo que só adultos têm", "Um talento de nascença"], "correta": 1},
        {"q": "Grandes resultados geralmente vêm de:", "opcoes": ["Um esforço enorme feito uma única vez", "Pequenas ações repetidas com constância", "Sorte", "Talento apenas"], "correta": 1},
        {"q": "É normal que os primeiros dias de um novo hábito pareçam:", "opcoes": ["Mais fáceis que o resto", "Mais difíceis, até o cérebro se acostumar", "Impossíveis para sempre", "Sem nenhuma diferença"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Organização do Meu Dia",
    "descricao": "Planejando o tempo para dar conta do que importa.",
    "aula": {
      "title": "Organizando meu tempo",
      "introduction": "Você já teve a sensação de que o dia passou rápido demais e várias coisas ficaram pra trás? Vamos aprender a organizar isso.",
      "content": "Organização é decidir, com antecedência, o que fazer e quando fazer. Isso ajuda a não esquecer tarefas importantes e a ter tempo tanto para obrigações (escola, tarefas de casa) quanto para descanso e diversão. Uma forma simples de organizar o dia é listar as tarefas e colocá-las em ordem de importância — o que precisa ser feito primeiro, o que pode esperar um pouco. Isso evita duas armadilhas comuns: deixar tudo para a última hora, ou passar o dia inteiro sem saber por onde começar.\n\nVocê sabia? Muitas pessoas de sucesso em diferentes áreas usam listas simples de tarefas todos os dias — não é sobre ser complicado, é sobre ser constante.\n\nPergunta para pensar: O que costuma atrapalhar sua organização durante o dia?\n\nDesafio: Antes de dormir hoje, escreva as 3 coisas mais importantes que você quer fazer amanhã.\n\nResumo: Organizar o tempo é planejar com antecedência o que fazer e priorizar o que é mais importante primeiro.",
      "example": "Antes de fazer a lição de casa, um aluno organizado separa primeiro o material necessário e escolhe qual matéria fazer primeiro — isso evita perder tempo procurando as coisas no meio da tarefa.",
      "activity_title": "Minha lista de prioridades de amanhã",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Tarefa mais importante de amanhã", "Segunda tarefa mais importante", "Terceira tarefa"]
      },
      "quiz": [
        {"q": "O que é organização do tempo?", "opcoes": ["Fazer tudo ao mesmo tempo", "Decidir com antecedência o que fazer e quando", "Nunca descansar", "Deixar tudo para depois"], "correta": 1},
        {"q": "Priorizar tarefas significa:", "opcoes": ["Fazer todas ao mesmo tempo", "Decidir o que é mais importante fazer primeiro", "Ignorar as menos importantes para sempre", "Fazer por sorteio"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Objetivos e Metas",
    "descricao": "Transformando sonhos em planos concretos.",
    "aula": {
      "title": "Sonhando com um plano",
      "introduction": "Ter um sonho é o primeiro passo — mas o que transforma um sonho em realidade é ter um plano.",
      "content": "Um OBJETIVO é algo que você deseja alcançar. Uma META é esse objetivo com detalhes claros: o que exatamente você quer, até quando, e quais passos vai seguir. Metas boas costumam ser específicas (claras sobre o que é), possíveis de medir (dá pra saber se alcançou ou não) e realistas (possíveis de alcançar com esforço). Dividir uma meta grande em etapas menores ajuda a não desanimar no meio do caminho, porque você vai vendo progresso a cada etapa concluída, e não só no final.\n\nVocê sabia? Escrever uma meta no papel (ou digitar) ajuda a lembrar dela com mais frequência e aumenta as chances de realmente seguir em direção a ela.\n\nPergunta para pensar: Qual é um objetivo que você tem para os próximos 3 meses?\n\nDesafio: Escreva uma meta sua dividida em pelo menos 3 etapas menores.\n\nResumo: Meta é um objetivo com detalhes e prazo. Dividir em etapas pequenas ajuda a manter o foco e ver o progresso.",
      "example": "'Eu quero ser bom em matemática' é um objetivo vago. 'Eu quero tirar nota 8 na próxima prova de matemática, estudando 20 minutos por dia' é uma meta clara.",
      "activity_title": "Minha meta com etapas",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["O que deseja alcançar", "Até quando", "Primeira etapa", "Segunda etapa", "Terceira etapa"]
      },
      "quiz": [
        {"q": "Qual a diferença entre objetivo e meta?", "opcoes": ["Não existe diferença", "Meta tem detalhes claros: o quê, até quando e como", "Objetivo é sempre mais detalhado", "Meta é só para adultos"], "correta": 1},
        {"q": "Por que dividir uma meta grande em etapas menores?", "opcoes": ["Para demorar mais", "Para conseguir ver progresso e não desanimar", "Não faz diferença nenhuma", "Para complicar o processo"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Responsabilidade",
    "descricao": "Cumprir compromissos e assumir consequências das próprias escolhas.",
    "aula": {
      "title": "O que significa ser responsável?",
      "introduction": "Você já prometeu fazer algo e cumpriu, mesmo sem vontade? Isso é responsabilidade em ação.",
      "content": "Ser responsável significa cumprir aquilo que você se comprometeu a fazer, e também assumir as consequências das suas próprias escolhas — tanto as boas quanto as que dão errado. Isso não significa nunca errar; significa reconhecer o erro e tentar consertar ou aprender com ele, ao invés de colocar a culpa sempre nos outros. Responsabilidade também aparece em coisas simples do dia a dia: cuidar dos seus materiais, cumprir horários combinados, e fazer sua parte em tarefas de grupo.\n\nVocê sabia? Pessoas responsáveis tendem a conquistar mais confiança dos outros ao longo do tempo, porque quem promete e cumpre gera confiabilidade.\n\nPergunta para pensar: Qual é um compromisso que você tem e que sente orgulho de sempre cumprir?\n\nDesafio: Hoje, cumpra um compromisso pequeno que você tinha adiado.\n\nResumo: Responsabilidade é cumprir compromissos e assumir as consequências das próprias escolhas, aprendendo com os erros.",
      "example": "Se um aluno esquece de trazer o material combinado para um trabalho em grupo, ser responsável é avisar o grupo e buscar uma solução, ao invés de esconder o problema.",
      "activity_title": "Meu compromisso desta semana",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um compromisso que você tem esta semana", "Como você vai garantir que vai cumprir"]
      },
      "quiz": [
        {"q": "Ser responsável significa:", "opcoes": ["Nunca errar", "Cumprir compromissos e assumir as consequências das escolhas", "Culpar sempre os outros", "Ignorar promessas feitas"], "correta": 1},
        {"q": "Quando alguém erra, uma atitude responsável é:", "opcoes": ["Esconder o erro", "Reconhecer e tentar consertar ou aprender com ele", "Culpar outra pessoa", "Fingir que não aconteceu"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Persistência: Aprendendo com os Erros",
    "descricao": "Erros fazem parte do caminho — o importante é continuar tentando.",
    "aula": {
      "title": "Errar faz parte de aprender",
      "introduction": "Você sabia que bebês caem centenas de vezes antes de aprender a andar? E ninguém acha isso estranho — faz parte do processo!",
      "content": "PERSISTÊNCIA é a capacidade de continuar tentando mesmo depois de errar ou enfrentar dificuldades. Erros não são o oposto de aprender — eles fazem PARTE do aprendizado. Quando erramos, ganhamos uma informação valiosa: descobrimos o que não funciona, e isso nos aproxima de descobrir o que funciona. O problema não é errar, é desistir depois do erro. Pessoas persistentes encaram um erro como um degrau, não como uma parede.\n\nVocê sabia? Muitos inventores e cientistas tiveram centenas de tentativas que não deram certo antes de chegar numa descoberta importante — o processo de errar fazia parte do caminho, não um desvio dele.\n\nPergunta para pensar: Qual foi um erro que, no fim, te ensinou algo importante?\n\nDesafio: Da próxima vez que você errar em algo, ao invés de se criticar, escreva uma frase sobre o que esse erro te ensinou.\n\nResumo: Persistência é continuar tentando depois de errar. Erros são parte do aprendizado, não o oposto dele.",
      "example": "Uma criança que erra várias vezes tentando montar um quebra-cabeça, mas continua tentando peças diferentes, eventualmente encontra o encaixe certo — e aprende mais sobre como resolver problemas do que quem desiste na primeira tentativa.",
      "activity_title": "Meu erro que virou aprendizado",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um erro que você cometeu recentemente", "O que esse erro te ensinou", "O que você faria diferente da próxima vez"]
      },
      "quiz": [
        {"q": "O que é persistência?", "opcoes": ["Nunca errar", "Continuar tentando mesmo depois de errar", "Desistir rápido para não sofrer", "Fazer tudo perfeito de primeira"], "correta": 1},
        {"q": "Erros, no processo de aprendizado, são:", "opcoes": ["Algo que deve ser evitado a todo custo", "Parte natural do processo, que ensina algo", "Prova de que a pessoa não é capaz", "Sempre culpa de outra pessoa"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Mentalidade de Crescimento",
    "descricao": "Acreditar que habilidades podem ser desenvolvidas com esforço e prática.",
    "aula": {
      "title": "Eu ainda não sei... por enquanto",
      "introduction": "Existe uma palavrinha pequena que muda tudo: 'ainda'. 'Eu não sei fazer isso' é bem diferente de 'eu ainda não sei fazer isso'.",
      "content": "Mentalidade de crescimento é acreditar que habilidades e inteligência podem se desenvolver com esforço, prática e boas estratégias — ao invés de pensar que a gente 'nasce' bom ou ruim em algo, para sempre. Quem tem mentalidade de crescimento encara desafios como oportunidades de aprender, e vê o esforço como o caminho para melhorar, não como um sinal de fraqueza. O oposto disso é a mentalidade fixa, que faz a pessoa evitar desafios com medo de parecer incapaz. A boa notícia: mentalidade de crescimento pode ser treinada, começando pela forma como você fala consigo mesmo.\n\nVocê sabia? Trocar frases como 'eu sou ruim nisso' por 'eu ainda estou aprendendo isso' já é um exercício real de mentalidade de crescimento.\n\nPergunta para pensar: Existe algo que você acha que 'não é bom' hoje, mas que talvez seja só uma questão de ainda não ter praticado o suficiente?\n\nDesafio: Troque uma frase negativa que você costuma pensar sobre si mesmo por uma versão com a palavra 'ainda'.\n\nResumo: Mentalidade de crescimento é acreditar que habilidades se desenvolvem com esforço e prática — desafios são oportunidades, não ameaças.",
      "example": "Ao invés de pensar 'eu sou péssimo em desenho', uma mentalidade de crescimento pensa 'eu ainda estou aprendendo a desenhar, e cada tentativa me deixa um pouco melhor'.",
      "activity_title": "Trocando o 'eu não sei' por 'eu ainda não sei'",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma frase negativa que você costuma pensar sobre si mesmo", "Como ficaria essa frase com a palavra 'ainda'"]
      },
      "quiz": [
        {"q": "O que é mentalidade de crescimento?", "opcoes": ["Achar que já sabe tudo", "Acreditar que habilidades se desenvolvem com esforço e prática", "Nunca enfrentar desafios", "Achar que talento é fixo e não muda"], "correta": 1},
        {"q": "Adicionar a palavra 'ainda' a uma frase negativa serve para:", "opcoes": ["Não mudar nada", "Lembrar que aquilo pode se desenvolver com o tempo", "Tornar a frase mais triste", "Evitar qualquer esforço"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("explorador_de_si_mesmo", "Explorador de Si Mesmo", "Completou o módulo Quem sou eu?", "🔍"),
  ("confiante", "Confiante", "Completou o módulo Confiança em mim mesmo", "💪"),
  ("disciplinado", "Disciplinado", "Completou o módulo Disciplina e Hábitos", "⏰"),
  ("organizador", "Organizador", "Completou o módulo Organização do Meu Dia", "🗂️"),
  ("mestre_das_metas", "Mestre das Metas", "Completou o módulo Objetivos e Metas", "🎯"),
  ("responsavel_nota_10", "Responsável Nota 10", "Completou o módulo Responsabilidade", "✅"),
  ("persistente", "Persistente", "Completou o módulo Persistência", "🔥"),
  ("mente_em_crescimento", "Mente em Crescimento", "Completou o módulo Mentalidade de Crescimento", "🌱"),
  ("explorador_da_evolucao", "Explorador da Evolução", "Concluiu o curso inteiro e o Plano de Evolução", "🚀"),
]

tipo_map = {
  "escolha_multipla_com_consequencia": "escolha",
  "classificacao": "classificacao",
  "distribuicao_valor": "simulacao",
  "formulario_calculado": "simulacao",
  "desafio_streak": "simulacao",
  "checklist_situacoes": "classificacao",
  "formulario_projeto": "texto_livre",
  "calculadora": "calculadora",
  "simulacao_dialogo": "simulacao",
  "simulacao_dialogo_avaliada": "simulacao",
}

out = []
out.append("do $$")
out.append("declare")
out.append("  v_course_id uuid;")
out.append("  v_module_id uuid;")
out.append("  v_lesson_id uuid;")
out.append("  v_quiz_id uuid;")
out.append("begin")
out.append(f"  insert into public.courses (slug, title, description, icon, is_published, order_index)")
out.append(f"  values ({esc(COURSE['slug'])}, {esc(COURSE['title'])}, {esc(COURSE['description'])}, {esc(COURSE['icon'])}, true, {COURSE['order_index']})")
out.append(f"  returning id into v_course_id;")
out.append("")

for i, mod in enumerate(MODULES, start=1):
    a = mod["aula"]
    out.append(f"  -- MODULO {i}: {mod['titulo']}")
    out.append(f"  insert into public.modules (course_id, title, description, order_index)")
    out.append(f"  values (v_course_id, {esc(mod['titulo'])}, {esc(mod['descricao'])}, {i})")
    out.append(f"  returning id into v_module_id;")
    content_full = a["content"] + "\n\nExemplo do cotidiano: " + a["example"]
    out.append(f"  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)")
    out.append(f"  values (v_module_id, {esc(a['title'])}, {esc(a['introduction'])}, {esc(content_full)}, {esc(a['example'])}, 20, 1)")
    out.append(f"  returning id into v_lesson_id;")
    tipo_sql = tipo_map.get(a["activity_config"]["tipo"], "escolha")
    out.append(f"  insert into public.activities (lesson_id, type, title, config, order_index)")
    out.append(f"  values (v_lesson_id, {esc(tipo_sql)}, {esc(a['activity_title'])}, {jsonesc(a['activity_config'])}, 1);")
    out.append(f"  insert into public.quizzes (lesson_id, title) values (v_lesson_id, {esc('Quiz: ' + a['title'])}) returning id into v_quiz_id;")
    for qi, q in enumerate(a["quiz"], start=1):
        out.append(f"  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)")
        out.append(f"  values (v_quiz_id, {esc(q['q'])}, {jsonesc(q['opcoes'])}, {q['correta']}, {qi});")
    out.append("")

out.append("  -- CONQUISTAS")
for code, title, desc, icon in ACHIEVEMENTS:
    out.append(f"  insert into public.achievements (code, title, description, icon) values ({esc(code)}, {esc(title)}, {esc(desc)}, {esc(icon)}) on conflict (code) do nothing;")
out.append("end $$;")

with open("/home/claude/escola-digital/database/seed_course_desenvolvimento_pessoal.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
