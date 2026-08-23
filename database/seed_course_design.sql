do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('criatividade-e-design', 'Criatividade e Design', 'Cores, formas, tipografia e como criar sua própria identidade visual.', '🎨', true, 7)
  returning id into v_course_id;

  -- MODULO 1: O que é Criatividade?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'O que é Criatividade?', 'Entendendo criatividade como uma habilidade que se treina.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Criatividade não é um dom mágico', 'Você já achou que só algumas pessoas ''nascem criativas''? Essa é uma ideia bem comum — mas não é bem assim!', 'Criatividade é a habilidade de gerar ideias novas ou combinar ideias já existentes de formas diferentes para resolver um problema ou expressar algo. Diferente do que muita gente pensa, criatividade não é um talento raro que só alguns nascem tendo — é uma habilidade que se desenvolve com prática, curiosidade e disposição para experimentar (e errar!). Uma boa forma de treinar a criatividade é observar o mundo com atenção, fazer perguntas do tipo ''e se...?'', e não ter medo de tentar ideias que parecem estranhas no início — muitas boas ideias começaram parecendo um pouco malucas.

Você sabia? Muitos designers e artistas famosos descartaram dezenas de ideias antes de chegar na que realmente funcionou — criatividade envolve tentar bastante, não acertar de primeira.

Pergunta para pensar: Você consegue lembrar de uma vez em que teve uma ideia criativa para resolver um problema do dia a dia?

Desafio: Pense em 3 usos diferentes e inesperados para um clipe de papel, além de prender papéis.

Resumo: Criatividade é uma habilidade que se desenvolve com prática e curiosidade — não é um talento reservado só para alguns.

Exemplo do cotidiano: Um copo plástico pode virar um porta-lápis, um pequeno vaso de planta, ou até parte de uma escultura — a mesma coisa, usada de formas criativas diferentes.', 'Um copo plástico pode virar um porta-lápis, um pequeno vaso de planta, ou até parte de uma escultura — a mesma coisa, usada de formas criativas diferentes.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Usos criativos para um objeto', '{"tipo": "formulario_projeto", "campos": ["Escolha um objeto comum (ex: caixa de papelão)", "Uso criativo 1", "Uso criativo 2", "Uso criativo 3"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Criatividade não é um dom mágico') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Criatividade é um talento que só algumas pessoas nascem tendo?', '["Sim, é um dom raro", "Não, é uma habilidade que se desenvolve com prática", "Só artistas têm", "Não pode ser treinada"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa forma de treinar a criatividade é:', '["Evitar tentar coisas novas", "Observar o mundo e fazer perguntas do tipo ''e se...?''", "Nunca errar", "Copiar exatamente o que já existe"]'::jsonb, 1, 2);

  -- MODULO 2: Cores: A Linguagem Silenciosa
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Cores: A Linguagem Silenciosa', 'Como cores comunicam sentimentos e mensagens sem palavras.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que as cores dizem sem falar nada', 'Você já notou como certas cores parecem ''combinar'' com certos sentimentos, mesmo sem ninguém explicar por quê?', 'Cores comunicam sentimentos e ideias mesmo sem palavras — isso se chama PSICOLOGIA DAS CORES. Por exemplo, o vermelho costuma transmitir energia ou urgência, o azul transmite calma e confiança, o amarelo transmite alegria e atenção, e o verde transmite natureza e crescimento. Isso não é uma regra fixa e absoluta (varia um pouco de cultura para cultura), mas é uma ferramenta poderosa usada em design: escolher as cores certas ajuda a comunicar a mensagem certa antes mesmo de qualquer texto ser lido.

Você sabia? Marcas e empresas escolhem as cores de seus logotipos com muito cuidado, pensando exatamente na sensação que querem transmitir para quem vê.

Pergunta para pensar: Que cor você associaria a um projeto sobre a natureza? E a um projeto sobre tecnologia?

Desafio: Escolha uma cor e escreva 2 sentimentos ou ideias que ela transmite para você.

Resumo: Cores comunicam sentimentos sem palavras — vermelho (energia), azul (calma), amarelo (alegria), verde (natureza), entre outras associações.

Exemplo do cotidiano: Um aplicativo de meditação provavelmente usaria tons de azul ou verde suaves para transmitir calma, e não vermelho vibrante, que passaria urgência.', 'Um aplicativo de meditação provavelmente usaria tons de azul ou verde suaves para transmitir calma, e não vermelho vibrante, que passaria urgência.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Qual cor combina?', '{"tipo": "classificacao", "situacoes": [{"item": "Um app de meditação (calma)", "resposta": "necessidade"}, {"item": "Um app de meditação usando vermelho vibrante", "resposta": "desejo"}, {"item": "Uma marca de sucos naturais usando verde", "resposta": "necessidade"}, {"item": "Uma marca de sucos naturais usando cinza escuro industrial", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que as cores dizem sem falar nada') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é psicologia das cores?', '["Um tipo de terapia", "Como as cores comunicam sentimentos e ideias sem palavras", "Uma regra rígida e universal", "Um tipo de tinta especial"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual cor costuma transmitir calma e confiança?', '["Vermelho vibrante", "Azul", "Laranja neon", "Preto puro"]'::jsonb, 1, 2);

  -- MODULO 3: Formas e Composição
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Formas e Composição', 'Como organizar elementos visuais de forma equilibrada.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Organizando o que os olhos veem', 'Já reparou como algumas imagens parecem ''bagunçadas'' e outras parecem ''organizadas'', mesmo sem saber explicar por quê?', 'COMPOSIÇÃO é a forma como os elementos visuais (formas, textos, imagens) são organizados dentro de um espaço. Uma boa composição ajuda o olho a entender o que é mais importante primeiro, e cria uma sensação de equilíbrio. Formas também comunicam algo: formas arredondadas costumam parecer mais amigáveis e suaves, enquanto formas angulares (como triângulos e quadrados) costumam parecer mais firmes ou tecnológicas. Um princípio simples de boa composição é deixar espaços vazios (chamados de espaço em branco) ao redor dos elementos principais — isso evita que tudo pareça amontoado e confuso.

Você sabia? O ''espaço em branco'' num design não é espaço desperdiçado — é uma ferramenta usada de propósito para destacar o que realmente importa.

Pergunta para pensar: Por que um cartaz com texto e imagens muito amontoados pode ser mais difícil de entender rapidamente?

Desafio: Observe uma capa de livro ou embalagem de produto e identifique o que está em destaque, e como o espaço foi organizado.

Resumo: Composição é a organização de elementos visuais no espaço. Espaço em branco e formas escolhidas com intenção ajudam a criar clareza e equilíbrio.

Exemplo do cotidiano: Um cartaz de evento com o título grande no centro e informações menores ao redor, com espaço vazio suficiente, é mais fácil de entender rapidamente do que um cartaz lotado de textos e imagens amontoados.', 'Um cartaz de evento com o título grande no centro e informações menores ao redor, com espaço vazio suficiente, é mais fácil de entender rapidamente do que um cartaz lotado de textos e imagens amontoados.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Formas e o que elas comunicam', '{"tipo": "classificacao", "situacoes": [{"item": "Formas arredondadas para uma marca de produtos infantis", "resposta": "necessidade"}, {"item": "Formas muito angulares e afiadas para produtos infantis", "resposta": "desejo"}, {"item": "Formas geométricas retas para uma empresa de tecnologia", "resposta": "necessidade"}, {"item": "Amontoar todos os elementos sem espaço vazio", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Organizando o que os olhos veem') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é composição em design?', '["A cor escolhida", "A organização dos elementos visuais no espaço", "O tamanho do papel", "Um tipo de fonte"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para que serve o ''espaço em branco'' num design?', '["É espaço desperdiçado", "Ajuda a destacar o que é mais importante e evita confusão", "Deve ser sempre evitado", "Não tem função nenhuma"]'::jsonb, 1, 2);

  -- MODULO 4: Contraste: Fazendo Coisas se Destacarem
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Contraste: Fazendo Coisas se Destacarem', 'Usando diferenças para chamar atenção para o que importa.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Por que algumas coisas ''saltam aos olhos''', 'Um texto escuro num fundo escuro é difícil de ler — mas por quê exatamente?', 'CONTRASTE é a diferença perceptível entre elementos — de cor, tamanho, ou forma — usada para destacar o que é mais importante. Um bom contraste ajuda o olho a identificar rapidamente o que deve ser notado primeiro. O exemplo mais comum é o contraste entre texto e fundo: texto escuro em fundo claro (ou vice-versa) é muito mais fácil de ler do que cores parecidas colocadas juntas. Contraste também pode ser de tamanho (um título grande se destaca de um texto pequeno) ou de estilo (uma palavra em negrito se destaca do resto do texto normal).

Você sabia? Designers profissionais usam ferramentas específicas para checar se o contraste entre texto e fundo é suficiente para pessoas com dificuldades de visão conseguirem ler com facilidade.

Pergunta para pensar: Por que um texto amarelo claro sobre fundo branco seria difícil de ler?

Desafio: Escolha duas cores que você acha que teriam bom contraste entre si, para um texto ficar bem legível.

Resumo: Contraste é a diferença perceptível entre elementos que ajuda a destacar o que é importante — essencial para legibilidade e hierarquia visual.

Exemplo do cotidiano: Um título em texto grande e preto sobre um fundo branco tem contraste forte, ficando fácil de ler à distância — diferente de um texto cinza claro sobre fundo branco, que é bem mais difícil.', 'Um título em texto grande e preto sobre um fundo branco tem contraste forte, ficando fácil de ler à distância — diferente de um texto cinza claro sobre fundo branco, que é bem mais difícil.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Bom contraste ou não?', '{"tipo": "classificacao", "situacoes": [{"item": "Texto preto sobre fundo branco", "resposta": "necessidade"}, {"item": "Texto amarelo claro sobre fundo branco", "resposta": "desejo"}, {"item": "Título grande e em negrito se destacando do texto normal", "resposta": "necessidade"}, {"item": "Todo o texto do mesmo tamanho e cor, sem nenhum destaque", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Por que algumas coisas ''saltam aos olhos''') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é contraste em design?', '["A cor de fundo apenas", "A diferença perceptível entre elementos, usada para destacar o importante", "Um tipo de fonte", "O tamanho do papel"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que texto escuro sobre fundo claro costuma ser mais legível?', '["Não é mais legível", "Porque tem bom contraste entre as cores", "Só por costume", "Não faz diferença nenhuma"]'::jsonb, 1, 2);

  -- MODULO 5: Tipografia: A Voz das Letras
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Tipografia: A Voz das Letras', 'Como a escolha das letras muda a mensagem transmitida.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'As letras também têm personalidade', 'A mesma palavra escrita em fontes diferentes pode parecer divertida, séria, elegante ou moderna. Isso é tipografia!', 'TIPOGRAFIA é a arte de escolher e organizar as letras (fontes) num design. Diferentes fontes transmitem sensações diferentes: fontes arredondadas e descontraídas parecem mais divertidas ou infantis, fontes com traços finos e elegantes parecem mais sofisticadas, e fontes simples e retas (como as usadas em placas de trânsito) parecem mais claras e funcionais. Um bom design geralmente usa poucas fontes diferentes (1 ou 2) para não ficar confuso, e escolhe a fonte pensando na mensagem que quer passar — um livro infantil e um documento oficial, por exemplo, provavelmente usariam fontes bem diferentes.

Você sabia? Existem milhares de fontes diferentes disponíveis, cada uma criada com uma personalidade e propósito específico em mente.

Pergunta para pensar: Que tipo de fonte você imagina que combinaria com um livro de contos de fadas? E com um documento sério de trabalho?

Desafio: Pense em 2 tipos de projeto diferentes (ex: convite de festa infantil e cartão de visita profissional) e descreva que estilo de fonte combinaria com cada um.

Resumo: Tipografia é a escolha das letras (fontes) num design — cada estilo de fonte transmite uma sensação diferente, e é importante escolher com intenção.

Exemplo do cotidiano: Um convite de festa de aniversário infantil provavelmente usaria uma fonte arredondada e colorida, enquanto um cartão de visita profissional usaria uma fonte mais simples e séria.', 'Um convite de festa de aniversário infantil provavelmente usaria uma fonte arredondada e colorida, enquanto um cartão de visita profissional usaria uma fonte mais simples e séria.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Fonte certa para o projeto certo', '{"tipo": "formulario_projeto", "campos": ["Um projeto que você imagina criar", "Que tipo de fonte (divertida, séria, elegante, simples) combinaria com ele e por quê"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: As letras também têm personalidade') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é tipografia?', '["A escolha de cores", "A arte de escolher e organizar as letras (fontes) num design", "O tamanho do papel", "Um tipo de desenho"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que é bom usar poucas fontes diferentes num design?', '["Não faz diferença", "Para não deixar o visual confuso", "Quanto mais fontes, melhor", "Fontes diferentes sempre combinam"]'::jsonb, 1, 2);

  -- MODULO 6: Desenho: Ideias que Ganham Forma
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Desenho: Ideias que Ganham Forma', 'Usando o desenho para expressar e planejar ideias.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Desenhar é pensar com as mãos', 'Você não precisa desenhar perfeitamente para usar o desenho como ferramenta de criação — o importante é comunicar uma ideia.', 'Desenho é uma ferramenta poderosa para expressar e planejar ideias, mesmo de forma simples. Designers frequentemente fazem RASCUNHOS (desenhos rápidos e simples) antes de criar a versão final de algo, só para organizar as ideias visualmente e testar diferentes possibilidades rapidamente. Não é necessário desenhar de forma realista ou perfeita — o objetivo do rascunho é comunicar uma ideia, não ser uma obra de arte finalizada. Praticar desenho regularmente, mesmo que simples, ajuda a desenvolver a habilidade de transformar ideias da cabeça em algo visual que outras pessoas conseguem entender.

Você sabia? Muitos designers profissionais fazem dezenas de pequenos rascunhos rápidos antes de escolher uma única ideia para desenvolver em detalhes.

Pergunta para pensar: Por que pode ser mais rápido desenhar uma ideia simples do que só explicar ela com palavras?

Desafio: Faça um rascunho simples (mesmo que rápido) de uma ideia de logotipo para um projeto imaginário seu.

Resumo: Desenho é uma ferramenta de pensamento visual — rascunhos simples ajudam a organizar e testar ideias antes da versão final.

Exemplo do cotidiano: Antes de criar o logotipo final de uma marca, um designer pode fazer 10 rascunhos rápidos e simples de diferentes ideias, escolhendo depois a melhor para desenvolver com mais detalhes.', 'Antes de criar o logotipo final de uma marca, um designer pode fazer 10 rascunhos rápidos e simples de diferentes ideias, escolhendo depois a melhor para desenvolver com mais detalhes.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Rascunho de ideia', '{"tipo": "formulario_projeto", "campos": ["Descreva em palavras uma ideia de desenho ou logotipo que você imagina", "Que elementos ele teria (formas, cores)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Desenhar é pensar com as mãos') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um rascunho em design?', '["A versão final e perfeita", "Um desenho rápido e simples para organizar ideias", "Um tipo de fonte", "Uma cor específica"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'É necessário desenhar perfeitamente para usar o desenho como ferramenta criativa?', '["Sim, sempre", "Não, o objetivo é comunicar a ideia", "Só profissionais podem desenhar", "Desenho não serve para planejar ideias"]'::jsonb, 1, 2);

  -- MODULO 7: Identidade Visual e Logotipo
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Identidade Visual e Logotipo', 'Criando um símbolo que representa uma ideia ou marca.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Um símbolo que representa uma ideia inteira', 'Você reconhece várias marcas só pelo símbolo, sem precisar ler o nome, certo? Isso é o poder de um bom logotipo.', 'IDENTIDADE VISUAL é o conjunto de elementos visuais (cores, fontes, logotipo) que representam uma marca, projeto ou pessoa de forma consistente. O LOGOTIPO é o símbolo principal dessa identidade — geralmente simples, fácil de reconhecer, e que funciona bem em tamanhos diferentes (tanto grande num cartaz quanto pequeno numa tela de celular). Um bom logotipo costuma ser simples ao invés de muito detalhado, porque precisa ser reconhecido rapidamente e funcionar em diferentes contextos. Criar uma identidade visual significa escolher cores, fontes e um logotipo que combinem entre si e comuniquem a mesma mensagem.

Você sabia? Muitos logotipos famosos passaram por dezenas de versões diferentes ao longo dos anos, sendo simplificados progressivamente para ficarem mais fáceis de reconhecer.

Pergunta para pensar: Qual logotipo você reconhece instantaneamente, mesmo de longe? O que faz ele ser tão reconhecível?

Desafio: Pense num nome para um projeto pessoal seu e imagine que cores e formas combinariam com a identidade visual dele.

Resumo: Identidade visual é o conjunto de cores, fontes e logotipo que representam algo de forma consistente. Um bom logotipo é simples e reconhecível.

Exemplo do cotidiano: O logotipo de uma marca de frutas pode usar uma forma simples e arredondada, em tons de verde e laranja, comunicando frescor de forma instantânea, mesmo sem nenhum texto.', 'O logotipo de uma marca de frutas pode usar uma forma simples e arredondada, em tons de verde e laranja, comunicando frescor de forma instantânea, mesmo sem nenhum texto.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Crie sua identidade visual', '{"tipo": "formulario_projeto", "campos": ["Nome do seu projeto ou marca pessoal", "Cores escolhidas e o que elas representam", "Ideia do logotipo (descreva em palavras)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Um símbolo que representa uma ideia inteira') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é identidade visual?', '["Só o nome de uma marca", "O conjunto de cores, fontes e logotipo que representam algo de forma consistente", "Um tipo de fonte específica", "Um cartaz apenas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como costuma ser um bom logotipo?', '["Muito detalhado e complexo", "Simples e fácil de reconhecer", "Sempre colorido com muitas cores", "Difícil de identificar rapidamente"]'::jsonb, 1, 2);

  -- MODULO 8: Criando um Cartaz
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Criando um Cartaz', 'Juntando cores, tipografia e composição num projeto real.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Comunicando uma mensagem em um único olhar', 'Um bom cartaz consegue passar uma mensagem clara em poucos segundos — vamos aprender como fazer isso!', 'Um CARTAZ é uma peça visual feita para comunicar uma mensagem de forma rápida e clara, geralmente à distância. Um bom cartaz combina tudo que você aprendeu até aqui: cores que comunicam a sensação certa, composição organizada com hierarquia clara (o mais importante em destaque), contraste que facilita a leitura, e tipografia escolhida com intenção. Um erro comum é colocar informação demais num cartaz — o ideal é escolher a mensagem principal e deixar ela bem clara, ao invés de tentar encaixar tudo.

Você sabia? Muitos designers seguem a regra de que um bom cartaz deveria ser entendido em menos de 5 segundos de olhar, mesmo à distância.

Pergunta para pensar: Se você tivesse que anunciar um evento num cartaz, qual seria a única informação mais importante que não poderia faltar?

Desafio: Planeje um cartaz simples para um evento imaginário, decidindo o título, a cor principal, e uma imagem ou forma central.

Resumo: Um bom cartaz combina cor, composição, contraste e tipografia para comunicar uma mensagem clara rapidamente — menos informação, bem organizada, funciona melhor.

Exemplo do cotidiano: Um cartaz de uma festa junina pode usar cores quentes (vermelho, amarelo, laranja), um título grande com o nome do evento, e poucas informações essenciais como data e local.', 'Um cartaz de uma festa junina pode usar cores quentes (vermelho, amarelo, laranja), um título grande com o nome do evento, e poucas informações essenciais como data e local.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Planeje seu cartaz', '{"tipo": "formulario_projeto", "campos": ["Título do cartaz (evento ou mensagem)", "Cor principal escolhida", "Uma imagem ou forma central que você usaria", "Informação essencial que não pode faltar"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Comunicando uma mensagem em um único olhar') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é importante evitar num bom cartaz?', '["Cores", "Informação demais, deixando confuso", "Um título", "Uma mensagem clara"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Um bom cartaz combina:', '["Apenas texto, sem nenhuma cor", "Cor, composição, contraste e tipografia trabalhando juntos", "Só imagens, sem nenhum texto", "O máximo de informação possível"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('mente_criativa', 'Mente Criativa', 'Completou o módulo O que é Criatividade?', '🎨') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_das_cores', 'Mestre das Cores', 'Completou o módulo Cores', '🌈') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('arquiteto_de_formas', 'Arquiteto de Formas', 'Completou o módulo Formas e Composição', '🔷') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_do_contraste', 'Mestre do Contraste', 'Completou o módulo Contraste', '⚡') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('tipografo', 'Tipógrafo', 'Completou o módulo Tipografia', '🔤') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('desenhista', 'Desenhista', 'Completou o módulo Desenho', '🖊️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('criador_de_marca', 'Criador de Marca', 'Completou o módulo Identidade Visual e Logotipo', '🏷️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cartazista', 'Cartazista', 'Completou o módulo Criando um Cartaz', '📌') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('designer_criativo', 'Designer Criativo', 'Concluiu o curso inteiro e a Identidade Visual', '🎨') on conflict (code) do nothing;
end $$;