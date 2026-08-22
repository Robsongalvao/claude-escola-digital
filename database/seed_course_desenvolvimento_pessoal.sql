do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('inteligencia-desenvolvimento-pessoal', 'Inteligência e Desenvolvimento Pessoal', 'Autoconhecimento, confiança, hábitos e mentalidade de crescimento para a vida.', '🧠', true, 2)
  returning id into v_course_id;

  -- MODULO 1: Quem sou eu?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Quem sou eu?', 'Descobrindo pontos fortes e o que te torna único.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Descobrindo meus pontos fortes', 'Você já imaginou como seu celular consegue reconhecer sua voz? Pois é — seu cérebro faz coisas ainda mais incríveis, e hoje você vai descobrir algumas delas sobre você mesmo!', 'Autoconhecimento é entender quem você é: o que você gosta, no que você é bom, e no que ainda está aprendendo. Todo mundo tem PONTOS FORTES (coisas que já fazemos bem ou com facilidade) e PONTOS A DESENVOLVER (coisas que ainda estamos aprendendo). Isso não é sobre ser perfeito — é sobre se conhecer de verdade. Quando você sabe seus pontos fortes, fica mais fácil escolher em que investir seu tempo e energia. E quando você identifica o que quer melhorar, fica mais fácil traçar um caminho pra isso, ao invés de simplesmente se sentir mal por não saber algo ainda.

Você sabia? Cientistas descobriram que pessoas que reconhecem seus próprios pontos fortes tendem a se sentir mais confiantes e motivadas no dia a dia — isso se chama autoconhecimento, e é uma habilidade que se treina, igual um músculo.

Pergunta para pensar: Se um amigo tivesse que descrever 3 coisas boas sobre você, o que ele diria?

Desafio: Pergunte a 2 pessoas da sua confiança (família ou amigos) o que elas acham que você faz bem. Anote as respostas — às vezes os outros percebem coisas em nós que nem notamos sozinhos!

Resumo: Autoconhecimento é entender seus pontos fortes e o que você quer desenvolver. Isso ajuda a crescer com mais direção e confiança.

Exemplo do cotidiano: Um aluno pode ser ótimo em desenhar, mas ainda estar aprendendo a falar em público. Os dois são igualmente importantes de reconhecer — um ponto forte pra valorizar, e um ponto a desenvolver pra treinar.', 'Um aluno pode ser ótimo em desenhar, mas ainda estar aprendendo a falar em público. Os dois são igualmente importantes de reconhecer — um ponto forte pra valorizar, e um ponto a desenvolver pra treinar.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu mapa de pontos fortes', '{"tipo": "formulario_projeto", "campos": ["3 coisas que eu faço bem", "1 coisa que eu quero aprender ou melhorar", "Uma vez que me senti orgulhoso(a) de mim mesmo(a)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Descobrindo meus pontos fortes') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é autoconhecimento?', '["Saber tudo sobre qualquer assunto", "Entender quem você é, seus pontos fortes e o que quer desenvolver", "Ser sempre o melhor da turma", "Nunca errar"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Ter um ''ponto a desenvolver'' significa:', '["Que você é ruim nisso pra sempre", "Algo que você ainda está aprendendo", "Um defeito que não tem solução", "Algo que não importa"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que é útil reconhecer seus pontos fortes?', '["Para se achar melhor que os outros", "Para saber onde investir tempo e energia com mais confiança", "Não serve pra nada", "Só serve para adultos"]'::jsonb, 1, 3);

  -- MODULO 2: Confiança em mim mesmo
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Confiança em mim mesmo', 'Construindo segurança para tentar coisas novas.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'De onde vem a confiança?', 'Você já sentiu medo de tentar algo novo com medo de errar? Isso é super normal — e hoje vamos entender como a confiança realmente se constrói.', 'Confiança não é nascer sabendo fazer tudo certo. Confiança é acreditar que você é capaz de aprender e tentar, mesmo que ainda não saiba fazer perfeitamente. Ela cresce toda vez que você tenta algo, mesmo com medo, e percebe que consegue lidar com o resultado — seja ele um acerto ou um aprendizado. Muita gente pensa que primeiro precisa ficar confiante para depois agir, mas geralmente é o contrário: é AGINDO que a confiança aparece. Cada pequena vitória (terminar uma tarefa difícil, apresentar um trabalho, tentar um esporte novo) constrói um pouco mais de confiança para o próximo desafio.

Você sabia? Muitos atletas e artistas famosos falam sobre o medo que sentiam antes de começar — a diferença é que eles agiram apesar do medo, não porque o medo tinha desaparecido.

Pergunta para pensar: Qual foi a última vez que você tentou algo com medo e, no final, se sentiu orgulhoso de ter tentado?

Desafio: Essa semana, tente fazer uma coisa pequena que você andava evitando por insegurança (levantar a mão em aula, convidar alguém pra brincar, tentar um esporte novo).

Resumo: Confiança se constrói agindo, não esperando o medo desaparecer. Cada tentativa, mesmo com erro, fortalece sua confiança para a próxima.

Exemplo do cotidiano: Uma criança que tem medo de andar de bicicleta só constrói confiança de verdade quando sobe na bicicleta e tenta, mesmo cambaleando no início.', 'Uma criança que tem medo de andar de bicicleta só constrói confiança de verdade quando sobe na bicicleta e tenta, mesmo cambaleando no início.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Minha próxima pequena vitória', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Esperar sentir 100% de confiança antes de tentar algo novo", "consequencia": "Você pode esperar muito tempo — a confiança completa geralmente só vem depois de tentar."}, {"texto": "Tentar mesmo com um pouco de medo, sabendo que errar faz parte", "consequencia": "Essa é a forma mais rápida de realmente construir confiança de verdade."}, {"texto": "Desistir na primeira dificuldade", "consequencia": "Isso impede que a confiança tenha a chance de crescer."}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: De onde vem a confiança?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como a confiança geralmente se constrói?', '["Nascendo com ela", "Agindo e tentando, mesmo com medo", "Evitando qualquer desafio", "Sendo perfeito desde o início"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Sentir medo antes de tentar algo novo é:', '["Um sinal de fraqueza", "Normal, e não impede a pessoa de agir", "Algo que só crianças sentem", "Prova de que não deve tentar"]'::jsonb, 1, 2);

  -- MODULO 3: Disciplina e Hábitos
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Disciplina e Hábitos', 'Como pequenas ações repetidas criam grandes resultados.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O poder dos pequenos hábitos', 'Você sabia que escovar os dentes hoje é fácil porque você já fez isso centenas de vezes? Isso é o poder de um hábito!', 'HÁBITO é uma ação que se repete tanto que passa a acontecer quase sem esforço. DISCIPLINA é a capacidade de continuar fazendo algo importante mesmo quando não estamos com vontade. A boa notícia é que disciplina fica mais fácil quando vira hábito — no início dá trabalho, mas repetindo todo dia (ou toda semana) no mesmo horário e contexto, o cérebro vai automatizando aquilo. Grandes resultados quase sempre vêm de pequenas ações repetidas com constância, e não de um esforço enorme feito uma vez só.

Você sabia? Estudos mostram que hábitos levam, em média, algumas semanas para começar a ficar mais automáticos — por isso é normal que os primeiros dias pareçam mais difíceis.

Pergunta para pensar: Qual hábito pequeno, se você fizesse todo dia, poderia fazer diferença grande daqui a um ano?

Desafio: Escolha um hábito pequeno (ler 10 minutos, arrumar a mochila à noite, beber mais água) e tente fazer por 7 dias seguidos.

Resumo: Disciplina fica mais fácil quando vira hábito. Pequenas ações repetidas com constância geram grandes resultados ao longo do tempo.

Exemplo do cotidiano: Um aluno que estuda 15 minutos todo dia, mesmo sem vontade às vezes, aprende muito mais ao longo do ano do que alguém que só estuda bastante na véspera da prova.', 'Um aluno que estuda 15 minutos todo dia, mesmo sem vontade às vezes, aprende muito mais ao longo do ano do que alguém que só estuda bastante na véspera da prova.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Desafio de 7 dias de hábito', '{"tipo": "desafio_streak", "opcoes_desafio": ["Desafio dos 7 dias"], "instrucao": "Escolha um pequeno hábito e marque visualmente cada dia em que você conseguiu cumprir."}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O poder dos pequenos hábitos') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um hábito?', '["Uma ação feita uma única vez", "Uma ação repetida que se torna quase automática", "Algo que só adultos têm", "Um talento de nascença"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Grandes resultados geralmente vêm de:', '["Um esforço enorme feito uma única vez", "Pequenas ações repetidas com constância", "Sorte", "Talento apenas"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'É normal que os primeiros dias de um novo hábito pareçam:', '["Mais fáceis que o resto", "Mais difíceis, até o cérebro se acostumar", "Impossíveis para sempre", "Sem nenhuma diferença"]'::jsonb, 1, 3);

  -- MODULO 4: Organização do Meu Dia
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Organização do Meu Dia', 'Planejando o tempo para dar conta do que importa.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Organizando meu tempo', 'Você já teve a sensação de que o dia passou rápido demais e várias coisas ficaram pra trás? Vamos aprender a organizar isso.', 'Organização é decidir, com antecedência, o que fazer e quando fazer. Isso ajuda a não esquecer tarefas importantes e a ter tempo tanto para obrigações (escola, tarefas de casa) quanto para descanso e diversão. Uma forma simples de organizar o dia é listar as tarefas e colocá-las em ordem de importância — o que precisa ser feito primeiro, o que pode esperar um pouco. Isso evita duas armadilhas comuns: deixar tudo para a última hora, ou passar o dia inteiro sem saber por onde começar.

Você sabia? Muitas pessoas de sucesso em diferentes áreas usam listas simples de tarefas todos os dias — não é sobre ser complicado, é sobre ser constante.

Pergunta para pensar: O que costuma atrapalhar sua organização durante o dia?

Desafio: Antes de dormir hoje, escreva as 3 coisas mais importantes que você quer fazer amanhã.

Resumo: Organizar o tempo é planejar com antecedência o que fazer e priorizar o que é mais importante primeiro.

Exemplo do cotidiano: Antes de fazer a lição de casa, um aluno organizado separa primeiro o material necessário e escolhe qual matéria fazer primeiro — isso evita perder tempo procurando as coisas no meio da tarefa.', 'Antes de fazer a lição de casa, um aluno organizado separa primeiro o material necessário e escolhe qual matéria fazer primeiro — isso evita perder tempo procurando as coisas no meio da tarefa.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minha lista de prioridades de amanhã', '{"tipo": "formulario_projeto", "campos": ["Tarefa mais importante de amanhã", "Segunda tarefa mais importante", "Terceira tarefa"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Organizando meu tempo') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é organização do tempo?', '["Fazer tudo ao mesmo tempo", "Decidir com antecedência o que fazer e quando", "Nunca descansar", "Deixar tudo para depois"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Priorizar tarefas significa:', '["Fazer todas ao mesmo tempo", "Decidir o que é mais importante fazer primeiro", "Ignorar as menos importantes para sempre", "Fazer por sorteio"]'::jsonb, 1, 2);

  -- MODULO 5: Objetivos e Metas
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Objetivos e Metas', 'Transformando sonhos em planos concretos.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Sonhando com um plano', 'Ter um sonho é o primeiro passo — mas o que transforma um sonho em realidade é ter um plano.', 'Um OBJETIVO é algo que você deseja alcançar. Uma META é esse objetivo com detalhes claros: o que exatamente você quer, até quando, e quais passos vai seguir. Metas boas costumam ser específicas (claras sobre o que é), possíveis de medir (dá pra saber se alcançou ou não) e realistas (possíveis de alcançar com esforço). Dividir uma meta grande em etapas menores ajuda a não desanimar no meio do caminho, porque você vai vendo progresso a cada etapa concluída, e não só no final.

Você sabia? Escrever uma meta no papel (ou digitar) ajuda a lembrar dela com mais frequência e aumenta as chances de realmente seguir em direção a ela.

Pergunta para pensar: Qual é um objetivo que você tem para os próximos 3 meses?

Desafio: Escreva uma meta sua dividida em pelo menos 3 etapas menores.

Resumo: Meta é um objetivo com detalhes e prazo. Dividir em etapas pequenas ajuda a manter o foco e ver o progresso.

Exemplo do cotidiano: ''Eu quero ser bom em matemática'' é um objetivo vago. ''Eu quero tirar nota 8 na próxima prova de matemática, estudando 20 minutos por dia'' é uma meta clara.', '''Eu quero ser bom em matemática'' é um objetivo vago. ''Eu quero tirar nota 8 na próxima prova de matemática, estudando 20 minutos por dia'' é uma meta clara.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Minha meta com etapas', '{"tipo": "formulario_calculado", "campos": ["O que deseja alcançar", "Até quando", "Primeira etapa", "Segunda etapa", "Terceira etapa"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Sonhando com um plano') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual a diferença entre objetivo e meta?', '["Não existe diferença", "Meta tem detalhes claros: o quê, até quando e como", "Objetivo é sempre mais detalhado", "Meta é só para adultos"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que dividir uma meta grande em etapas menores?', '["Para demorar mais", "Para conseguir ver progresso e não desanimar", "Não faz diferença nenhuma", "Para complicar o processo"]'::jsonb, 1, 2);

  -- MODULO 6: Responsabilidade
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Responsabilidade', 'Cumprir compromissos e assumir consequências das próprias escolhas.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que significa ser responsável?', 'Você já prometeu fazer algo e cumpriu, mesmo sem vontade? Isso é responsabilidade em ação.', 'Ser responsável significa cumprir aquilo que você se comprometeu a fazer, e também assumir as consequências das suas próprias escolhas — tanto as boas quanto as que dão errado. Isso não significa nunca errar; significa reconhecer o erro e tentar consertar ou aprender com ele, ao invés de colocar a culpa sempre nos outros. Responsabilidade também aparece em coisas simples do dia a dia: cuidar dos seus materiais, cumprir horários combinados, e fazer sua parte em tarefas de grupo.

Você sabia? Pessoas responsáveis tendem a conquistar mais confiança dos outros ao longo do tempo, porque quem promete e cumpre gera confiabilidade.

Pergunta para pensar: Qual é um compromisso que você tem e que sente orgulho de sempre cumprir?

Desafio: Hoje, cumpra um compromisso pequeno que você tinha adiado.

Resumo: Responsabilidade é cumprir compromissos e assumir as consequências das próprias escolhas, aprendendo com os erros.

Exemplo do cotidiano: Se um aluno esquece de trazer o material combinado para um trabalho em grupo, ser responsável é avisar o grupo e buscar uma solução, ao invés de esconder o problema.', 'Se um aluno esquece de trazer o material combinado para um trabalho em grupo, ser responsável é avisar o grupo e buscar uma solução, ao invés de esconder o problema.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu compromisso desta semana', '{"tipo": "formulario_projeto", "campos": ["Um compromisso que você tem esta semana", "Como você vai garantir que vai cumprir"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que significa ser responsável?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Ser responsável significa:', '["Nunca errar", "Cumprir compromissos e assumir as consequências das escolhas", "Culpar sempre os outros", "Ignorar promessas feitas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quando alguém erra, uma atitude responsável é:', '["Esconder o erro", "Reconhecer e tentar consertar ou aprender com ele", "Culpar outra pessoa", "Fingir que não aconteceu"]'::jsonb, 1, 2);

  -- MODULO 7: Persistência: Aprendendo com os Erros
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Persistência: Aprendendo com os Erros', 'Erros fazem parte do caminho — o importante é continuar tentando.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Errar faz parte de aprender', 'Você sabia que bebês caem centenas de vezes antes de aprender a andar? E ninguém acha isso estranho — faz parte do processo!', 'PERSISTÊNCIA é a capacidade de continuar tentando mesmo depois de errar ou enfrentar dificuldades. Erros não são o oposto de aprender — eles fazem PARTE do aprendizado. Quando erramos, ganhamos uma informação valiosa: descobrimos o que não funciona, e isso nos aproxima de descobrir o que funciona. O problema não é errar, é desistir depois do erro. Pessoas persistentes encaram um erro como um degrau, não como uma parede.

Você sabia? Muitos inventores e cientistas tiveram centenas de tentativas que não deram certo antes de chegar numa descoberta importante — o processo de errar fazia parte do caminho, não um desvio dele.

Pergunta para pensar: Qual foi um erro que, no fim, te ensinou algo importante?

Desafio: Da próxima vez que você errar em algo, ao invés de se criticar, escreva uma frase sobre o que esse erro te ensinou.

Resumo: Persistência é continuar tentando depois de errar. Erros são parte do aprendizado, não o oposto dele.

Exemplo do cotidiano: Uma criança que erra várias vezes tentando montar um quebra-cabeça, mas continua tentando peças diferentes, eventualmente encontra o encaixe certo — e aprende mais sobre como resolver problemas do que quem desiste na primeira tentativa.', 'Uma criança que erra várias vezes tentando montar um quebra-cabeça, mas continua tentando peças diferentes, eventualmente encontra o encaixe certo — e aprende mais sobre como resolver problemas do que quem desiste na primeira tentativa.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu erro que virou aprendizado', '{"tipo": "formulario_projeto", "campos": ["Um erro que você cometeu recentemente", "O que esse erro te ensinou", "O que você faria diferente da próxima vez"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Errar faz parte de aprender') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é persistência?', '["Nunca errar", "Continuar tentando mesmo depois de errar", "Desistir rápido para não sofrer", "Fazer tudo perfeito de primeira"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Erros, no processo de aprendizado, são:', '["Algo que deve ser evitado a todo custo", "Parte natural do processo, que ensina algo", "Prova de que a pessoa não é capaz", "Sempre culpa de outra pessoa"]'::jsonb, 1, 2);

  -- MODULO 8: Mentalidade de Crescimento
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Mentalidade de Crescimento', 'Acreditar que habilidades podem ser desenvolvidas com esforço e prática.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Eu ainda não sei... por enquanto', 'Existe uma palavrinha pequena que muda tudo: ''ainda''. ''Eu não sei fazer isso'' é bem diferente de ''eu ainda não sei fazer isso''.', 'Mentalidade de crescimento é acreditar que habilidades e inteligência podem se desenvolver com esforço, prática e boas estratégias — ao invés de pensar que a gente ''nasce'' bom ou ruim em algo, para sempre. Quem tem mentalidade de crescimento encara desafios como oportunidades de aprender, e vê o esforço como o caminho para melhorar, não como um sinal de fraqueza. O oposto disso é a mentalidade fixa, que faz a pessoa evitar desafios com medo de parecer incapaz. A boa notícia: mentalidade de crescimento pode ser treinada, começando pela forma como você fala consigo mesmo.

Você sabia? Trocar frases como ''eu sou ruim nisso'' por ''eu ainda estou aprendendo isso'' já é um exercício real de mentalidade de crescimento.

Pergunta para pensar: Existe algo que você acha que ''não é bom'' hoje, mas que talvez seja só uma questão de ainda não ter praticado o suficiente?

Desafio: Troque uma frase negativa que você costuma pensar sobre si mesmo por uma versão com a palavra ''ainda''.

Resumo: Mentalidade de crescimento é acreditar que habilidades se desenvolvem com esforço e prática — desafios são oportunidades, não ameaças.

Exemplo do cotidiano: Ao invés de pensar ''eu sou péssimo em desenho'', uma mentalidade de crescimento pensa ''eu ainda estou aprendendo a desenhar, e cada tentativa me deixa um pouco melhor''.', 'Ao invés de pensar ''eu sou péssimo em desenho'', uma mentalidade de crescimento pensa ''eu ainda estou aprendendo a desenhar, e cada tentativa me deixa um pouco melhor''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Trocando o ''eu não sei'' por ''eu ainda não sei''', '{"tipo": "formulario_projeto", "campos": ["Uma frase negativa que você costuma pensar sobre si mesmo", "Como ficaria essa frase com a palavra ''ainda''"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Eu ainda não sei... por enquanto') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é mentalidade de crescimento?', '["Achar que já sabe tudo", "Acreditar que habilidades se desenvolvem com esforço e prática", "Nunca enfrentar desafios", "Achar que talento é fixo e não muda"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Adicionar a palavra ''ainda'' a uma frase negativa serve para:', '["Não mudar nada", "Lembrar que aquilo pode se desenvolver com o tempo", "Tornar a frase mais triste", "Evitar qualquer esforço"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('explorador_de_si_mesmo', 'Explorador de Si Mesmo', 'Completou o módulo Quem sou eu?', '🔍') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('confiante', 'Confiante', 'Completou o módulo Confiança em mim mesmo', '💪') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('disciplinado', 'Disciplinado', 'Completou o módulo Disciplina e Hábitos', '⏰') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('organizador', 'Organizador', 'Completou o módulo Organização do Meu Dia', '🗂️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_das_metas', 'Mestre das Metas', 'Completou o módulo Objetivos e Metas', '🎯') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('responsavel_nota_10', 'Responsável Nota 10', 'Completou o módulo Responsabilidade', '✅') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('persistente', 'Persistente', 'Completou o módulo Persistência', '🔥') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mente_em_crescimento', 'Mente em Crescimento', 'Completou o módulo Mentalidade de Crescimento', '🌱') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('explorador_da_evolucao', 'Explorador da Evolução', 'Concluiu o curso inteiro e o Plano de Evolução', '🚀') on conflict (code) do nothing;
end $$;