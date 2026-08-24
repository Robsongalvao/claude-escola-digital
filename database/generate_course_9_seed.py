#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "cidadania-e-vida-em-sociedade",
  "title": "Cidadania e Vida em Sociedade",
  "description": "Respeito, direitos, regras e como contribuir para a comunidade.",
  "icon": "🌎",
  "order_index": 9,
}

MODULES = [
  {
    "titulo": "Respeito e Empatia",
    "descricao": "Entendendo o outro e tratando as pessoas com consideração.",
    "aula": {
      "title": "Se colocar no lugar do outro",
      "introduction": "Você já parou para pensar como seria estar no lugar de outra pessoa antes de julgar uma atitude dela?",
      "content": "EMPATIA é a capacidade de se colocar no lugar do outro, tentando entender como ele se sente numa situação, mesmo que você não tenha passado exatamente pela mesma coisa. RESPEITO é tratar as pessoas com consideração, reconhecendo que elas têm sentimentos, opiniões e necessidades tão válidas quanto as suas. Esses dois conceitos andam juntos: quando praticamos empatia, fica mais fácil ser respeitoso, porque entendemos melhor o impacto das nossas palavras e ações nos outros. Respeito não significa concordar com tudo — significa tratar bem mesmo quando existe uma diferença de opinião ou de forma de ser.\n\nVocê sabia? Estudos mostram que crianças que praticam empatia regularmente tendem a formar amizades mais duradouras e a lidar melhor com conflitos.\n\nPergunta para pensar: Já houve uma vez em que, ao pensar em como a outra pessoa estava se sentindo, você mudou sua atitude? Como foi isso?\n\nDesafio: Hoje, antes de reagir a alguma situação com um colega ou familiar, tente pensar em como ele deve estar se sentindo.\n\nResumo: Empatia é se colocar no lugar do outro; respeito é tratar as pessoas com consideração, mesmo quando há diferenças de opinião.",
      "example": "Se um colega está mais quieto e triste, ao invés de julgar, uma atitude empática seria perguntar com cuidado se está tudo bem, tentando entender o que ele pode estar sentindo.",
      "activity_title": "Praticando empatia",
      "activity_config": {
        "tipo": "simulacao_dialogo",
        "situacoes": [
          {"cliente": "Um colega chegou atrasado e parece chateado, sem explicar o motivo.", "opcoes": ["Reclamar do atraso na frente de todos", "Perguntar com cuidado se está tudo bem, sem julgar", "Ignorar completamente"], "correta": 1}
        ]
      },
      "quiz": [
        {"q": "O que é empatia?", "opcoes": ["Concordar com tudo que o outro diz", "Se colocar no lugar do outro para entender como ele se sente", "Ignorar os sentimentos alheios", "Um tipo de regra"], "correta": 1},
        {"q": "Respeitar alguém significa sempre concordar com essa pessoa?", "opcoes": ["Sim, sempre", "Não, é possível respeitar mesmo discordando", "Só se for da família", "Respeito não tem relação com concordar ou discordar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Direitos e Deveres",
    "descricao": "Entendendo o que temos garantido e o que é esperado de nós.",
    "aula": {
      "title": "Toda garantia vem com uma responsabilidade",
      "introduction": "Você sabia que crianças e adolescentes têm direitos garantidos por lei, e também responsabilidades no seu dia a dia?",
      "content": "DIREITOS são garantias que todas as pessoas têm, como o direito à educação, à saúde, ao lazer e a serem tratadas com respeito. DEVERES são as responsabilidades que temos em troca de fazer parte de uma sociedade ou grupo — como respeitar os direitos dos outros, seguir combinados, e contribuir com o que está ao nosso alcance. Direitos e deveres andam juntos: ter o direito de estudar, por exemplo, também envolve o dever de se esforçar e respeitar o ambiente escolar. Entender essa relação ajuda a perceber que viver em sociedade é uma troca — ninguém vive sozinho, e as ações de cada um afetam os outros.\n\nVocê sabia? A Convenção sobre os Direitos da Criança, um documento internacional, garante direitos específicos para crianças e adolescentes em praticamente todos os países do mundo.\n\nPergunta para pensar: Qual é um direito que você tem, e qual dever você acha que anda junto com ele?\n\nDesafio: Escreva um direito seu e um dever correspondente que você pratica no dia a dia.\n\nResumo: Direitos são garantias que temos; deveres são as responsabilidades que temos em troca. Os dois andam juntos na vida em sociedade.",
      "example": "Toda criança tem o direito à educação; junto com isso, vem o dever de respeitar professores e colegas e se esforçar nos estudos.",
      "activity_title": "Direito e dever correspondente",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um direito que você tem", "O dever correspondente a esse direito"]
      },
      "quiz": [
        {"q": "O que são direitos?", "opcoes": ["Regras impostas sem explicação", "Garantias que todas as pessoas têm, como educação e saúde", "Punições", "Um tipo de imposto"], "correta": 1},
        {"q": "Direitos e deveres andam juntos?", "opcoes": ["Não têm relação nenhuma", "Sim, geralmente um vem acompanhado do outro", "Só direitos importam", "Só deveres importam"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Regras: Por que Existem?",
    "descricao": "Entendendo o propósito das regras em diferentes contextos.",
    "aula": {
      "title": "Regras não existem à toa",
      "introduction": "Você já se perguntou por que existem regras, ao invés de cada um fazer o que quiser?",
      "content": "REGRAS são combinados que ajudam a organizar a convivência entre pessoas, tornando os espaços mais seguros, justos e previsíveis para todos. Sem regras, seria muito mais difícil garantir que todos fossem tratados de forma justa, ou que espaços compartilhados (como uma escola, um parque, ou um jogo) funcionassem bem. É importante entender o PROPÓSITO por trás das regras, e não só decorá-las: uma regra de trânsito existe para evitar acidentes, uma regra de silêncio na biblioteca existe para as pessoas conseguirem se concentrar. Quando entendemos o motivo de uma regra, fica mais fácil respeitá-la de verdade, e não só por obrigação.\n\nVocê sabia? Regras de jogos, esportes, e até brincadeiras infantis também são um tipo de regra social — elas existem para que todos joguem de forma justa.\n\nPergunta para pensar: Pense numa regra que você segue no dia a dia. Qual é o propósito real dela?\n\nDesafio: Escolha uma regra da sua casa ou escola e explique, com suas palavras, por que ela existe.\n\nResumo: Regras existem para organizar a convivência e tornar espaços mais seguros e justos. Entender o propósito de uma regra ajuda a respeitá-la de verdade.",
      "example": "A regra de formar fila para usar o bebedouro existe para que todos tenham a chance de beber água de forma organizada, sem confusão nem empurra-empurra.",
      "activity_title": "Qual o propósito dessa regra?",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma regra que você segue (escola, casa, jogo)", "Qual é o propósito real dessa regra"]
      },
      "quiz": [
        {"q": "Por que as regras existem?", "opcoes": ["Para dificultar a vida das pessoas", "Para organizar a convivência e tornar espaços mais seguros e justos", "Não têm propósito nenhum", "Só para punir"], "correta": 1},
        {"q": "Entender o propósito de uma regra ajuda a:", "opcoes": ["Ignorá-la mais facilmente", "Respeitá-la de verdade, não só por obrigação", "Não faz diferença nenhuma", "Só complica as coisas"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Cooperação: Trabalhando Juntos",
    "descricao": "Como o trabalho em equipe alcança resultados melhores.",
    "aula": {
      "title": "Juntos, conseguimos mais",
      "introduction": "Você já notou como algumas tarefas ficam muito mais fáceis quando feitas em grupo, ao invés de sozinho?",
      "content": "COOPERAÇÃO é trabalhar junto com outras pessoas em direção a um objetivo comum, dividindo tarefas e ajudando uns aos outros. Cooperar não significa que todo mundo tem que fazer exatamente a mesma coisa — significa reconhecer que cada pessoa pode contribuir de um jeito diferente, e que o resultado final costuma ser melhor quando as pessoas se ajudam do que quando cada um tenta fazer tudo sozinho. Uma boa cooperação envolve: ouvir as ideias dos outros, comunicar bem o que você está fazendo, e estar disposto a ajudar quando alguém precisa.\n\nVocê sabia? Muitos projetos importantes da história, como grandes construções e descobertas científicas, só foram possíveis porque muitas pessoas trabalharam juntas, cada uma contribuindo com sua parte.\n\nPergunta para pensar: Que tarefa você já fez que ficou muito melhor porque teve ajuda de outras pessoas?\n\nDesafio: Pense num trabalho em grupo que você participou e identifique como cada pessoa contribuiu de forma diferente.\n\nResumo: Cooperação é trabalhar junto em direção a um objetivo comum, reconhecendo que cada pessoa contribui de um jeito diferente.",
      "example": "Numa faxina em grupo na sala de aula, uma pessoa pode organizar os materiais, outra pode limpar as mesas, e outra pode cuidar do lixo — cada um contribuindo de um jeito, alcançando o resultado juntos.",
      "activity_title": "Cooperação em ação",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma tarefa que fica melhor feita em grupo", "Como diferentes pessoas poderiam contribuir para ela"]
      },
      "quiz": [
        {"q": "O que é cooperação?", "opcoes": ["Fazer tudo sozinho", "Trabalhar junto com outras pessoas em direção a um objetivo comum", "Competir sem ajudar ninguém", "Ignorar as ideias dos outros"], "correta": 1},
        {"q": "Uma boa cooperação envolve:", "opcoes": ["Ignorar o que os outros dizem", "Ouvir ideias, comunicar bem e ajudar quando necessário", "Fazer tudo do seu próprio jeito, sem falar com ninguém", "Competir para ver quem faz mais rápido"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Diversidade de Opiniões",
    "descricao": "Convivendo respeitosamente com formas diferentes de pensar.",
    "aula": {
      "title": "Pensar diferente não é um problema",
      "introduction": "Você já discordou de um amigo sobre algo e mesmo assim continuaram sendo amigos? Isso é conviver bem com a diversidade de opiniões.",
      "content": "DIVERSIDADE DE OPINIÕES significa que pessoas diferentes podem pensar de formas diferentes sobre o mesmo assunto — e isso é normal e até saudável. Cada pessoa tem experiências, valores e vivências diferentes, o que naturalmente leva a opiniões diferentes. Conviver bem com isso significa: ouvir opiniões diferentes das suas com curiosidade, ao invés de hostilidade; entender que discordar de uma ideia não significa desrespeitar a pessoa; e reconhecer que você também pode aprender algo com pontos de vista diferentes do seu. Isso não significa que toda opinião é igualmente válida em qualquer situação (por exemplo, fatos científicos não são 'opinião'), mas em questões de gosto, preferência e valores, a diversidade enriquece a convivência.\n\nVocê sabia? Grupos com pessoas de opiniões e experiências diferentes costumam encontrar soluções mais criativas para problemas do que grupos onde todos pensam igual.\n\nPergunta para pensar: Você já mudou de opinião sobre algo depois de ouvir o ponto de vista de outra pessoa? O que aconteceu?\n\nDesafio: Pense num assunto em que você e um amigo discordam, e escreva um argumento que você entende do lado dele, mesmo sem concordar.\n\nResumo: Diversidade de opiniões é normal e saudável. Discordar de uma ideia não significa desrespeitar a pessoa — ouvir com curiosidade enriquece a convivência.",
      "example": "Dois amigos podem discordar sobre qual é o melhor filme, e mesmo assim continuar sendo bons amigos, respeitando que cada um tem seu gosto.",
      "activity_title": "Entendendo o outro lado",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um assunto em que você e alguém têm opiniões diferentes", "Um argumento que você entende do lado da outra pessoa, mesmo sem concordar"]
      },
      "quiz": [
        {"q": "Discordar de uma opinião significa desrespeitar a pessoa?", "opcoes": ["Sim, sempre", "Não, é possível discordar com respeito", "Só se for um assunto sério", "Discordância é sempre desrespeito"], "correta": 1},
        {"q": "Por que a diversidade de opiniões pode ser positiva num grupo?", "opcoes": ["Não traz nenhum benefício", "Pode levar a soluções mais criativas para problemas", "Sempre causa brigas", "É melhor todo mundo pensar igual"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Resolução de Conflitos",
    "descricao": "Lidando com desacordos de forma construtiva.",
    "aula": {
      "title": "Conflitos acontecem — o importante é como resolvemos",
      "introduction": "Ter um desentendimento com alguém não é o problema — o problema é não saber como resolver isso de forma saudável.",
      "content": "CONFLITO é um desacordo ou desentendimento entre pessoas — algo natural que acontece em qualquer convivência, mesmo entre pessoas que se gostam muito. O importante não é evitar conflitos a todo custo, mas saber RESOLVER eles de forma construtiva. Alguns passos úteis: ouvir o outro lado com atenção antes de responder, expressar como você se sente usando frases como 'eu me senti...' ao invés de acusações diretas, buscar um meio-termo quando possível, e pedir ajuda de um adulto quando o conflito é grande demais para resolver sozinho. Resolver conflitos bem fortalece relações, ao invés de destruí-las.\n\nVocê sabia? Evitar completamente qualquer conflito também não é saudável — expressar desacordos de forma respeitosa é parte importante de relações saudáveis.\n\nPergunta para pensar: Qual foi um conflito que você teve e conseguiu resolver bem? O que ajudou nisso?\n\nDesafio: Da próxima vez que tiver um desacordo com alguém, tente usar a frase 'eu me senti... quando...' ao invés de uma acusação direta.\n\nResumo: Conflitos são naturais na convivência. Resolvê-los bem envolve ouvir o outro lado, expressar sentimentos com clareza, e buscar um meio-termo.",
      "example": "Ao invés de dizer 'você é folgado, nunca ajuda em nada', é mais construtivo dizer 'eu me senti sozinho fazendo essa tarefa toda — você poderia me ajudar da próxima vez?'.",
      "activity_title": "Resolvendo um conflito",
      "activity_config": {
        "tipo": "simulacao_dialogo",
        "situacoes": [
          {"cliente": "Um amigo esqueceu de te ajudar numa tarefa combinada, e você ficou chateado.", "opcoes": ["Gritar e dizer que ele nunca ajuda em nada", "Dizer com calma como você se sentiu e perguntar o que aconteceu", "Ignorar o amigo até ele perceber sozinho"], "correta": 1}
        ]
      },
      "quiz": [
        {"q": "Conflitos entre pessoas são:", "opcoes": ["Algo que deve ser sempre evitado", "Naturais na convivência, e podem ser resolvidos de forma construtiva", "Sempre destrutivos", "Um sinal de que a amizade acabou"], "correta": 1},
        {"q": "Uma boa forma de expressar como você se sente num conflito é:", "opcoes": ["Fazer acusações diretas", "Usar frases como 'eu me senti... quando...'", "Gritar mais alto", "Ignorar completamente o problema"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Vivendo em Comunidade",
    "descricao": "Entendendo o papel de cada pessoa dentro de uma comunidade.",
    "aula": {
      "title": "Cada pessoa faz parte de algo maior",
      "introduction": "Você faz parte de várias comunidades ao mesmo tempo: sua família, sua turma, seu bairro. Já pensou no seu papel em cada uma delas?",
      "content": "COMUNIDADE é um grupo de pessoas que compartilham um espaço, interesse ou objetivo em comum — pode ser um bairro, uma escola, um time, ou até um grupo online. Viver bem em comunidade envolve reconhecer que as ações de cada pessoa afetam as outras: cuidar de espaços compartilhados, respeitar vizinhos, e contribuir com o que está ao seu alcance para melhorar o ambiente coletivo. Pequenas atitudes fazem diferença: cumprimentar vizinhos, não jogar lixo em locais públicos, ajudar quando alguém precisa. Ninguém precisa resolver todos os problemas de uma comunidade sozinho — pequenas contribuições, somadas, criam um ambiente melhor para todos.\n\nVocê sabia? Muitas mudanças positivas em bairros e cidades começaram com a iniciativa de poucas pessoas que decidiram agir sobre um problema que percebiam no dia a dia.\n\nPergunta para pensar: De quais comunidades você faz parte? Qual pequena atitude sua poderia melhorar uma delas?\n\nDesafio: Pense numa pequena atitude que você poderia praticar essa semana para contribuir com uma comunidade da qual você faz parte.\n\nResumo: Comunidade é um grupo que compartilha espaço ou objetivo. Pequenas atitudes individuais, somadas, melhoram o ambiente coletivo.",
      "example": "Recolher o próprio lixo depois de um piquenique num parque público é uma pequena atitude que, somada à de outras pessoas, mantém o espaço agradável para todos.",
      "activity_title": "Minha contribuição para a comunidade",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma comunidade da qual você faz parte", "Uma pequena atitude que você poderia praticar para contribuir com ela"]
      },
      "quiz": [
        {"q": "O que é uma comunidade?", "opcoes": ["Só a sua família", "Um grupo de pessoas que compartilham espaço, interesse ou objetivo em comum", "Apenas um bairro", "Um tipo de escola"], "correta": 1},
        {"q": "Pequenas atitudes individuais fazem diferença numa comunidade?", "opcoes": ["Não, só grandes ações importam", "Sim, somadas, elas melhoram o ambiente coletivo", "Só se forem feitas por adultos", "Não têm nenhum impacto"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Identificando Problemas e Propondo Soluções",
    "descricao": "Olhando para a comunidade com espírito de solução.",
    "aula": {
      "title": "De observador a agente de mudança",
      "introduction": "Todo grande projeto de melhoria começou com alguém percebendo um problema e pensando: 'e se a gente resolvesse isso?'",
      "content": "Identificar problemas na comunidade e propor soluções é uma habilidade cidadã poderosa. O primeiro passo é OBSERVAR: o que incomoda ou poderia estar melhor no seu bairro, escola ou grupo? Depois, é importante entender quem é afetado por esse problema, e pensar em soluções realistas — não precisam ser grandiosas, pequenas mudanças bem pensadas já fazem diferença. Por fim, vale pensar em como comunicar essa ideia para outras pessoas, e quem poderia ajudar a colocar a solução em prática (vizinhos, escola, responsáveis, autoridades locais). Esse processo — observar, entender, propor e comunicar — é a base de qualquer mudança positiva numa comunidade.\n\nVocê sabia? Muitas leis e políticas importantes começaram como uma ideia simples de um cidadão que percebeu um problema e decidiu agir.\n\nPergunta para pensar: Que problema você percebe no seu bairro, escola ou comunidade que gostaria de ajudar a resolver?\n\nDesafio: Escolha um pequeno problema da sua comunidade e pense em uma solução simples e realista para ele.\n\nResumo: Mudanças positivas começam observando problemas, entendendo quem é afetado, propondo soluções realistas, e comunicando a ideia para quem pode ajudar.",
      "example": "Perceber que uma praça do bairro está com lixo acumulado pode levar à ideia de organizar um mutirão de limpeza com vizinhos e a ajuda de responsáveis.",
      "activity_title": "Uma Solução para Minha Comunidade",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Problema identificado na sua comunidade", "Quem é afetado por esse problema", "Solução proposta", "Quem poderia ajudar a colocar isso em prática"]
      },
      "quiz": [
        {"q": "Qual é o primeiro passo para propor uma solução para um problema da comunidade?", "opcoes": ["Ignorar o problema", "Observar e identificar o que poderia estar melhor", "Esperar alguém mais resolver", "Reclamar sem pensar em soluções"], "correta": 1},
        {"q": "Soluções para problemas da comunidade precisam ser sempre grandiosas?", "opcoes": ["Sim, sempre", "Não, pequenas mudanças bem pensadas também fazem diferença", "Só governos podem resolver problemas", "Não vale a pena tentar"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("respeitoso", "Respeitoso", "Completou o módulo Respeito e Empatia", "🤝"),
  ("conhecedor_de_direitos", "Conhecedor de Direitos", "Completou o módulo Direitos e Deveres", "⚖️"),
  ("seguidor_consciente", "Seguidor Consciente de Regras", "Completou o módulo Regras", "📜"),
  ("cooperador", "Cooperador", "Completou o módulo Cooperação", "🤲"),
  ("mente_aberta", "Mente Aberta", "Completou o módulo Diversidade de Opiniões", "💭"),
  ("pacificador", "Pacificador", "Completou o módulo Resolução de Conflitos", "🕊️"),
  ("vizinho_exemplar", "Vizinho Exemplar", "Completou o módulo Vivendo em Comunidade", "🏘️"),
  ("agente_de_mudanca", "Agente de Mudança", "Completou o módulo Identificando Problemas e Soluções", "💡"),
  ("cidadao_consciente", "Cidadão Consciente", "Concluiu o curso inteiro e a Solução para a Comunidade", "🌎"),
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

with open("/home/claude/escola-digital/database/seed_course_cidadania.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
