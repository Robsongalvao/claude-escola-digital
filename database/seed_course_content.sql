-- =========================================================
-- ESCOLA DIGITAL - SEED: CONTEUDO DO CURSO DE EDUCACAO
-- FINANCEIRA E EMPREENDEDORISMO (12 modulos)
-- Gerado automaticamente por generate_course_seed.py
-- =========================================================

do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  select id into v_course_id from public.courses where slug = 'educacao-financeira-empreendedorismo';

  -- ===== MODULO 1: Entendendo o Dinheiro =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Entendendo o Dinheiro', 'O que é dinheiro, para que serve e como ele entra na sua vida.', 1)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que é o dinheiro?', 'Todo mundo usa dinheiro todos os dias, mas você já parou pra pensar de onde ele vem e pra que ele realmente serve?', 'Dinheiro é uma ferramenta que as pessoas usam para trocar coisas de forma mais fácil. Antes do dinheiro existir, as pessoas trocavam produtos diretamente (isso se chama escambo) — por exemplo, trocar ovos por leite. Isso funcionava, mas era complicado: e se você tivesse ovos, mas a pessoa com leite não quisesse ovos? O dinheiro resolveu esse problema, porque todo mundo aceita ele em troca de qualquer coisa. As pessoas conseguem dinheiro principalmente trabalhando: um adulto troca seu tempo e suas habilidades por um pagamento. Com esse dinheiro, a pessoa pode: GANHAR (receber por um trabalho, mesada ou presente), GASTAR (usar o dinheiro para comprar algo) ou GUARDAR (deixar o dinheiro reservado para o futuro). E existe uma regra muito importante: o dinheiro é limitado. Ninguém tem dinheiro infinito, nem mesmo os adultos. Por isso, cada escolha que fazemos com o dinheiro significa abrir mão de outra coisa que poderíamos ter feito com ele.

Exemplo do cotidiano: Imagine que sua mãe te dá R$ 20 de mesada. Se você gastar tudo em figurinhas, não vai sobrar nada para o cinema no fim de semana. Cada escolha tem uma consequência — isso vale pra criança e pra adulto.

Pergunta para reflexão: Se o dinheiro é limitado, por que é importante pensar antes de gastar?

Resumo: Dinheiro é uma ferramenta para trocas, ele é limitado, e vem principalmente do trabalho. Toda escolha financeira tem uma consequência.

Mensagem: Parabéns! Você acabou de aprender a base de tudo sobre dinheiro. Continue avançando!', 'Imagine que sua mãe te dá R$ 20 de mesada. Se você gastar tudo em figurinhas, não vai sobrar nada para o cinema no fim de semana. Cada escolha tem uma consequência — isso vale pra criança e pra adulto.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Você recebeu R$ 20. O que faria?', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Gastar tudo em doces agora", "consequencia": "Você fica sem nada guardado se precisar de dinheiro depois."}, {"texto": "Guardar tudo", "consequencia": "Você não aproveita nada agora, mas seu dinheiro cresce para um objetivo maior."}, {"texto": "Dividir: uma parte pra gastar, uma parte pra guardar", "consequencia": "Você aproveita um pouco agora e ainda constrói uma reserva para o futuro — esse é o caminho mais equilibrado."}]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que é o dinheiro?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para que serve o dinheiro?', '["Para facilitar trocas entre as pessoas", "Para deixar as pessoas ricas magicamente", "Para não precisar trabalhar", "Para comprar tudo sem pensar"]'::jsonb, 0, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como a maioria das pessoas consegue dinheiro?', '["Encontrando na rua", "Trabalhando", "Pedindo emprestado sempre", "Ganhando de presente todo dia"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que significa dizer que o dinheiro é ''limitado''?', '["Que ele desaparece sozinho", "Que ninguém tem uma quantidade infinita dele", "Que só adultos podem usá-lo", "Que ele só serve para guardar"]'::jsonb, 1, 3);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Antes do dinheiro existir, como as pessoas trocavam produtos?', '["Escambo (troca direta)", "Cartão de crédito", "Pix", "Não trocavam nada"]'::jsonb, 0, 4);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual dessas é uma das três coisas que podemos fazer com o dinheiro?', '["Apagar", "Guardar", "Multiplicar sozinho", "Ignorar"]'::jsonb, 1, 5);

  -- ===== MODULO 2: Necessidade ou Desejo? =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Necessidade ou Desejo?', 'Aprenda a diferenciar o que você precisa do que você quer.', 2)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Necessidade ou Desejo?', 'Você já quis muito uma coisa, mas depois percebeu que não precisava tanto assim dela? Hoje vamos aprender a diferença entre precisar e querer.', 'NECESSIDADE é tudo aquilo que precisamos para viver bem: alimentação, água, moradia, saúde, educação e higiene. Sem essas coisas, nossa vida fica em risco ou muito difícil. DESEJO é tudo aquilo que gostaríamos de ter, mas que não é indispensável: brinquedos, jogos, doces, roupas por vontade, eletrônicos, passeios. Desejos deixam a vida mais divertida, mas não são obrigatórios. O grande problema é que a propaganda é feita exatamente para transformar desejos em algo que parece uma necessidade urgente. Comerciais, vídeos e redes sociais mostram produtos de um jeito tão atraente que ficamos com vontade de comprar na hora — isso se chama compra por impulso. A melhor forma de se proteger disso é parar e pensar antes de decidir.

Exemplo do cotidiano: Um tênis novo pode ser um desejo (você já tem um tênis que serve), mas se o seu único tênis furou e machuca seu pé, aí ele vira uma necessidade.

Pergunta para reflexão: Pensa em algo que você comprou recentemente: era necessidade ou desejo? Como você percebe isso?

Resumo: Necessidade é o que precisamos para viver bem; desejo é o que queremos, mas podemos viver sem. Publicidade tenta confundir os dois.

Mensagem: Muito bem! Agora você tem uma ferramenta poderosa: parar, pensar e escolher.', 'Um tênis novo pode ser um desejo (você já tem um tênis que serve), mas se o seu único tênis furou e machuca seu pé, aí ele vira uma necessidade.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Jogo: Necessidade ou Desejo?', '{"tipo": "classificacao", "situacoes": [{"item": "Comprar remédio quando está doente", "resposta": "necessidade"}, {"item": "Comprar o jogo novo que todo mundo está jogando", "resposta": "desejo"}, {"item": "Comprar material escolar pedido pela escola", "resposta": "necessidade"}, {"item": "Trocar de celular só porque saiu um modelo novo", "resposta": "desejo"}, {"item": "Comprar comida para o almoço", "resposta": "necessidade"}, {"item": "Comprar um segundo boneco/figura igual ao que já tem", "resposta": "desejo"}, {"item": "Pagar a conta de água de casa", "resposta": "necessidade"}, {"item": "Comprar uma roupa nova só porque é bonita", "resposta": "desejo"}, {"item": "Ir ao médico quando está com dor", "resposta": "necessidade"}, {"item": "Comprar um doce depois do almoço", "resposta": "desejo"}, {"item": "Comprar sapato quando o antigo não serve mais", "resposta": "necessidade"}, {"item": "Assinar um serviço de jogos online", "resposta": "desejo"}, {"item": "Pagar o transporte para ir à escola", "resposta": "necessidade"}, {"item": "Comprar figurinhas para completar o álbum", "resposta": "desejo"}, {"item": "Comprar produtos de higiene, como sabonete", "resposta": "necessidade"}]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Necessidade ou Desejo?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma necessidade?', '["Algo indispensável para viver bem", "Qualquer coisa que aparece na propaganda", "Um brinquedo caro", "Algo que só os adultos têm"]'::jsonb, 0, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Comprar um jogo novo só porque os amigos têm é um exemplo de:', '["Necessidade", "Desejo", "Obrigação", "Investimento"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é ''compra por impulso''?', '["Comprar depois de planejar com calma", "Comprar de repente, sem pensar, por causa de uma vontade rápida", "Comprar apenas necessidades", "Não comprar nada"]'::jsonb, 1, 3);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é a melhor atitude antes de comprar algo que parece um desejo?', '["Comprar na hora para não perder", "Parar e pensar se realmente precisa", "Pedir para alguém comprar por você", "Ignorar o preço"]'::jsonb, 1, 4);

  -- ===== MODULO 3: Orçamento =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Orçamento', 'Como organizar entradas e gastos para saber quanto pode usar.', 3)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Montando seu primeiro orçamento', 'Já ouviu alguém dizer ''gastei mais do que tinha''? Isso acontece quando não existe um orçamento.', 'Orçamento é um plano que mostra quanto dinheiro entra (as ENTRADAS, como mesada, presentes em dinheiro ou pagamento por um trabalho) e quanto vai sair (os GASTOS). Fazer um orçamento significa organizar esse dinheiro ANTES de gastar, e não depois. Sem orçamento, é fácil gastar tudo rápido demais e ficar sem nada quando surge algo importante. Uma forma simples de organizar o dinheiro é dividir em partes com objetivos diferentes, por exemplo: uma parte para GASTAR no dia a dia, uma parte para GUARDAR, uma parte para um OBJETIVO específico (tipo aquele brinquedo que você está querendo) e uma parte para DIVERSÃO. Não existe uma única forma certa de dividir — o importante é que a divisão seja pensada antes, e não decidida no impulso na hora da compra.

Exemplo do cotidiano: Se você recebe R$ 100 de mesada, ao invés de gastar tudo na primeira semana, você pode planejar: R$ 40 para o dia a dia, R$ 30 para guardar, R$ 20 para um objetivo e R$ 10 para diversão. Assim o dinheiro dura o mês todo.

Pergunta para reflexão: O que pode acontecer se alguém gastar todo o dinheiro assim que recebe, sem fazer um orçamento?

Resumo: Orçamento é planejar entradas e gastos antes de usar o dinheiro, dividindo-o em categorias com propósito.

Mensagem: Você acabou de aprender uma habilidade que muitos adultos ainda não dominam. Continue!', 'Se você recebe R$ 100 de mesada, ao invés de gastar tudo na primeira semana, você pode planejar: R$ 40 para o dia a dia, R$ 30 para guardar, R$ 20 para um objetivo e R$ 10 para diversão. Assim o dinheiro dura o mês todo.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Monte seu primeiro orçamento', '{"tipo": "distribuicao_valor", "valor_total": 100, "categorias": ["Gastar", "Guardar", "Objetivo", "Diversão"], "instrucao": "Distribua os R$ 100 fictícios entre as 4 categorias e veja o resultado em um gráfico."}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Montando seu primeiro orçamento') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um orçamento?', '["Um plano de entradas e gastos", "Um tipo de conta bancária", "Um valor fixo que nunca muda", "Um imposto"]'::jsonb, 0, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que é importante planejar antes de gastar?', '["Para gastar mais rápido", "Para não ficar sem dinheiro para o que é importante", "Porque é obrigatório por lei", "Não é importante"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que são ''entradas'' num orçamento?', '["O dinheiro que sai", "O dinheiro que você recebe", "As dívidas", "As lojas que você visita"]'::jsonb, 1, 3);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Dividir o dinheiro em categorias como gastar, guardar e objetivo serve para:', '["Confundir as contas", "Organizar o uso do dinheiro com propósito", "Gastar tudo mais rápido", "Impedir qualquer gasto"]'::jsonb, 1, 4);

  -- ===== MODULO 4: Planejamento =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Planejamento', 'Definindo objetivos e transformando sonhos em metas com prazo.', 4)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Transformando sonhos em metas', 'Tem algo que você sonha em comprar ou fazer? Hoje você vai aprender a transformar esse sonho em um plano real.', 'Planejar é decidir hoje o que você vai fazer para alcançar algo no futuro. Um OBJETIVO é aquilo que você quer alcançar (por exemplo, comprar um videogame). Uma META é o objetivo com detalhes: quanto custa, quanto tempo vai levar e como você vai chegar lá. Planejamentos podem ser de CURTO PRAZO (poucas semanas), MÉDIO PRAZO (alguns meses) ou LONGO PRAZO (mais de um ano). Quanto maior o objetivo, mais importante é dividir ele em etapas pequenas — assim ele não parece impossível, e você consegue acompanhar seu progresso aos poucos, comemorando cada etapa alcançada.

Exemplo do cotidiano: Se um videogame custa R$ 200 e você consegue guardar R$ 20 por mês, você vai precisar de 10 meses. Saber esse número ajuda a manter o foco, porque você sabe exatamente o que está fazendo e por quê.

Pergunta para reflexão: Por que dividir um objetivo grande em etapas menores ajuda a não desistir no meio do caminho?

Resumo: Planejamento é transformar um sonho em etapas concretas com prazo, valor e acompanhamento.

Mensagem: Agora seu sonho tem um caminho. Continue acompanhando seu progresso!', 'Se um videogame custa R$ 200 e você consegue guardar R$ 20 por mês, você vai precisar de 10 meses. Saber esse número ajuda a manter o foco, porque você sabe exatamente o que está fazendo e por quê.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Meu primeiro objetivo financeiro', '{"tipo": "formulario_calculado", "campos": ["O que deseja comprar ou realizar", "Quanto custa", "Quanto consegue guardar por mês", "Cálculo automático: tempo necessário em meses"]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Transformando sonhos em metas') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual a diferença entre objetivo e meta?', '["Não existe diferença", "Meta é o objetivo com detalhes: valor, prazo e etapas", "Objetivo é mais detalhado que meta", "Meta é só para adultos"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Um plano para os próximos 10 anos é um planejamento de:', '["Curto prazo", "Médio prazo", "Longo prazo", "Nenhum prazo"]'::jsonb, 2, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que dividir um objetivo grande em etapas pequenas?', '["Para demorar mais", "Para ficar mais fácil de acompanhar e não desistir", "Não faz diferença", "Para gastar mais dinheiro"]'::jsonb, 1, 3);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Se algo custa R$200 e você guarda R$20 por mês, quantos meses você precisa?', '["5", "10", "20", "2"]'::jsonb, 1, 4);

  -- ===== MODULO 5: Poupança =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Poupança', 'O hábito de guardar dinheiro e construir disciplina financeira.', 5)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O hábito de poupar', 'Poupar não é sobre ter muito dinheiro — é sobre criar o hábito de guardar um pouco, sempre.', 'Poupar significa guardar uma parte do dinheiro em vez de gastar tudo. Isso não tem a ver com quanto você ganha, e sim com a disciplina de separar uma parte antes de gastar o resto. Pequenas economias do dia a dia (como não comprar algo por impulso) somadas ao longo do tempo fazem muita diferença. É importante entender: poupar não significa nunca gastar — significa fazer escolhas equilibradas entre aproveitar o presente e se preparar para o futuro. Este curso não recomenda que crianças ou adolescentes façam investimentos financeiros — isso é uma decisão que deve envolver os responsáveis mais adiante, quando for a hora certa.

Exemplo do cotidiano: Se você guarda R$ 2 por dia, em 30 dias você tem R$ 60 — o suficiente para algo que parecia distante quando pensado de uma vez só.

Pergunta para reflexão: O que é mais difícil para você: guardar dinheiro uma vez, ou guardar toda semana sem parar? Por quê?

Resumo: Poupar é um hábito de guardar uma parte do dinheiro regularmente, não uma questão de quanto se ganha.

Mensagem: Todo grande hábito começa pequeno. Você está construindo o seu agora!', 'Se você guarda R$ 2 por dia, em 30 dias você tem R$ 60 — o suficiente para algo que parecia distante quando pensado de uma vez só.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Desafio de poupança', '{"tipo": "desafio_streak", "opcoes_desafio": ["Desafio dos 7 dias", "Desafio dos 30 dias"], "instrucao": "Marque visualmente cada dia em que você conseguiu guardar um pouquinho, mesmo que pouco."}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O hábito de poupar') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Poupar depende principalmente de:', '["Ganhar muito dinheiro", "Ter disciplina para guardar uma parte", "Ter conta em banco", "Não gastar nunca"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que este curso recomenda sobre investimentos para crianças?', '["Investir tudo o quanto antes", "Não é o foco aqui — isso deve envolver os responsáveis no futuro", "Investir é obrigatório", "Investir é igual a poupar"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Pequenas economias do dia a dia, somadas ao longo do tempo:', '["Não fazem diferença", "Podem fazer muita diferença", "Só funcionam para adultos", "Atrapalham o orçamento"]'::jsonb, 1, 3);

  -- ===== MODULO 6: Consumo Consciente =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Consumo Consciente', 'Pensar antes de comprar: preço, qualidade e real necessidade.', 6)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Antes de comprar...', 'Toda compra é uma decisão — e boas decisões vêm de boas perguntas.', 'Consumo consciente significa comprar pensando no que realmente importa: você precisa daquilo? Você vai usar de verdade? Existe uma opção melhor ou mais barata? Comprar por impulso, sem pensar, costuma levar a desperdício — coisas compradas e esquecidas, ou que quebram rápido porque eram de baixa qualidade. Antes de qualquer compra, vale se perguntar: Eu preciso? Eu quero? Eu tenho dinheiro planejado pra isso? Eu pesquisei o preço? Existe outra opção? Eu vou realmente usar isso? Além disso, cuidar bem do que já se tem e reutilizar quando possível também é parte do consumo consciente — muitas vezes a melhor compra é a que a gente nem precisa fazer.

Exemplo do cotidiano: Antes de comprar um brinquedo novo, dá pra se perguntar: ''Eu já tenho um parecido? Vou brincar com ele de verdade, ou só vou querer por um tempo e depois esquecer?''

Pergunta para reflexão: Você encontrou um brinquedo que quer muito, mas já tem vários parecidos. O que você faria?

Resumo: Consumo consciente é pensar antes de comprar, evitando desperdício e comprando com propósito real.

Mensagem: Pensar antes de agir é uma das habilidades mais valiosas que existem. Você já está treinando isso!', 'Antes de comprar um brinquedo novo, dá pra se perguntar: ''Eu já tenho um parecido? Vou brincar com ele de verdade, ou só vou querer por um tempo e depois esquecer?''', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Jogo: Antes de comprar...', '{"tipo": "checklist_situacoes", "perguntas_checklist": ["Eu preciso?", "Eu quero?", "Tenho dinheiro planejado?", "Pesquisei?", "Existe outra opção?", "Vou realmente utilizar?"], "situacoes": ["Um brinquedo parecido com um que você já tem", "Um lanche na cantina quando você já levou lanche de casa", "Um caderno novo quando o seu ainda tem páginas em branco", "Uma roupa da moda que você só usaria uma vez", "Um jogo digital que seus amigos estão jogando"]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Antes de comprar...') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é consumo consciente?', '["Comprar tudo o que aparece", "Pensar antes de comprar, considerando real necessidade e uso", "Nunca comprar nada", "Comprar só coisas caras"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual dessas é uma boa pergunta antes de comprar algo?', '["Vou realmente usar isso?", "Todo mundo tem?", "É a última unidade?", "É bonito na loja?"]'::jsonb, 0, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Reutilizar e cuidar bem do que já se tem faz parte de:', '["Desperdício", "Consumo consciente", "Compra por impulso", "Publicidade"]'::jsonb, 1, 3);

  -- ===== MODULO 7: Meu Primeiro Pequeno Negócio =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Meu Primeiro Pequeno Negócio', 'Introdução ao empreendedorismo: identificar problemas e criar soluções.', 7)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que é empreender?', 'Empreender é enxergar um problema e criar uma solução para ele — e isso pode começar de forma bem simples.', 'Empreendedorismo é a habilidade de identificar um PROBLEMA (algo que incomoda ou falta para alguém) e criar uma SOLUÇÃO para ele, na forma de um PRODUTO (algo que se fabrica ou revende) ou SERVIÇO (uma ajuda ou trabalho que se oferece). Todo negócio tem um CLIENTE: a pessoa que vai usar essa solução. Pensar como empreendedor é pensar: ''O que as pessoas ao meu redor precisam, e como eu poderia ajudar com isso?''. Não é preciso ter uma ideia genial e nunca vista — muitas vezes, uma ideia simples e bem feita já resolve um problema real. É importante lembrar: qualquer negócio de verdade, com vendas reais e dinheiro de clientes, deve ter acompanhamento de um responsável.

Exemplo do cotidiano: Doces caseiros, artesanato, desenhos personalizados ou até ajudar um vizinho a organizar algo são exemplos de pequenos negócios que resolvem problemas reais para pessoas reais.

Pergunta para reflexão: Pense em algo que incomoda você ou sua família no dia a dia. Que solução simples poderia ajudar?

Resumo: Empreender é identificar um problema real e criar uma solução (produto ou serviço) para um cliente específico.

Mensagem: Você acabou de dar o primeiro passo como empreendedor. Vamos construir esse negócio juntos nos próximos módulos!', 'Doces caseiros, artesanato, desenhos personalizados ou até ajudar um vizinho a organizar algo são exemplos de pequenos negócios que resolvem problemas reais para pessoas reais.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Crie seu primeiro negócio', '{"tipo": "formulario_projeto", "campos": ["Nome do negócio", "Produto ou serviço", "Quem é o cliente", "Qual problema ele resolve", "Qual o diferencial"]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que é empreender?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um ''problema'' no contexto de empreendedorismo?', '["Uma prova difícil", "Algo que incomoda ou falta para alguém", "Um erro de cálculo", "Um tipo de imposto"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quem é o ''cliente'' de um negócio?', '["O dono do negócio", "A pessoa que vai usar a solução oferecida", "O concorrente", "O banco"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que negócios reais feitos por crianças precisam de acompanhamento de um responsável?', '["Não precisam", "Porque envolvem dinheiro real e contato com outras pessoas", "Só por enfeite", "Porque é proibido empreender"]'::jsonb, 1, 3);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa ideia de negócio precisa necessariamente ser algo nunca visto antes?', '["Sim, sempre", "Não, ideias simples também podem resolver problemas reais", "Só se for digital", "Só se for caro"]'::jsonb, 1, 4);

  -- ===== MODULO 8: Precificação =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Precificação', 'Como calcular custo, preço de venda e lucro de forma simples.', 8)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Quanto cobrar pelo que eu crio?', 'Você já pensou em vender algo, mas não sabia por quanto? Vamos aprender a calcular isso.', 'CUSTO é quanto gastamos para fazer ou conseguir um produto. PREÇO é quanto cobramos do cliente por ele. LUCRO é o que sobra depois de descontar o custo do preço de venda — é o resultado positivo do negócio. A conta básica é: Preço de venda menos Custo = Lucro. Se o custo for maior que o preço, isso se chama PREJUÍZO, e é o contrário do que queremos. Definir um preço bom não é só ''cobrar bastante'' — é encontrar um valor que cubra o custo, gere lucro justo, e ainda seja um preço que o cliente aceite pagar.

Exemplo do cotidiano: Se fazer um brigadeiro custa R$ 1 em ingredientes, e você vende por R$ 3, seu lucro é de R$ 2 por brigadeiro vendido.

Pergunta para reflexão: O que aconteceria se você vendesse um produto por um preço menor do que ele custou para fazer?

Resumo: Preço menos custo é igual a lucro. Um bom preço cobre o custo, gera lucro justo e é aceito pelo cliente.

Mensagem: Agora você sabe calcular o lucro de um negócio — hora de aplicar isso no seu próprio projeto!', 'Se fazer um brigadeiro custa R$ 1 em ingredientes, e você vende por R$ 3, seu lucro é de R$ 2 por brigadeiro vendido.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'calculadora', 'Calculadora de preços', '{"tipo": "calculadora", "produtos_ficticios": [{"nome": "Pulseira artesanal", "custo": 3}, {"nome": "Brigadeiro gourmet", "custo": 1.5}, {"nome": "Desenho personalizado", "custo": 2}, {"nome": "Marcador de página decorado", "custo": 1}, {"nome": "Sabonete artesanal", "custo": 4}], "instrucao": "Para cada produto, o aluno escolhe um preço de venda e o sistema calcula automaticamente o lucro."}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Quanto cobrar pelo que eu crio?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é lucro?', '["O mesmo que custo", "O que sobra depois de descontar o custo do preço de venda", "O valor total da venda", "Um imposto"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Se o custo de um produto é R$5 e ele é vendido por R$10, qual é o lucro?', '["R$15", "R$5", "R$10", "R$0"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é prejuízo?', '["Quando o preço é maior que o custo", "Quando o custo é maior que o preço de venda", "O mesmo que lucro", "Um tipo de desconto"]'::jsonb, 1, 3);

  -- ===== MODULO 9: Divulgação =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Divulgação', 'Como apresentar um produto e criar uma propaganda simples e honesta.', 9)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Como divulgar meu negócio', 'Ter um bom produto não basta — as pessoas precisam saber que ele existe.', 'Divulgação é a forma como um negócio conta às pessoas que ele existe e por que vale a pena conhecê-lo. Uma boa propaganda tem: um público-alvo claro (para quem essa mensagem é?), um benefício real (o que essa pessoa ganha usando o produto?) e uma mensagem simples e verdadeira. É muito importante que a propaganda nunca minta ou exagere para enganar o cliente — isso quebra a confiança e prejudica o negócio no longo prazo. Uma propaganda honesta e bem feita destaca de verdade o que o produto tem de bom, sem inventar coisas que ele não faz.

Exemplo do cotidiano: Ao invés de dizer ''o melhor brigadeiro do mundo'' (que ninguém pode provar), é melhor dizer ''brigadeiro cremoso, feito na hora, com chocolate de verdade'' — algo específico e verdadeiro.

Pergunta para reflexão: Por que uma propaganda que exagera ou mente pode prejudicar um negócio no futuro, mesmo que funcione uma vez?

Resumo: Divulgação eficaz é clara, honesta e destaca um benefício real para um público específico.

Mensagem: Sua propaganda está pronta! Isso mostra que você sabe comunicar valor de forma honesta.', 'Ao invés de dizer ''o melhor brigadeiro do mundo'' (que ninguém pode provar), é melhor dizer ''brigadeiro cremoso, feito na hora, com chocolate de verdade'' — algo específico e verdadeiro.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Crie sua primeira propaganda', '{"tipo": "formulario_projeto", "campos": ["Nome do produto", "Frase de divulgação", "Preço", "Benefício principal", "Público-alvo"]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Como divulgar meu negócio') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é o objetivo da divulgação?', '["Enganar o cliente", "Fazer as pessoas saberem que o negócio existe e por que vale a pena", "Aumentar o preço", "Esconder defeitos do produto"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que a propaganda nunca deve mentir?', '["Porque é proibido por lei em qualquer caso", "Porque isso quebra a confiança do cliente com o negócio", "Não tem problema mentir um pouco", "Porque ninguém percebe"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é ''público-alvo''?', '["O dono do negócio", "O grupo de pessoas para quem a mensagem é direcionada", "O concorrente", "O produto em si"]'::jsonb, 1, 3);

  -- ===== MODULO 10: Atendimento ao Cliente =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Atendimento ao Cliente', 'Educação, escuta e respeito na hora de atender alguém.', 10)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Como atender bem alguém', 'A forma como tratamos as pessoas é tão importante quanto o produto que vendemos.', 'Bom atendimento envolve: educação (tratar bem, com respeito), escuta (prestar atenção no que o cliente precisa, não só no que você quer dizer), paciência (mesmo quando o cliente tem dúvidas ou está indeciso), honestidade (não prometer o que não pode cumprir) e resolução de problemas (ajudar de verdade quando algo não sai como esperado). A confiança é construída atendimento após atendimento — um cliente bem tratado volta e ainda recomenda o negócio para outras pessoas.

Exemplo do cotidiano: Se um cliente pergunta o preço e você responde com educação e clareza, ele se sente respeitado — mesmo que decida não comprar naquele momento.

Pergunta para reflexão: Como você se sente quando é bem atendido em algum lugar? E quando é mal atendido?

Resumo: Bom atendimento é educação, escuta, paciência, honestidade e vontade real de ajudar.

Mensagem: Um bom atendimento constrói confiança — e confiança é a base de qualquer negócio duradouro.', 'Se um cliente pergunta o preço e você responde com educação e clareza, ele se sente respeitado — mesmo que decida não comprar naquele momento.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Você é o atendente', '{"tipo": "simulacao_dialogo", "situacoes": [{"cliente": "Olá, gostaria de saber o preço.", "opcoes": ["Oi! Custa R$10, e inclui isso e aquilo. Posso te ajudar em algo mais?", "Não sei, pergunta depois.", "Por que você quer saber?"], "correta": 0}, {"cliente": "Estou em dúvida se compro ou não.", "opcoes": ["Compra logo, não enrola.", "Sem problema, posso te contar mais sobre o produto para te ajudar a decidir.", "Então não compra."], "correta": 1}, {"cliente": "Não gostei do produto que comprei.", "opcoes": ["Ignorar a reclamação.", "Ouvir com calma e ver como posso resolver isso com você.", "Dizer que o problema é do cliente."], "correta": 1}]}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Como atender bem alguém') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual dessas NÃO faz parte de um bom atendimento?', '["Escuta", "Paciência", "Ignorar o cliente", "Honestidade"]'::jsonb, 2, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que a confiança do cliente é importante para um negócio?', '["Não é importante", "Um cliente que confia volta e recomenda o negócio", "Só serve para parecer bonito", "Atrapalha as vendas"]'::jsonb, 1, 2);

  -- ===== MODULO 11: Vendas =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Vendas', 'Vender é ajudar o cliente a decidir bem, não pressionar ou enganar.', 11)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que é realmente vender?', 'Vender não é pressionar alguém a comprar — é ajudar a pessoa a perceber se aquilo é bom para ela.', 'Vender bem envolve: conhecer o cliente (entender o que ele precisa), apresentar o produto com clareza, explicar benefícios reais, ouvir as dúvidas do cliente com atenção, responder com honestidade, e finalizar a venda sem pressionar. Uma venda boa é aquela em que o cliente sai satisfeito, porque sentiu que a compra realmente vai ajudar ele — isso se chama criar valor. Depois da venda, também existe o pós-venda: perguntar se o cliente ficou satisfeito e estar disponível se precisar de algo. Isso fortalece a confiança para futuras compras.

Exemplo do cotidiano: Ao invés de insistir ''compra agora, é a última unidade!'', um bom vendedor explica com calma os benefícios e deixa o cliente decidir com informação suficiente.

Pergunta para reflexão: Qual a diferença entre convencer alguém com boas informações e pressionar alguém a comprar?

Resumo: Vender bem é ajudar o cliente a decidir com boas informações, sem pressão nem exagero — e cuidar dele depois da compra também.

Mensagem: Você está pronto para aplicar tudo isso no seu próprio negócio. Continue firme!', 'Ao invés de insistir ''compra agora, é a última unidade!'', um bom vendedor explica com calma os benefícios e deixa o cliente decidir com informação suficiente.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Simulação de venda', '{"tipo": "simulacao_dialogo_avaliada", "criterios_avaliacao": ["Comunicação", "Educação", "Clareza", "Conhecimento do produto", "Capacidade de responder dúvidas"], "instrucao": "Use o negócio que você criou no Módulo 7 para simular uma conversa de venda completa."}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que é realmente vender?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que significa ''criar valor'' numa venda?', '["Cobrar o máximo possível", "Fazer o cliente sentir que a compra realmente o ajuda", "Pressionar até o cliente comprar", "Vender qualquer coisa, mesmo sem qualidade"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é pós-venda?', '["A venda antes de acontecer", "O cuidado com o cliente depois da compra", "O preço final", "Um tipo de propaganda"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa venda é aquela em que:', '["O cliente se sente pressionado", "O cliente sai satisfeito e bem informado", "O vendedor engana o cliente", "O produto nunca é explicado"]'::jsonb, 1, 3);

  -- ===== MODULO 12: Redes Sociais e Empreendedorismo =====
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Redes Sociais e Empreendedorismo', 'Divulgar um negócio online com criatividade e segurança digital.', 12)
  returning id into v_module_id;

  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Redes sociais com responsabilidade', 'Redes sociais podem ajudar um negócio a crescer — mas também exigem muito cuidado, especialmente para crianças e adolescentes.', 'Redes sociais são espaços onde negócios podem mostrar fotos, vídeos e legendas para apresentar seus produtos a um público maior. Para isso funcionar bem, é importante pensar em: que conteúdo mostrar, como comunicar a marca, e para qual público. Mas isso vem junto com uma responsabilidade enorme: SEGURANÇA DIGITAL. Isso significa nunca divulgar endereço de casa, nunca compartilhar informações pessoais como escola ou rotina, nunca compartilhar senhas com ninguém, ter muito cuidado com desconhecidos que tentam conversar, desconfiar de links suspeitos e golpes, proteger sua privacidade, e nunca participar de cyberbullying — nem praticando, nem calado quando vir acontecer. É fundamental deixar claro: qualquer atividade comercial real, com vendas de verdade, contato com clientes ou dinheiro envolvido, deve sempre ter a supervisão de um responsável.

Exemplo do cotidiano: Um negócio pode postar uma foto do produto com uma legenda simples e verdadeira, sem nunca colocar informações como o endereço de onde os produtos são feitos ou entregues.

Pergunta para reflexão: Por que é perigoso compartilhar informações pessoais, mesmo com pessoas que parecem simpáticas na internet?

Resumo: Redes sociais ajudam a divulgar um negócio, mas exigem segurança digital: nunca compartilhar dados pessoais, senhas, e sempre ter supervisão de um adulto em atividades reais.

Mensagem: Você concluiu o último módulo antes do projeto final. Hora de juntar tudo o que aprendeu!', 'Um negócio pode postar uma foto do produto com uma legenda simples e verdadeira, sem nunca colocar informações como o endereço de onde os produtos são feitos ou entregues.', 20, 1)
  returning id into v_lesson_id;

  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Crie o perfil do seu negócio (fictício)', '{"tipo": "formulario_projeto", "campos": ["Nome do negócio", "Descrição curta", "Público", "Primeira publicação: Apresentação", "Segunda publicação: Produto", "Terceira publicação: Divulgação"], "aviso": "Esta atividade é fictícia e educativa. Nenhuma publicação real deve ser feita sem acompanhamento de um responsável."}'::jsonb, 1);

  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Redes sociais com responsabilidade') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que NUNCA deve ser compartilhado nas redes sociais?', '["O nome do produto", "Endereço de casa e informações pessoais", "O preço do produto", "Uma foto do produto"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Se um negócio envolve vendas reais e dinheiro de clientes, o que é necessário?', '["Nada, a criança pode fazer tudo sozinha", "Acompanhamento de um responsável", "Postar o endereço de casa", "Compartilhar senhas com clientes"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer diante de um desconhecido insistindo em conversar na internet?', '["Continuar a conversa normalmente", "Ter cuidado e contar para um responsável", "Compartilhar dados pessoais", "Ignorar completamente sem contar pra ninguém"]'::jsonb, 1, 3);

  -- ===== CONQUISTAS =====
  insert into public.achievements (code, title, description, icon) values ('primeiro_passo', 'Primeiro Passo', 'Concluiu sua primeira aula', '🏆') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('guardador_de_dinheiro', 'Guardador de Dinheiro', 'Completou o módulo de Poupança', '💰') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_planejamento', 'Mestre do Planejamento', 'Completou o módulo de Planejamento', '🎯') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('consumo_consciente', 'Consumo Consciente', 'Completou o módulo de Consumo Consciente', '🧠') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('grande_ideia', 'Grande Ideia', 'Criou seu primeiro negócio fictício', '💡') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('jovem_empreendedor', 'Jovem Empreendedor', 'Completou o módulo de Empreendedorismo', '🏪') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_divulgacao', 'Mestre da Divulgação', 'Completou o módulo de Divulgação', '📢') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('especialista_precos', 'Especialista em Preços', 'Completou o módulo de Precificação', '💵') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('atendimento_nota_10', 'Atendimento Nota 10', 'Completou o módulo de Atendimento ao Cliente', '🤝') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('pequeno_empreendedor', 'Pequeno Empreendedor', 'Concluiu o curso inteiro e o projeto final', '🚀') on conflict (code) do nothing;
end $$;
