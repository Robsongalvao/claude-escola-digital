#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "programacao-para-criancas",
  "title": "Programação para Crianças",
  "description": "Lógica, algoritmos e os primeiros passos para criar um jogo do zero.",
  "icon": "👨‍💻",
  "order_index": 6,
}

MODULES = [
  {
    "titulo": "O que é Programação?",
    "descricao": "Entendendo a ideia por trás de dar instruções a um computador.",
    "aula": {
      "title": "Ensinando um computador a fazer algo",
      "introduction": "Você já pensou em como um jogo sabe exatamente o que fazer quando você aperta um botão?",
      "content": "Programação é o processo de dar instruções precisas para um computador seguir, passo a passo, para que ele realize uma tarefa. Diferente de uma pessoa, o computador não 'entende' o que você quer dizer de forma vaga — ele só faz exatamente o que foi instruído, na ordem exata que foi escrito. Por isso, programar é, em grande parte, sobre pensar com clareza e organizar ideias em passos bem definidos, antes mesmo de escrever qualquer código. Essa forma de pensar se chama PENSAMENTO COMPUTACIONAL, e é útil até fora da programação, para resolver problemas do dia a dia.\n\nVocê sabia? Muitos jogos que você já jogou foram criados com milhares (às vezes milhões) de linhas de instruções escritas por programadores.\n\nPergunta para pensar: Que tarefa do seu dia a dia você conseguiria descrever em passos bem específicos, como se estivesse programando alguém para fazê-la?\n\nDesafio: Escreva o passo a passo bem detalhado de como escovar os dentes, como se fosse explicar para alguém que nunca fez isso.\n\nResumo: Programar é dar instruções precisas e ordenadas para um computador seguir. Isso exige pensar com clareza antes de escrever qualquer código.",
      "example": "Se você pedir para um computador 'fazer um sanduíche' sem detalhar os passos, ele não saberia o que fazer — programação é descrever cada passo, como pegar o pão, colocar o recheio, e fechar o sanduíche.",
      "activity_title": "Passo a passo detalhado",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma tarefa simples do dia a dia", "Passo 1", "Passo 2", "Passo 3"]
      },
      "quiz": [
        {"q": "O que é programação?", "opcoes": ["Adivinhar o que o usuário quer", "Dar instruções precisas e ordenadas para um computador seguir", "Um tipo de jogo apenas", "Desenhar na tela"], "correta": 1},
        {"q": "O que é pensamento computacional?", "opcoes": ["Pensar como um robô sem sentimentos", "Organizar ideias em passos claros para resolver problemas", "Um tipo de calculadora", "Só serve para programadores profissionais"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Algoritmos: A Receita que o Computador Segue",
    "descricao": "Entendendo o que é um algoritmo com exemplos do dia a dia.",
    "aula": {
      "title": "Toda tarefa tem uma receita",
      "introduction": "Uma receita de bolo tem passos numerados que você segue em ordem — um algoritmo funciona quase da mesma forma!",
      "content": "Um ALGORITMO é uma sequência de passos bem definidos para resolver um problema ou realizar uma tarefa. É como uma receita: tem um início, uma ordem de passos a seguir, e um resultado final esperado. Algoritmos existem em todo lugar, não só em programação — uma receita de bolo, o caminho que você faz para chegar na escola, ou até as regras de um jogo de tabuleiro são exemplos de algoritmos do dia a dia. Em programação, escrever um bom algoritmo antes de programar ajuda a organizar as ideias e evitar confusão depois.\n\nVocê sabia? A palavra 'algoritmo' vem do nome de um matemático persa chamado Al-Khwarizmi, que viveu há mais de mil anos!\n\nPergunta para pensar: Qual seria o algoritmo (passo a passo) para escovar os dentes?\n\nDesafio: Escreva o algoritmo (em passos numerados) de uma atividade que você faz toda semana.\n\nResumo: Um algoritmo é uma sequência de passos organizados para resolver um problema — existe em receitas, jogos e, claro, em programas de computador.",
      "example": "O algoritmo para atravessar a rua com segurança pode ser: 1) Olhar para os dois lados, 2) Esperar não ter carros vindo, 3) Atravessar andando, sem correr.",
      "activity_title": "Meu primeiro algoritmo",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome da tarefa", "Passo 1", "Passo 2", "Passo 3", "Resultado esperado no final"]
      },
      "quiz": [
        {"q": "O que é um algoritmo?", "opcoes": ["Um tipo de computador", "Uma sequência de passos organizados para resolver um problema", "Um jogo específico", "Um erro de programação"], "correta": 1},
        {"q": "Qual desses é um exemplo de algoritmo do dia a dia?", "opcoes": ["Uma receita de bolo", "A cor de uma parede", "O tamanho de uma sala", "Um sentimento"], "correta": 0}
      ]
    }
  },
  {
    "titulo": "Sequência e Instruções",
    "descricao": "Por que a ordem das instruções importa tanto.",
    "aula": {
      "title": "A ordem muda tudo",
      "introduction": "Você já tentou vestir o sapato antes da meia? A ordem dos passos faz toda diferença!",
      "content": "SEQUÊNCIA, em programação, é a ordem exata em que as instruções são executadas. O computador segue as instruções uma após a outra, na ordem em que foram escritas — e mudar essa ordem pode mudar completamente o resultado. Por isso, organizar bem a sequência de instruções é uma das primeiras habilidades importantes ao programar. Um erro comum de quem está começando é esquecer que o computador não vai 'adivinhar' a ordem certa — ele só segue exatamente o que foi escrito, na ordem escrita.\n\nVocê sabia? Um pequeno erro na ordem das instruções pode fazer um programa inteiro não funcionar como esperado — por isso programadores revisam a sequência com cuidado.\n\nPergunta para pensar: O que aconteceria se você tentasse 'fechar a porta' antes de 'entrar em casa'?\n\nDesafio: Coloque em ordem correta os passos de uma tarefa simples (como fazer um suco), numerando de 1 a 4.\n\nResumo: A sequência (ordem) das instruções muda completamente o resultado de um programa — o computador segue exatamente a ordem que foi escrita.",
      "example": "Para fazer um suco, a ordem importa: primeiro cortar a fruta, depois colocar no liquidificador, depois bater, e só então servir — inverter essa ordem não funcionaria.",
      "activity_title": "Coloque na ordem certa",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Colocar a meia antes do sapato", "resposta": "necessidade"},
          {"item": "Colocar o sapato antes da meia", "resposta": "desejo"},
          {"item": "Escovar os dentes depois de comer", "resposta": "necessidade"},
          {"item": "Fechar a porta antes de entrar em casa", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que é sequência em programação?", "opcoes": ["Um tipo de erro", "A ordem exata em que as instruções são executadas", "Um tipo de jogo", "Uma variável"], "correta": 1},
        {"q": "O que acontece se a sequência de instruções estiver errada?", "opcoes": ["Nada muda", "O resultado pode ficar completamente diferente do esperado", "O computador corrige sozinho sempre", "Só afeta jogos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Condições: Se Isso, Então Aquilo",
    "descricao": "Como programas tomam decisões diferentes.",
    "aula": {
      "title": "Ensinando o computador a decidir",
      "introduction": "Se estiver chovendo, você leva guarda-chuva. Se não estiver, você não leva. Isso é uma condição!",
      "content": "Uma CONDIÇÃO é uma estrutura que permite ao programa tomar decisões diferentes dependendo de uma situação. A forma mais comum é 'SE isso acontecer, ENTÃO faça aquilo' — por exemplo, 'SE o jogador tocar no inimigo, ENTÃO ele perde uma vida'. Condições são o que fazem jogos e programas parecerem 'inteligentes', reagindo de formas diferentes dependendo do que acontece. Sem condições, um programa sempre faria exatamente a mesma coisa, não importa a situação.\n\nVocê sabia? Praticamente todo jogo que você já jogou usa condições o tempo todo — para saber se você ganhou, perdeu, ou avançou de fase.\n\nPergunta para pensar: Qual seria uma condição do tipo 'se isso, então aquilo' na sua rotina diária?\n\nDesafio: Escreva 2 condições do tipo 'SE... ENTÃO...' que poderiam existir num jogo simples.\n\nResumo: Condições ('SE isso, ENTÃO aquilo') permitem que programas tomem decisões diferentes dependendo da situação.",
      "example": "Num jogo, uma condição pode ser: 'SE a pontuação for maior que 100, ENTÃO o jogador ganha uma medalha'.",
      "activity_title": "Complete a condição",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["SE (o que acontece)", "ENTÃO (o que o programa faz)"]
      },
      "quiz": [
        {"q": "O que é uma condição em programação?", "opcoes": ["Um tipo de variável", "Uma estrutura 'SE isso, ENTÃO aquilo' que permite decisões diferentes", "Um erro de código", "A cor da tela"], "correta": 1},
        {"q": "Para que servem condições num jogo?", "opcoes": ["Para deixar o jogo mais lento", "Para o jogo reagir de formas diferentes dependendo da situação", "Não servem para nada em jogos", "Só servem para o menu inicial"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Repetições: Fazendo a Mesma Coisa Várias Vezes",
    "descricao": "Como evitar repetir instruções manualmente.",
    "aula": {
      "title": "Por que repetir manualmente quando o computador pode fazer isso?",
      "introduction": "Imagine escrever a mesma instrução 100 vezes — que trabalho! É aí que entram as repetições.",
      "content": "Uma REPETIÇÃO (também chamada de LOOP) é uma estrutura que permite executar a mesma instrução várias vezes, sem precisar escrever ela repetidamente. Por exemplo, ao invés de escrever 'ande um passo' 10 vezes seguidas, um programador pode escrever uma repetição que diz 'ande um passo, 10 vezes'. Isso economiza tempo, deixa o código mais organizado, e é essencial para tarefas que precisam se repetir, como animar um personagem se movendo continuamente num jogo.\n\nVocê sabia? Sem repetições, criar até mesmo animações simples em jogos seria extremamente trabalhoso, exigindo escrever a mesma instrução centenas de vezes.\n\nPergunta para pensar: Que tarefa do seu dia a dia envolve fazer a mesma coisa várias vezes seguidas?\n\nDesafio: Pense numa ação de jogo (como pular ou andar) e imagine como seria usar uma repetição para fazer isso acontecer 5 vezes seguidas.\n\nResumo: Repetições (loops) permitem executar a mesma instrução várias vezes sem repetir o código manualmente — essenciais para animações e tarefas repetitivas.",
      "example": "Ao invés de escrever 'pular' cinco vezes seguidas no código, um programador escreve uma repetição dizendo 'pular, 5 vezes' — muito mais organizado.",
      "activity_title": "Onde usar uma repetição?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Fazer um personagem andar 10 passos seguidos", "resposta": "necessidade"},
          {"item": "Mostrar o nome do jogo uma única vez na tela inicial", "resposta": "desejo"},
          {"item": "Fazer uma estrela piscar continuamente na tela", "resposta": "necessidade"},
          {"item": "Mostrar 'Fim de jogo' uma única vez", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que é uma repetição (loop) em programação?", "opcoes": ["Um erro do programa", "Uma estrutura que executa a mesma instrução várias vezes", "Um tipo de variável", "Uma condição"], "correta": 1},
        {"q": "Por que repetições são úteis?", "opcoes": ["Deixam o código mais confuso", "Evitam repetir manualmente a mesma instrução várias vezes", "Não servem para nada", "Só funcionam em jogos simples"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Variáveis: Guardando Informações",
    "descricao": "Como programas lembram de números e informações.",
    "aula": {
      "title": "Uma caixinha com nome para guardar informação",
      "introduction": "Como você acha que um jogo 'lembra' quantos pontos você fez? A resposta é: variáveis!",
      "content": "Uma VARIÁVEL é como uma caixinha com um nome, usada para guardar uma informação que pode mudar ao longo do programa — como a pontuação de um jogador, o número de vidas, ou o nome digitado por alguém. Por exemplo, uma variável chamada 'pontos' pode começar em 0 e ir aumentando conforme o jogador faz pontos no jogo. O nome da variável ajuda o programador a lembrar o que aquela informação representa, e o valor guardado dentro dela pode mudar (por isso se chama 'variável' — porque varia!).\n\nVocê sabia? Praticamente todo jogo digital usa variáveis para controlar coisas como pontuação, vidas, tempo restante e nível do jogador.\n\nPergunta para pensar: Que informações um jogo de plataforma (tipo pular e correr) provavelmente guarda em variáveis?\n\nDesafio: Pense em 3 variáveis que um jogo simples de corrida poderia ter (como 'velocidade' ou 'distância percorrida').\n\nResumo: Variáveis são 'caixinhas com nome' que guardam informações que podem mudar durante o programa, como pontuação ou vidas.",
      "example": "Numa variável chamada 'vidas', o valor pode começar em 3 e diminuir toda vez que o personagem é atingido por um inimigo.",
      "activity_title": "Minhas variáveis de jogo",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome da primeira variável (ex: pontos)", "Valor inicial dela", "Nome da segunda variável (ex: vidas)", "Valor inicial dela"]
      },
      "quiz": [
        {"q": "O que é uma variável em programação?", "opcoes": ["Um tipo de erro", "Uma 'caixinha com nome' que guarda uma informação que pode mudar", "Uma imagem fixa", "Um tipo de repetição"], "correta": 1},
        {"q": "Qual dessas seria uma boa variável num jogo?", "opcoes": ["Pontuação do jogador", "A cor do fundo do menu, sempre fixa", "O nome do jogo, sempre igual", "O logotipo da empresa"], "correta": 0}
      ]
    }
  },
  {
    "titulo": "Eventos: Quando Algo Acontece",
    "descricao": "Como o programa reage a ações do jogador.",
    "aula": {
      "title": "O que acontece quando eu clico aqui?",
      "introduction": "Quando você aperta um botão num jogo e algo acontece na tela, isso é um evento sendo processado!",
      "content": "Um EVENTO é algo que acontece durante o uso do programa que faz ele reagir de alguma forma — como clicar num botão, apertar uma tecla, ou o personagem tocar em um objeto. Programas reagem a eventos executando uma ação específica: 'QUANDO o jogador apertar a seta para cima, ENTÃO o personagem pula'. Eventos são o que tornam jogos interativos — sem eles, o jogo simplesmente aconteceria sozinho, sem responder ao que o jogador faz.\n\nVocê sabia? Existem eventos que nem sempre vêm do jogador — por exemplo, 'QUANDO o cronômetro chegar a zero' também é um evento que o programa pode reagir.\n\nPergunta para pensar: Que eventos você consegue identificar num jogo que você gosta (como apertar um botão específico)?\n\nDesafio: Escreva um evento e a reação dele: 'QUANDO ___ acontecer, ENTÃO ___'.\n\nResumo: Eventos são ações que fazem o programa reagir, como cliques ou teclas pressionadas — são essenciais para a interatividade dos jogos.",
      "example": "Num jogo de plataforma, o evento 'QUANDO o jogador aperta a barra de espaço' pode causar a reação 'ENTÃO o personagem pula'.",
      "activity_title": "Meus eventos de jogo",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["QUANDO (evento)", "ENTÃO (reação do jogo)"]
      },
      "quiz": [
        {"q": "O que é um evento em programação?", "opcoes": ["Uma festa no jogo", "Uma ação que faz o programa reagir de alguma forma", "Um tipo de variável", "Um erro do código"], "correta": 1},
        {"q": "Por que eventos são importantes em jogos?", "opcoes": ["Não são importantes", "Tornam o jogo interativo, reagindo ao que o jogador faz", "Deixam o jogo mais lento", "Só servem para o menu"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Lógica de Jogos: Planejando Meu Primeiro Jogo",
    "descricao": "Juntando tudo para planejar um jogo simples do início ao fim.",
    "aula": {
      "title": "Da ideia ao plano do jogo",
      "introduction": "Agora que você já conhece as peças fundamentais da programação, é hora de planejar seu próprio jogo!",
      "content": "Todo jogo, por mais simples que seja, é construído combinando os conceitos que você já aprendeu: uma SEQUÊNCIA de passos, CONDIÇÕES que decidem o que acontece, REPETIÇÕES para ações que se repetem, VARIÁVEIS para guardar informações como pontuação, e EVENTOS que reagem ao que o jogador faz. Antes de programar de verdade, é muito útil planejar no papel: qual é o objetivo do jogador? Quais são as regras principais? O que faz o jogador ganhar ou perder? Esse planejamento prévio economiza muito tempo e deixa as ideias mais claras.\n\nVocê sabia? Muitos estúdios de jogos profissionais passam semanas ou meses só planejando as regras de um jogo antes de escrever qualquer código.\n\nPergunta para pensar: Qual seria o objetivo principal de um jogo simples que você gostaria de criar?\n\nDesafio: Rascunhe as regras principais de um jogo simples, pensando em objetivo, condições de vitória e derrota.\n\nResumo: Um jogo combina sequência, condições, repetições, variáveis e eventos. Planejar as regras no papel antes de programar economiza tempo.",
      "example": "Um jogo simples de 'pegar estrelas' pode ter: o objetivo de coletar 10 estrelas (variável de pontuação), a condição de perder se tocar num inimigo, e o evento de mover o personagem com as setas do teclado.",
      "activity_title": "Meu Primeiro Jogo",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome do jogo", "Objetivo do jogador", "Regra principal (o que faz ganhar ou perder)", "Uma ação que o jogador pode fazer (evento)"]
      },
      "quiz": [
        {"q": "Antes de programar um jogo, o que é útil fazer?", "opcoes": ["Começar a escrever código direto, sem planejar", "Planejar as regras e objetivos no papel primeiro", "Não pensar em nada antes", "Copiar outro jogo exatamente"], "correta": 1},
        {"q": "Quais elementos costumam se combinar num jogo?", "opcoes": ["Só variáveis", "Sequência, condições, repetições, variáveis e eventos", "Só imagens bonitas", "Nenhum conceito de programação"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("programador_iniciante", "Programador Iniciante", "Completou o módulo O que é Programação?", "💻"),
  ("mestre_dos_algoritmos", "Mestre dos Algoritmos", "Completou o módulo Algoritmos", "📋"),
  ("organizador_de_instrucoes", "Organizador de Instruções", "Completou o módulo Sequência e Instruções", "🔢"),
  ("mestre_das_condicoes", "Mestre das Condições", "Completou o módulo Condições", "🔀"),
  ("mestre_das_repeticoes", "Mestre das Repetições", "Completou o módulo Repetições", "🔁"),
  ("guardiao_de_variaveis", "Guardião de Variáveis", "Completou o módulo Variáveis", "📦"),
  ("cacador_de_eventos", "Caçador de Eventos", "Completou o módulo Eventos", "⚡"),
  ("planejador_de_jogos", "Planejador de Jogos", "Completou o módulo Lógica de Jogos", "🎮"),
  ("pequeno_programador", "Pequeno Programador", "Concluiu o curso inteiro e o Primeiro Jogo", "👨‍💻"),
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
out.append("  insert into public.courses (slug, title, description, icon, is_published, order_index)")
out.append(f"  values ({esc(COURSE['slug'])}, {esc(COURSE['title'])}, {esc(COURSE['description'])}, {esc(COURSE['icon'])}, true, {COURSE['order_index']})")
out.append("  returning id into v_course_id;")
out.append("")

for i, mod in enumerate(MODULES, start=1):
    a = mod["aula"]
    out.append(f"  -- MODULO {i}: {mod['titulo']}")
    out.append("  insert into public.modules (course_id, title, description, order_index)")
    out.append(f"  values (v_course_id, {esc(mod['titulo'])}, {esc(mod['descricao'])}, {i})")
    out.append("  returning id into v_module_id;")
    content_full = a["content"] + "\n\nExemplo do cotidiano: " + a["example"]
    out.append("  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)")
    out.append(f"  values (v_module_id, {esc(a['title'])}, {esc(a['introduction'])}, {esc(content_full)}, {esc(a['example'])}, 20, 1)")
    out.append("  returning id into v_lesson_id;")
    tipo_sql = tipo_map.get(a["activity_config"]["tipo"], "escolha")
    out.append("  insert into public.activities (lesson_id, type, title, config, order_index)")
    out.append(f"  values (v_lesson_id, {esc(tipo_sql)}, {esc(a['activity_title'])}, {jsonesc(a['activity_config'])}, 1);")
    out.append(f"  insert into public.quizzes (lesson_id, title) values (v_lesson_id, {esc('Quiz: ' + a['title'])}) returning id into v_quiz_id;")
    for qi, q in enumerate(a["quiz"], start=1):
        out.append("  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)")
        out.append(f"  values (v_quiz_id, {esc(q['q'])}, {jsonesc(q['opcoes'])}, {q['correta']}, {qi});")
    out.append("")

out.append("  -- CONQUISTAS")
for code, title, desc, icon in ACHIEVEMENTS:
    out.append(f"  insert into public.achievements (code, title, description, icon) values ({esc(code)}, {esc(title)}, {esc(desc)}, {esc(icon)}) on conflict (code) do nothing;")
out.append("end $$;")

with open("/home/claude/escola-digital/database/seed_course_programacao.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
