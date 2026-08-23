do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('programacao-para-criancas', 'Programação para Crianças', 'Lógica, algoritmos e os primeiros passos para criar um jogo do zero.', '👨‍💻', true, 6)
  returning id into v_course_id;

  -- MODULO 1: O que é Programação?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'O que é Programação?', 'Entendendo a ideia por trás de dar instruções a um computador.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Ensinando um computador a fazer algo', 'Você já pensou em como um jogo sabe exatamente o que fazer quando você aperta um botão?', 'Programação é o processo de dar instruções precisas para um computador seguir, passo a passo, para que ele realize uma tarefa. Diferente de uma pessoa, o computador não ''entende'' o que você quer dizer de forma vaga — ele só faz exatamente o que foi instruído, na ordem exata que foi escrito. Por isso, programar é, em grande parte, sobre pensar com clareza e organizar ideias em passos bem definidos, antes mesmo de escrever qualquer código. Essa forma de pensar se chama PENSAMENTO COMPUTACIONAL, e é útil até fora da programação, para resolver problemas do dia a dia.

Você sabia? Muitos jogos que você já jogou foram criados com milhares (às vezes milhões) de linhas de instruções escritas por programadores.

Pergunta para pensar: Que tarefa do seu dia a dia você conseguiria descrever em passos bem específicos, como se estivesse programando alguém para fazê-la?

Desafio: Escreva o passo a passo bem detalhado de como escovar os dentes, como se fosse explicar para alguém que nunca fez isso.

Resumo: Programar é dar instruções precisas e ordenadas para um computador seguir. Isso exige pensar com clareza antes de escrever qualquer código.

Exemplo do cotidiano: Se você pedir para um computador ''fazer um sanduíche'' sem detalhar os passos, ele não saberia o que fazer — programação é descrever cada passo, como pegar o pão, colocar o recheio, e fechar o sanduíche.', 'Se você pedir para um computador ''fazer um sanduíche'' sem detalhar os passos, ele não saberia o que fazer — programação é descrever cada passo, como pegar o pão, colocar o recheio, e fechar o sanduíche.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Passo a passo detalhado', '{"tipo": "formulario_projeto", "campos": ["Uma tarefa simples do dia a dia", "Passo 1", "Passo 2", "Passo 3"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Ensinando um computador a fazer algo') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é programação?', '["Adivinhar o que o usuário quer", "Dar instruções precisas e ordenadas para um computador seguir", "Um tipo de jogo apenas", "Desenhar na tela"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é pensamento computacional?', '["Pensar como um robô sem sentimentos", "Organizar ideias em passos claros para resolver problemas", "Um tipo de calculadora", "Só serve para programadores profissionais"]'::jsonb, 1, 2);

  -- MODULO 2: Algoritmos: A Receita que o Computador Segue
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Algoritmos: A Receita que o Computador Segue', 'Entendendo o que é um algoritmo com exemplos do dia a dia.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Toda tarefa tem uma receita', 'Uma receita de bolo tem passos numerados que você segue em ordem — um algoritmo funciona quase da mesma forma!', 'Um ALGORITMO é uma sequência de passos bem definidos para resolver um problema ou realizar uma tarefa. É como uma receita: tem um início, uma ordem de passos a seguir, e um resultado final esperado. Algoritmos existem em todo lugar, não só em programação — uma receita de bolo, o caminho que você faz para chegar na escola, ou até as regras de um jogo de tabuleiro são exemplos de algoritmos do dia a dia. Em programação, escrever um bom algoritmo antes de programar ajuda a organizar as ideias e evitar confusão depois.

Você sabia? A palavra ''algoritmo'' vem do nome de um matemático persa chamado Al-Khwarizmi, que viveu há mais de mil anos!

Pergunta para pensar: Qual seria o algoritmo (passo a passo) para escovar os dentes?

Desafio: Escreva o algoritmo (em passos numerados) de uma atividade que você faz toda semana.

Resumo: Um algoritmo é uma sequência de passos organizados para resolver um problema — existe em receitas, jogos e, claro, em programas de computador.

Exemplo do cotidiano: O algoritmo para atravessar a rua com segurança pode ser: 1) Olhar para os dois lados, 2) Esperar não ter carros vindo, 3) Atravessar andando, sem correr.', 'O algoritmo para atravessar a rua com segurança pode ser: 1) Olhar para os dois lados, 2) Esperar não ter carros vindo, 3) Atravessar andando, sem correr.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu primeiro algoritmo', '{"tipo": "formulario_projeto", "campos": ["Nome da tarefa", "Passo 1", "Passo 2", "Passo 3", "Resultado esperado no final"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Toda tarefa tem uma receita') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um algoritmo?', '["Um tipo de computador", "Uma sequência de passos organizados para resolver um problema", "Um jogo específico", "Um erro de programação"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual desses é um exemplo de algoritmo do dia a dia?', '["Uma receita de bolo", "A cor de uma parede", "O tamanho de uma sala", "Um sentimento"]'::jsonb, 0, 2);

  -- MODULO 3: Sequência e Instruções
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Sequência e Instruções', 'Por que a ordem das instruções importa tanto.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'A ordem muda tudo', 'Você já tentou vestir o sapato antes da meia? A ordem dos passos faz toda diferença!', 'SEQUÊNCIA, em programação, é a ordem exata em que as instruções são executadas. O computador segue as instruções uma após a outra, na ordem em que foram escritas — e mudar essa ordem pode mudar completamente o resultado. Por isso, organizar bem a sequência de instruções é uma das primeiras habilidades importantes ao programar. Um erro comum de quem está começando é esquecer que o computador não vai ''adivinhar'' a ordem certa — ele só segue exatamente o que foi escrito, na ordem escrita.

Você sabia? Um pequeno erro na ordem das instruções pode fazer um programa inteiro não funcionar como esperado — por isso programadores revisam a sequência com cuidado.

Pergunta para pensar: O que aconteceria se você tentasse ''fechar a porta'' antes de ''entrar em casa''?

Desafio: Coloque em ordem correta os passos de uma tarefa simples (como fazer um suco), numerando de 1 a 4.

Resumo: A sequência (ordem) das instruções muda completamente o resultado de um programa — o computador segue exatamente a ordem que foi escrita.

Exemplo do cotidiano: Para fazer um suco, a ordem importa: primeiro cortar a fruta, depois colocar no liquidificador, depois bater, e só então servir — inverter essa ordem não funcionaria.', 'Para fazer um suco, a ordem importa: primeiro cortar a fruta, depois colocar no liquidificador, depois bater, e só então servir — inverter essa ordem não funcionaria.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Coloque na ordem certa', '{"tipo": "classificacao", "situacoes": [{"item": "Colocar a meia antes do sapato", "resposta": "necessidade"}, {"item": "Colocar o sapato antes da meia", "resposta": "desejo"}, {"item": "Escovar os dentes depois de comer", "resposta": "necessidade"}, {"item": "Fechar a porta antes de entrar em casa", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: A ordem muda tudo') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é sequência em programação?', '["Um tipo de erro", "A ordem exata em que as instruções são executadas", "Um tipo de jogo", "Uma variável"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que acontece se a sequência de instruções estiver errada?', '["Nada muda", "O resultado pode ficar completamente diferente do esperado", "O computador corrige sozinho sempre", "Só afeta jogos"]'::jsonb, 1, 2);

  -- MODULO 4: Condições: Se Isso, Então Aquilo
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Condições: Se Isso, Então Aquilo', 'Como programas tomam decisões diferentes.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Ensinando o computador a decidir', 'Se estiver chovendo, você leva guarda-chuva. Se não estiver, você não leva. Isso é uma condição!', 'Uma CONDIÇÃO é uma estrutura que permite ao programa tomar decisões diferentes dependendo de uma situação. A forma mais comum é ''SE isso acontecer, ENTÃO faça aquilo'' — por exemplo, ''SE o jogador tocar no inimigo, ENTÃO ele perde uma vida''. Condições são o que fazem jogos e programas parecerem ''inteligentes'', reagindo de formas diferentes dependendo do que acontece. Sem condições, um programa sempre faria exatamente a mesma coisa, não importa a situação.

Você sabia? Praticamente todo jogo que você já jogou usa condições o tempo todo — para saber se você ganhou, perdeu, ou avançou de fase.

Pergunta para pensar: Qual seria uma condição do tipo ''se isso, então aquilo'' na sua rotina diária?

Desafio: Escreva 2 condições do tipo ''SE... ENTÃO...'' que poderiam existir num jogo simples.

Resumo: Condições (''SE isso, ENTÃO aquilo'') permitem que programas tomem decisões diferentes dependendo da situação.

Exemplo do cotidiano: Num jogo, uma condição pode ser: ''SE a pontuação for maior que 100, ENTÃO o jogador ganha uma medalha''.', 'Num jogo, uma condição pode ser: ''SE a pontuação for maior que 100, ENTÃO o jogador ganha uma medalha''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Complete a condição', '{"tipo": "formulario_projeto", "campos": ["SE (o que acontece)", "ENTÃO (o que o programa faz)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Ensinando o computador a decidir') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma condição em programação?', '["Um tipo de variável", "Uma estrutura ''SE isso, ENTÃO aquilo'' que permite decisões diferentes", "Um erro de código", "A cor da tela"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para que servem condições num jogo?', '["Para deixar o jogo mais lento", "Para o jogo reagir de formas diferentes dependendo da situação", "Não servem para nada em jogos", "Só servem para o menu inicial"]'::jsonb, 1, 2);

  -- MODULO 5: Repetições: Fazendo a Mesma Coisa Várias Vezes
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Repetições: Fazendo a Mesma Coisa Várias Vezes', 'Como evitar repetir instruções manualmente.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Por que repetir manualmente quando o computador pode fazer isso?', 'Imagine escrever a mesma instrução 100 vezes — que trabalho! É aí que entram as repetições.', 'Uma REPETIÇÃO (também chamada de LOOP) é uma estrutura que permite executar a mesma instrução várias vezes, sem precisar escrever ela repetidamente. Por exemplo, ao invés de escrever ''ande um passo'' 10 vezes seguidas, um programador pode escrever uma repetição que diz ''ande um passo, 10 vezes''. Isso economiza tempo, deixa o código mais organizado, e é essencial para tarefas que precisam se repetir, como animar um personagem se movendo continuamente num jogo.

Você sabia? Sem repetições, criar até mesmo animações simples em jogos seria extremamente trabalhoso, exigindo escrever a mesma instrução centenas de vezes.

Pergunta para pensar: Que tarefa do seu dia a dia envolve fazer a mesma coisa várias vezes seguidas?

Desafio: Pense numa ação de jogo (como pular ou andar) e imagine como seria usar uma repetição para fazer isso acontecer 5 vezes seguidas.

Resumo: Repetições (loops) permitem executar a mesma instrução várias vezes sem repetir o código manualmente — essenciais para animações e tarefas repetitivas.

Exemplo do cotidiano: Ao invés de escrever ''pular'' cinco vezes seguidas no código, um programador escreve uma repetição dizendo ''pular, 5 vezes'' — muito mais organizado.', 'Ao invés de escrever ''pular'' cinco vezes seguidas no código, um programador escreve uma repetição dizendo ''pular, 5 vezes'' — muito mais organizado.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Onde usar uma repetição?', '{"tipo": "classificacao", "situacoes": [{"item": "Fazer um personagem andar 10 passos seguidos", "resposta": "necessidade"}, {"item": "Mostrar o nome do jogo uma única vez na tela inicial", "resposta": "desejo"}, {"item": "Fazer uma estrela piscar continuamente na tela", "resposta": "necessidade"}, {"item": "Mostrar ''Fim de jogo'' uma única vez", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Por que repetir manualmente quando o computador pode fazer isso?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma repetição (loop) em programação?', '["Um erro do programa", "Uma estrutura que executa a mesma instrução várias vezes", "Um tipo de variável", "Uma condição"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que repetições são úteis?', '["Deixam o código mais confuso", "Evitam repetir manualmente a mesma instrução várias vezes", "Não servem para nada", "Só funcionam em jogos simples"]'::jsonb, 1, 2);

  -- MODULO 6: Variáveis: Guardando Informações
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Variáveis: Guardando Informações', 'Como programas lembram de números e informações.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Uma caixinha com nome para guardar informação', 'Como você acha que um jogo ''lembra'' quantos pontos você fez? A resposta é: variáveis!', 'Uma VARIÁVEL é como uma caixinha com um nome, usada para guardar uma informação que pode mudar ao longo do programa — como a pontuação de um jogador, o número de vidas, ou o nome digitado por alguém. Por exemplo, uma variável chamada ''pontos'' pode começar em 0 e ir aumentando conforme o jogador faz pontos no jogo. O nome da variável ajuda o programador a lembrar o que aquela informação representa, e o valor guardado dentro dela pode mudar (por isso se chama ''variável'' — porque varia!).

Você sabia? Praticamente todo jogo digital usa variáveis para controlar coisas como pontuação, vidas, tempo restante e nível do jogador.

Pergunta para pensar: Que informações um jogo de plataforma (tipo pular e correr) provavelmente guarda em variáveis?

Desafio: Pense em 3 variáveis que um jogo simples de corrida poderia ter (como ''velocidade'' ou ''distância percorrida'').

Resumo: Variáveis são ''caixinhas com nome'' que guardam informações que podem mudar durante o programa, como pontuação ou vidas.

Exemplo do cotidiano: Numa variável chamada ''vidas'', o valor pode começar em 3 e diminuir toda vez que o personagem é atingido por um inimigo.', 'Numa variável chamada ''vidas'', o valor pode começar em 3 e diminuir toda vez que o personagem é atingido por um inimigo.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minhas variáveis de jogo', '{"tipo": "formulario_projeto", "campos": ["Nome da primeira variável (ex: pontos)", "Valor inicial dela", "Nome da segunda variável (ex: vidas)", "Valor inicial dela"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Uma caixinha com nome para guardar informação') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma variável em programação?', '["Um tipo de erro", "Uma ''caixinha com nome'' que guarda uma informação que pode mudar", "Uma imagem fixa", "Um tipo de repetição"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual dessas seria uma boa variável num jogo?', '["Pontuação do jogador", "A cor do fundo do menu, sempre fixa", "O nome do jogo, sempre igual", "O logotipo da empresa"]'::jsonb, 0, 2);

  -- MODULO 7: Eventos: Quando Algo Acontece
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Eventos: Quando Algo Acontece', 'Como o programa reage a ações do jogador.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que acontece quando eu clico aqui?', 'Quando você aperta um botão num jogo e algo acontece na tela, isso é um evento sendo processado!', 'Um EVENTO é algo que acontece durante o uso do programa que faz ele reagir de alguma forma — como clicar num botão, apertar uma tecla, ou o personagem tocar em um objeto. Programas reagem a eventos executando uma ação específica: ''QUANDO o jogador apertar a seta para cima, ENTÃO o personagem pula''. Eventos são o que tornam jogos interativos — sem eles, o jogo simplesmente aconteceria sozinho, sem responder ao que o jogador faz.

Você sabia? Existem eventos que nem sempre vêm do jogador — por exemplo, ''QUANDO o cronômetro chegar a zero'' também é um evento que o programa pode reagir.

Pergunta para pensar: Que eventos você consegue identificar num jogo que você gosta (como apertar um botão específico)?

Desafio: Escreva um evento e a reação dele: ''QUANDO ___ acontecer, ENTÃO ___''.

Resumo: Eventos são ações que fazem o programa reagir, como cliques ou teclas pressionadas — são essenciais para a interatividade dos jogos.

Exemplo do cotidiano: Num jogo de plataforma, o evento ''QUANDO o jogador aperta a barra de espaço'' pode causar a reação ''ENTÃO o personagem pula''.', 'Num jogo de plataforma, o evento ''QUANDO o jogador aperta a barra de espaço'' pode causar a reação ''ENTÃO o personagem pula''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meus eventos de jogo', '{"tipo": "formulario_projeto", "campos": ["QUANDO (evento)", "ENTÃO (reação do jogo)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que acontece quando eu clico aqui?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um evento em programação?', '["Uma festa no jogo", "Uma ação que faz o programa reagir de alguma forma", "Um tipo de variável", "Um erro do código"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que eventos são importantes em jogos?', '["Não são importantes", "Tornam o jogo interativo, reagindo ao que o jogador faz", "Deixam o jogo mais lento", "Só servem para o menu"]'::jsonb, 1, 2);

  -- MODULO 8: Lógica de Jogos: Planejando Meu Primeiro Jogo
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Lógica de Jogos: Planejando Meu Primeiro Jogo', 'Juntando tudo para planejar um jogo simples do início ao fim.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Da ideia ao plano do jogo', 'Agora que você já conhece as peças fundamentais da programação, é hora de planejar seu próprio jogo!', 'Todo jogo, por mais simples que seja, é construído combinando os conceitos que você já aprendeu: uma SEQUÊNCIA de passos, CONDIÇÕES que decidem o que acontece, REPETIÇÕES para ações que se repetem, VARIÁVEIS para guardar informações como pontuação, e EVENTOS que reagem ao que o jogador faz. Antes de programar de verdade, é muito útil planejar no papel: qual é o objetivo do jogador? Quais são as regras principais? O que faz o jogador ganhar ou perder? Esse planejamento prévio economiza muito tempo e deixa as ideias mais claras.

Você sabia? Muitos estúdios de jogos profissionais passam semanas ou meses só planejando as regras de um jogo antes de escrever qualquer código.

Pergunta para pensar: Qual seria o objetivo principal de um jogo simples que você gostaria de criar?

Desafio: Rascunhe as regras principais de um jogo simples, pensando em objetivo, condições de vitória e derrota.

Resumo: Um jogo combina sequência, condições, repetições, variáveis e eventos. Planejar as regras no papel antes de programar economiza tempo.

Exemplo do cotidiano: Um jogo simples de ''pegar estrelas'' pode ter: o objetivo de coletar 10 estrelas (variável de pontuação), a condição de perder se tocar num inimigo, e o evento de mover o personagem com as setas do teclado.', 'Um jogo simples de ''pegar estrelas'' pode ter: o objetivo de coletar 10 estrelas (variável de pontuação), a condição de perder se tocar num inimigo, e o evento de mover o personagem com as setas do teclado.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu Primeiro Jogo', '{"tipo": "formulario_projeto", "campos": ["Nome do jogo", "Objetivo do jogador", "Regra principal (o que faz ganhar ou perder)", "Uma ação que o jogador pode fazer (evento)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Da ideia ao plano do jogo') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Antes de programar um jogo, o que é útil fazer?', '["Começar a escrever código direto, sem planejar", "Planejar as regras e objetivos no papel primeiro", "Não pensar em nada antes", "Copiar outro jogo exatamente"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quais elementos costumam se combinar num jogo?', '["Só variáveis", "Sequência, condições, repetições, variáveis e eventos", "Só imagens bonitas", "Nenhum conceito de programação"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('programador_iniciante', 'Programador Iniciante', 'Completou o módulo O que é Programação?', '💻') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_dos_algoritmos', 'Mestre dos Algoritmos', 'Completou o módulo Algoritmos', '📋') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('organizador_de_instrucoes', 'Organizador de Instruções', 'Completou o módulo Sequência e Instruções', '🔢') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_das_condicoes', 'Mestre das Condições', 'Completou o módulo Condições', '🔀') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_das_repeticoes', 'Mestre das Repetições', 'Completou o módulo Repetições', '🔁') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('guardiao_de_variaveis', 'Guardião de Variáveis', 'Completou o módulo Variáveis', '📦') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cacador_de_eventos', 'Caçador de Eventos', 'Completou o módulo Eventos', '⚡') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('planejador_de_jogos', 'Planejador de Jogos', 'Completou o módulo Lógica de Jogos', '🎮') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('pequeno_programador', 'Pequeno Programador', 'Concluiu o curso inteiro e o Primeiro Jogo', '👨‍💻') on conflict (code) do nothing;
end $$;