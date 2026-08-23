#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "seguranca-na-internet",
  "title": "Segurança na Internet",
  "description": "Senhas, privacidade, golpes e comportamento responsável online.",
  "icon": "🔐",
  "order_index": 4,
}

MODULES = [
  {
    "titulo": "Senhas Fortes e Seguras",
    "descricao": "Como criar e proteger senhas de verdade.",
    "aula": {
      "title": "A chave que só você deve ter",
      "introduction": "Você tranca a porta de casa à noite, certo? Uma senha faz o mesmo trabalho no mundo digital: protege o que é seu.",
      "content": "Uma SENHA é como uma chave secreta que protege suas contas (jogos, e-mail, aplicativos). Uma senha forte tem letras maiúsculas e minúsculas, números, e de preferência um símbolo, além de ser longa — evite coisas óbvias como '123456', seu nome, ou sua data de nascimento, porque são fáceis de adivinhar. A regra mais importante de todas: senha é para guardar, não para compartilhar — nem com amigos, nem com pessoas que você conhece só pela internet. Só um responsável de confiança deveria conhecer suas senhas, para ajudar em caso de emergência.\n\nVocê sabia? Uma senha simples como '123456' pode ser descoberta por um programa em menos de 1 segundo, enquanto uma senha longa e variada pode levar anos.\n\nPergunta para pensar: Por que compartilhar uma senha, mesmo com um amigo próximo, pode ser arriscado?\n\nDesafio: Pense numa senha forte (sem usar de verdade em nenhuma conta agora) misturando letras, números e um símbolo.\n\nResumo: Senhas fortes misturam letras, números e símbolos, e nunca devem ser compartilhadas, nem com amigos.",
      "example": "Uma senha como 'Estrela7*Azul' é muito mais segura do que 'estrela' sozinha, porque mistura maiúsculas, números e símbolo.",
      "activity_title": "Senha forte ou fraca?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "123456", "resposta": "desejo"},
          {"item": "MeuCao2020!", "resposta": "necessidade"},
          {"item": "seu próprio nome", "resposta": "desejo"},
          {"item": "Gt7#pLuma9", "resposta": "necessidade"},
          {"item": "senha", "resposta": "desejo"},
          {"item": "sua data de nascimento", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "O que torna uma senha forte?", "opcoes": ["Ser curta e simples", "Misturar letras, números e símbolos", "Ser seu próprio nome", "Ser igual em todas as contas"], "correta": 1},
        {"q": "Com quem você deve compartilhar suas senhas?", "opcoes": ["Com qualquer amigo que pedir", "Só com um responsável de confiança, em caso de necessidade", "Com qualquer pessoa da internet", "Com todo mundo da escola"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Privacidade: O Que é Meu, é Meu",
    "descricao": "Dados pessoais e o que nunca deve ser compartilhado.",
    "aula": {
      "title": "Guardando minhas informações",
      "introduction": "Existem coisas sobre você que só as pessoas de confiança deveriam saber. Vamos entender quais.",
      "content": "DADOS PESSOAIS são informações que identificam você: nome completo, endereço, escola que estuda, telefone, ou a rotina do seu dia. Compartilhar esses dados com desconhecidos na internet pode ser perigoso, porque uma pessoa mal-intencionada pode usar essas informações para te localizar ou te enganar. A regra de ouro é: se um site, jogo ou pessoa desconhecida pede informações pessoais, o ideal é não responder e contar para um responsável. Privacidade não é sobre esconder tudo de todo mundo — é sobre escolher com cuidado quem pode saber o quê.\n\nVocê sabia? Muitos jogos e aplicativos pedem informações que não são realmente necessárias para funcionar — por isso é importante sempre ter um responsável por perto ao criar contas novas.\n\nPergunta para pensar: Por que alguém desconhecido pediria seu endereço ou nome da escola?\n\nDesafio: Converse com um responsável sobre quais aplicativos ou jogos você usa e quais informações eles pedem.\n\nResumo: Dados pessoais (nome completo, endereço, escola, rotina) não devem ser compartilhados com desconhecidos. Privacidade é escolher com cuidado quem sabe o quê.",
      "example": "Se um jogo pede para você digitar seu endereço completo para 'ganhar um prêmio', o ideal é desconfiar e chamar um responsável antes de continuar.",
      "activity_title": "Compartilhar ou não compartilhar?",
      "activity_config": {
        "tipo": "checklist_situacoes",
        "perguntas_checklist": ["Isso identifica onde eu moro ou estudo?", "Um desconhecido está pedindo isso?", "Eu perguntei a um responsável antes?"],
        "situacoes": [
          "Um site pede seu nome completo e endereço para 'liberar um brinde'",
          "Um app de jogo pede sua localização em tempo real",
          "Alguém desconhecido no chat de um jogo pergunta em qual escola você estuda",
          "Um formulário oficial da escola, preenchido com um responsável, pede seu nome"
        ]
      },
      "quiz": [
        {"q": "O que são dados pessoais?", "opcoes": ["Qualquer informação sem importância", "Informações que identificam você, como nome, endereço e escola", "Apenas fotos", "Só a senha do e-mail"], "correta": 1},
        {"q": "O que fazer se um desconhecido pedir informações pessoais online?", "opcoes": ["Responder rapidamente", "Não responder e contar para um responsável", "Compartilhar só um pouco", "Ignorar e continuar conversando sobre outros assuntos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Golpes e Links Suspeitos",
    "descricao": "Reconhecendo tentativas de engano na internet.",
    "aula": {
      "title": "Nem tudo que brilha é confiável",
      "introduction": "Você já recebeu uma mensagem prometendo um prêmio incrível do nada? Isso pode ser um golpe.",
      "content": "Um GOLPE digital é uma tentativa de enganar alguém para roubar dinheiro, senhas ou informações. Um sinal comum de golpe é uma mensagem que promete algo bom demais para ser verdade (como ganhar um celular grátis) ou que cria urgência ('responda agora ou vai perder'). LINKS SUSPEITOS são endereços de internet estranhos, com erros de escrita ou vindos de mensagens desconhecidas — clicar neles pode levar a páginas falsas feitas para roubar senhas. A regra de segurança mais simples: na dúvida, não clique, e pergunte a um responsável antes.\n\nVocê sabia? Golpistas costumam copiar o visual de sites famosos (como bancos ou lojas) para parecerem confiáveis, mesmo sendo falsos.\n\nPergunta para pensar: O que te faria desconfiar de uma mensagem prometendo um prêmio?\n\nDesafio: Se você receber uma mensagem ou link suspeito, pratique o hábito de mostrar para um responsável antes de clicar em qualquer coisa.\n\nResumo: Golpes prometem coisas boas demais ou criam urgência. Links suspeitos podem ser perigosos — na dúvida, não clique e pergunte a um adulto de confiança.",
      "example": "Uma mensagem dizendo 'Você ganhou um celular! Clique aqui e informe seus dados em 5 minutos' tem os sinais clássicos de golpe: promessa boa demais e urgência.",
      "activity_title": "É golpe ou não é?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Mensagem dizendo que você ganhou um prêmio sem participar de nada", "resposta": "desejo"},
          {"item": "E-mail da escola avisando sobre uma reunião de pais", "resposta": "necessidade"},
          {"item": "Link estranho pedindo para 'confirmar sua senha urgentemente'", "resposta": "desejo"},
          {"item": "Aviso do próprio jogo sobre uma atualização, dentro do aplicativo oficial", "resposta": "necessidade"}
        ]
      },
      "quiz": [
        {"q": "Qual é um sinal comum de golpe digital?", "opcoes": ["Uma mensagem clara e sem pressa", "Promessas boas demais e urgência para agir rápido", "Vir de uma pessoa conhecida", "Não pedir nada em troca"], "correta": 1},
        {"q": "O que fazer diante de um link suspeito?", "opcoes": ["Clicar para ver o que é", "Não clicar e perguntar a um responsável", "Compartilhar com amigos primeiro", "Clicar só se for rápido"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Desconhecidos na Internet",
    "descricao": "Como agir diante de contato de pessoas que você não conhece.",
    "aula": {
      "title": "Nem todo mundo online é quem diz ser",
      "introduction": "Na internet, uma pessoa pode dizer que tem qualquer idade ou é qualquer um — por isso, um cuidado extra é sempre importante.",
      "content": "Na internet, é possível conversar com pessoas de qualquer lugar do mundo, mas isso também significa que nem sempre dá para saber quem realmente está do outro lado de uma conversa. Um DESCONHECIDO é qualquer pessoa que você não conhece pessoalmente, mesmo que pareça simpática ou amigável em uma conversa online. É importante nunca aceitar combinar encontros pessoais com alguém conhecido só pela internet, nunca enviar fotos ou informações pessoais para desconhecidos, e sempre contar para um responsável se alguém insistir em conversas que deixam você desconfortável.\n\nVocê sabia? Pessoas com más intenções às vezes fingem ser mais jovens do que realmente são para conversar com crianças e adolescentes online — por isso a idade que alguém diz ter na internet nem sempre é verdadeira.\n\nPergunta para pensar: O que você faria se um desconhecido insistisse para você guardar segredo de uma conversa dos seus responsáveis?\n\nDesafio: Combine com um responsável um sinal ou uma frase-código para usar caso você se sinta desconfortável com alguma conversa online.\n\nResumo: Desconhecidos na internet nem sempre são quem dizem ser. Nunca combine encontros, nunca envie informações pessoais, e sempre conte para um responsável se algo parecer estranho.",
      "example": "Se alguém desconhecido em um jogo online insiste para saber onde você mora ou pede para manter a conversa em segredo dos seus pais, isso é um sinal de alerta importante.",
      "activity_title": "O que fazer nessa situação?",
      "activity_config": {
        "tipo": "simulacao_dialogo",
        "situacoes": [
          {"cliente": "Oi! Você é bem legal, não conta pra ninguém que a gente conversa, tá? É nosso segredo.", "opcoes": ["Combinado, é nosso segredo!", "Isso é estranho — vou contar para um responsável.", "Vou ignorar mas continuar conversando escondido."], "correta": 1},
          {"cliente": "Me manda uma foto sua e me diz onde você mora?", "opcoes": ["Manda os dados", "Não vou compartilhar isso e vou contar a um responsável", "Manda só a foto"], "correta": 1}
        ]
      },
      "quiz": [
        {"q": "O que fazer se um desconhecido pedir segredo sobre a conversa?", "opcoes": ["Manter o segredo", "Contar para um responsável, pois isso é um sinal de alerta", "Ignorar e seguir conversando", "Pedir mais informações à pessoa"], "correta": 1},
        {"q": "É seguro combinar um encontro pessoal com alguém que você só conhece pela internet?", "opcoes": ["Sim, sem problema", "Não, nunca sem um responsável sabendo e supervisionando", "Só se a pessoa parecer legal", "Só uma vez para conhecer"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Fotos, Vídeos e Localização",
    "descricao": "Cuidados ao compartilhar imagens e sua localização.",
    "aula": {
      "title": "Pensando antes de compartilhar",
      "introduction": "Uma foto ou vídeo publicado pode ser visto, salvo e compartilhado por muito mais gente do que você imagina.",
      "content": "Fotos e vídeos publicados na internet podem ser vistos, salvos e compartilhados por outras pessoas, mesmo depois de apagados do post original — por isso vale sempre pensar antes de publicar. Além disso, muitas fotos guardam informações escondidas sobre onde e quando foram tiradas (chamado de LOCALIZAÇÃO ou geolocalização), o que pode revelar onde você mora ou estuda sem querer. Antes de compartilhar qualquer imagem ou vídeo, vale se perguntar: essa imagem revela informações pessoais? Eu ficaria à vontade se qualquer pessoa (não só amigos) visse isso? Tenho autorização de um responsável para postar?\n\nVocê sabia? Muitos aplicativos têm uma configuração para desativar o compartilhamento automático de localização nas fotos — vale pedir ajuda de um responsável para checar isso.\n\nPergunta para pensar: Por que uma foto continua existindo na internet mesmo depois de você apagar o post original?\n\nDesafio: Converse com um responsável sobre como checar se a localização está ativada nas fotos do seu celular ou tablet.\n\nResumo: Fotos e vídeos podem ser salvos e compartilhados por outras pessoas, e podem revelar localização sem querer. Pense e peça autorização antes de publicar.",
      "example": "Uma foto tirada no quintal de casa pode, sem querer, mostrar o número da casa ou uma placa de rua que revela onde a pessoa mora.",
      "activity_title": "Posso postar isso?",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Postar qualquer foto sem pensar duas vezes", "consequencia": "Isso pode expor informações pessoais sem querer, como localização."},
          {"texto": "Pensar no que a imagem revela e pedir autorização de um responsável antes", "consequencia": "Essa é a forma mais segura de compartilhar com consciência."},
          {"texto": "Nunca tirar fotos nem vídeos", "consequencia": "Não é necessário evitar completamente, só é preciso ter cuidado ao compartilhar."}
        ]
      },
      "quiz": [
        {"q": "Por que uma foto pode continuar circulando mesmo depois de apagada?", "opcoes": ["Isso nunca acontece", "Outras pessoas podem tê-la salvo ou compartilhado antes", "As fotos se apagam sozinhas em todo lugar", "Não é possível salvar fotos de outras pessoas"], "correta": 1},
        {"q": "O que é geolocalização numa foto?", "opcoes": ["A cor da imagem", "Informação escondida sobre onde e quando a foto foi tirada", "O tamanho do arquivo", "Um tipo de filtro"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Cyberbullying: Respeito Também Online",
    "descricao": "Reconhecendo e enfrentando o bullying no ambiente digital.",
    "aula": {
      "title": "Ser gentil também é coisa de internet",
      "introduction": "As mesmas regras de respeito que valem na escola valem na internet — só que às vezes é mais fácil esquecer disso atrás de uma tela.",
      "content": "CYBERBULLYING é quando alguém usa a internet para intimidar, humilhar ou machucar outra pessoa repetidamente — através de mensagens ofensivas, exclusão intencional de grupos, ou espalhar coisas maldosas sobre alguém. Isso causa dor de verdade, mesmo sendo digital. Se você vir isso acontecendo (seja com você ou com outra pessoa), o mais importante é: não revidar com mais agressão, guardar prints como prova se possível, e contar para um responsável de confiança. Ser uma pessoa que ajuda quem está sendo maltratado, ao invés de ficar calado, faz toda a diferença.\n\nVocê sabia? Muitas plataformas têm uma opção de 'denunciar' ou 'bloquear' especificamente para casos de cyberbullying — usar essas ferramentas é uma atitude válida e importante.\n\nPergunta para pensar: Por que pode ser mais fácil alguém ser cruel escondido atrás de uma tela do que pessoalmente?\n\nDesafio: Se você seguir alguém que está sofrendo cyberbullying, mande uma mensagem de apoio para essa pessoa.\n\nResumo: Cyberbullying machuca de verdade. Não revide, guarde provas, conte para um responsável, e apoie quem está sofrendo.",
      "example": "Se um grupo de colegas está excluindo e zombando de alguém repetidamente num chat de jogo, isso é cyberbullying — e merece ser levado a sério, não ignorado.",
      "activity_title": "Como agir diante do cyberbullying",
      "activity_config": {
        "tipo": "simulacao_dialogo",
        "situacoes": [
          {"cliente": "Um colega está mandando mensagens maldosas repetidas para outro colega num grupo.", "opcoes": ["Ignorar, não é comigo", "Não participar, apoiar quem está sofrendo e contar a um responsável", "Rir junto para não ser o próximo alvo"], "correta": 1}
        ]
      },
      "quiz": [
        {"q": "O que é cyberbullying?", "opcoes": ["Uma brincadeira sem problema", "Intimidar ou humilhar alguém repetidamente pela internet", "Jogar online com amigos", "Compartilhar memes engraçados"], "correta": 1},
        {"q": "O que fazer se você presenciar cyberbullying?", "opcoes": ["Ficar calado e não se envolver", "Apoiar quem está sofrendo e contar para um responsável", "Participar também", "Rir para não ser excluído"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Fake News: Nem Tudo que Circula é Verdade",
    "descricao": "Aprendendo a checar informações antes de acreditar ou compartilhar.",
    "aula": {
      "title": "Verificando antes de acreditar",
      "introduction": "Você já viu uma notícia chocante circulando e depois descobriu que era mentira? Isso é uma fake news.",
      "content": "FAKE NEWS são notícias falsas espalhadas como se fossem verdadeiras, geralmente para enganar, causar pânico, ou conseguir cliques. Elas se espalham rápido porque costumam ser chocantes ou emocionantes — e as pessoas compartilham antes mesmo de checar se é verdade. Algumas formas simples de checar uma informação: ver se ela aparece em fontes confiáveis e conhecidas, prestar atenção a erros de escrita ou títulos exagerados demais, e desconfiar quando algo parece feito para gerar raiva ou medo instantâneo. Antes de compartilhar qualquer coisa, vale se perguntar: eu confirmei se isso é verdade?\n\nVocê sabia? Estudos mostram que notícias falsas costumam se espalhar mais rápido do que notícias verdadeiras, justamente porque são feitas para chamar mais atenção.\n\nPergunta para pensar: Por que uma notícia chocante te deixa com mais vontade de compartilhar rápido, sem checar?\n\nDesafio: Da próxima vez que ver uma notícia impressionante, tente encontrar a mesma informação em pelo menos uma fonte confiável antes de acreditar ou compartilhar.\n\nResumo: Fake news são notícias falsas feitas para enganar. Checar fontes confiáveis antes de acreditar ou compartilhar é essencial.",
      "example": "Uma mensagem dizendo 'Cientistas descobrem que X é perigoso!' sem citar nenhuma fonte real é um sinal clássico de fake news.",
      "activity_title": "Verdade ou fake news?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Notícia sem fonte, cheia de erros de escrita, prometendo algo chocante", "resposta": "desejo"},
          {"item": "Reportagem de um veículo de notícias conhecido, com fonte identificada", "resposta": "necessidade"},
          {"item": "Mensagem de corrente pedindo para 'compartilhar antes que seja tarde demais'", "resposta": "desejo"},
          {"item": "Informação confirmada em mais de uma fonte confiável", "resposta": "necessidade"}
        ]
      },
      "quiz": [
        {"q": "O que é fake news?", "opcoes": ["Uma notícia sempre verdadeira", "Uma notícia falsa espalhada como se fosse verdadeira", "Um tipo de propaganda paga", "Um vídeo educativo"], "correta": 1},
        {"q": "Uma boa forma de checar uma notícia é:", "opcoes": ["Compartilhar rápido antes de checar", "Ver se aparece em fontes confiáveis conhecidas", "Confiar só porque parece chocante", "Não checar nada"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Tempo de Tela e Uso Responsável",
    "descricao": "Equilibrando o tempo online com outras partes da vida.",
    "aula": {
      "title": "Encontrando o equilíbrio digital",
      "introduction": "Telas são ótimas ferramentas — mas, como qualquer coisa boa, funcionam melhor com equilíbrio.",
      "content": "TEMPO DE TELA é o tempo que passamos usando celular, computador ou tablet. Usar tecnologia não é ruim — ela ajuda a aprender, se comunicar e se divertir. Mas passar tempo demais nas telas pode atrapalhar outras partes importantes da vida: dormir bem, se exercitar, conversar pessoalmente com a família e amigos, e até prestar atenção na escola. Um uso equilibrado geralmente envolve ter horários combinados com os responsáveis, fazer pausas regulares, e priorizar atividades fora da tela também, como esportes, leitura e tempo com a família.\n\nVocê sabia? Muitos especialistas recomendam que o uso de telas seja combinado em família, com horários definidos, ao invés de ilimitado.\n\nPergunta para pensar: O que você poderia fazer no seu tempo livre além de usar telas?\n\nDesafio: Combine com seus responsáveis um horário equilibrado de uso de telas para essa semana.\n\nResumo: Tecnologia é uma ferramenta útil, mas o uso equilibrado — com horários combinados e pausas — é importante para uma vida saudável.",
      "example": "Alguém que passa o dia inteiro no celular pode acabar dormindo tarde demais e ficando cansado para a escola no dia seguinte.",
      "activity_title": "Meu equilíbrio digital",
      "activity_config": {
        "tipo": "distribuicao_valor",
        "valor_total": 100,
        "categorias": ["Telas", "Sono", "Atividades físicas", "Família e amigos"],
        "instrucao": "Distribua 100 pontos representando como você gostaria de equilibrar seu tempo entre essas áreas."
      },
      "quiz": [
        {"q": "Usar tecnologia é sempre ruim?", "opcoes": ["Sim, deve ser evitado completamente", "Não, mas o uso equilibrado é importante", "Só é ruim para adultos", "Não tem nenhum impacto na vida"], "correta": 1},
        {"q": "Um uso equilibrado de telas geralmente envolve:", "opcoes": ["Uso ilimitado, sem horários", "Horários combinados e pausas regulares", "Usar telas o tempo todo, inclusive para dormir", "Nunca usar tecnologia"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("mestre_das_senhas", "Mestre das Senhas", "Completou o módulo Senhas Fortes e Seguras", "🔑"),
  ("guardiao_da_privacidade", "Guardião da Privacidade", "Completou o módulo Privacidade", "🔒"),
  ("detetive_de_golpes", "Detetive de Golpes", "Completou o módulo Golpes e Links Suspeitos", "🕵️"),
  ("alerta_ligado", "Alerta Ligado", "Completou o módulo Desconhecidos na Internet", "🚨"),
  ("cuidadoso_com_imagens", "Cuidadoso com Imagens", "Completou o módulo Fotos, Vídeos e Localização", "📸"),
  ("gentileza_online", "Gentileza Online", "Completou o módulo Cyberbullying", "💙"),
  ("verificador_de_fatos", "Verificador de Fatos", "Completou o módulo Fake News", "🔍"),
  ("equilibrio_digital", "Equilíbrio Digital", "Completou o módulo Tempo de Tela", "⏱️"),
  ("guardiao_digital", "Guardião Digital", "Concluiu o curso inteiro e o Manual de Segurança Digital", "🔐"),
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

with open("/home/claude/escola-digital/database/seed_course_seguranca.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
