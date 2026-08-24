#!/usr/bin/env python3
import json

def esc(s):
    if s is None: return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE = {
  "slug": "matematica-na-vida-real",
  "title": "Matemática na Vida Real",
  "description": "Porcentagem, medidas, tempo, gráficos e como planejar com números.",
  "icon": "🧩",
  "order_index": 10,
}

MODULES = [
  {
    "titulo": "Dinheiro e Matemática",
    "descricao": "Contas rápidas do dia a dia envolvendo dinheiro.",
    "aula": {
      "title": "Fazendo contas de cabeça no mercado",
      "introduction": "Você já tentou calcular rapidinho se tinha dinheiro suficiente para comprar algo? Isso é matemática na vida real!",
      "content": "A matemática do dinheiro está presente o tempo todo: somar preços, calcular troco, comparar qual opção é mais barata. Uma habilidade útil é ARREDONDAR números para fazer contas de cabeça mais rápido — por exemplo, ao invés de somar R$ 4,90 + R$ 7,80 exatamente, você pode pensar '5 + 8 = 13' como uma estimativa rápida, e depois ajustar se precisar de precisão exata. Comparar preços também envolve matemática: um produto de 500g por R$ 10 e outro de 1kg por R$ 22 — qual é mais barato por grama? Fazer esse tipo de comparação ajuda a tomar decisões mais espertas nas compras.\n\nVocê sabia? Fazer estimativas rápidas (arredondando números) é uma habilidade tão valorizada que é ensinada separadamente em muitas escolas, chamada de 'cálculo mental'.\n\nPergunta para pensar: Da próxima vez que for a um mercado, como você poderia estimar rapidamente se tem dinheiro suficiente para o que está no carrinho?\n\nDesafio: Se você tiver R$ 50, some mentalmente (arredondando) se consegue comprar 3 itens de R$ 12,90, R$ 8,50 e R$ 15,90.\n\nResumo: Matemática do dinheiro envolve somar, calcular troco e comparar preços — arredondar números ajuda a fazer estimativas rápidas de cabeça.",
      "example": "Se um item custa R$ 19,90, uma boa estimativa rápida é pensar nele como R$ 20 para fazer contas de cabeça mais fácil, ajustando depois se precisar de exatidão.",
      "activity_title": "Calculadora de compras",
      "activity_config": {
        "tipo": "calculadora",
        "produtos_ficticios": [
          {"nome": "Suco de caixinha", "custo": 4.5},
          {"nome": "Pacote de biscoito", "custo": 6},
          {"nome": "Fruta (unidade)", "custo": 2},
          {"nome": "Iogurte", "custo": 3.5},
          {"nome": "Pão de forma", "custo": 8}
        ],
        "instrucao": "Para cada produto, o aluno estima um valor de venda e o sistema calcula automaticamente a diferença."
      },
      "quiz": [
        {"q": "Para que serve arredondar números ao fazer contas de cabeça?", "opcoes": ["Para errar de propósito", "Para fazer estimativas rápidas", "Não serve para nada", "Só complica"], "correta": 1},
        {"q": "Comparar o preço por grama de dois produtos ajuda a:", "opcoes": ["Confundir mais a compra", "Descobrir qual opção é mais econômica", "Não faz diferença nenhuma", "Só serve para adultos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Porcentagem no Dia a Dia",
    "descricao": "Entendendo o que porcentagens realmente significam.",
    "aula": {
      "title": "O que significa 20% de desconto?",
      "introduction": "Você já viu uma placa de '30% OFF' numa loja e ficou em dúvida sobre quanto isso realmente representa em dinheiro?",
      "content": "PORCENTAGEM é uma forma de representar uma parte de um total, sempre em relação a 100. Por exemplo, 50% significa metade de qualquer quantidade, porque é 50 em cada 100. Uma forma simples de calcular porcentagens do dia a dia: para achar 10% de um valor, basta dividir esse valor por 10. Para achar 50%, divide por 2. Para achar 25%, divide por 4. Essas contas rápidas ajudam bastante para entender descontos em lojas, por exemplo: um produto de R$ 100 com 20% de desconto tem uma redução de R$ 20 (porque 10% é R$ 10, e 20% é o dobro disso).\n\nVocê sabia? A palavra 'porcentagem' vem do latim 'per centum', que significa 'por cem' — por isso porcentagens sempre se referem a uma parte de 100.\n\nPergunta para pensar: Se um produto de R$ 50 está com 10% de desconto, quanto você vai pagar?\n\nDesafio: Calcule 10% de três valores diferentes (por exemplo, R$ 30, R$ 80 e R$ 150).\n\nResumo: Porcentagem representa uma parte de 100. Truques simples como dividir por 10 (para 10%) ou por 2 (para 50%) ajudam a calcular rapidamente.",
      "example": "Um produto de R$ 200 com 25% de desconto tem uma redução de R$ 50 (porque 25% é R$ 200 dividido por 4), então o preço final seria R$ 150.",
      "activity_title": "Calculando descontos",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["Preço original do produto", "Porcentagem de desconto", "Cálculo automático: valor final com desconto"]
      },
      "quiz": [
        {"q": "O que significa 50%?", "opcoes": ["A quantidade total", "Metade de uma quantidade", "Um quarto de uma quantidade", "O dobro de uma quantidade"], "correta": 1},
        {"q": "Como calcular 10% de um valor rapidamente?", "opcoes": ["Multiplicando por 10", "Dividindo o valor por 10", "Somando 10 ao valor", "Não é possível calcular rápido"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Medidas: Do Tamanho ao Peso",
    "descricao": "Entendendo unidades de medida usadas no cotidiano.",
    "aula": {
      "title": "Quanto isso mede, pesa ou cabe?",
      "introduction": "Você já se perguntou por que usamos centímetros para uma coisa e quilômetros para outra?",
      "content": "MEDIDAS ajudam a descrever o tamanho, peso ou volume de algo, usando unidades padronizadas para que todo mundo entenda da mesma forma. Para COMPRIMENTO, usamos centímetros (cm) para coisas pequenas e metros (m) ou quilômetros (km) para distâncias maiores. Para PESO, usamos gramas (g) para quantidades pequenas e quilogramas (kg) para quantidades maiores. Para VOLUME (líquidos), usamos mililitros (ml) e litros (l). Saber converter entre essas unidades (por exemplo, que 1.000 gramas equivalem a 1 quilograma) é útil para entender embalagens, receitas culinárias e até planejar uma viagem.\n\nVocê sabia? O sistema de medidas usado no Brasil e na maioria dos países (chamado de sistema métrico) foi criado para ser mais fácil de converter, já que sempre usa múltiplos de 10.\n\nPergunta para pensar: Por que faz mais sentido medir a distância entre duas cidades em quilômetros do que em centímetros?\n\nDesafio: Converta: quantos gramas há em 2,5 quilogramas?\n\nResumo: Medidas padronizadas (comprimento, peso, volume) ajudam a descrever tamanhos de forma que todos entendam igual — e é útil saber converter entre elas.",
      "example": "Uma receita que pede 500 ml de leite está pedindo meio litro, já que 1 litro equivale a 1.000 ml.",
      "activity_title": "Conversões do dia a dia",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "1000 gramas equivalem a 1 quilograma", "resposta": "necessidade"},
          {"item": "1000 gramas equivalem a 10 quilogramas", "resposta": "desejo"},
          {"item": "1000 ml equivalem a 1 litro", "resposta": "necessidade"},
          {"item": "100 cm equivalem a 1 metro", "resposta": "necessidade"}
        ]
      },
      "quiz": [
        {"q": "Quantos gramas há em 1 quilograma?", "opcoes": ["100", "1.000", "10", "10.000"], "correta": 1},
        {"q": "Para medir a distância entre duas cidades, qual unidade faz mais sentido?", "opcoes": ["Centímetros", "Quilômetros", "Gramas", "Mililitros"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Tempo: Calculando Duração e Horários",
    "descricao": "Fazendo contas com horas, minutos e durações.",
    "aula": {
      "title": "Quanto tempo falta? Quanto tempo passou?",
      "introduction": "Calcular tempo é diferente de outras contas, porque não usamos base 10 — usamos base 60 para minutos e segundos!",
      "content": "Calcular TEMPO tem uma particularidade importante: uma hora tem 60 minutos (não 100), e um minuto tem 60 segundos. Por isso, contas com tempo funcionam um pouco diferente de contas com dinheiro, por exemplo. Se um evento começa às 14h e dura 1h30min, ele termina às 15h30min — somando as horas e os minutos separadamente, e ajustando se os minutos passarem de 60. Calcular DURAÇÃO (quanto tempo passou entre dois horários) também é uma habilidade útil: se algo começou às 10h15 e terminou às 11h45, a duração foi de 1h30min.\n\nVocê sabia? O sistema de 60 minutos numa hora vem de civilizações antigas, como os babilônios, que usavam um sistema de contagem baseado no número 60.\n\nPergunta para pensar: Se uma viagem começa às 8h e demora 2h45min, a que horas ela termina?\n\nDesafio: Calcule quanto tempo passa entre 9h20 e 11h05.\n\nResumo: Cálculos com tempo usam base 60 (minutos e segundos), diferente de outras contas em base 10 — é importante ajustar quando os minutos ultrapassam 60.",
      "example": "Se uma aula começa às 13h50 e dura 50 minutos, ela termina às 14h40 (13h50 + 10 minutos completa a hora, e sobram mais 40 minutos).",
      "activity_title": "Calculando horários",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["Horário de início", "Duração em horas e minutos", "Cálculo automático: horário de término"]
      },
      "quiz": [
        {"q": "Quantos minutos tem uma hora?", "opcoes": ["100", "60", "24", "10"], "correta": 1},
        {"q": "Se um evento começa às 14h e dura 1h30min, a que horas termina?", "opcoes": ["15h", "15h30", "14h30", "16h"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Distância e Velocidade",
    "descricao": "Entendendo como tempo, distância e velocidade se relacionam.",
    "aula": {
      "title": "Quanto tempo leva para chegar lá?",
      "introduction": "Você já se perguntou como um aplicativo de mapas calcula quanto tempo vai levar para chegar a um lugar?",
      "content": "DISTÂNCIA, VELOCIDADE e TEMPO estão relacionados de uma forma simples: quanto maior a velocidade, menos tempo leva para percorrer a mesma distância. A relação básica é: tempo = distância dividida pela velocidade. Por exemplo, se um carro percorre 120 km numa velocidade média de 60 km/h, a viagem leva 2 horas (120 dividido por 60). Entender essa relação ajuda a planejar viagens, calcular quanto tempo algo vai demorar, e até entender por que um avião chega muito mais rápido a um lugar do que um carro.\n\nVocê sabia? A velocidade média de uma viagem raramente é igual à velocidade máxima do veículo, porque inclui paradas, trânsito e variações no caminho.\n\nPergunta para pensar: Se dois carros percorrem a mesma distância, mas um vai mais rápido que o outro, qual deles chega primeiro?\n\nDesafio: Se uma viagem de 200 km é feita numa velocidade média de 100 km/h, quanto tempo ela leva?\n\nResumo: Tempo de viagem é calculado dividindo a distância pela velocidade — quanto maior a velocidade, menor o tempo para a mesma distância.",
      "example": "Uma viagem de 300 km numa velocidade média de 100 km/h leva 3 horas (300 dividido por 100).",
      "activity_title": "Calculando o tempo de viagem",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["Distância em km", "Velocidade média em km/h", "Cálculo automático: tempo estimado de viagem"]
      },
      "quiz": [
        {"q": "Como se calcula o tempo de uma viagem?", "opcoes": ["Multiplicando distância por velocidade", "Dividindo a distância pela velocidade", "Somando distância e velocidade", "Não é possível calcular"], "correta": 1},
        {"q": "Se a velocidade aumenta e a distância continua a mesma, o tempo de viagem:", "opcoes": ["Aumenta", "Diminui", "Não muda", "Fica impossível calcular"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Gráficos: Lendo Informações Visuais",
    "descricao": "Como interpretar gráficos de barras, linhas e pizza.",
    "aula": {
      "title": "Números que viram imagens",
      "introduction": "Já reparou como é mais fácil entender uma informação através de um gráfico do que de uma tabela cheia de números?",
      "content": "GRÁFICOS são formas visuais de representar dados numéricos, facilitando a compreensão rápida de informações. O GRÁFICO DE BARRAS compara quantidades diferentes usando barras de tamanhos proporcionais — quanto maior o valor, maior a barra. O GRÁFICO DE LINHAS mostra como algo muda ao longo do tempo, sendo útil para ver tendências (crescimento ou queda). O GRÁFICO DE PIZZA mostra como um total se divide em partes, sendo útil para ver proporções (como porcentagens de um todo). Saber ler gráficos rapidamente é uma habilidade cada vez mais importante, já que notícias, pesquisas e até jogos usam gráficos para apresentar informações.\n\nVocê sabia? Um bom gráfico consegue comunicar uma informação complexa muito mais rápido do que uma tabela cheia de números, por isso são tão usados em notícias e apresentações.\n\nPergunta para pensar: Se você quisesse mostrar como sua altura mudou ao longo dos anos, qual tipo de gráfico usaria?\n\nDesafio: Pense em uma informação do seu dia a dia (como horas de sono por dia da semana) e imagine que tipo de gráfico representaria bem essa informação.\n\nResumo: Gráficos representam números visualmente. Barras comparam quantidades, linhas mostram mudanças ao longo do tempo, e pizza mostra proporções de um total.",
      "example": "Um gráfico de linhas mostrando a temperatura ao longo dos meses do ano ajuda a visualizar rapidamente quais meses são mais quentes ou frios, sem precisar ler uma tabela de números.",
      "activity_title": "Qual gráfico usar?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Comparar as notas de 5 alunos diferentes", "resposta": "necessidade"},
          {"item": "Mostrar como a temperatura mudou ao longo do ano", "resposta": "desejo"},
          {"item": "Mostrar como um total de gastos se divide entre categorias", "resposta": "necessidade"},
          {"item": "Comparar a altura de 4 plantas diferentes", "resposta": "desejo"}
        ]
      },
      "quiz": [
        {"q": "Qual gráfico é melhor para mostrar mudanças ao longo do tempo?", "opcoes": ["Gráfico de pizza", "Gráfico de linhas", "Não existe diferença", "Nenhum gráfico serve para isso"], "correta": 1},
        {"q": "Um gráfico de pizza é útil para mostrar:", "opcoes": ["Mudanças ao longo do tempo apenas", "Como um total se divide em partes/proporções", "Não serve para nada", "Só números negativos"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Probabilidade: Qual a Chance?",
    "descricao": "Entendendo as chances de algo acontecer.",
    "aula": {
      "title": "Qual a chance de dar cara ou coroa?",
      "introduction": "Você já jogou uma moeda para decidir algo? Isso envolve probabilidade — as chances de cada resultado acontecer.",
      "content": "PROBABILIDADE é a medida das chances de algo acontecer. Ela é geralmente expressa como uma fração, decimal ou porcentagem entre 0 (impossível) e 1 ou 100% (certeza absoluta). Por exemplo, jogar uma moeda tem 50% de chance de dar cara e 50% de chance de dar coroa, porque existem 2 resultados possíveis e igualmente prováveis. Já um dado de 6 lados tem 1/6 (cerca de 16,7%) de chance de cair em qualquer número específico, porque existem 6 resultados possíveis. Entender probabilidade ajuda a tomar decisões mais informadas em jogos, e até a entender previsões (como 'chance de chuva de 70%').\n\nVocê sabia? A probabilidade é a base matemática de praticamente todos os jogos de tabuleiro e cartas que usam dados ou sorteios.\n\nPergunta para pensar: Se você tem 4 bolas coloridas numa sacola (1 vermelha e 3 azuis), qual é a chance de tirar a vermelha sem olhar?\n\nDesafio: Calcule a probabilidade de tirar um número par ao jogar um dado de 6 lados (números 1 a 6).\n\nResumo: Probabilidade mede as chances de algo acontecer, geralmente entre 0% (impossível) e 100% (certeza) — depende de quantos resultados possíveis existem.",
      "example": "Numa sacola com 10 bolinhas, sendo 2 vermelhas e 8 azuis, a chance de tirar uma vermelha sem olhar é de 2 em 10, ou 20%.",
      "activity_title": "Calculando probabilidades",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["Número de resultados favoráveis (ex: bolinhas vermelhas)", "Número total de resultados possíveis (ex: total de bolinhas)", "Cálculo automático: probabilidade em porcentagem"]
      },
      "quiz": [
        {"q": "O que é probabilidade?", "opcoes": ["Uma certeza absoluta sempre", "A medida das chances de algo acontecer", "Um tipo de gráfico", "Não tem relação com matemática"], "correta": 1},
        {"q": "Qual é a chance de dar cara ao jogar uma moeda?", "opcoes": ["100%", "50%", "0%", "25%"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Planejando com Números: Minha Viagem",
    "descricao": "Juntando várias habilidades matemáticas num planejamento real.",
    "aula": {
      "title": "Toda viagem começa com boas contas",
      "introduction": "Planejar uma viagem envolve muito mais matemática do que parece — orçamento, distância, tempo e muito mais!",
      "content": "Planejar uma viagem combina praticamente tudo que você aprendeu neste curso: ORÇAMENTO (quanto dinheiro será gasto, dividido entre transporte, alimentação e hospedagem), DISTÂNCIA e TEMPO (quantos quilômetros até o destino, e quanto tempo a viagem vai levar), e até PROBABILIDADE (qual a chance de chover no dia escolhido, por exemplo). Também é importante considerar a QUANTIDADE DE PESSOAS na viagem, porque isso afeta diretamente os custos — dividir despesas entre mais pessoas pode tornar a viagem mais barata por pessoa, mas também aumenta o custo total. Planejar bem com números ajuda a evitar surpresas e a aproveitar melhor o passeio.\n\nVocê sabia? Muitas famílias e empresas de viagem usam planilhas inteiras só para organizar o orçamento e a logística de uma viagem, exatamente combinando esses conceitos matemáticos.\n\nPergunta para pensar: Se uma viagem custa R$ 800 no total e é dividida entre 4 pessoas, quanto cada uma paga?\n\nDesafio: Planeje uma viagem fictícia, decidindo destino, orçamento total, distância aproximada e quantidade de pessoas.\n\nResumo: Planejar uma viagem combina orçamento, distância, tempo, probabilidade e número de pessoas — matemática aplicada de forma prática e útil.",
      "example": "Uma viagem de 400 km, com um carro que roda em média 80 km/h, levaria cerca de 5 horas — esse tipo de cálculo ajuda a planejar quando parar para descansar ou almoçar no caminho.",
      "activity_title": "Minha Viagem Planejada",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Destino da viagem", "Orçamento total disponível", "Distância aproximada em km", "Quantidade de pessoas na viagem"]
      },
      "quiz": [
        {"q": "O que é importante considerar ao planejar o orçamento de uma viagem?", "opcoes": ["Só o transporte", "Transporte, alimentação, hospedagem e quantidade de pessoas", "Nada, viagens não precisam de planejamento", "Só a distância"], "correta": 1},
        {"q": "Como a quantidade de pessoas afeta o custo por pessoa numa viagem dividida?", "opcoes": ["Não afeta nada", "Mais pessoas dividindo geralmente reduz o custo por pessoa", "Sempre aumenta o custo por pessoa", "Só afeta o custo total, nunca o individual"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("calculista_do_dinheiro", "Calculista do Dinheiro", "Completou o módulo Dinheiro e Matemática", "💵"),
  ("mestre_da_porcentagem", "Mestre da Porcentagem", "Completou o módulo Porcentagem no Dia a Dia", "📊"),
  ("medidor_experiente", "Medidor Experiente", "Completou o módulo Medidas", "📏"),
  ("cronometrista", "Cronometrista", "Completou o módulo Tempo", "🕐"),
  ("navegador_de_distancias", "Navegador de Distâncias", "Completou o módulo Distância e Velocidade", "🗺️"),
  ("leitor_de_graficos", "Leitor de Gráficos", "Completou o módulo Gráficos", "📈"),
  ("estatistico_iniciante", "Estatístico Iniciante", "Completou o módulo Probabilidade", "🎲"),
  ("planejador_de_viagem", "Planejador de Viagem", "Completou o módulo Planejando com Números", "🧳"),
  ("mestre_da_matematica", "Mestre da Matemática", "Concluiu o curso inteiro e a Viagem Planejada", "🧩"),
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

with open("/home/claude/escola-digital/database/seed_course_matematica.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK -", len(MODULES), "modulos gerados")
