#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "inteligencia-artificial-para-criancas",
  "title": "Inteligência Artificial para Crianças",
  "description": "O que é IA, como usar com criatividade, e como verificar informações com responsabilidade.",
  "icon": "🤖",
  "order_index": 5,
}

MODULES = [
  {
    "titulo": "O que é Inteligência Artificial?",
    "descricao": "Entendendo, de forma simples, o que é IA.",
    "aula": {
      "title": "Uma máquina que aprende padrões",
      "introduction": "Você já imaginou como seu celular consegue reconhecer sua voz ou sugerir a próxima palavra que você vai digitar?",
      "content": "Inteligência Artificial (IA) é uma tecnologia feita para reconhecer padrões em grandes quantidades de informação e, a partir disso, gerar respostas, sugestões ou previsões. Diferente de uma calculadora simples que só segue uma conta fixa, uma IA 'aprende' observando muitos exemplos — por exemplo, uma IA que reconhece gatos em fotos aprendeu isso vendo milhões de fotos de gatos antes. É importante entender: a IA não pensa como uma pessoa, não tem sentimentos de verdade, e não sabe tudo — ela apenas identifica padrões nos dados que recebeu para treinar.\n\nVocê sabia? A ideia de máquinas que 'pensam' existe há décadas, mas a IA que usamos hoje (como assistentes de voz e chats) só se tornou realmente boa nos últimos anos.\n\nPergunta para pensar: Qual é a diferença entre uma calculadora simples e uma IA que reconhece padrões?\n\nDesafio: Pense em 3 coisas do seu dia a dia que podem estar usando IA sem você perceber.\n\nResumo: IA é uma tecnologia que reconhece padrões a partir de muitos exemplos, mas não pensa nem sente como uma pessoa.",
      "example": "Quando seu celular sugere a próxima palavra ao digitar uma mensagem, ele está usando IA para prever, com base em padrões de outras pessoas, qual palavra provavelmente vem a seguir.",
      "activity_title": "IA ou não é IA?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Um assistente de voz que responde perguntas faladas", "resposta": "necessidade"},
          {"item": "Uma calculadora simples somando 2 + 2", "resposta": "desejo"},
          {"item": "Um aplicativo que reconhece rostos em fotos", "resposta": "necessidade"},
          {"item": "Um relógio mostrando a hora certa", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que é Inteligência Artificial?", "opcoes": ["Uma máquina com sentimentos reais", "Uma tecnologia que reconhece padrões a partir de exemplos", "Um robô que pensa como humano", "Uma calculadora comum"], "correta": 1},
        {"q": "A IA pensa e sente como uma pessoa?", "opcoes": ["Sim, exatamente igual", "Não, ela apenas reconhece padrões nos dados", "Só as IAs mais modernas", "Depende do dia"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Onde Encontro IA no Meu Dia a Dia",
    "descricao": "Reconhecendo IA em aplicativos e ferramentas comuns.",
    "aula": {
      "title": "A IA está mais perto do que parece",
      "introduction": "Você provavelmente já usou IA hoje sem perceber. Vamos descobrir onde ela se esconde!",
      "content": "A IA está presente em várias ferramentas do dia a dia: assistentes virtuais (que respondem perguntas faladas), sistemas de RECOMENDAÇÃO (que sugerem vídeos, músicas ou produtos parecidos com o que você já gostou antes), reconhecimento de imagens (que identifica objetos ou rostos em fotos), e até corretores automáticos de texto. Essas ferramentas 'aprenderam' analisando um padrão de comportamento — por exemplo, um sistema de recomendação de vídeos observa o que outras pessoas com gostos parecidos assistiram, para sugerir algo parecido para você.\n\nVocê sabia? Sistemas de recomendação são um dos usos mais comuns de IA no mundo, presentes em quase todo aplicativo de vídeos, música ou compras.\n\nPergunta para pensar: Você consegue lembrar de uma vez em que um aplicativo 'acertou' uma recomendação para você? Como você acha que ele soube?\n\nDesafio: Hoje, preste atenção em quantas vezes um aplicativo te sugere algo — e pense se aquilo pode ser IA funcionando.\n\nResumo: IA está em assistentes de voz, sistemas de recomendação e reconhecimento de imagens — sempre aprendendo com padrões de uso.",
      "example": "Quando um aplicativo de vídeos sugere 'você pode gostar disso' com base no que você já assistiu, isso é um sistema de recomendação usando IA.",
      "activity_title": "Onde vejo IA no meu dia?",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um app ou ferramenta que você usa que provavelmente tem IA", "O que essa IA faz nesse app"]
      },
      "quiz": [
        {"q": "O que é um sistema de recomendação?", "opcoes": ["Uma lista aleatória", "Uma IA que sugere coisas com base em padrões de gosto", "Um tipo de calculadora", "Um jogo apenas"], "correta": 1},
        {"q": "Qual dessas ferramentas geralmente usa IA?", "opcoes": ["Um relógio analógico", "Um assistente de voz", "Uma régua", "Um lápis"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Como Conversar Bem com uma IA",
    "descricao": "Fazendo perguntas melhores para obter respostas melhores.",
    "aula": {
      "title": "A arte de fazer boas perguntas",
      "introduction": "Você sabia que a forma como você pergunta algo para uma IA muda bastante a qualidade da resposta que você recebe?",
      "content": "Ao conversar com uma IA de texto, quanto mais clara e específica for sua pergunta (chamada de PROMPT), melhor tende a ser a resposta. Uma pergunta vaga como 'me fale sobre animais' gera uma resposta genérica, enquanto uma pergunta específica como 'quais são 3 curiosidades sobre golfinhos' gera uma resposta mais útil e direcionada. Também é importante lembrar: se a resposta não ficou boa, você pode pedir para a IA explicar de outro jeito, dar mais detalhes, ou simplificar — conversar com IA é um processo, não precisa acertar a pergunta perfeita de primeira.\n\nVocê sabia? A habilidade de fazer boas perguntas para IAs já é considerada tão importante que algumas escolas e empresas ensinam isso como uma habilidade própria.\n\nPergunta para pensar: Qual seria uma pergunta melhor do que 'me conta sobre o espaço' se você quisesse aprender sobre planetas?\n\nDesafio: Se você tiver acesso a uma IA de texto (com supervisão de um responsável), pratique fazer uma pergunta bem específica sobre algo que você quer aprender.\n\nResumo: Perguntas específicas geram respostas melhores de uma IA. Se a resposta não ficou boa, você pode pedir para reformular.",
      "example": "Perguntar 'como funciona a fotossíntese, explicando para uma criança de 10 anos' tende a gerar uma resposta muito melhor do que só perguntar 'fotossíntese'.",
      "activity_title": "Melhorando minha pergunta",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Uma pergunta vaga que você poderia fazer para uma IA", "Como você deixaria essa pergunta mais específica e clara"]
      },
      "quiz": [
        {"q": "O que é um 'prompt'?", "opcoes": ["Um tipo de robô", "A pergunta ou instrução que você dá para uma IA", "Um erro da IA", "Um aplicativo específico"], "correta": 1},
        {"q": "Perguntas específicas para uma IA geralmente geram:", "opcoes": ["Respostas piores", "Respostas mais úteis e direcionadas", "Sempre a mesma resposta", "Nenhuma diferença"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "IA que Cria: Textos e Imagens",
    "descricao": "Como funcionam as IAs que geram conteúdo novo.",
    "aula": {
      "title": "Quando a IA vira uma ferramenta criativa",
      "introduction": "Além de responder perguntas, algumas IAs conseguem criar histórias, desenhos e até músicas novas!",
      "content": "Algumas IAs são feitas especificamente para GERAR conteúdo novo: textos (histórias, poemas, resumos), imagens (desenhos e ilustrações a partir de uma descrição) e até músicas. Essas IAs criam coisas 'novas' combinando padrões aprendidos de milhões de exemplos anteriores — não é mágica, é matemática reconhecendo e recombinando padrões. Isso pode ser uma ferramenta criativa poderosa: ajudar a começar uma história quando você está sem ideias, ou visualizar um personagem que você imaginou. Mas é importante lembrar que o resultado gerado pela IA não substitui a sua própria criatividade — ela é mais útil como ponto de partida ou ferramenta de apoio.\n\nVocê sabia? Algumas IAs de imagem conseguem criar uma ilustração inteira a partir de apenas uma frase descrevendo o que você imagina.\n\nPergunta para pensar: Como uma IA poderia te ajudar a começar uma história que você está com dificuldade de imaginar?\n\nDesafio: Pense numa ideia de história (personagem, lugar e problema) que você gostaria de pedir para uma IA ajudar a desenvolver, com supervisão de um responsável.\n\nResumo: IAs geradoras criam textos e imagens combinando padrões aprendidos. São ferramentas de apoio criativo, não substitutas da sua própria imaginação.",
      "example": "Pedir para uma IA 'criar uma pequena história sobre um dragão que tem medo de voar' pode gerar um ponto de partida divertido para você continuar e adaptar do seu jeito.",
      "activity_title": "Ideia de história com IA",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Personagem principal da história", "Lugar onde a história acontece", "Um problema que o personagem precisa resolver"]
      },
      "quiz": [
        {"q": "Como uma IA geradora de texto cria histórias novas?", "opcoes": ["Por mágica", "Combinando padrões aprendidos de muitos exemplos", "Copiando uma história existente exatamente", "Ela não consegue criar nada novo"], "correta": 1},
        {"q": "O conteúdo criado por uma IA deve:", "opcoes": ["Substituir completamente sua criatividade", "Ser usado como ponto de partida ou apoio criativo", "Nunca ser usado", "Ser sempre perfeito sem revisão"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "A IA Pode Errar: Verificando Informações",
    "descricao": "Entendendo os limites da IA e a importância de checar fatos.",
    "aula": {
      "title": "Nem tudo que a IA diz é verdade",
      "introduction": "Você sabia que uma IA pode responder algo com muita confiança e, mesmo assim, estar errada?",
      "content": "IAs de texto às vezes cometem erros — podem inventar informações que parecem reais mas não são, misturar fatos, ou simplesmente errar dados como datas e nomes. Isso acontece porque a IA gera respostas baseadas em padrões, não porque ela 'sabe' a verdade com certeza absoluta. Por isso, é essencial VERIFICAR informações importantes que vêm de uma IA, especialmente para trabalhos escolares ou fatos que você vai compartilhar com outras pessoas — checando em fontes confiáveis, como livros, sites oficiais ou perguntando a um adulto que entenda do assunto. Usar IA não significa parar de pensar criticamente; significa usar o pensamento crítico ainda mais.\n\nVocê sabia? Esse tipo de erro da IA (inventar informação com confiança) tem até um nome técnico entre especialistas: 'alucinação'.\n\nPergunta para pensar: Por que é arriscado usar uma informação de uma IA num trabalho escolar sem checar antes?\n\nDesafio: Se você usar uma IA para uma tarefa escolar, escolha uma informação dada por ela e confirme se é verdadeira em outra fonte.\n\nResumo: IAs podem errar ou inventar informações com confiança. Sempre verifique fatos importantes em fontes confiáveis antes de usar ou compartilhar.",
      "example": "Se uma IA disser uma data histórica que parece estranha, vale a pena checar num livro ou site confiável antes de usar essa informação num trabalho.",
      "activity_title": "Confio ou verifico?",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Usar qualquer resposta de IA sem checar em nenhuma fonte", "consequencia": "Isso pode espalhar informações erradas sem querer."},
          {"texto": "Checar informações importantes em fontes confiáveis antes de usar", "consequencia": "Essa é a forma mais segura de garantir que a informação é verdadeira."},
          {"texto": "Nunca usar IA para nada", "consequencia": "Não é necessário evitar completamente, só usar com pensamento crítico."}
        ]
      },
      "quiz": [
        {"q": "Uma IA de texto pode errar ou inventar informações?", "opcoes": ["Não, ela é sempre perfeita", "Sim, isso pode acontecer", "Só em jogos", "Apenas com imagens"], "correta": 1},
        {"q": "O que fazer com uma informação importante que veio de uma IA?", "opcoes": ["Usar sem checar nada", "Verificar em fontes confiáveis antes de usar", "Ignorar sempre", "Compartilhar sem pensar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Criatividade com IA: Inventando Histórias",
    "descricao": "Usando IA como parceira criativa em projetos próprios.",
    "aula": {
      "title": "Minha imaginação + IA como ferramenta",
      "introduction": "Que tal usar a IA como uma parceira de criatividade, ao invés de só uma fonte de respostas?",
      "content": "Usar IA de forma criativa significa tratar ela como uma colaboradora que ajuda a expandir suas próprias ideias, não como quem decide tudo sozinha. Você pode começar com uma ideia sua (um personagem, um cenário, um problema) e pedir para a IA ajudar a desenvolver partes específicas — como sugestões de nomes, descrições de lugares, ou desfechos possíveis para a história. O resultado final fica mais interessante quando você usa suas próprias escolhas para decidir o que manter, o que mudar, e o que descartar do que a IA sugeriu — a criatividade continua sendo sua.\n\nVocê sabia? Muitos escritores e artistas profissionais já usam IA como ferramenta de brainstorming, mas sempre revisando e ajustando o resultado com seu próprio estilo.\n\nPergunta para pensar: O que você acha mais divertido: criar uma história sozinho, ou criar em parceria com uma ferramenta que sugere ideias?\n\nDesafio: Imagine que você vai pedir ajuda de uma IA para criar uma história. Escreva 3 perguntas que você faria para desenvolver essa ideia.\n\nResumo: IA pode ser uma parceira criativa — você traz a ideia principal, ela ajuda a desenvolver detalhes, e você decide o que manter no resultado final.",
      "example": "Um aluno pode criar o personagem principal sozinho, e pedir para a IA sugerir 3 nomes possíveis para esse personagem, escolhendo depois o que mais gostou.",
      "activity_title": "3 perguntas para desenvolver minha história",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Primeira pergunta que faria à IA sobre sua história", "Segunda pergunta", "Terceira pergunta"]
      },
      "quiz": [
        {"q": "Usar IA de forma criativa significa:", "opcoes": ["Deixar a IA decidir tudo sozinha", "Usar a IA como parceira para expandir suas próprias ideias", "Nunca usar suas próprias ideias", "Copiar exatamente o que a IA sugere"], "correta": 1},
        {"q": "Quem deve decidir o que manter do que a IA sugeriu?", "opcoes": ["A própria IA", "Você, usando sua criatividade", "Ninguém decide", "Sempre um professor"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Recomendações: Como a IA Sugere Coisas pra Mim",
    "descricao": "Entendendo como algoritmos de recomendação funcionam.",
    "aula": {
      "title": "Por que esse vídeo apareceu para mim?",
      "introduction": "Já notou como alguns aplicativos parecem 'adivinhar' exatamente o que você quer assistir ou ouvir?",
      "content": "Sistemas de recomendação usam IA para sugerir conteúdo (vídeos, músicas, produtos) com base no que você já assistiu, curtiu ou pesquisou antes, e também no que pessoas parecidas com você gostaram. Isso pode ser útil (descobrir coisas novas que você provavelmente vai gostar), mas também tem um lado importante de se pensar: esses sistemas tendem a mostrar sempre mais do mesmo tipo de conteúdo, criando uma 'bolha' onde você vê principalmente coisas parecidas com o que já viu, e menos coisas diferentes. Ter consciência disso ajuda a buscar ativamente conteúdos variados, e não só o que o algoritmo sugere.\n\nVocê sabia? O termo usado para esse fenômeno de só ver conteúdo parecido é chamado de 'bolha de filtro'.\n\nPergunta para pensar: Você acha que só assistir ao que é recomendado pode limitar o que você aprende ou conhece? Por quê?\n\nDesafio: Essa semana, procure ativamente por um assunto novo que você nunca pesquisou antes, ao invés de só seguir as recomendações automáticas.\n\nResumo: Recomendações de IA se baseiam no seu histórico de uso e podem criar uma 'bolha' de conteúdo parecido — vale buscar coisas novas de vez em quando.",
      "example": "Se alguém só assiste vídeos sobre um único assunto, o algoritmo vai recomendar cada vez mais daquele mesmo assunto, tornando mais difícil descobrir coisas diferentes por conta própria.",
      "activity_title": "Saindo da bolha",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Um assunto que você nunca pesquisou mas tem curiosidade de aprender"]
      },
      "quiz": [
        {"q": "Como funcionam sistemas de recomendação?", "opcoes": ["Escolhem aleatoriamente", "Sugerem com base no seu histórico e em pessoas parecidas com você", "Perguntam diretamente o que você quer", "Não usam nenhuma informação"], "correta": 1},
        {"q": "O que é uma 'bolha de filtro'?", "opcoes": ["Um tipo de jogo", "Ver principalmente conteúdo parecido, limitando a diversidade", "Um erro de internet", "Um tipo de vírus"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Usando IA com Responsabilidade e Segurança",
    "descricao": "Privacidade, supervisão e uso ético da inteligência artificial.",
    "aula": {
      "title": "Usando essa ferramenta poderosa com cuidado",
      "introduction": "Toda ferramenta poderosa merece ser usada com responsabilidade — e com IA não é diferente.",
      "content": "Usar IA com responsabilidade envolve alguns cuidados importantes: nunca compartilhar informações pessoais (nome completo, endereço, senha) em conversas com IA, sempre usar ferramentas de IA com a orientação de um responsável, e lembrar que o que você digita em algumas ferramentas de IA pode ser armazenado, então vale ter cuidado com o que é compartilhado. Além disso, é importante usar a IA de forma ÉTICA: não usar para enganar outras pessoas, não fingir que um trabalho totalmente feito pela IA é 100% seu sem falar isso, e sempre dar crédito quando apropriado. IA é uma ferramenta poderosa — e como toda ferramenta poderosa, funciona melhor quando usada com consciência.\n\nVocê sabia? Muitas ferramentas de IA têm uma idade mínima recomendada e políticas específicas sobre uso por crianças — por isso o acompanhamento de um responsável é sempre importante.\n\nPergunta para pensar: Por que pode ser importante avisar quando um trabalho teve ajuda de uma IA?\n\nDesafio: Combine com um responsável quais ferramentas de IA você pode usar e em quais situações.\n\nResumo: Usar IA com responsabilidade significa proteger informações pessoais, ter supervisão de um responsável, e ser honesto sobre quando e como a IA foi usada.",
      "example": "Se um aluno usa uma IA para ajudar a organizar ideias de um trabalho escolar, é importante ser honesto com o professor sobre como a ferramenta foi usada, ao invés de esconder.",
      "activity_title": "Regras de uso responsável de IA",
      "activity_config": {
        "tipo": "checklist_situacoes",
        "perguntas_checklist": ["Isso envolve compartilhar dados pessoais?", "Um responsável sabe que estou usando isso?", "Estou sendo honesto sobre o uso da IA?"],
        "situacoes": [
          "Digitar seu nome completo e endereço numa conversa com uma IA",
          "Usar uma IA para ajudar a organizar ideias de um trabalho escolar, avisando o professor",
          "Pedir para a IA responder uma prova inteira e entregar como se fosse só seu"
        ]
      },
      "quiz": [
        {"q": "O que você nunca deve compartilhar em conversas com uma IA?", "opcoes": ["Uma dúvida sobre matemática", "Informações pessoais como endereço e senha", "Uma pergunta sobre animais", "Uma ideia de história"], "correta": 1},
        {"q": "Usar IA de forma ética envolve:", "opcoes": ["Fingir que um trabalho feito pela IA é totalmente seu", "Ser honesto sobre como e quando a IA foi usada", "Nunca contar para ninguém", "Enganar outras pessoas"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("explorador_de_ia", "Explorador de IA", "Completou o módulo O que é Inteligência Artificial?", "🤖"),
  ("cacador_de_ia", "Caçador de IA", "Completou o módulo Onde Encontro IA no Meu Dia a Dia", "🔎"),
  ("comunicador_com_ia", "Comunicador com IA", "Completou o módulo Como Conversar Bem com uma IA", "💬"),
  ("criador_com_ia", "Criador com IA", "Completou o módulo IA que Cria: Textos e Imagens", "🎨"),
  ("checador_de_ia", "Checador de Fatos da IA", "Completou o módulo A IA Pode Errar", "🧐"),
  ("contador_de_historias_ia", "Contador de Histórias", "Completou o módulo Criatividade com IA", "📖"),
  ("curioso_das_recomendacoes", "Curioso das Recomendações", "Completou o módulo Recomendações", "🎯"),
  ("ia_com_responsabilidade", "IA com Responsabilidade", "Completou o módulo Usando IA com Responsabilidade", "🛡️"),
  ("jovem_especialista_ia", "Jovem Especialista em IA", "Concluiu o curso inteiro e o Primeiro Projeto com IA", "🤖"),
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

with open("/home/claude/escola-digital/database/seed_course_ia.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
