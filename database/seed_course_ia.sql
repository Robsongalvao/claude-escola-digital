do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('inteligencia-artificial-para-criancas', 'Inteligência Artificial para Crianças', 'O que é IA, como usar com criatividade, e como verificar informações com responsabilidade.', '🤖', true, 5)
  returning id into v_course_id;

  -- MODULO 1: O que é Inteligência Artificial?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'O que é Inteligência Artificial?', 'Entendendo, de forma simples, o que é IA.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Uma máquina que aprende padrões', 'Você já imaginou como seu celular consegue reconhecer sua voz ou sugerir a próxima palavra que você vai digitar?', 'Inteligência Artificial (IA) é uma tecnologia feita para reconhecer padrões em grandes quantidades de informação e, a partir disso, gerar respostas, sugestões ou previsões. Diferente de uma calculadora simples que só segue uma conta fixa, uma IA ''aprende'' observando muitos exemplos — por exemplo, uma IA que reconhece gatos em fotos aprendeu isso vendo milhões de fotos de gatos antes. É importante entender: a IA não pensa como uma pessoa, não tem sentimentos de verdade, e não sabe tudo — ela apenas identifica padrões nos dados que recebeu para treinar.

Você sabia? A ideia de máquinas que ''pensam'' existe há décadas, mas a IA que usamos hoje (como assistentes de voz e chats) só se tornou realmente boa nos últimos anos.

Pergunta para pensar: Qual é a diferença entre uma calculadora simples e uma IA que reconhece padrões?

Desafio: Pense em 3 coisas do seu dia a dia que podem estar usando IA sem você perceber.

Resumo: IA é uma tecnologia que reconhece padrões a partir de muitos exemplos, mas não pensa nem sente como uma pessoa.

Exemplo do cotidiano: Quando seu celular sugere a próxima palavra ao digitar uma mensagem, ele está usando IA para prever, com base em padrões de outras pessoas, qual palavra provavelmente vem a seguir.', 'Quando seu celular sugere a próxima palavra ao digitar uma mensagem, ele está usando IA para prever, com base em padrões de outras pessoas, qual palavra provavelmente vem a seguir.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'IA ou não é IA?', '{"tipo": "classificacao", "situacoes": [{"item": "Um assistente de voz que responde perguntas faladas", "resposta": "necessidade"}, {"item": "Uma calculadora simples somando 2 + 2", "resposta": "desejo"}, {"item": "Um aplicativo que reconhece rostos em fotos", "resposta": "necessidade"}, {"item": "Um relógio mostrando a hora certa", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Uma máquina que aprende padrões') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é Inteligência Artificial?', '["Uma máquina com sentimentos reais", "Uma tecnologia que reconhece padrões a partir de exemplos", "Um robô que pensa como humano", "Uma calculadora comum"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'A IA pensa e sente como uma pessoa?', '["Sim, exatamente igual", "Não, ela apenas reconhece padrões nos dados", "Só as IAs mais modernas", "Depende do dia"]'::jsonb, 1, 2);

  -- MODULO 2: Onde Encontro IA no Meu Dia a Dia
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Onde Encontro IA no Meu Dia a Dia', 'Reconhecendo IA em aplicativos e ferramentas comuns.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'A IA está mais perto do que parece', 'Você provavelmente já usou IA hoje sem perceber. Vamos descobrir onde ela se esconde!', 'A IA está presente em várias ferramentas do dia a dia: assistentes virtuais (que respondem perguntas faladas), sistemas de RECOMENDAÇÃO (que sugerem vídeos, músicas ou produtos parecidos com o que você já gostou antes), reconhecimento de imagens (que identifica objetos ou rostos em fotos), e até corretores automáticos de texto. Essas ferramentas ''aprenderam'' analisando um padrão de comportamento — por exemplo, um sistema de recomendação de vídeos observa o que outras pessoas com gostos parecidos assistiram, para sugerir algo parecido para você.

Você sabia? Sistemas de recomendação são um dos usos mais comuns de IA no mundo, presentes em quase todo aplicativo de vídeos, música ou compras.

Pergunta para pensar: Você consegue lembrar de uma vez em que um aplicativo ''acertou'' uma recomendação para você? Como você acha que ele soube?

Desafio: Hoje, preste atenção em quantas vezes um aplicativo te sugere algo — e pense se aquilo pode ser IA funcionando.

Resumo: IA está em assistentes de voz, sistemas de recomendação e reconhecimento de imagens — sempre aprendendo com padrões de uso.

Exemplo do cotidiano: Quando um aplicativo de vídeos sugere ''você pode gostar disso'' com base no que você já assistiu, isso é um sistema de recomendação usando IA.', 'Quando um aplicativo de vídeos sugere ''você pode gostar disso'' com base no que você já assistiu, isso é um sistema de recomendação usando IA.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Onde vejo IA no meu dia?', '{"tipo": "formulario_projeto", "campos": ["Um app ou ferramenta que você usa que provavelmente tem IA", "O que essa IA faz nesse app"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: A IA está mais perto do que parece') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um sistema de recomendação?', '["Uma lista aleatória", "Uma IA que sugere coisas com base em padrões de gosto", "Um tipo de calculadora", "Um jogo apenas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual dessas ferramentas geralmente usa IA?', '["Um relógio analógico", "Um assistente de voz", "Uma régua", "Um lápis"]'::jsonb, 1, 2);

  -- MODULO 3: Como Conversar Bem com uma IA
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Como Conversar Bem com uma IA', 'Fazendo perguntas melhores para obter respostas melhores.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'A arte de fazer boas perguntas', 'Você sabia que a forma como você pergunta algo para uma IA muda bastante a qualidade da resposta que você recebe?', 'Ao conversar com uma IA de texto, quanto mais clara e específica for sua pergunta (chamada de PROMPT), melhor tende a ser a resposta. Uma pergunta vaga como ''me fale sobre animais'' gera uma resposta genérica, enquanto uma pergunta específica como ''quais são 3 curiosidades sobre golfinhos'' gera uma resposta mais útil e direcionada. Também é importante lembrar: se a resposta não ficou boa, você pode pedir para a IA explicar de outro jeito, dar mais detalhes, ou simplificar — conversar com IA é um processo, não precisa acertar a pergunta perfeita de primeira.

Você sabia? A habilidade de fazer boas perguntas para IAs já é considerada tão importante que algumas escolas e empresas ensinam isso como uma habilidade própria.

Pergunta para pensar: Qual seria uma pergunta melhor do que ''me conta sobre o espaço'' se você quisesse aprender sobre planetas?

Desafio: Se você tiver acesso a uma IA de texto (com supervisão de um responsável), pratique fazer uma pergunta bem específica sobre algo que você quer aprender.

Resumo: Perguntas específicas geram respostas melhores de uma IA. Se a resposta não ficou boa, você pode pedir para reformular.

Exemplo do cotidiano: Perguntar ''como funciona a fotossíntese, explicando para uma criança de 10 anos'' tende a gerar uma resposta muito melhor do que só perguntar ''fotossíntese''.', 'Perguntar ''como funciona a fotossíntese, explicando para uma criança de 10 anos'' tende a gerar uma resposta muito melhor do que só perguntar ''fotossíntese''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Melhorando minha pergunta', '{"tipo": "formulario_projeto", "campos": ["Uma pergunta vaga que você poderia fazer para uma IA", "Como você deixaria essa pergunta mais específica e clara"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: A arte de fazer boas perguntas') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um ''prompt''?', '["Um tipo de robô", "A pergunta ou instrução que você dá para uma IA", "Um erro da IA", "Um aplicativo específico"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Perguntas específicas para uma IA geralmente geram:', '["Respostas piores", "Respostas mais úteis e direcionadas", "Sempre a mesma resposta", "Nenhuma diferença"]'::jsonb, 1, 2);

  -- MODULO 4: IA que Cria: Textos e Imagens
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'IA que Cria: Textos e Imagens', 'Como funcionam as IAs que geram conteúdo novo.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Quando a IA vira uma ferramenta criativa', 'Além de responder perguntas, algumas IAs conseguem criar histórias, desenhos e até músicas novas!', 'Algumas IAs são feitas especificamente para GERAR conteúdo novo: textos (histórias, poemas, resumos), imagens (desenhos e ilustrações a partir de uma descrição) e até músicas. Essas IAs criam coisas ''novas'' combinando padrões aprendidos de milhões de exemplos anteriores — não é mágica, é matemática reconhecendo e recombinando padrões. Isso pode ser uma ferramenta criativa poderosa: ajudar a começar uma história quando você está sem ideias, ou visualizar um personagem que você imaginou. Mas é importante lembrar que o resultado gerado pela IA não substitui a sua própria criatividade — ela é mais útil como ponto de partida ou ferramenta de apoio.

Você sabia? Algumas IAs de imagem conseguem criar uma ilustração inteira a partir de apenas uma frase descrevendo o que você imagina.

Pergunta para pensar: Como uma IA poderia te ajudar a começar uma história que você está com dificuldade de imaginar?

Desafio: Pense numa ideia de história (personagem, lugar e problema) que você gostaria de pedir para uma IA ajudar a desenvolver, com supervisão de um responsável.

Resumo: IAs geradoras criam textos e imagens combinando padrões aprendidos. São ferramentas de apoio criativo, não substitutas da sua própria imaginação.

Exemplo do cotidiano: Pedir para uma IA ''criar uma pequena história sobre um dragão que tem medo de voar'' pode gerar um ponto de partida divertido para você continuar e adaptar do seu jeito.', 'Pedir para uma IA ''criar uma pequena história sobre um dragão que tem medo de voar'' pode gerar um ponto de partida divertido para você continuar e adaptar do seu jeito.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Ideia de história com IA', '{"tipo": "formulario_projeto", "campos": ["Personagem principal da história", "Lugar onde a história acontece", "Um problema que o personagem precisa resolver"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Quando a IA vira uma ferramenta criativa') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como uma IA geradora de texto cria histórias novas?', '["Por mágica", "Combinando padrões aprendidos de muitos exemplos", "Copiando uma história existente exatamente", "Ela não consegue criar nada novo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O conteúdo criado por uma IA deve:', '["Substituir completamente sua criatividade", "Ser usado como ponto de partida ou apoio criativo", "Nunca ser usado", "Ser sempre perfeito sem revisão"]'::jsonb, 1, 2);

  -- MODULO 5: A IA Pode Errar: Verificando Informações
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'A IA Pode Errar: Verificando Informações', 'Entendendo os limites da IA e a importância de checar fatos.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Nem tudo que a IA diz é verdade', 'Você sabia que uma IA pode responder algo com muita confiança e, mesmo assim, estar errada?', 'IAs de texto às vezes cometem erros — podem inventar informações que parecem reais mas não são, misturar fatos, ou simplesmente errar dados como datas e nomes. Isso acontece porque a IA gera respostas baseadas em padrões, não porque ela ''sabe'' a verdade com certeza absoluta. Por isso, é essencial VERIFICAR informações importantes que vêm de uma IA, especialmente para trabalhos escolares ou fatos que você vai compartilhar com outras pessoas — checando em fontes confiáveis, como livros, sites oficiais ou perguntando a um adulto que entenda do assunto. Usar IA não significa parar de pensar criticamente; significa usar o pensamento crítico ainda mais.

Você sabia? Esse tipo de erro da IA (inventar informação com confiança) tem até um nome técnico entre especialistas: ''alucinação''.

Pergunta para pensar: Por que é arriscado usar uma informação de uma IA num trabalho escolar sem checar antes?

Desafio: Se você usar uma IA para uma tarefa escolar, escolha uma informação dada por ela e confirme se é verdadeira em outra fonte.

Resumo: IAs podem errar ou inventar informações com confiança. Sempre verifique fatos importantes em fontes confiáveis antes de usar ou compartilhar.

Exemplo do cotidiano: Se uma IA disser uma data histórica que parece estranha, vale a pena checar num livro ou site confiável antes de usar essa informação num trabalho.', 'Se uma IA disser uma data histórica que parece estranha, vale a pena checar num livro ou site confiável antes de usar essa informação num trabalho.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Confio ou verifico?', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Usar qualquer resposta de IA sem checar em nenhuma fonte", "consequencia": "Isso pode espalhar informações erradas sem querer."}, {"texto": "Checar informações importantes em fontes confiáveis antes de usar", "consequencia": "Essa é a forma mais segura de garantir que a informação é verdadeira."}, {"texto": "Nunca usar IA para nada", "consequencia": "Não é necessário evitar completamente, só usar com pensamento crítico."}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Nem tudo que a IA diz é verdade') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma IA de texto pode errar ou inventar informações?', '["Não, ela é sempre perfeita", "Sim, isso pode acontecer", "Só em jogos", "Apenas com imagens"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer com uma informação importante que veio de uma IA?', '["Usar sem checar nada", "Verificar em fontes confiáveis antes de usar", "Ignorar sempre", "Compartilhar sem pensar"]'::jsonb, 1, 2);

  -- MODULO 6: Criatividade com IA: Inventando Histórias
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Criatividade com IA: Inventando Histórias', 'Usando IA como parceira criativa em projetos próprios.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Minha imaginação + IA como ferramenta', 'Que tal usar a IA como uma parceira de criatividade, ao invés de só uma fonte de respostas?', 'Usar IA de forma criativa significa tratar ela como uma colaboradora que ajuda a expandir suas próprias ideias, não como quem decide tudo sozinha. Você pode começar com uma ideia sua (um personagem, um cenário, um problema) e pedir para a IA ajudar a desenvolver partes específicas — como sugestões de nomes, descrições de lugares, ou desfechos possíveis para a história. O resultado final fica mais interessante quando você usa suas próprias escolhas para decidir o que manter, o que mudar, e o que descartar do que a IA sugeriu — a criatividade continua sendo sua.

Você sabia? Muitos escritores e artistas profissionais já usam IA como ferramenta de brainstorming, mas sempre revisando e ajustando o resultado com seu próprio estilo.

Pergunta para pensar: O que você acha mais divertido: criar uma história sozinho, ou criar em parceria com uma ferramenta que sugere ideias?

Desafio: Imagine que você vai pedir ajuda de uma IA para criar uma história. Escreva 3 perguntas que você faria para desenvolver essa ideia.

Resumo: IA pode ser uma parceira criativa — você traz a ideia principal, ela ajuda a desenvolver detalhes, e você decide o que manter no resultado final.

Exemplo do cotidiano: Um aluno pode criar o personagem principal sozinho, e pedir para a IA sugerir 3 nomes possíveis para esse personagem, escolhendo depois o que mais gostou.', 'Um aluno pode criar o personagem principal sozinho, e pedir para a IA sugerir 3 nomes possíveis para esse personagem, escolhendo depois o que mais gostou.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', '3 perguntas para desenvolver minha história', '{"tipo": "formulario_projeto", "campos": ["Primeira pergunta que faria à IA sobre sua história", "Segunda pergunta", "Terceira pergunta"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Minha imaginação + IA como ferramenta') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Usar IA de forma criativa significa:', '["Deixar a IA decidir tudo sozinha", "Usar a IA como parceira para expandir suas próprias ideias", "Nunca usar suas próprias ideias", "Copiar exatamente o que a IA sugere"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quem deve decidir o que manter do que a IA sugeriu?', '["A própria IA", "Você, usando sua criatividade", "Ninguém decide", "Sempre um professor"]'::jsonb, 1, 2);

  -- MODULO 7: Recomendações: Como a IA Sugere Coisas pra Mim
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Recomendações: Como a IA Sugere Coisas pra Mim', 'Entendendo como algoritmos de recomendação funcionam.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Por que esse vídeo apareceu para mim?', 'Já notou como alguns aplicativos parecem ''adivinhar'' exatamente o que você quer assistir ou ouvir?', 'Sistemas de recomendação usam IA para sugerir conteúdo (vídeos, músicas, produtos) com base no que você já assistiu, curtiu ou pesquisou antes, e também no que pessoas parecidas com você gostaram. Isso pode ser útil (descobrir coisas novas que você provavelmente vai gostar), mas também tem um lado importante de se pensar: esses sistemas tendem a mostrar sempre mais do mesmo tipo de conteúdo, criando uma ''bolha'' onde você vê principalmente coisas parecidas com o que já viu, e menos coisas diferentes. Ter consciência disso ajuda a buscar ativamente conteúdos variados, e não só o que o algoritmo sugere.

Você sabia? O termo usado para esse fenômeno de só ver conteúdo parecido é chamado de ''bolha de filtro''.

Pergunta para pensar: Você acha que só assistir ao que é recomendado pode limitar o que você aprende ou conhece? Por quê?

Desafio: Essa semana, procure ativamente por um assunto novo que você nunca pesquisou antes, ao invés de só seguir as recomendações automáticas.

Resumo: Recomendações de IA se baseiam no seu histórico de uso e podem criar uma ''bolha'' de conteúdo parecido — vale buscar coisas novas de vez em quando.

Exemplo do cotidiano: Se alguém só assiste vídeos sobre um único assunto, o algoritmo vai recomendar cada vez mais daquele mesmo assunto, tornando mais difícil descobrir coisas diferentes por conta própria.', 'Se alguém só assiste vídeos sobre um único assunto, o algoritmo vai recomendar cada vez mais daquele mesmo assunto, tornando mais difícil descobrir coisas diferentes por conta própria.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Saindo da bolha', '{"tipo": "formulario_projeto", "campos": ["Um assunto que você nunca pesquisou mas tem curiosidade de aprender"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Por que esse vídeo apareceu para mim?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como funcionam sistemas de recomendação?', '["Escolhem aleatoriamente", "Sugerem com base no seu histórico e em pessoas parecidas com você", "Perguntam diretamente o que você quer", "Não usam nenhuma informação"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma ''bolha de filtro''?', '["Um tipo de jogo", "Ver principalmente conteúdo parecido, limitando a diversidade", "Um erro de internet", "Um tipo de vírus"]'::jsonb, 1, 2);

  -- MODULO 8: Usando IA com Responsabilidade e Segurança
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Usando IA com Responsabilidade e Segurança', 'Privacidade, supervisão e uso ético da inteligência artificial.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Usando essa ferramenta poderosa com cuidado', 'Toda ferramenta poderosa merece ser usada com responsabilidade — e com IA não é diferente.', 'Usar IA com responsabilidade envolve alguns cuidados importantes: nunca compartilhar informações pessoais (nome completo, endereço, senha) em conversas com IA, sempre usar ferramentas de IA com a orientação de um responsável, e lembrar que o que você digita em algumas ferramentas de IA pode ser armazenado, então vale ter cuidado com o que é compartilhado. Além disso, é importante usar a IA de forma ÉTICA: não usar para enganar outras pessoas, não fingir que um trabalho totalmente feito pela IA é 100% seu sem falar isso, e sempre dar crédito quando apropriado. IA é uma ferramenta poderosa — e como toda ferramenta poderosa, funciona melhor quando usada com consciência.

Você sabia? Muitas ferramentas de IA têm uma idade mínima recomendada e políticas específicas sobre uso por crianças — por isso o acompanhamento de um responsável é sempre importante.

Pergunta para pensar: Por que pode ser importante avisar quando um trabalho teve ajuda de uma IA?

Desafio: Combine com um responsável quais ferramentas de IA você pode usar e em quais situações.

Resumo: Usar IA com responsabilidade significa proteger informações pessoais, ter supervisão de um responsável, e ser honesto sobre quando e como a IA foi usada.

Exemplo do cotidiano: Se um aluno usa uma IA para ajudar a organizar ideias de um trabalho escolar, é importante ser honesto com o professor sobre como a ferramenta foi usada, ao invés de esconder.', 'Se um aluno usa uma IA para ajudar a organizar ideias de um trabalho escolar, é importante ser honesto com o professor sobre como a ferramenta foi usada, ao invés de esconder.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Regras de uso responsável de IA', '{"tipo": "checklist_situacoes", "perguntas_checklist": ["Isso envolve compartilhar dados pessoais?", "Um responsável sabe que estou usando isso?", "Estou sendo honesto sobre o uso da IA?"], "situacoes": ["Digitar seu nome completo e endereço numa conversa com uma IA", "Usar uma IA para ajudar a organizar ideias de um trabalho escolar, avisando o professor", "Pedir para a IA responder uma prova inteira e entregar como se fosse só seu"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Usando essa ferramenta poderosa com cuidado') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que você nunca deve compartilhar em conversas com uma IA?', '["Uma dúvida sobre matemática", "Informações pessoais como endereço e senha", "Uma pergunta sobre animais", "Uma ideia de história"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Usar IA de forma ética envolve:', '["Fingir que um trabalho feito pela IA é totalmente seu", "Ser honesto sobre como e quando a IA foi usada", "Nunca contar para ninguém", "Enganar outras pessoas"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('explorador_de_ia', 'Explorador de IA', 'Completou o módulo O que é Inteligência Artificial?', '🤖') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cacador_de_ia', 'Caçador de IA', 'Completou o módulo Onde Encontro IA no Meu Dia a Dia', '🔎') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('comunicador_com_ia', 'Comunicador com IA', 'Completou o módulo Como Conversar Bem com uma IA', '💬') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('criador_com_ia', 'Criador com IA', 'Completou o módulo IA que Cria: Textos e Imagens', '🎨') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('checador_de_ia', 'Checador de Fatos da IA', 'Completou o módulo A IA Pode Errar', '🧐') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('contador_de_historias_ia', 'Contador de Histórias', 'Completou o módulo Criatividade com IA', '📖') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('curioso_das_recomendacoes', 'Curioso das Recomendações', 'Completou o módulo Recomendações', '🎯') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('ia_com_responsabilidade', 'IA com Responsabilidade', 'Completou o módulo Usando IA com Responsabilidade', '🛡️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('jovem_especialista_ia', 'Jovem Especialista em IA', 'Concluiu o curso inteiro e o Primeiro Projeto com IA', '🤖') on conflict (code) do nothing;
end $$;