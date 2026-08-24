#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "criacao-de-conteudo-digital",
  "title": "Criação de Conteúdo Digital",
  "description": "Roteiro, fotografia, edição e como publicar conteúdo com responsabilidade.",
  "icon": "📱",
  "order_index": 8,
}

MODULES = [
  {
    "titulo": "Storytelling: Contando Histórias que Prendem Atenção",
    "descricao": "Como estruturar uma história que mantém o interesse de quem assiste.",
    "aula": {
      "title": "Toda boa história tem uma estrutura",
      "introduction": "Você já assistiu um vídeo curto que te prendeu do início ao fim? Isso não é acaso — é storytelling bem feito.",
      "content": "STORYTELLING é a arte de contar histórias de forma envolvente. Mesmo um vídeo curto e educativo pode usar storytelling: começar despertando curiosidade (uma pergunta ou situação interessante), desenvolver a ideia principal de forma clara, e terminar com uma conclusão que fica na memória. Uma estrutura simples e eficaz é: INÍCIO (desperta interesse), MEIO (desenvolve a ideia principal) e FIM (conclusão ou chamada para ação). Histórias com essa estrutura tendem a prender mais atenção do que informações jogadas sem nenhuma organização.\n\nVocê sabia? Os primeiros segundos de um vídeo são os mais importantes para prender a atenção — se a pessoa perde o interesse logo no início, ela não continua assistindo.\n\nPergunta para pensar: Qual foi o último vídeo que te prendeu do início ao fim? O que fez você continuar assistindo?\n\nDesafio: Pense num assunto que você gosta e escreva uma frase de abertura que despertaria curiosidade sobre ele.\n\nResumo: Storytelling é estruturar uma história com início (desperta interesse), meio (desenvolve a ideia) e fim (conclusão) para prender a atenção de quem assiste.",
      "example": "Um vídeo sobre 'como funcionam os vulcões' pode começar com 'Você sabia que existe rocha derretida embaixo dos seus pés agora mesmo?' — uma abertura que desperta curiosidade imediata.",
      "activity_title": "Minha abertura de história",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Assunto que você gostaria de contar", "Frase de abertura que desperta curiosidade", "Conclusão que fica na memória"]
      },
      "quiz": [
        {"q": "O que é storytelling?", "opcoes": ["Um tipo de câmera", "A arte de contar histórias de forma envolvente", "Um programa de edição", "Um tipo de música"], "correta": 1},
        {"q": "Qual é a estrutura básica de uma boa história?", "opcoes": ["Só o meio, sem início nem fim", "Início (desperta interesse), meio (desenvolve) e fim (conclusão)", "Apenas imagens sem nenhuma estrutura", "Não existe estrutura fixa"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Roteiro: Planejando Antes de Gravar",
    "descricao": "Por que organizar as ideias antes de qualquer gravação.",
    "aula": {
      "title": "Escrever antes de gravar economiza tempo",
      "introduction": "Gravar sem um plano costuma resultar em muitas tentativas e retrabalho. Um roteiro resolve isso.",
      "content": "Um ROTEIRO é o planejamento escrito do que será dito e mostrado num vídeo, antes de gravar qualquer coisa. Ele pode ser simples — não precisa ser um texto completo, palavra por palavra, mas deve conter os pontos principais na ordem certa, para não esquecer nada importante durante a gravação. Um bom roteiro geralmente responde: qual é o assunto principal? Quais os pontos mais importantes a incluir? Como o vídeo vai começar e terminar? Planejar isso antes evita gravações longas demais, cheias de pausas e repetições.\n\nVocê sabia? Muitos criadores de conteúdo profissionais escrevem o roteiro completo antes de ligar a câmera, mesmo para vídeos que parecem 'espontâneos'.\n\nPergunta para pensar: Por que gravar sem nenhum planejamento pode resultar em muitas tentativas repetidas?\n\nDesafio: Escreva um roteiro simples (em tópicos) para um vídeo curto sobre um assunto que você domina.\n\nResumo: Roteiro é o planejamento escrito antes de gravar — organiza os pontos principais e evita retrabalho durante a gravação.",
      "example": "Um roteiro simples para um vídeo sobre 'como cuidar de uma planta' pode ter tópicos como: introdução, quanta água dar, quanto sol precisa, e uma dica final.",
      "activity_title": "Meu roteiro em tópicos",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Assunto do vídeo", "Ponto principal 1", "Ponto principal 2", "Como vai terminar"]
      },
      "quiz": [
        {"q": "O que é um roteiro?", "opcoes": ["A edição final do vídeo", "O planejamento escrito do que será dito e mostrado, antes de gravar", "Um tipo de câmera", "A legenda do vídeo"], "correta": 1},
        {"q": "Por que fazer um roteiro antes de gravar?", "opcoes": ["Não é necessário", "Evita retrabalho e esquecimentos durante a gravação", "Deixa o vídeo mais longo", "Só serve para vídeos profissionais"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Enquadramento e Fotografia",
    "descricao": "Como posicionar a câmera para comunicar melhor.",
    "aula": {
      "title": "Onde colocar a câmera importa",
      "introduction": "A mesma cena pode parecer completamente diferente dependendo de como a câmera está posicionada.",
      "content": "ENQUADRAMENTO é a forma como a câmera é posicionada para capturar uma cena — o que aparece dentro do quadro e o que fica de fora. Um princípio simples e muito usado é a REGRA DOS TERÇOS: imaginar a tela dividida em 3 partes (como um jogo da velha) e posicionar o elemento principal perto de uma dessas linhas, ao invés de sempre no centro exato — isso costuma deixar a composição mais interessante visualmente. Também é importante pensar em ILUMINAÇÃO: gravar de frente para uma janela ou luz costuma deixar a imagem mais clara e agradável do que gravar contra a luz (o que deixa a pessoa escura, como uma silhueta).\n\nVocê sabia? A regra dos terços é usada há séculos em pinturas, e continua sendo usada hoje em fotografia e vídeo profissional.\n\nPergunta para pensar: Por que gravar de costas para uma janela pode deixar a imagem escura demais?\n\nDesafio: Se você tiver uma câmera disponível, tente posicionar um objeto seguindo a regra dos terços, ao invés de deixar ele sempre no centro.\n\nResumo: Enquadramento é como a câmera captura a cena. A regra dos terços e a boa iluminação (de frente para a luz) melhoram bastante a qualidade visual.",
      "example": "Ao gravar um vídeo em um quarto, posicionar a câmera de frente para a janela (não de costas) deixa o rosto bem iluminado, ao invés de escuro e difícil de ver.",
      "activity_title": "Boa ou má iluminação?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Gravar de frente para uma janela iluminada", "resposta": "necessidade"},
          {"item": "Gravar de costas para uma janela iluminada", "resposta": "desejo"},
          {"item": "Gravar num ambiente com luz suficiente para ver o rosto claramente", "resposta": "necessidade"},
          {"item": "Gravar num ambiente completamente escuro", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que é a regra dos terços?", "opcoes": ["Filmar sempre no centro exato", "Dividir a tela em 3 partes e posicionar o elemento principal perto de uma linha", "Um tipo de edição", "Uma regra sobre áudio"], "correta": 1},
        {"q": "Por que gravar de frente para a luz costuma ser melhor?", "opcoes": ["Não faz diferença", "Deixa a imagem mais clara e agradável, evitando silhueta escura", "Deixa a imagem sempre pior", "Só importa em fotos profissionais"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Áudio: O Som Também Conta a História",
    "descricao": "Por que um bom áudio é tão importante quanto uma boa imagem.",
    "aula": {
      "title": "Um áudio ruim pode arruinar um vídeo bom",
      "introduction": "Você já assistiu um vídeo com imagem boa, mas o som tão ruim que ficou difícil de entender? Isso mostra como o áudio importa.",
      "content": "Áudio de qualidade é tão importante quanto uma boa imagem — muitas vezes, as pessoas toleram mais um vídeo com imagem simples e áudio claro, do que o contrário. Alguns cuidados simples fazem grande diferença: gravar em um ambiente sem muito barulho de fundo (ventilador, trânsito, conversas), falar de forma clara e num ritmo que não seja rápido demais, e ficar numa distância razoável do microfone (nem muito perto, o que distorce o som, nem muito longe, o que deixa o áudio baixo e cheio de eco). Testar o áudio antes de gravar o vídeo inteiro evita ter que regravar tudo depois.\n\nVocê sabia? Muitos criadores de conteúdo investem primeiro num bom microfone antes de investir numa câmera melhor, porque o áudio ruim afasta mais o público do que uma imagem simples.\n\nPergunta para pensar: Por que um ambiente silencioso é importante para gravar um bom áudio?\n\nDesafio: Se possível, grave um áudio curto de teste e ouça de volta, prestando atenção em ruídos de fundo.\n\nResumo: Áudio claro é essencial — ambiente silencioso, fala clara, e distância adequada do microfone fazem grande diferença na qualidade.",
      "example": "Gravar perto de um ventilador ligado pode fazer o áudio final ficar cheio de ruído de fundo, mesmo que a imagem esteja perfeita.",
      "activity_title": "O que evitar num bom áudio?",
      "activity_config": {
        "tipo": "checklist_situacoes",
        "perguntas_checklist": ["Tem barulho de fundo?", "A fala está clara?", "A distância do microfone está adequada?"],
        "situacoes": [
          "Gravar perto de um ventilador ligado",
          "Gravar num quarto silencioso, falando de forma pausada",
          "Gravar gritando muito perto do microfone",
          "Gravar muito longe do microfone, com voz baixa"
        ]
      },
      "quiz": [
        {"q": "Por que o áudio é tão importante quanto a imagem num vídeo?", "opcoes": ["Não é importante", "Um áudio ruim pode afastar quem está assistindo, mesmo com boa imagem", "Áudio nunca importa em vídeos", "Só imagem importa"], "correta": 1},
        {"q": "O que ajuda a ter um bom áudio na gravação?", "opcoes": ["Gravar perto de ruídos altos", "Ambiente silencioso e distância adequada do microfone", "Falar o mais rápido possível", "Ignorar o som completamente"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Edição Básica: Dando Ritmo ao Conteúdo",
    "descricao": "Como cortes e organização tornam um vídeo mais interessante.",
    "aula": {
      "title": "A mágica acontece na edição",
      "introduction": "Muito do que torna um vídeo interessante acontece depois da gravação: na edição!",
      "content": "EDIÇÃO é o processo de organizar, cortar e ajustar as partes gravadas para formar o vídeo final. Um dos recursos mais básicos e importantes é o CORTE: remover partes desnecessárias, pausas longas, ou erros de fala, deixando o vídeo mais dinâmico e direto. Um bom RITMO de edição significa que o vídeo não fica nem rápido demais (difícil de acompanhar) nem lento demais (cansativo de assistir). Editores também costumam adicionar elementos simples como texto na tela para reforçar pontos importantes, sem exagerar na quantidade de efeitos.\n\nVocê sabia? Muitos vídeos profissionais passam bem mais tempo sendo editados do que sendo gravados — a edição é onde a história realmente ganha forma final.\n\nPergunta para pensar: Por que cortar pausas longas e erros de fala deixa um vídeo mais agradável de assistir?\n\nDesafio: Se você gravar um vídeo de teste, tente identificar quais partes você cortaria na edição.\n\nResumo: Edição é organizar e cortar o material gravado, criando ritmo e removendo o desnecessário — é onde o vídeo final ganha forma.",
      "example": "Um vídeo de 5 minutos gravado pode virar um vídeo final de 2 minutos depois da edição, removendo pausas, repetições e erros de fala.",
      "activity_title": "O que cortar na edição?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Uma pausa longa de 10 segundos sem falar nada", "resposta": "desejo"},
          {"item": "Um erro de fala repetido, corrigido logo depois", "resposta": "desejo"},
          {"item": "A explicação principal do assunto", "resposta": "necessidade"},
          {"item": "A conclusão do vídeo", "resposta": "necessidade"}
        ]
      },
      "quiz": [
        {"q": "O que é edição de vídeo?", "opcoes": ["Só gravar o vídeo", "Organizar, cortar e ajustar as partes gravadas para formar o vídeo final", "Um tipo de roteiro", "A publicação do vídeo apenas"], "correta": 1},
        {"q": "Por que cortar pausas longas e erros na edição é útil?", "opcoes": ["Não é útil", "Deixa o vídeo mais dinâmico e agradável de assistir", "Deixa o vídeo mais longo", "Atrapalha a compreensão"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Thumbnail e Legenda: A Primeira Impressão",
    "descricao": "Como a capa e o texto de apresentação influenciam quem assiste.",
    "aula": {
      "title": "Antes de assistir, a pessoa vê a capa",
      "introduction": "Antes de clicar em qualquer vídeo, você já formou uma primeira impressão pela imagem e pelo texto que apareceram, certo?",
      "content": "THUMBNAIL é a imagem de capa que representa um vídeo antes de ser assistido — geralmente a primeira coisa que a pessoa vê. Uma boa thumbnail costuma ser clara, com boa iluminação, e dá uma pista honesta sobre o que o vídeo mostra, sem enganar quem vai assistir. A LEGENDA (ou título e descrição) é o texto que acompanha o vídeo, resumindo do que se trata de forma clara e interessante. É importante que a thumbnail e a legenda sejam honestas com o conteúdo real do vídeo — usar imagens ou textos enganosos só para conseguir cliques (chamado de 'clickbait') quebra a confiança de quem assiste.\n\nVocê sabia? Muitos criadores de conteúdo passam bastante tempo pensando só na thumbnail e no título, porque eles determinam se alguém vai clicar ou não no vídeo.\n\nPergunta para pensar: Você já clicou num vídeo por causa da thumbnail e ficou decepcionado porque o conteúdo não tinha nada a ver? Como isso te fez sentir?\n\nDesafio: Pense num título e numa ideia de thumbnail honesta para um vídeo educativo que você criaria.\n\nResumo: Thumbnail e legenda formam a primeira impressão de um vídeo — devem ser claras, atrativas e honestas sobre o conteúdo real.",
      "example": "Uma thumbnail mostrando exatamente o assunto do vídeo, com um título claro como 'Como plantar uma horta em casa', é mais honesta do que uma imagem exagerada prometendo algo que o vídeo não entrega.",
      "activity_title": "Minha thumbnail e legenda",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Título do vídeo", "Descrição da thumbnail (o que apareceria na imagem)", "Legenda curta explicando do que se trata"]
      },
      "quiz": [
        {"q": "O que é uma thumbnail?", "opcoes": ["O roteiro do vídeo", "A imagem de capa que representa o vídeo", "O áudio do vídeo", "A edição final"], "correta": 1},
        {"q": "O que é 'clickbait'?", "opcoes": ["Uma boa prática de edição", "Usar imagens ou textos enganosos só para conseguir cliques", "Um tipo de roteiro", "Uma forma honesta de apresentar conteúdo"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Direitos Autorais e Uso Responsável de Imagens",
    "descricao": "Entendendo o que pode e o que não pode ser usado em conteúdos.",
    "aula": {
      "title": "Nem tudo que está na internet pode ser usado livremente",
      "introduction": "Você sabia que usar uma música ou imagem de outra pessoa sem permissão pode causar problemas, mesmo em conteúdo feito por diversão?",
      "content": "DIREITOS AUTORAIS são as regras que protegem o trabalho de quem criou algo (uma música, imagem, vídeo) — significa que outras pessoas não podem simplesmente usar esse conteúdo sem permissão. Isso vale mesmo para conteúdos encontrados livremente na internet: só porque uma imagem apareceu numa busca, não significa que ela pode ser usada livremente em qualquer projeto. Existem imagens, músicas e vídeos disponibilizados com licenças que permitem uso livre (geralmente indicadas explicitamente) — vale sempre buscar por esse tipo de conteúdo, ou criar material próprio, ao invés de usar qualquer coisa encontrada sem checar a permissão.\n\nVocê sabia? Existem bancos de imagens e músicas gratuitas feitos especificamente para uso livre em projetos, criados exatamente para resolver esse problema.\n\nPergunta para pensar: Por que não é justo usar o trabalho de outra pessoa sem dar crédito ou pedir permissão?\n\nDesafio: Se você fosse criar um vídeo, pense em como conseguiria imagens ou músicas de forma responsável (fazendo você mesmo, ou buscando conteúdo livre).\n\nResumo: Direitos autorais protegem o trabalho de criadores. Usar conteúdo de outras pessoas requer permissão ou uma licença de uso livre — nem tudo na internet pode ser usado livremente.",
      "example": "Ao invés de usar uma música popular protegida por direitos autorais num vídeo, um criador responsável busca músicas com licença de uso livre, criadas especificamente para esse fim.",
      "activity_title": "Posso usar isso no meu vídeo?",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Usar qualquer imagem ou música encontrada na internet sem checar nada", "consequencia": "Isso pode violar direitos autorais de quem criou o conteúdo."},
          {"texto": "Usar apenas conteúdo próprio ou com licença de uso livre", "consequencia": "Essa é a forma responsável e segura de criar conteúdo."},
          {"texto": "Nunca usar nenhuma imagem ou música", "consequencia": "Não é necessário evitar completamente, só é preciso checar a permissão de uso."}
        ]
      },
      "quiz": [
        {"q": "O que são direitos autorais?", "opcoes": ["Uma regra sem importância", "Regras que protegem o trabalho de quem criou algo", "Um tipo de câmera", "Uma edição especial"], "correta": 1},
        {"q": "Toda imagem encontrada numa busca na internet pode ser usada livremente?", "opcoes": ["Sim, sempre", "Não, é preciso checar a licença de uso", "Só imagens coloridas", "Só se for antiga"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Publicando com Segurança",
    "descricao": "Cuidados finais antes de compartilhar um conteúdo.",
    "aula": {
      "title": "Antes de publicar, uma última checagem",
      "introduction": "Depois de gravar e editar, ainda falta um passo importante: publicar com responsabilidade.",
      "content": "Antes de publicar qualquer conteúdo, vale fazer uma checagem final de segurança: o vídeo revela informações pessoais sem querer (endereço, escola, rotina)? Um responsável já viu e aprovou o conteúdo? As imagens e sons usados são próprios ou têm permissão de uso? O conteúdo é verdadeiro e não engana quem vai assistir? Publicar conteúdo online, especialmente para crianças e adolescentes, deve sempre envolver a supervisão de um responsável — desde a escolha da plataforma até a decisão do que realmente vale a pena compartilhar publicamente.\n\nVocê sabia? Muitas plataformas de vídeo têm configurações de privacidade que permitem compartilhar conteúdo só com pessoas específicas, ao invés de publicamente para qualquer um — vale conhecer essas opções com ajuda de um responsável.\n\nPergunta para pensar: Por que é importante ter a aprovação de um responsável antes de publicar qualquer conteúdo online?\n\nDesafio: Se você fosse publicar um vídeo, liste 3 coisas que você checaria antes de compartilhar.\n\nResumo: Antes de publicar, cheque se o conteúdo é seguro, honesto, respeita direitos autorais, e tem a aprovação de um responsável.",
      "example": "Antes de publicar um vídeo, um criador responsável revisa se apareceu algo pessoal sem querer no fundo da gravação, como um endereço ou uniforme escolar visível.",
      "activity_title": "Checklist antes de publicar",
      "activity_config": {
        "tipo": "checklist_situacoes",
        "perguntas_checklist": ["Revela informações pessoais?", "Um responsável aprovou?", "Uso conteúdo próprio ou com permissão?", "É honesto com quem vai assistir?"],
        "situacoes": [
          "Vídeo com endereço de casa visível no fundo, sem querer",
          "Vídeo revisado e aprovado por um responsável antes de publicar",
          "Vídeo usando apenas fotos e músicas criadas pelo próprio autor",
          "Vídeo com thumbnail enganosa (clickbait)"
        ]
      },
      "quiz": [
        {"q": "O que é importante checar antes de publicar um conteúdo?", "opcoes": ["Nada, pode publicar direto", "Se é seguro, honesto, e tem aprovação de um responsável", "Só o número de curtidas esperado", "Apenas a duração do vídeo"], "correta": 1},
        {"q": "Por que a supervisão de um responsável é importante antes de publicar?", "opcoes": ["Não é importante", "Ajuda a garantir segurança e uso responsável do conteúdo", "Atrapalha a criatividade", "Só serve para adultos"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("mestre_do_storytelling", "Mestre do Storytelling", "Completou o módulo Storytelling", "📖"),
  ("roteirista", "Roteirista", "Completou o módulo Roteiro", "✍️"),
  ("fotografo_iniciante", "Fotógrafo Iniciante", "Completou o módulo Enquadramento e Fotografia", "📸"),
  ("engenheiro_de_som", "Engenheiro de Som", "Completou o módulo Áudio", "🎙️"),
  ("editor_de_video", "Editor de Vídeo", "Completou o módulo Edição Básica", "✂️"),
  ("mestre_da_thumbnail", "Mestre da Thumbnail", "Completou o módulo Thumbnail e Legenda", "🖼️"),
  ("respeitador_de_direitos", "Respeitador de Direitos Autorais", "Completou o módulo Direitos Autorais", "©️"),
  ("publicador_seguro", "Publicador Seguro", "Completou o módulo Publicando com Segurança", "🔒"),
  ("criador_de_conteudo", "Criador de Conteúdo", "Concluiu o curso inteiro e o Primeiro Vídeo Educativo", "📱"),
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

with open("/home/claude/escola-digital/database/seed_course_conteudo.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
