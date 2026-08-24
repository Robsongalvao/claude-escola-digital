do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('cidadania-e-vida-em-sociedade', 'Cidadania e Vida em Sociedade', 'Respeito, direitos, regras e como contribuir para a comunidade.', '🌎', true, 9)
  returning id into v_course_id;

  -- MODULO 1: Respeito e Empatia
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Respeito e Empatia', 'Entendendo o outro e tratando as pessoas com consideração.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Se colocar no lugar do outro', 'Você já parou para pensar como seria estar no lugar de outra pessoa antes de julgar uma atitude dela?', 'EMPATIA é a capacidade de se colocar no lugar do outro, tentando entender como ele se sente numa situação, mesmo que você não tenha passado exatamente pela mesma coisa. RESPEITO é tratar as pessoas com consideração, reconhecendo que elas têm sentimentos, opiniões e necessidades tão válidas quanto as suas. Esses dois conceitos andam juntos: quando praticamos empatia, fica mais fácil ser respeitoso, porque entendemos melhor o impacto das nossas palavras e ações nos outros. Respeito não significa concordar com tudo — significa tratar bem mesmo quando existe uma diferença de opinião ou de forma de ser.

Você sabia? Estudos mostram que crianças que praticam empatia regularmente tendem a formar amizades mais duradouras e a lidar melhor com conflitos.

Pergunta para pensar: Já houve uma vez em que, ao pensar em como a outra pessoa estava se sentindo, você mudou sua atitude? Como foi isso?

Desafio: Hoje, antes de reagir a alguma situação com um colega ou familiar, tente pensar em como ele deve estar se sentindo.

Resumo: Empatia é se colocar no lugar do outro; respeito é tratar as pessoas com consideração, mesmo quando há diferenças de opinião.

Exemplo do cotidiano: Se um colega está mais quieto e triste, ao invés de julgar, uma atitude empática seria perguntar com cuidado se está tudo bem, tentando entender o que ele pode estar sentindo.', 'Se um colega está mais quieto e triste, ao invés de julgar, uma atitude empática seria perguntar com cuidado se está tudo bem, tentando entender o que ele pode estar sentindo.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Praticando empatia', '{"tipo": "simulacao_dialogo", "situacoes": [{"cliente": "Um colega chegou atrasado e parece chateado, sem explicar o motivo.", "opcoes": ["Reclamar do atraso na frente de todos", "Perguntar com cuidado se está tudo bem, sem julgar", "Ignorar completamente"], "correta": 1}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Se colocar no lugar do outro') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é empatia?', '["Concordar com tudo que o outro diz", "Se colocar no lugar do outro para entender como ele se sente", "Ignorar os sentimentos alheios", "Um tipo de regra"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Respeitar alguém significa sempre concordar com essa pessoa?', '["Sim, sempre", "Não, é possível respeitar mesmo discordando", "Só se for da família", "Respeito não tem relação com concordar ou discordar"]'::jsonb, 1, 2);

  -- MODULO 2: Direitos e Deveres
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Direitos e Deveres', 'Entendendo o que temos garantido e o que é esperado de nós.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Toda garantia vem com uma responsabilidade', 'Você sabia que crianças e adolescentes têm direitos garantidos por lei, e também responsabilidades no seu dia a dia?', 'DIREITOS são garantias que todas as pessoas têm, como o direito à educação, à saúde, ao lazer e a serem tratadas com respeito. DEVERES são as responsabilidades que temos em troca de fazer parte de uma sociedade ou grupo — como respeitar os direitos dos outros, seguir combinados, e contribuir com o que está ao nosso alcance. Direitos e deveres andam juntos: ter o direito de estudar, por exemplo, também envolve o dever de se esforçar e respeitar o ambiente escolar. Entender essa relação ajuda a perceber que viver em sociedade é uma troca — ninguém vive sozinho, e as ações de cada um afetam os outros.

Você sabia? A Convenção sobre os Direitos da Criança, um documento internacional, garante direitos específicos para crianças e adolescentes em praticamente todos os países do mundo.

Pergunta para pensar: Qual é um direito que você tem, e qual dever você acha que anda junto com ele?

Desafio: Escreva um direito seu e um dever correspondente que você pratica no dia a dia.

Resumo: Direitos são garantias que temos; deveres são as responsabilidades que temos em troca. Os dois andam juntos na vida em sociedade.

Exemplo do cotidiano: Toda criança tem o direito à educação; junto com isso, vem o dever de respeitar professores e colegas e se esforçar nos estudos.', 'Toda criança tem o direito à educação; junto com isso, vem o dever de respeitar professores e colegas e se esforçar nos estudos.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Direito e dever correspondente', '{"tipo": "formulario_projeto", "campos": ["Um direito que você tem", "O dever correspondente a esse direito"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Toda garantia vem com uma responsabilidade') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que são direitos?', '["Regras impostas sem explicação", "Garantias que todas as pessoas têm, como educação e saúde", "Punições", "Um tipo de imposto"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Direitos e deveres andam juntos?', '["Não têm relação nenhuma", "Sim, geralmente um vem acompanhado do outro", "Só direitos importam", "Só deveres importam"]'::jsonb, 1, 2);

  -- MODULO 3: Regras: Por que Existem?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Regras: Por que Existem?', 'Entendendo o propósito das regras em diferentes contextos.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Regras não existem à toa', 'Você já se perguntou por que existem regras, ao invés de cada um fazer o que quiser?', 'REGRAS são combinados que ajudam a organizar a convivência entre pessoas, tornando os espaços mais seguros, justos e previsíveis para todos. Sem regras, seria muito mais difícil garantir que todos fossem tratados de forma justa, ou que espaços compartilhados (como uma escola, um parque, ou um jogo) funcionassem bem. É importante entender o PROPÓSITO por trás das regras, e não só decorá-las: uma regra de trânsito existe para evitar acidentes, uma regra de silêncio na biblioteca existe para as pessoas conseguirem se concentrar. Quando entendemos o motivo de uma regra, fica mais fácil respeitá-la de verdade, e não só por obrigação.

Você sabia? Regras de jogos, esportes, e até brincadeiras infantis também são um tipo de regra social — elas existem para que todos joguem de forma justa.

Pergunta para pensar: Pense numa regra que você segue no dia a dia. Qual é o propósito real dela?

Desafio: Escolha uma regra da sua casa ou escola e explique, com suas palavras, por que ela existe.

Resumo: Regras existem para organizar a convivência e tornar espaços mais seguros e justos. Entender o propósito de uma regra ajuda a respeitá-la de verdade.

Exemplo do cotidiano: A regra de formar fila para usar o bebedouro existe para que todos tenham a chance de beber água de forma organizada, sem confusão nem empurra-empurra.', 'A regra de formar fila para usar o bebedouro existe para que todos tenham a chance de beber água de forma organizada, sem confusão nem empurra-empurra.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Qual o propósito dessa regra?', '{"tipo": "formulario_projeto", "campos": ["Uma regra que você segue (escola, casa, jogo)", "Qual é o propósito real dessa regra"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Regras não existem à toa') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que as regras existem?', '["Para dificultar a vida das pessoas", "Para organizar a convivência e tornar espaços mais seguros e justos", "Não têm propósito nenhum", "Só para punir"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Entender o propósito de uma regra ajuda a:', '["Ignorá-la mais facilmente", "Respeitá-la de verdade, não só por obrigação", "Não faz diferença nenhuma", "Só complica as coisas"]'::jsonb, 1, 2);

  -- MODULO 4: Cooperação: Trabalhando Juntos
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Cooperação: Trabalhando Juntos', 'Como o trabalho em equipe alcança resultados melhores.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Juntos, conseguimos mais', 'Você já notou como algumas tarefas ficam muito mais fáceis quando feitas em grupo, ao invés de sozinho?', 'COOPERAÇÃO é trabalhar junto com outras pessoas em direção a um objetivo comum, dividindo tarefas e ajudando uns aos outros. Cooperar não significa que todo mundo tem que fazer exatamente a mesma coisa — significa reconhecer que cada pessoa pode contribuir de um jeito diferente, e que o resultado final costuma ser melhor quando as pessoas se ajudam do que quando cada um tenta fazer tudo sozinho. Uma boa cooperação envolve: ouvir as ideias dos outros, comunicar bem o que você está fazendo, e estar disposto a ajudar quando alguém precisa.

Você sabia? Muitos projetos importantes da história, como grandes construções e descobertas científicas, só foram possíveis porque muitas pessoas trabalharam juntas, cada uma contribuindo com sua parte.

Pergunta para pensar: Que tarefa você já fez que ficou muito melhor porque teve ajuda de outras pessoas?

Desafio: Pense num trabalho em grupo que você participou e identifique como cada pessoa contribuiu de forma diferente.

Resumo: Cooperação é trabalhar junto em direção a um objetivo comum, reconhecendo que cada pessoa contribui de um jeito diferente.

Exemplo do cotidiano: Numa faxina em grupo na sala de aula, uma pessoa pode organizar os materiais, outra pode limpar as mesas, e outra pode cuidar do lixo — cada um contribuindo de um jeito, alcançando o resultado juntos.', 'Numa faxina em grupo na sala de aula, uma pessoa pode organizar os materiais, outra pode limpar as mesas, e outra pode cuidar do lixo — cada um contribuindo de um jeito, alcançando o resultado juntos.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Cooperação em ação', '{"tipo": "formulario_projeto", "campos": ["Uma tarefa que fica melhor feita em grupo", "Como diferentes pessoas poderiam contribuir para ela"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Juntos, conseguimos mais') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é cooperação?', '["Fazer tudo sozinho", "Trabalhar junto com outras pessoas em direção a um objetivo comum", "Competir sem ajudar ninguém", "Ignorar as ideias dos outros"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa cooperação envolve:', '["Ignorar o que os outros dizem", "Ouvir ideias, comunicar bem e ajudar quando necessário", "Fazer tudo do seu próprio jeito, sem falar com ninguém", "Competir para ver quem faz mais rápido"]'::jsonb, 1, 2);

  -- MODULO 5: Diversidade de Opiniões
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Diversidade de Opiniões', 'Convivendo respeitosamente com formas diferentes de pensar.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Pensar diferente não é um problema', 'Você já discordou de um amigo sobre algo e mesmo assim continuaram sendo amigos? Isso é conviver bem com a diversidade de opiniões.', 'DIVERSIDADE DE OPINIÕES significa que pessoas diferentes podem pensar de formas diferentes sobre o mesmo assunto — e isso é normal e até saudável. Cada pessoa tem experiências, valores e vivências diferentes, o que naturalmente leva a opiniões diferentes. Conviver bem com isso significa: ouvir opiniões diferentes das suas com curiosidade, ao invés de hostilidade; entender que discordar de uma ideia não significa desrespeitar a pessoa; e reconhecer que você também pode aprender algo com pontos de vista diferentes do seu. Isso não significa que toda opinião é igualmente válida em qualquer situação (por exemplo, fatos científicos não são ''opinião''), mas em questões de gosto, preferência e valores, a diversidade enriquece a convivência.

Você sabia? Grupos com pessoas de opiniões e experiências diferentes costumam encontrar soluções mais criativas para problemas do que grupos onde todos pensam igual.

Pergunta para pensar: Você já mudou de opinião sobre algo depois de ouvir o ponto de vista de outra pessoa? O que aconteceu?

Desafio: Pense num assunto em que você e um amigo discordam, e escreva um argumento que você entende do lado dele, mesmo sem concordar.

Resumo: Diversidade de opiniões é normal e saudável. Discordar de uma ideia não significa desrespeitar a pessoa — ouvir com curiosidade enriquece a convivência.

Exemplo do cotidiano: Dois amigos podem discordar sobre qual é o melhor filme, e mesmo assim continuar sendo bons amigos, respeitando que cada um tem seu gosto.', 'Dois amigos podem discordar sobre qual é o melhor filme, e mesmo assim continuar sendo bons amigos, respeitando que cada um tem seu gosto.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Entendendo o outro lado', '{"tipo": "formulario_projeto", "campos": ["Um assunto em que você e alguém têm opiniões diferentes", "Um argumento que você entende do lado da outra pessoa, mesmo sem concordar"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Pensar diferente não é um problema') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Discordar de uma opinião significa desrespeitar a pessoa?', '["Sim, sempre", "Não, é possível discordar com respeito", "Só se for um assunto sério", "Discordância é sempre desrespeito"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que a diversidade de opiniões pode ser positiva num grupo?', '["Não traz nenhum benefício", "Pode levar a soluções mais criativas para problemas", "Sempre causa brigas", "É melhor todo mundo pensar igual"]'::jsonb, 1, 2);

  -- MODULO 6: Resolução de Conflitos
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Resolução de Conflitos', 'Lidando com desacordos de forma construtiva.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Conflitos acontecem — o importante é como resolvemos', 'Ter um desentendimento com alguém não é o problema — o problema é não saber como resolver isso de forma saudável.', 'CONFLITO é um desacordo ou desentendimento entre pessoas — algo natural que acontece em qualquer convivência, mesmo entre pessoas que se gostam muito. O importante não é evitar conflitos a todo custo, mas saber RESOLVER eles de forma construtiva. Alguns passos úteis: ouvir o outro lado com atenção antes de responder, expressar como você se sente usando frases como ''eu me senti...'' ao invés de acusações diretas, buscar um meio-termo quando possível, e pedir ajuda de um adulto quando o conflito é grande demais para resolver sozinho. Resolver conflitos bem fortalece relações, ao invés de destruí-las.

Você sabia? Evitar completamente qualquer conflito também não é saudável — expressar desacordos de forma respeitosa é parte importante de relações saudáveis.

Pergunta para pensar: Qual foi um conflito que você teve e conseguiu resolver bem? O que ajudou nisso?

Desafio: Da próxima vez que tiver um desacordo com alguém, tente usar a frase ''eu me senti... quando...'' ao invés de uma acusação direta.

Resumo: Conflitos são naturais na convivência. Resolvê-los bem envolve ouvir o outro lado, expressar sentimentos com clareza, e buscar um meio-termo.

Exemplo do cotidiano: Ao invés de dizer ''você é folgado, nunca ajuda em nada'', é mais construtivo dizer ''eu me senti sozinho fazendo essa tarefa toda — você poderia me ajudar da próxima vez?''.', 'Ao invés de dizer ''você é folgado, nunca ajuda em nada'', é mais construtivo dizer ''eu me senti sozinho fazendo essa tarefa toda — você poderia me ajudar da próxima vez?''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Resolvendo um conflito', '{"tipo": "simulacao_dialogo", "situacoes": [{"cliente": "Um amigo esqueceu de te ajudar numa tarefa combinada, e você ficou chateado.", "opcoes": ["Gritar e dizer que ele nunca ajuda em nada", "Dizer com calma como você se sentiu e perguntar o que aconteceu", "Ignorar o amigo até ele perceber sozinho"], "correta": 1}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Conflitos acontecem — o importante é como resolvemos') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Conflitos entre pessoas são:', '["Algo que deve ser sempre evitado", "Naturais na convivência, e podem ser resolvidos de forma construtiva", "Sempre destrutivos", "Um sinal de que a amizade acabou"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa forma de expressar como você se sente num conflito é:', '["Fazer acusações diretas", "Usar frases como ''eu me senti... quando...''", "Gritar mais alto", "Ignorar completamente o problema"]'::jsonb, 1, 2);

  -- MODULO 7: Vivendo em Comunidade
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Vivendo em Comunidade', 'Entendendo o papel de cada pessoa dentro de uma comunidade.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Cada pessoa faz parte de algo maior', 'Você faz parte de várias comunidades ao mesmo tempo: sua família, sua turma, seu bairro. Já pensou no seu papel em cada uma delas?', 'COMUNIDADE é um grupo de pessoas que compartilham um espaço, interesse ou objetivo em comum — pode ser um bairro, uma escola, um time, ou até um grupo online. Viver bem em comunidade envolve reconhecer que as ações de cada pessoa afetam as outras: cuidar de espaços compartilhados, respeitar vizinhos, e contribuir com o que está ao seu alcance para melhorar o ambiente coletivo. Pequenas atitudes fazem diferença: cumprimentar vizinhos, não jogar lixo em locais públicos, ajudar quando alguém precisa. Ninguém precisa resolver todos os problemas de uma comunidade sozinho — pequenas contribuições, somadas, criam um ambiente melhor para todos.

Você sabia? Muitas mudanças positivas em bairros e cidades começaram com a iniciativa de poucas pessoas que decidiram agir sobre um problema que percebiam no dia a dia.

Pergunta para pensar: De quais comunidades você faz parte? Qual pequena atitude sua poderia melhorar uma delas?

Desafio: Pense numa pequena atitude que você poderia praticar essa semana para contribuir com uma comunidade da qual você faz parte.

Resumo: Comunidade é um grupo que compartilha espaço ou objetivo. Pequenas atitudes individuais, somadas, melhoram o ambiente coletivo.

Exemplo do cotidiano: Recolher o próprio lixo depois de um piquenique num parque público é uma pequena atitude que, somada à de outras pessoas, mantém o espaço agradável para todos.', 'Recolher o próprio lixo depois de um piquenique num parque público é uma pequena atitude que, somada à de outras pessoas, mantém o espaço agradável para todos.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minha contribuição para a comunidade', '{"tipo": "formulario_projeto", "campos": ["Uma comunidade da qual você faz parte", "Uma pequena atitude que você poderia praticar para contribuir com ela"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Cada pessoa faz parte de algo maior') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma comunidade?', '["Só a sua família", "Um grupo de pessoas que compartilham espaço, interesse ou objetivo em comum", "Apenas um bairro", "Um tipo de escola"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Pequenas atitudes individuais fazem diferença numa comunidade?', '["Não, só grandes ações importam", "Sim, somadas, elas melhoram o ambiente coletivo", "Só se forem feitas por adultos", "Não têm nenhum impacto"]'::jsonb, 1, 2);

  -- MODULO 8: Identificando Problemas e Propondo Soluções
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Identificando Problemas e Propondo Soluções', 'Olhando para a comunidade com espírito de solução.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'De observador a agente de mudança', 'Todo grande projeto de melhoria começou com alguém percebendo um problema e pensando: ''e se a gente resolvesse isso?''', 'Identificar problemas na comunidade e propor soluções é uma habilidade cidadã poderosa. O primeiro passo é OBSERVAR: o que incomoda ou poderia estar melhor no seu bairro, escola ou grupo? Depois, é importante entender quem é afetado por esse problema, e pensar em soluções realistas — não precisam ser grandiosas, pequenas mudanças bem pensadas já fazem diferença. Por fim, vale pensar em como comunicar essa ideia para outras pessoas, e quem poderia ajudar a colocar a solução em prática (vizinhos, escola, responsáveis, autoridades locais). Esse processo — observar, entender, propor e comunicar — é a base de qualquer mudança positiva numa comunidade.

Você sabia? Muitas leis e políticas importantes começaram como uma ideia simples de um cidadão que percebeu um problema e decidiu agir.

Pergunta para pensar: Que problema você percebe no seu bairro, escola ou comunidade que gostaria de ajudar a resolver?

Desafio: Escolha um pequeno problema da sua comunidade e pense em uma solução simples e realista para ele.

Resumo: Mudanças positivas começam observando problemas, entendendo quem é afetado, propondo soluções realistas, e comunicando a ideia para quem pode ajudar.

Exemplo do cotidiano: Perceber que uma praça do bairro está com lixo acumulado pode levar à ideia de organizar um mutirão de limpeza com vizinhos e a ajuda de responsáveis.', 'Perceber que uma praça do bairro está com lixo acumulado pode levar à ideia de organizar um mutirão de limpeza com vizinhos e a ajuda de responsáveis.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Uma Solução para Minha Comunidade', '{"tipo": "formulario_projeto", "campos": ["Problema identificado na sua comunidade", "Quem é afetado por esse problema", "Solução proposta", "Quem poderia ajudar a colocar isso em prática"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: De observador a agente de mudança') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é o primeiro passo para propor uma solução para um problema da comunidade?', '["Ignorar o problema", "Observar e identificar o que poderia estar melhor", "Esperar alguém mais resolver", "Reclamar sem pensar em soluções"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Soluções para problemas da comunidade precisam ser sempre grandiosas?', '["Sim, sempre", "Não, pequenas mudanças bem pensadas também fazem diferença", "Só governos podem resolver problemas", "Não vale a pena tentar"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('respeitoso', 'Respeitoso', 'Completou o módulo Respeito e Empatia', '🤝') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('conhecedor_de_direitos', 'Conhecedor de Direitos', 'Completou o módulo Direitos e Deveres', '⚖️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('seguidor_consciente', 'Seguidor Consciente de Regras', 'Completou o módulo Regras', '📜') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cooperador', 'Cooperador', 'Completou o módulo Cooperação', '🤲') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mente_aberta', 'Mente Aberta', 'Completou o módulo Diversidade de Opiniões', '💭') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('pacificador', 'Pacificador', 'Completou o módulo Resolução de Conflitos', '🕊️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('vizinho_exemplar', 'Vizinho Exemplar', 'Completou o módulo Vivendo em Comunidade', '🏘️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('agente_de_mudanca', 'Agente de Mudança', 'Completou o módulo Identificando Problemas e Soluções', '💡') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cidadao_consciente', 'Cidadão Consciente', 'Concluiu o curso inteiro e a Solução para a Comunidade', '🌎') on conflict (code) do nothing;
end $$;