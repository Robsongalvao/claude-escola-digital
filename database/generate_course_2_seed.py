#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "informatica-do-zero",
  "title": "Informática do Zero",
  "description": "Computador, arquivos, internet, e-mail e os primeiros documentos digitais.",
  "icon": "💻",
  "order_index": 3,
}

MODULES = [
  {
    "titulo": "O que é um computador?",
    "descricao": "Hardware, software e as partes que você usa todo dia.",
    "aula": {
      "title": "Por dentro do computador",
      "introduction": "Você já imaginou como seu computador consegue entender o que você digita e mostrar isso na tela?",
      "content": "HARDWARE são as partes físicas do computador — as que você pode tocar: o monitor (a tela), o teclado (onde você digita), o mouse (para clicar e apontar), e o gabinete (onde ficam as peças que processam tudo). SOFTWARE são os programas — as instruções que fazem o hardware funcionar de um jeito útil, como o navegador de internet, um editor de texto ou um jogo. Pense assim: o hardware é o corpo do computador, e o software é como uma receita que diz o que esse corpo deve fazer. Sem software, o hardware é só uma caixa de peças; sem hardware, o software não tem onde rodar.\n\nVocê sabia? O primeiro mouse de computador foi inventado nos anos 1960 e era feito de madeira!\n\nPergunta para pensar: Se seu celular também tem hardware e software, quais partes dele você consegue identificar?\n\nDesafio: Olhe para o computador ou celular mais próximo e tente identificar 3 partes de hardware.\n\nResumo: Hardware são as partes físicas; software são os programas que fazem o hardware funcionar de forma útil.",
      "example": "O monitor mostrando a tela é hardware. O navegador que você usa para acessar sites é software rodando dentro daquele hardware.",
      "activity_title": "Hardware ou Software?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Teclado", "resposta": "necessidade"},
          {"item": "Navegador de internet", "resposta": "desejo"},
          {"item": "Mouse", "resposta": "necessidade"},
          {"item": "Editor de texto", "resposta": "desejo"},
          {"item": "Monitor", "resposta": "necessidade"},
          {"item": "Aplicativo de jogos", "resposta": "desejo"},
          {"item": "Gabinete (a caixa do computador)", "resposta": "necessidade"},
          {"item": "Sistema operacional", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que é hardware?", "opcoes": ["Os programas do computador", "As partes físicas do computador", "A internet", "Um tipo de arquivo"], "correta": 1},
        {"q": "O que é software?", "opcoes": ["As peças físicas", "Os programas e instruções que rodam no hardware", "O monitor", "O teclado"], "correta": 1},
        {"q": "Qual desses é um exemplo de hardware?", "opcoes": ["Navegador de internet", "Mouse", "Editor de texto", "Aplicativo de mensagens"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Organização Digital",
    "descricao": "Arquivos, pastas e como manter tudo em ordem no computador.",
    "aula": {
      "title": "Arquivos e pastas: minha gaveta digital",
      "introduction": "Você organiza roupas em gavetas e livros em estantes — no computador, usamos pastas e arquivos do mesmo jeito!",
      "content": "Um ARQUIVO é qualquer coisa salva no computador: um texto, uma foto, uma música, um vídeo. Uma PASTA é como uma gaveta digital que guarda arquivos (e até outras pastas dentro dela) organizados por assunto. Organizar bem os arquivos em pastas com nomes claros evita perder tempo procurando algo depois. Uma boa prática é criar uma pasta principal para cada assunto grande (como 'Escola' ou 'Fotos') e, dentro dela, subpastas mais específicas (como 'Escola > Matemática' ou 'Fotos > Aniversário').\n\nVocê sabia? Um computador pode guardar milhões de arquivos — por isso a organização em pastas é tão importante, senão fica impossível encontrar as coisas depois.\n\nPergunta para pensar: Como você organizaria seus arquivos escolares em pastas?\n\nDesafio: Se você tem acesso a um computador, crie uma pasta nova com um nome claro para guardar algo que você usa com frequência.\n\nResumo: Arquivos são os itens salvos; pastas organizam esses arquivos por assunto, facilitando encontrar tudo depois.",
      "example": "Ao invés de salvar todos os trabalhos escolares soltos numa única pasta bagunçada, um aluno organizado cria 'Escola > Português', 'Escola > Matemática', e assim por diante.",
      "activity_title": "Organize as pastas",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome de uma pasta principal que você criaria", "3 subpastas que ficariam dentro dela"]
      },
      "quiz": [
        {"q": "O que é um arquivo?", "opcoes": ["Uma gaveta digital", "Algo salvo no computador, como um texto ou foto", "Um tipo de internet", "Um programa apenas"], "correta": 1},
        {"q": "Para que servem as pastas?", "opcoes": ["Para deixar o computador mais lento", "Para organizar arquivos por assunto", "Não servem para nada", "Só para fotos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Navegando na Internet",
    "descricao": "Navegadores, pesquisa e como buscar informações com segurança.",
    "aula": {
      "title": "Como funciona a internet que eu uso",
      "introduction": "Você já se perguntou como um site do outro lado do mundo aparece na sua tela em segundos?",
      "content": "A internet é uma gigantesca rede que conecta computadores do mundo todo, permitindo trocar informações. Para acessar sites, usamos um NAVEGADOR (como Chrome, Firefox ou Edge) — um programa feito especialmente para mostrar páginas da internet. Para encontrar informações, usamos um MECANISMO DE PESQUISA (como o Google), digitando palavras-chave sobre o que queremos saber. Uma boa pesquisa usa palavras específicas (não frases muito longas) e, o mais importante: nem tudo que aparece na internet é verdade, então é essencial checar se a informação vem de uma fonte confiável antes de acreditar nela.\n\nVocê sabia? A internet não tem um único 'dono' — ela é formada por milhões de redes de computadores conectadas entre si ao redor do mundo.\n\nPergunta para pensar: Como você poderia checar se uma informação que você leu na internet é verdadeira?\n\nDesafio: Da próxima vez que pesquisar algo, tente usar 2-3 palavras-chave específicas ao invés de uma frase inteira, e veja se o resultado melhora.\n\nResumo: Navegadores mostram sites; mecanismos de pesquisa ajudam a encontrar informação. Nem tudo na internet é verdade — é preciso checar as fontes.",
      "example": "Pesquisar 'capital da França' é mais eficiente do que digitar 'eu queria saber qual é a capital do país França por favor'.",
      "activity_title": "Pesquisa boa vs. pesquisa ruim",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Acreditar em qualquer informação só porque estava na internet", "consequencia": "Isso pode te fazer acreditar em informações falsas, então é arriscado."},
          {"texto": "Checar se a informação aparece em mais de uma fonte confiável", "consequencia": "Essa é a forma mais segura de confirmar se algo é verdade."},
          {"texto": "Nunca pesquisar nada na internet", "consequencia": "Isso te impede de aproveitar uma ferramenta útil de aprendizado."}
        ]
      },
      "quiz": [
        {"q": "O que é um navegador?", "opcoes": ["Um tipo de arquivo", "Um programa para acessar sites na internet", "Um mecanismo de pesquisa apenas", "Um tipo de pasta"], "correta": 1},
        {"q": "Por que é importante checar fontes na internet?", "opcoes": ["Não é importante", "Porque nem tudo que aparece é verdade", "Só para deixar mais lento", "Porque é proibido pesquisar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "E-mail: Minha Caixa de Mensagens",
    "descricao": "Como funciona o e-mail e boas práticas de uso.",
    "aula": {
      "title": "Enviando minha primeira mensagem digital",
      "introduction": "Você sabia que uma mensagem de e-mail pode chegar do outro lado do mundo em poucos segundos?",
      "content": "E-mail é uma forma de enviar mensagens digitais para qualquer pessoa que tenha um endereço de e-mail, em qualquer lugar do mundo. Um e-mail tem partes importantes: o DESTINATÁRIO (para quem vai), o ASSUNTO (um resumo curto do que a mensagem trata) e o CORPO (o texto da mensagem em si). Escrever um e-mail educado e claro é uma habilidade importante — começar com uma saudação, explicar o motivo da mensagem com clareza, e terminar de forma educada. E-mails são frequentemente usados para assuntos importantes (escola, trabalho), por isso vale caprichar mais do que numa mensagem informal de chat.\n\nVocê sabia? O e-mail existe desde antes da internet como conhecemos hoje — uma das primeiras formas de comunicação digital que existiram!\n\nPergunta para pensar: Qual seria um bom assunto para um e-mail avisando que você vai faltar a uma atividade?\n\nDesafio: Se você (com ajuda de um responsável) tiver acesso a um e-mail, pratique escrever uma mensagem educada para alguém da família.\n\nResumo: E-mail é uma forma de enviar mensagens digitais, com destinatário, assunto e corpo. Uma boa escrita de e-mail é clara e educada.",
      "example": "Um e-mail com o assunto 'Dúvida sobre a tarefa de matemática' é muito mais claro do que um sem assunto nenhum, porque a pessoa já sabe do que se trata antes de abrir.",
      "activity_title": "Escreva um e-mail educado",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Assunto do e-mail", "Saudação inicial", "Corpo da mensagem", "Despedida"]
      },
      "quiz": [
        {"q": "O que é o 'assunto' de um e-mail?", "opcoes": ["O nome de quem envia", "Um resumo curto do que a mensagem trata", "A hora que foi enviado", "O tamanho do arquivo"], "correta": 1},
        {"q": "Escrever um e-mail educado envolve:", "opcoes": ["Ser direto sem nenhuma saudação", "Saudação, clareza no motivo e despedida educada", "Usar só gírias", "Escrever tudo em letras maiúsculas"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Criando Documentos de Texto",
    "descricao": "Editores de texto e como formatar um documento.",
    "aula": {
      "title": "Meu primeiro documento digital",
      "introduction": "Antigamente, documentos importantes eram só escritos à mão ou na máquina de escrever — hoje, um editor de texto faz tudo isso (e muito mais) na tela.",
      "content": "Um EDITOR DE TEXTO é um programa (como Word ou Google Docs) usado para escrever e formatar documentos digitais. Formatar significa ajustar a aparência do texto: escolher um TÍTULO em destaque, deixar palavras em NEGRITO para dar ênfase, organizar o texto em parágrafos, e até inserir imagens quando fizer sentido. Um documento bem organizado é mais fácil de ler do que um bloco de texto corrido sem nenhuma estrutura. Isso vale tanto para trabalhos escolares quanto para qualquer texto que você queira compartilhar com outras pessoas.\n\nVocê sabia? A tecla de atalho Ctrl+B (ou Cmd+B no Mac) coloca o texto selecionado em negrito instantaneamente, sem precisar usar o mouse.\n\nPergunta para pensar: Por que um documento com título e parágrafos organizados é mais fácil de entender do que um texto corrido?\n\nDesafio: Escreva um pequeno texto (3-4 frases) sobre um assunto que você gosta, com um título em destaque.\n\nResumo: Editores de texto permitem escrever e formatar documentos com título, negrito e parágrafos, deixando a leitura mais clara.",
      "example": "Um trabalho escolar com título grande, subtítulos e parágrafos bem divididos é muito mais fácil de ler do que um texto inteiro sem quebras.",
      "activity_title": "Meu Primeiro Documento Digital",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Título do documento", "Parágrafo de introdução", "Parágrafo principal (com uma palavra em destaque)"]
      },
      "quiz": [
        {"q": "O que é um editor de texto?", "opcoes": ["Um mecanismo de pesquisa", "Um programa para escrever e formatar documentos", "Um tipo de e-mail", "Um navegador"], "correta": 1},
        {"q": "Formatar um documento significa:", "opcoes": ["Apagar o texto", "Ajustar a aparência: título, negrito, parágrafos", "Enviar por e-mail", "Salvar em pasta"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Apresentações: Contando Ideias em Slides",
    "descricao": "Como estruturar uma apresentação simples e clara.",
    "aula": {
      "title": "Montando minha primeira apresentação",
      "introduction": "Já viu alguém apresentando um trabalho com slides na tela? Hoje você vai aprender a montar o seu.",
      "content": "Uma APRESENTAÇÃO é um conjunto de SLIDES (telas) usado para expor uma ideia de forma visual e organizada, geralmente enquanto a pessoa fala sobre o assunto. Um bom slide não deve ter texto demais — o ideal é usar poucas palavras-chave e deixar a explicação detalhada para a fala, não para o slide cheio de texto pequeno. Uma apresentação simples geralmente segue essa estrutura: um slide de título (apresentando o tema), alguns slides de conteúdo (um assunto por slide) e um slide de conclusão (resumindo a ideia principal).\n\nVocê sabia? Especialistas em apresentações costumam recomendar no máximo 6 linhas de texto por slide — o foco deve estar em quem está falando, não em ler o slide.\n\nPergunta para pensar: Por que um slide com texto demais pode atrapalhar quem está assistindo à apresentação?\n\nDesafio: Escolha um assunto que você gosta e planeje 3 slides: título, um ponto principal, e conclusão.\n\nResumo: Apresentações usam slides com poucas palavras-chave para apoiar visualmente uma fala, não substituí-la.",
      "example": "Ao invés de colocar um parágrafo inteiro num slide sobre o sistema solar, é melhor colocar 'Sistema Solar: 8 planetas' e explicar os detalhes falando.",
      "activity_title": "Planeje sua apresentação",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Título da apresentação", "Ponto principal do slide 2", "Frase de conclusão"]
      },
      "quiz": [
        {"q": "O que é um slide?", "opcoes": ["Um tipo de arquivo de música", "Uma tela dentro de uma apresentação", "Um e-mail", "Uma pasta"], "correta": 1},
        {"q": "Um bom slide geralmente tem:", "opcoes": ["Muito texto detalhado", "Poucas palavras-chave", "Nenhuma palavra", "Só imagens sem nenhum texto"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Planilhas: Organizando Números",
    "descricao": "O que são planilhas e para que servem no dia a dia.",
    "aula": {
      "title": "Números organizados em linhas e colunas",
      "introduction": "Já viu uma tabela cheia de números organizados em linhas e colunas? Isso é uma planilha!",
      "content": "Uma PLANILHA é um programa (como Excel ou Google Sheets) que organiza informação em CÉLULAS, dispostas em LINHAS (horizontais) e COLUNAS (verticais). Planilhas são ótimas para organizar listas, calcular somas automaticamente, e visualizar dados de forma clara. Por exemplo, você pode fazer uma planilha simples para controlar sua mesada: uma coluna para o que você ganhou, outra para o que gastou. A grande vantagem é que, ao mudar um número, os cálculos que dependem dele se atualizam sozinhos.\n\nVocê sabia? Planilhas conseguem fazer cálculos automáticos usando fórmulas — por exemplo, somar uma coluna inteira de números com um único comando, sem precisar somar cada um manualmente.\n\nPergunta para pensar: Que tipo de lista do seu dia a dia poderia ser organizada numa planilha?\n\nDesafio: No papel ou numa planilha real, organize uma lista simples (como seus gastos da semana) em linhas e colunas.\n\nResumo: Planilhas organizam dados em linhas e colunas, permitindo cálculos automáticos e visualização clara de números.",
      "example": "Uma planilha de mesada pode ter colunas 'Data', 'Ganhei' e 'Gastei', mostrando de forma clara para onde o dinheiro está indo.",
      "activity_title": "Minha planilha de mesada",
      "activity_config": {
        "tipo": "distribuicao_valor",
        "valor_total": 50,
        "categorias": ["Guardado", "Gasto com lanche", "Gasto com lazer"],
        "instrucao": "Distribua uma mesada fictícia de R$ 50 entre as categorias, como faria numa planilha simples."
      },
      "quiz": [
        {"q": "O que é uma célula numa planilha?", "opcoes": ["Um tipo de arquivo", "O espaço onde uma linha e uma coluna se cruzam", "Um e-mail", "Um slide"], "correta": 1},
        {"q": "Qual a vantagem de usar fórmulas numa planilha?", "opcoes": ["Não tem vantagem", "Cálculos se atualizam automaticamente quando os números mudam", "Deixa a planilha mais lenta", "Serve só para decorar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Digitação e Atalhos",
    "descricao": "Digitando com mais confiança e rapidez.",
    "aula": {
      "title": "Digitando mais rápido e com menos erros",
      "introduction": "No início, digitar parece devagar e cansativo — mas, com prática, isso muda rápido!",
      "content": "Digitação é a habilidade de escrever no teclado. Uma boa digitação não é sobre velocidade no início — é sobre praticar regularmente até ficar mais natural. Alguns ATALHOS DE TECLADO comuns economizam bastante tempo: Ctrl+C copia algo selecionado, Ctrl+V cola o que foi copiado, Ctrl+Z desfaz a última ação, e Ctrl+S salva o documento. Aprender esses atalhos evita precisar usar o mouse toda hora para ações simples e repetitivas, deixando o trabalho no computador mais fluido.\n\nVocê sabia? Os atalhos Ctrl+C e Ctrl+V (copiar e colar) são usados bilhões de vezes por dia ao redor do mundo — são alguns dos atalhos mais usados de toda a informática.\n\nPergunta para pensar: Qual tarefa no computador você acha que ficaria mais rápida se você soubesse mais atalhos de teclado?\n\nDesafio: Pratique usar Ctrl+C e Ctrl+V para copiar e colar um texto pequeno.\n\nResumo: Digitação melhora com prática regular. Atalhos de teclado (como Ctrl+C, Ctrl+V, Ctrl+Z, Ctrl+S) tornam o trabalho no computador mais rápido.",
      "example": "Ao invés de clicar com o mouse em 'copiar' e depois em 'colar' em menus, usar Ctrl+C e Ctrl+V faz a mesma coisa muito mais rápido.",
      "activity_title": "Quiz de atalhos",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Copiar um texto selecionado", "resposta": "necessidade"},
          {"item": "Colar o que foi copiado", "resposta": "desejo"},
          {"item": "Desfazer a última ação", "resposta": "necessidade"},
          {"item": "Salvar o documento", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que faz o atalho Ctrl+Z?", "opcoes": ["Salva o documento", "Desfaz a última ação", "Copia o texto", "Fecha o programa"], "correta": 1},
        {"q": "Por que aprender atalhos de teclado é útil?", "opcoes": ["Não é útil", "Torna ações repetitivas mais rápidas", "Deixa o computador mais lento", "Só serve para jogos"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("explorador_digital", "Explorador Digital", "Completou o módulo O que é um computador?", "💻"),
  ("organizador_de_arquivos", "Organizador de Arquivos", "Completou o módulo Organização Digital", "🗂️"),
  ("navegador_seguro", "Navegador Seguro", "Completou o módulo Navegando na Internet", "🌐"),
  ("mensageiro_digital", "Mensageiro Digital", "Completou o módulo E-mail", "✉️"),
  ("criador_de_documentos", "Criador de Documentos", "Completou o módulo Criando Documentos de Texto", "📝"),
  ("apresentador", "Apresentador", "Completou o módulo Apresentações", "🎤"),
  ("planilheiro", "Planilheiro", "Completou o módulo Planilhas", "📊"),
  ("digitador_rapido", "Digitador Rápido", "Completou o módulo Digitação e Atalhos", "⌨️"),
  ("mestre_da_informatica", "Mestre da Informática", "Concluiu o curso inteiro e o Primeiro Documento Digital", "🖥️"),
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

with open("/home/claude/escola-digital/database/seed_course_informatica.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
