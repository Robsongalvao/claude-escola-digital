#!/usr/bin/env python3
# Gera database/seed_course_content.sql a partir do conteudo pedagogico do curso.
import json

def esc(s):
    if s is None:
        return "null"
    return "'" + str(s).replace("'", "''") + "'"

def jsonesc(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

COURSE_SLUG = "educacao-financeira-empreendedorismo"

MODULES = [
  {
    "titulo": "Entendendo o Dinheiro",
    "descricao": "O que é dinheiro, para que serve e como ele entra na sua vida.",
    "aula": {
      "title": "O que é o dinheiro?",
      "introduction": "Todo mundo usa dinheiro todos os dias, mas você já parou pra pensar de onde ele vem e pra que ele realmente serve?",
      "content": "Dinheiro é uma ferramenta que as pessoas usam para trocar coisas de forma mais fácil. Antes do dinheiro existir, as pessoas trocavam produtos diretamente (isso se chama escambo) — por exemplo, trocar ovos por leite. Isso funcionava, mas era complicado: e se você tivesse ovos, mas a pessoa com leite não quisesse ovos? O dinheiro resolveu esse problema, porque todo mundo aceita ele em troca de qualquer coisa. As pessoas conseguem dinheiro principalmente trabalhando: um adulto troca seu tempo e suas habilidades por um pagamento. Com esse dinheiro, a pessoa pode: GANHAR (receber por um trabalho, mesada ou presente), GASTAR (usar o dinheiro para comprar algo) ou GUARDAR (deixar o dinheiro reservado para o futuro). E existe uma regra muito importante: o dinheiro é limitado. Ninguém tem dinheiro infinito, nem mesmo os adultos. Por isso, cada escolha que fazemos com o dinheiro significa abrir mão de outra coisa que poderíamos ter feito com ele.",
      "example": "Imagine que sua mãe te dá R$ 20 de mesada. Se você gastar tudo em figurinhas, não vai sobrar nada para o cinema no fim de semana. Cada escolha tem uma consequência — isso vale pra criança e pra adulto.",
      "reflection_question": "Se o dinheiro é limitado, por que é importante pensar antes de gastar?",
      "activity_title": "Você recebeu R$ 20. O que faria?",
      "activity_config": {
        "tipo": "escolha_multipla_com_consequencia",
        "opcoes": [
          {"texto": "Gastar tudo em doces agora", "consequencia": "Você fica sem nada guardado se precisar de dinheiro depois."},
          {"texto": "Guardar tudo", "consequencia": "Você não aproveita nada agora, mas seu dinheiro cresce para um objetivo maior."},
          {"texto": "Dividir: uma parte pra gastar, uma parte pra guardar", "consequencia": "Você aproveita um pouco agora e ainda constrói uma reserva para o futuro — esse é o caminho mais equilibrado."}
        ]
      },
      "summary": "Dinheiro é uma ferramenta para trocas, ele é limitado, e vem principalmente do trabalho. Toda escolha financeira tem uma consequência.",
      "motivational_message": "Parabéns! Você acabou de aprender a base de tudo sobre dinheiro. Continue avançando!",
      "quiz": [
        {"q": "Para que serve o dinheiro?", "opcoes": ["Para facilitar trocas entre as pessoas", "Para deixar as pessoas ricas magicamente", "Para não precisar trabalhar", "Para comprar tudo sem pensar"], "correta": 0},
        {"q": "Como a maioria das pessoas consegue dinheiro?", "opcoes": ["Encontrando na rua", "Trabalhando", "Pedindo emprestado sempre", "Ganhando de presente todo dia"], "correta": 1},
        {"q": "O que significa dizer que o dinheiro é 'limitado'?", "opcoes": ["Que ele desaparece sozinho", "Que ninguém tem uma quantidade infinita dele", "Que só adultos podem usá-lo", "Que ele só serve para guardar"], "correta": 1},
        {"q": "Antes do dinheiro existir, como as pessoas trocavam produtos?", "opcoes": ["Escambo (troca direta)", "Cartão de crédito", "Pix", "Não trocavam nada"], "correta": 0},
        {"q": "Qual dessas é uma das três coisas que podemos fazer com o dinheiro?", "opcoes": ["Apagar", "Guardar", "Multiplicar sozinho", "Ignorar"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Necessidade ou Desejo?",
    "descricao": "Aprenda a diferenciar o que você precisa do que você quer.",
    "aula": {
      "title": "Necessidade ou Desejo?",
      "introduction": "Você já quis muito uma coisa, mas depois percebeu que não precisava tanto assim dela? Hoje vamos aprender a diferença entre precisar e querer.",
      "content": "NECESSIDADE é tudo aquilo que precisamos para viver bem: alimentação, água, moradia, saúde, educação e higiene. Sem essas coisas, nossa vida fica em risco ou muito difícil. DESEJO é tudo aquilo que gostaríamos de ter, mas que não é indispensável: brinquedos, jogos, doces, roupas por vontade, eletrônicos, passeios. Desejos deixam a vida mais divertida, mas não são obrigatórios. O grande problema é que a propaganda é feita exatamente para transformar desejos em algo que parece uma necessidade urgente. Comerciais, vídeos e redes sociais mostram produtos de um jeito tão atraente que ficamos com vontade de comprar na hora — isso se chama compra por impulso. A melhor forma de se proteger disso é parar e pensar antes de decidir.",
      "example": "Um tênis novo pode ser um desejo (você já tem um tênis que serve), mas se o seu único tênis furou e machuca seu pé, aí ele vira uma necessidade.",
      "reflection_question": "Pensa em algo que você comprou recentemente: era necessidade ou desejo? Como você percebe isso?",
      "activity_title": "Jogo: Necessidade ou Desejo?",
      "activity_config": {
        "tipo": "classificacao",
        "situacoes": [
          {"item": "Comprar remédio quando está doente", "resposta": "necessidade"},
          {"item": "Comprar o jogo novo que todo mundo está jogando", "resposta": "desejo"},
          {"item": "Comprar material escolar pedido pela escola", "resposta": "necessidade"},
          {"item": "Trocar de celular só porque saiu um modelo novo", "resposta": "desejo"},
          {"item": "Comprar comida para o almoço", "resposta": "necessidade"},
          {"item": "Comprar um segundo boneco/figura igual ao que já tem", "resposta": "desejo"},
          {"item": "Pagar a conta de água de casa", "resposta": "necessidade"},
          {"item": "Comprar uma roupa nova só porque é bonita", "resposta": "desejo"},
          {"item": "Ir ao médico quando está com dor", "resposta": "necessidade"},
          {"item": "Comprar um doce depois do almoço", "resposta": "desejo"},
          {"item": "Comprar sapato quando o antigo não serve mais", "resposta": "necessidade"},
          {"item": "Assinar um serviço de jogos online", "resposta": "desejo"},
          {"item": "Pagar o transporte para ir à escola", "resposta": "necessidade"},
          {"item": "Comprar figurinhas para completar o álbum", "resposta": "desejo"},
          {"item": "Comprar produtos de higiene, como sabonete", "resposta": "necessidade"}
        ]
      },
      "summary": "Necessidade é o que precisamos para viver bem; desejo é o que queremos, mas podemos viver sem. Publicidade tenta confundir os dois.",
      "motivational_message": "Muito bem! Agora você tem uma ferramenta poderosa: parar, pensar e escolher.",
      "quiz": [
        {"q": "O que é uma necessidade?", "opcoes": ["Algo indispensável para viver bem", "Qualquer coisa que aparece na propaganda", "Um brinquedo caro", "Algo que só os adultos têm"], "correta": 0},
        {"q": "Comprar um jogo novo só porque os amigos têm é um exemplo de:", "opcoes": ["Necessidade", "Desejo", "Obrigação", "Investimento"], "correta": 1},
        {"q": "O que é 'compra por impulso'?", "opcoes": ["Comprar depois de planejar com calma", "Comprar de repente, sem pensar, por causa de uma vontade rápida", "Comprar apenas necessidades", "Não comprar nada"], "correta": 1},
        {"q": "Qual é a melhor atitude antes de comprar algo que parece um desejo?", "opcoes": ["Comprar na hora para não perder", "Parar e pensar se realmente precisa", "Pedir para alguém comprar por você", "Ignorar o preço"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Orçamento",
    "descricao": "Como organizar entradas e gastos para saber quanto pode usar.",
    "aula": {
      "title": "Montando seu primeiro orçamento",
      "introduction": "Já ouviu alguém dizer 'gastei mais do que tinha'? Isso acontece quando não existe um orçamento.",
      "content": "Orçamento é um plano que mostra quanto dinheiro entra (as ENTRADAS, como mesada, presentes em dinheiro ou pagamento por um trabalho) e quanto vai sair (os GASTOS). Fazer um orçamento significa organizar esse dinheiro ANTES de gastar, e não depois. Sem orçamento, é fácil gastar tudo rápido demais e ficar sem nada quando surge algo importante. Uma forma simples de organizar o dinheiro é dividir em partes com objetivos diferentes, por exemplo: uma parte para GASTAR no dia a dia, uma parte para GUARDAR, uma parte para um OBJETIVO específico (tipo aquele brinquedo que você está querendo) e uma parte para DIVERSÃO. Não existe uma única forma certa de dividir — o importante é que a divisão seja pensada antes, e não decidida no impulso na hora da compra.",
      "example": "Se você recebe R$ 100 de mesada, ao invés de gastar tudo na primeira semana, você pode planejar: R$ 40 para o dia a dia, R$ 30 para guardar, R$ 20 para um objetivo e R$ 10 para diversão. Assim o dinheiro dura o mês todo.",
      "reflection_question": "O que pode acontecer se alguém gastar todo o dinheiro assim que recebe, sem fazer um orçamento?",
      "activity_title": "Monte seu primeiro orçamento",
      "activity_config": {
        "tipo": "distribuicao_valor",
        "valor_total": 100,
        "categorias": ["Gastar", "Guardar", "Objetivo", "Diversão"],
        "instrucao": "Distribua os R$ 100 fictícios entre as 4 categorias e veja o resultado em um gráfico."
      },
      "summary": "Orçamento é planejar entradas e gastos antes de usar o dinheiro, dividindo-o em categorias com propósito.",
      "motivational_message": "Você acabou de aprender uma habilidade que muitos adultos ainda não dominam. Continue!",
      "quiz": [
        {"q": "O que é um orçamento?", "opcoes": ["Um plano de entradas e gastos", "Um tipo de conta bancária", "Um valor fixo que nunca muda", "Um imposto"], "correta": 0},
        {"q": "Por que é importante planejar antes de gastar?", "opcoes": ["Para gastar mais rápido", "Para não ficar sem dinheiro para o que é importante", "Porque é obrigatório por lei", "Não é importante"], "correta": 1},
        {"q": "O que são 'entradas' num orçamento?", "opcoes": ["O dinheiro que sai", "O dinheiro que você recebe", "As dívidas", "As lojas que você visita"], "correta": 1},
        {"q": "Dividir o dinheiro em categorias como gastar, guardar e objetivo serve para:", "opcoes": ["Confundir as contas", "Organizar o uso do dinheiro com propósito", "Gastar tudo mais rápido", "Impedir qualquer gasto"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Planejamento",
    "descricao": "Definindo objetivos e transformando sonhos em metas com prazo.",
    "aula": {
      "title": "Transformando sonhos em metas",
      "introduction": "Tem algo que você sonha em comprar ou fazer? Hoje você vai aprender a transformar esse sonho em um plano real.",
      "content": "Planejar é decidir hoje o que você vai fazer para alcançar algo no futuro. Um OBJETIVO é aquilo que você quer alcançar (por exemplo, comprar um videogame). Uma META é o objetivo com detalhes: quanto custa, quanto tempo vai levar e como você vai chegar lá. Planejamentos podem ser de CURTO PRAZO (poucas semanas), MÉDIO PRAZO (alguns meses) ou LONGO PRAZO (mais de um ano). Quanto maior o objetivo, mais importante é dividir ele em etapas pequenas — assim ele não parece impossível, e você consegue acompanhar seu progresso aos poucos, comemorando cada etapa alcançada.",
      "example": "Se um videogame custa R$ 200 e você consegue guardar R$ 20 por mês, você vai precisar de 10 meses. Saber esse número ajuda a manter o foco, porque você sabe exatamente o que está fazendo e por quê.",
      "reflection_question": "Por que dividir um objetivo grande em etapas menores ajuda a não desistir no meio do caminho?",
      "activity_title": "Meu primeiro objetivo financeiro",
      "activity_config": {
        "tipo": "formulario_calculado",
        "campos": ["O que deseja comprar ou realizar", "Quanto custa", "Quanto consegue guardar por mês", "Cálculo automático: tempo necessário em meses"]
      },
      "summary": "Planejamento é transformar um sonho em etapas concretas com prazo, valor e acompanhamento.",
      "motivational_message": "Agora seu sonho tem um caminho. Continue acompanhando seu progresso!",
      "quiz": [
        {"q": "Qual a diferença entre objetivo e meta?", "opcoes": ["Não existe diferença", "Meta é o objetivo com detalhes: valor, prazo e etapas", "Objetivo é mais detalhado que meta", "Meta é só para adultos"], "correta": 1},
        {"q": "Um plano para os próximos 10 anos é um planejamento de:", "opcoes": ["Curto prazo", "Médio prazo", "Longo prazo", "Nenhum prazo"], "correta": 2},
        {"q": "Por que dividir um objetivo grande em etapas pequenas?", "opcoes": ["Para demorar mais", "Para ficar mais fácil de acompanhar e não desistir", "Não faz diferença", "Para gastar mais dinheiro"], "correta": 1},
        {"q": "Se algo custa R$200 e você guarda R$20 por mês, quantos meses você precisa?", "opcoes": ["5", "10", "20", "2"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Poupança",
    "descricao": "O hábito de guardar dinheiro e construir disciplina financeira.",
    "aula": {
      "title": "O hábito de poupar",
      "introduction": "Poupar não é sobre ter muito dinheiro — é sobre criar o hábito de guardar um pouco, sempre.",
      "content": "Poupar significa guardar uma parte do dinheiro em vez de gastar tudo. Isso não tem a ver com quanto você ganha, e sim com a disciplina de separar uma parte antes de gastar o resto. Pequenas economias do dia a dia (como não comprar algo por impulso) somadas ao longo do tempo fazem muita diferença. É importante entender: poupar não significa nunca gastar — significa fazer escolhas equilibradas entre aproveitar o presente e se preparar para o futuro. Este curso não recomenda que crianças ou adolescentes façam investimentos financeiros — isso é uma decisão que deve envolver os responsáveis mais adiante, quando for a hora certa.",
      "example": "Se você guarda R$ 2 por dia, em 30 dias você tem R$ 60 — o suficiente para algo que parecia distante quando pensado de uma vez só.",
      "reflection_question": "O que é mais difícil para você: guardar dinheiro uma vez, ou guardar toda semana sem parar? Por quê?",
      "activity_title": "Desafio de poupança",
      "activity_config": {
        "tipo": "desafio_streak",
        "opcoes_desafio": ["Desafio dos 7 dias", "Desafio dos 30 dias"],
        "instrucao": "Marque visualmente cada dia em que você conseguiu guardar um pouquinho, mesmo que pouco."
      },
      "summary": "Poupar é um hábito de guardar uma parte do dinheiro regularmente, não uma questão de quanto se ganha.",
      "motivational_message": "Todo grande hábito começa pequeno. Você está construindo o seu agora!",
      "quiz": [
        {"q": "Poupar depende principalmente de:", "opcoes": ["Ganhar muito dinheiro", "Ter disciplina para guardar uma parte", "Ter conta em banco", "Não gastar nunca"], "correta": 1},
        {"q": "O que este curso recomenda sobre investimentos para crianças?", "opcoes": ["Investir tudo o quanto antes", "Não é o foco aqui — isso deve envolver os responsáveis no futuro", "Investir é obrigatório", "Investir é igual a poupar"], "correta": 1},
        {"q": "Pequenas economias do dia a dia, somadas ao longo do tempo:", "opcoes": ["Não fazem diferença", "Podem fazer muita diferença", "Só funcionam para adultos", "Atrapalham o orçamento"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Consumo Consciente",
    "descricao": "Pensar antes de comprar: preço, qualidade e real necessidade.",
    "aula": {
      "title": "Antes de comprar...",
      "introduction": "Toda compra é uma decisão — e boas decisões vêm de boas perguntas.",
      "content": "Consumo consciente significa comprar pensando no que realmente importa: você precisa daquilo? Você vai usar de verdade? Existe uma opção melhor ou mais barata? Comprar por impulso, sem pensar, costuma levar a desperdício — coisas compradas e esquecidas, ou que quebram rápido porque eram de baixa qualidade. Antes de qualquer compra, vale se perguntar: Eu preciso? Eu quero? Eu tenho dinheiro planejado pra isso? Eu pesquisei o preço? Existe outra opção? Eu vou realmente usar isso? Além disso, cuidar bem do que já se tem e reutilizar quando possível também é parte do consumo consciente — muitas vezes a melhor compra é a que a gente nem precisa fazer.",
      "example": "Antes de comprar um brinquedo novo, dá pra se perguntar: 'Eu já tenho um parecido? Vou brincar com ele de verdade, ou só vou querer por um tempo e depois esquecer?'",
      "reflection_question": "Você encontrou um brinquedo que quer muito, mas já tem vários parecidos. O que você faria?",
      "activity_title": "Jogo: Antes de comprar...",
      "activity_config": {
        "tipo": "checklist_situacoes",
        "perguntas_checklist": ["Eu preciso?", "Eu quero?", "Tenho dinheiro planejado?", "Pesquisei?", "Existe outra opção?", "Vou realmente utilizar?"],
        "situacoes": [
          "Um brinquedo parecido com um que você já tem",
          "Um lanche na cantina quando você já levou lanche de casa",
          "Um caderno novo quando o seu ainda tem páginas em branco",
          "Uma roupa da moda que você só usaria uma vez",
          "Um jogo digital que seus amigos estão jogando"
        ]
      },
      "summary": "Consumo consciente é pensar antes de comprar, evitando desperdício e comprando com propósito real.",
      "motivational_message": "Pensar antes de agir é uma das habilidades mais valiosas que existem. Você já está treinando isso!",
      "quiz": [
        {"q": "O que é consumo consciente?", "opcoes": ["Comprar tudo o que aparece", "Pensar antes de comprar, considerando real necessidade e uso", "Nunca comprar nada", "Comprar só coisas caras"], "correta": 1},
        {"q": "Qual dessas é uma boa pergunta antes de comprar algo?", "opcoes": ["Vou realmente usar isso?", "Todo mundo tem?", "É a última unidade?", "É bonito na loja?"], "correta": 0},
        {"q": "Reutilizar e cuidar bem do que já se tem faz parte de:", "opcoes": ["Desperdício", "Consumo consciente", "Compra por impulso", "Publicidade"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Meu Primeiro Pequeno Negócio",
    "descricao": "Introdução ao empreendedorismo: identificar problemas e criar soluções.",
    "aula": {
      "title": "O que é empreender?",
      "introduction": "Empreender é enxergar um problema e criar uma solução para ele — e isso pode começar de forma bem simples.",
      "content": "Empreendedorismo é a habilidade de identificar um PROBLEMA (algo que incomoda ou falta para alguém) e criar uma SOLUÇÃO para ele, na forma de um PRODUTO (algo que se fabrica ou revende) ou SERVIÇO (uma ajuda ou trabalho que se oferece). Todo negócio tem um CLIENTE: a pessoa que vai usar essa solução. Pensar como empreendedor é pensar: 'O que as pessoas ao meu redor precisam, e como eu poderia ajudar com isso?'. Não é preciso ter uma ideia genial e nunca vista — muitas vezes, uma ideia simples e bem feita já resolve um problema real. É importante lembrar: qualquer negócio de verdade, com vendas reais e dinheiro de clientes, deve ter acompanhamento de um responsável.",
      "example": "Doces caseiros, artesanato, desenhos personalizados ou até ajudar um vizinho a organizar algo são exemplos de pequenos negócios que resolvem problemas reais para pessoas reais.",
      "reflection_question": "Pense em algo que incomoda você ou sua família no dia a dia. Que solução simples poderia ajudar?",
      "activity_title": "Crie seu primeiro negócio",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome do negócio", "Produto ou serviço", "Quem é o cliente", "Qual problema ele resolve", "Qual o diferencial"]
      },
      "summary": "Empreender é identificar um problema real e criar uma solução (produto ou serviço) para um cliente específico.",
      "motivational_message": "Você acabou de dar o primeiro passo como empreendedor. Vamos construir esse negócio juntos nos próximos módulos!",
      "quiz": [
        {"q": "O que é um 'problema' no contexto de empreendedorismo?", "opcoes": ["Uma prova difícil", "Algo que incomoda ou falta para alguém", "Um erro de cálculo", "Um tipo de imposto"], "correta": 1},
        {"q": "Quem é o 'cliente' de um negócio?", "opcoes": ["O dono do negócio", "A pessoa que vai usar a solução oferecida", "O concorrente", "O banco"], "correta": 1},
        {"q": "Por que negócios reais feitos por crianças precisam de acompanhamento de um responsável?", "opcoes": ["Não precisam", "Porque envolvem dinheiro real e contato com outras pessoas", "Só por enfeite", "Porque é proibido empreender"], "correta": 1},
        {"q": "Uma boa ideia de negócio precisa necessariamente ser algo nunca visto antes?", "opcoes": ["Sim, sempre", "Não, ideias simples também podem resolver problemas reais", "Só se for digital", "Só se for caro"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Precificação",
    "descricao": "Como calcular custo, preço de venda e lucro de forma simples.",
    "aula": {
      "title": "Quanto cobrar pelo que eu crio?",
      "introduction": "Você já pensou em vender algo, mas não sabia por quanto? Vamos aprender a calcular isso.",
      "content": "CUSTO é quanto gastamos para fazer ou conseguir um produto. PREÇO é quanto cobramos do cliente por ele. LUCRO é o que sobra depois de descontar o custo do preço de venda — é o resultado positivo do negócio. A conta básica é: Preço de venda menos Custo = Lucro. Se o custo for maior que o preço, isso se chama PREJUÍZO, e é o contrário do que queremos. Definir um preço bom não é só 'cobrar bastante' — é encontrar um valor que cubra o custo, gere lucro justo, e ainda seja um preço que o cliente aceite pagar.",
      "example": "Se fazer um brigadeiro custa R$ 1 em ingredientes, e você vende por R$ 3, seu lucro é de R$ 2 por brigadeiro vendido.",
      "reflection_question": "O que aconteceria se você vendesse um produto por um preço menor do que ele custou para fazer?",
      "activity_title": "Calculadora de preços",
      "activity_config": {
        "tipo": "calculadora",
        "produtos_ficticios": [
          {"nome": "Pulseira artesanal", "custo": 3},
          {"nome": "Brigadeiro gourmet", "custo": 1.5},
          {"nome": "Desenho personalizado", "custo": 2},
          {"nome": "Marcador de página decorado", "custo": 1},
          {"nome": "Sabonete artesanal", "custo": 4}
        ],
        "instrucao": "Para cada produto, o aluno escolhe um preço de venda e o sistema calcula automaticamente o lucro."
      },
      "summary": "Preço menos custo é igual a lucro. Um bom preço cobre o custo, gera lucro justo e é aceito pelo cliente.",
      "motivational_message": "Agora você sabe calcular o lucro de um negócio — hora de aplicar isso no seu próprio projeto!",
      "quiz": [
        {"q": "O que é lucro?", "opcoes": ["O mesmo que custo", "O que sobra depois de descontar o custo do preço de venda", "O valor total da venda", "Um imposto"], "correta": 1},
        {"q": "Se o custo de um produto é R$5 e ele é vendido por R$10, qual é o lucro?", "opcoes": ["R$15", "R$5", "R$10", "R$0"], "correta": 1},
        {"q": "O que é prejuízo?", "opcoes": ["Quando o preço é maior que o custo", "Quando o custo é maior que o preço de venda", "O mesmo que lucro", "Um tipo de desconto"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Divulgação",
    "descricao": "Como apresentar um produto e criar uma propaganda simples e honesta.",
    "aula": {
      "title": "Como divulgar meu negócio",
      "introduction": "Ter um bom produto não basta — as pessoas precisam saber que ele existe.",
      "content": "Divulgação é a forma como um negócio conta às pessoas que ele existe e por que vale a pena conhecê-lo. Uma boa propaganda tem: um público-alvo claro (para quem essa mensagem é?), um benefício real (o que essa pessoa ganha usando o produto?) e uma mensagem simples e verdadeira. É muito importante que a propaganda nunca minta ou exagere para enganar o cliente — isso quebra a confiança e prejudica o negócio no longo prazo. Uma propaganda honesta e bem feita destaca de verdade o que o produto tem de bom, sem inventar coisas que ele não faz.",
      "example": "Ao invés de dizer 'o melhor brigadeiro do mundo' (que ninguém pode provar), é melhor dizer 'brigadeiro cremoso, feito na hora, com chocolate de verdade' — algo específico e verdadeiro.",
      "reflection_question": "Por que uma propaganda que exagera ou mente pode prejudicar um negócio no futuro, mesmo que funcione uma vez?",
      "activity_title": "Crie sua primeira propaganda",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome do produto", "Frase de divulgação", "Preço", "Benefício principal", "Público-alvo"]
      },
      "summary": "Divulgação eficaz é clara, honesta e destaca um benefício real para um público específico.",
      "motivational_message": "Sua propaganda está pronta! Isso mostra que você sabe comunicar valor de forma honesta.",
      "quiz": [
        {"q": "Qual é o objetivo da divulgação?", "opcoes": ["Enganar o cliente", "Fazer as pessoas saberem que o negócio existe e por que vale a pena", "Aumentar o preço", "Esconder defeitos do produto"], "correta": 1},
        {"q": "Por que a propaganda nunca deve mentir?", "opcoes": ["Porque é proibido por lei em qualquer caso", "Porque isso quebra a confiança do cliente com o negócio", "Não tem problema mentir um pouco", "Porque ninguém percebe"], "correta": 1},
        {"q": "O que é 'público-alvo'?", "opcoes": ["O dono do negócio", "O grupo de pessoas para quem a mensagem é direcionada", "O concorrente", "O produto em si"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Atendimento ao Cliente",
    "descricao": "Educação, escuta e respeito na hora de atender alguém.",
    "aula": {
      "title": "Como atender bem alguém",
      "introduction": "A forma como tratamos as pessoas é tão importante quanto o produto que vendemos.",
      "content": "Bom atendimento envolve: educação (tratar bem, com respeito), escuta (prestar atenção no que o cliente precisa, não só no que você quer dizer), paciência (mesmo quando o cliente tem dúvidas ou está indeciso), honestidade (não prometer o que não pode cumprir) e resolução de problemas (ajudar de verdade quando algo não sai como esperado). A confiança é construída atendimento após atendimento — um cliente bem tratado volta e ainda recomenda o negócio para outras pessoas.",
      "example": "Se um cliente pergunta o preço e você responde com educação e clareza, ele se sente respeitado — mesmo que decida não comprar naquele momento.",
      "reflection_question": "Como você se sente quando é bem atendido em algum lugar? E quando é mal atendido?",
      "activity_title": "Você é o atendente",
      "activity_config": {
        "tipo": "simulacao_dialogo",
        "situacoes": [
          {"cliente": "Olá, gostaria de saber o preço.", "opcoes": ["Oi! Custa R$10, e inclui isso e aquilo. Posso te ajudar em algo mais?", "Não sei, pergunta depois.", "Por que você quer saber?"], "correta": 0},
          {"cliente": "Estou em dúvida se compro ou não.", "opcoes": ["Compra logo, não enrola.", "Sem problema, posso te contar mais sobre o produto para te ajudar a decidir.", "Então não compra."], "correta": 1},
          {"cliente": "Não gostei do produto que comprei.", "opcoes": ["Ignorar a reclamação.", "Ouvir com calma e ver como posso resolver isso com você.", "Dizer que o problema é do cliente."], "correta": 1}
        ]
      },
      "summary": "Bom atendimento é educação, escuta, paciência, honestidade e vontade real de ajudar.",
      "motivational_message": "Um bom atendimento constrói confiança — e confiança é a base de qualquer negócio duradouro.",
      "quiz": [
        {"q": "Qual dessas NÃO faz parte de um bom atendimento?", "opcoes": ["Escuta", "Paciência", "Ignorar o cliente", "Honestidade"], "correta": 2},
        {"q": "Por que a confiança do cliente é importante para um negócio?", "opcoes": ["Não é importante", "Um cliente que confia volta e recomenda o negócio", "Só serve para parecer bonito", "Atrapalha as vendas"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Vendas",
    "descricao": "Vender é ajudar o cliente a decidir bem, não pressionar ou enganar.",
    "aula": {
      "title": "O que é realmente vender?",
      "introduction": "Vender não é pressionar alguém a comprar — é ajudar a pessoa a perceber se aquilo é bom para ela.",
      "content": "Vender bem envolve: conhecer o cliente (entender o que ele precisa), apresentar o produto com clareza, explicar benefícios reais, ouvir as dúvidas do cliente com atenção, responder com honestidade, e finalizar a venda sem pressionar. Uma venda boa é aquela em que o cliente sai satisfeito, porque sentiu que a compra realmente vai ajudar ele — isso se chama criar valor. Depois da venda, também existe o pós-venda: perguntar se o cliente ficou satisfeito e estar disponível se precisar de algo. Isso fortalece a confiança para futuras compras.",
      "example": "Ao invés de insistir 'compra agora, é a última unidade!', um bom vendedor explica com calma os benefícios e deixa o cliente decidir com informação suficiente.",
      "reflection_question": "Qual a diferença entre convencer alguém com boas informações e pressionar alguém a comprar?",
      "activity_title": "Simulação de venda",
      "activity_config": {
        "tipo": "simulacao_dialogo_avaliada",
        "criterios_avaliacao": ["Comunicação", "Educação", "Clareza", "Conhecimento do produto", "Capacidade de responder dúvidas"],
        "instrucao": "Use o negócio que você criou no Módulo 7 para simular uma conversa de venda completa."
      },
      "summary": "Vender bem é ajudar o cliente a decidir com boas informações, sem pressão nem exagero — e cuidar dele depois da compra também.",
      "motivational_message": "Você está pronto para aplicar tudo isso no seu próprio negócio. Continue firme!",
      "quiz": [
        {"q": "O que significa 'criar valor' numa venda?", "opcoes": ["Cobrar o máximo possível", "Fazer o cliente sentir que a compra realmente o ajuda", "Pressionar até o cliente comprar", "Vender qualquer coisa, mesmo sem qualidade"], "correta": 1},
        {"q": "O que é pós-venda?", "opcoes": ["A venda antes de acontecer", "O cuidado com o cliente depois da compra", "O preço final", "Um tipo de propaganda"], "correta": 1},
        {"q": "Uma boa venda é aquela em que:", "opcoes": ["O cliente se sente pressionado", "O cliente sai satisfeito e bem informado", "O vendedor engana o cliente", "O produto nunca é explicado"], "correta": 1}
      ]
    }
  },
  {
    "titulo": "Redes Sociais e Empreendedorismo",
    "descricao": "Divulgar um negócio online com criatividade e segurança digital.",
    "aula": {
      "title": "Redes sociais com responsabilidade",
      "introduction": "Redes sociais podem ajudar um negócio a crescer — mas também exigem muito cuidado, especialmente para crianças e adolescentes.",
      "content": "Redes sociais são espaços onde negócios podem mostrar fotos, vídeos e legendas para apresentar seus produtos a um público maior. Para isso funcionar bem, é importante pensar em: que conteúdo mostrar, como comunicar a marca, e para qual público. Mas isso vem junto com uma responsabilidade enorme: SEGURANÇA DIGITAL. Isso significa nunca divulgar endereço de casa, nunca compartilhar informações pessoais como escola ou rotina, nunca compartilhar senhas com ninguém, ter muito cuidado com desconhecidos que tentam conversar, desconfiar de links suspeitos e golpes, proteger sua privacidade, e nunca participar de cyberbullying — nem praticando, nem calado quando vir acontecer. É fundamental deixar claro: qualquer atividade comercial real, com vendas de verdade, contato com clientes ou dinheiro envolvido, deve sempre ter a supervisão de um responsável.",
      "example": "Um negócio pode postar uma foto do produto com uma legenda simples e verdadeira, sem nunca colocar informações como o endereço de onde os produtos são feitos ou entregues.",
      "reflection_question": "Por que é perigoso compartilhar informações pessoais, mesmo com pessoas que parecem simpáticas na internet?",
      "activity_title": "Crie o perfil do seu negócio (fictício)",
      "activity_config": {
        "tipo": "formulario_projeto",
        "campos": ["Nome do negócio", "Descrição curta", "Público", "Primeira publicação: Apresentação", "Segunda publicação: Produto", "Terceira publicação: Divulgação"],
        "aviso": "Esta atividade é fictícia e educativa. Nenhuma publicação real deve ser feita sem acompanhamento de um responsável."
      },
      "summary": "Redes sociais ajudam a divulgar um negócio, mas exigem segurança digital: nunca compartilhar dados pessoais, senhas, e sempre ter supervisão de um adulto em atividades reais.",
      "motivational_message": "Você concluiu o último módulo antes do projeto final. Hora de juntar tudo o que aprendeu!",
      "quiz": [
        {"q": "O que NUNCA deve ser compartilhado nas redes sociais?", "opcoes": ["O nome do produto", "Endereço de casa e informações pessoais", "O preço do produto", "Uma foto do produto"], "correta": 1},
        {"q": "Se um negócio envolve vendas reais e dinheiro de clientes, o que é necessário?", "opcoes": ["Nada, a criança pode fazer tudo sozinha", "Acompanhamento de um responsável", "Postar o endereço de casa", "Compartilhar senhas com clientes"], "correta": 1},
        {"q": "O que fazer diante de um desconhecido insistindo em conversar na internet?", "opcoes": ["Continuar a conversa normalmente", "Ter cuidado e contar para um responsável", "Compartilhar dados pessoais", "Ignorar completamente sem contar pra ninguém"], "correta": 1}
      ]
    }
  }
]

ACHIEVEMENTS = [
  ("primeiro_passo", "Primeiro Passo", "Concluiu sua primeira aula", "🏆"),
  ("guardador_de_dinheiro", "Guardador de Dinheiro", "Completou o módulo de Poupança", "💰"),
  ("mestre_planejamento", "Mestre do Planejamento", "Completou o módulo de Planejamento", "🎯"),
  ("consumo_consciente", "Consumo Consciente", "Completou o módulo de Consumo Consciente", "🧠"),
  ("grande_ideia", "Grande Ideia", "Criou seu primeiro negócio fictício", "💡"),
  ("jovem_empreendedor", "Jovem Empreendedor", "Completou o módulo de Empreendedorismo", "🏪"),
  ("mestre_divulgacao", "Mestre da Divulgação", "Completou o módulo de Divulgação", "📢"),
  ("especialista_precos", "Especialista em Preços", "Completou o módulo de Precificação", "💵"),
  ("atendimento_nota_10", "Atendimento Nota 10", "Completou o módulo de Atendimento ao Cliente", "🤝"),
  ("pequeno_empreendedor", "Pequeno Empreendedor", "Concluiu o curso inteiro e o projeto final", "🚀"),
]

out = []
out.append("-- =========================================================")
out.append("-- ESCOLA DIGITAL - SEED: CONTEUDO DO CURSO DE EDUCACAO")
out.append("-- FINANCEIRA E EMPREENDEDORISMO (12 modulos)")
out.append("-- Gerado automaticamente por generate_course_seed.py")
out.append("-- =========================================================")
out.append("")
out.append("do $$")
out.append("declare")
out.append("  v_course_id uuid;")
out.append("  v_module_id uuid;")
out.append("  v_lesson_id uuid;")
out.append("  v_quiz_id uuid;")
out.append("begin")
out.append(f"  select id into v_course_id from public.courses where slug = {esc(COURSE_SLUG)};")
out.append("")

for i, mod in enumerate(MODULES, start=1):
    a = mod["aula"]
    out.append(f"  -- ===== MODULO {i}: {mod['titulo']} =====")
    out.append(f"  insert into public.modules (course_id, title, description, order_index)")
    out.append(f"  values (v_course_id, {esc(mod['titulo'])}, {esc(mod['descricao'])}, {i})")
    out.append(f"  returning id into v_module_id;")
    out.append("")
    intro_full = a["introduction"]
    content_full = a["content"] + "\n\nExemplo do cotidiano: " + a["example"] + "\n\nPergunta para reflexão: " + a["reflection_question"] + "\n\nResumo: " + a["summary"] + "\n\nMensagem: " + a["motivational_message"]
    out.append(f"  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)")
    out.append(f"  values (v_module_id, {esc(a['title'])}, {esc(intro_full)}, {esc(content_full)}, {esc(a['example'])}, 20, 1)")
    out.append(f"  returning id into v_lesson_id;")
    out.append("")
    out.append(f"  insert into public.activities (lesson_id, type, title, config, order_index)")
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
    tipo_sql = tipo_map.get(a["activity_config"]["tipo"], "escolha")
    out.append(f"  values (v_lesson_id, {esc(tipo_sql)}, {esc(a['activity_title'])}, {jsonesc(a['activity_config'])}, 1);")
    out.append("")
    out.append(f"  insert into public.quizzes (lesson_id, title) values (v_lesson_id, {esc('Quiz: ' + a['title'])}) returning id into v_quiz_id;")
    for qi, q in enumerate(a["quiz"], start=1):
        out.append(f"  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)")
        out.append(f"  values (v_quiz_id, {esc(q['q'])}, {jsonesc(q['opcoes'])}, {q['correta']}, {qi});")
    out.append("")

out.append("  -- ===== CONQUISTAS =====")
for code, title, desc, icon in ACHIEVEMENTS:
    out.append(f"  insert into public.achievements (code, title, description, icon) values ({esc(code)}, {esc(title)}, {esc(desc)}, {esc(icon)}) on conflict (code) do nothing;")

out.append("end $$;")
out.append("")

with open("/home/claude/escola-digital/database/seed_course_content.sql", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("OK - seed_course_content.sql gerado com", len(MODULES), "modulos")
