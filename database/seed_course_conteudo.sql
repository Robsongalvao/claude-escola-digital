do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('criacao-de-conteudo-digital', 'Criação de Conteúdo Digital', 'Roteiro, fotografia, edição e como publicar conteúdo com responsabilidade.', '📱', true, 8)
  returning id into v_course_id;

  -- MODULO 1: Storytelling: Contando Histórias que Prendem Atenção
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Storytelling: Contando Histórias que Prendem Atenção', 'Como estruturar uma história que mantém o interesse de quem assiste.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Toda boa história tem uma estrutura', 'Você já assistiu um vídeo curto que te prendeu do início ao fim? Isso não é acaso — é storytelling bem feito.', 'STORYTELLING é a arte de contar histórias de forma envolvente. Mesmo um vídeo curto e educativo pode usar storytelling: começar despertando curiosidade (uma pergunta ou situação interessante), desenvolver a ideia principal de forma clara, e terminar com uma conclusão que fica na memória. Uma estrutura simples e eficaz é: INÍCIO (desperta interesse), MEIO (desenvolve a ideia principal) e FIM (conclusão ou chamada para ação). Histórias com essa estrutura tendem a prender mais atenção do que informações jogadas sem nenhuma organização.

Você sabia? Os primeiros segundos de um vídeo são os mais importantes para prender a atenção — se a pessoa perde o interesse logo no início, ela não continua assistindo.

Pergunta para pensar: Qual foi o último vídeo que te prendeu do início ao fim? O que fez você continuar assistindo?

Desafio: Pense num assunto que você gosta e escreva uma frase de abertura que despertaria curiosidade sobre ele.

Resumo: Storytelling é estruturar uma história com início (desperta interesse), meio (desenvolve a ideia) e fim (conclusão) para prender a atenção de quem assiste.

Exemplo do cotidiano: Um vídeo sobre ''como funcionam os vulcões'' pode começar com ''Você sabia que existe rocha derretida embaixo dos seus pés agora mesmo?'' — uma abertura que desperta curiosidade imediata.', 'Um vídeo sobre ''como funcionam os vulcões'' pode começar com ''Você sabia que existe rocha derretida embaixo dos seus pés agora mesmo?'' — uma abertura que desperta curiosidade imediata.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minha abertura de história', '{"tipo": "formulario_projeto", "campos": ["Assunto que você gostaria de contar", "Frase de abertura que desperta curiosidade", "Conclusão que fica na memória"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Toda boa história tem uma estrutura') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é storytelling?', '["Um tipo de câmera", "A arte de contar histórias de forma envolvente", "Um programa de edição", "Um tipo de música"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é a estrutura básica de uma boa história?', '["Só o meio, sem início nem fim", "Início (desperta interesse), meio (desenvolve) e fim (conclusão)", "Apenas imagens sem nenhuma estrutura", "Não existe estrutura fixa"]'::jsonb, 1, 2);

  -- MODULO 2: Roteiro: Planejando Antes de Gravar
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Roteiro: Planejando Antes de Gravar', 'Por que organizar as ideias antes de qualquer gravação.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Escrever antes de gravar economiza tempo', 'Gravar sem um plano costuma resultar em muitas tentativas e retrabalho. Um roteiro resolve isso.', 'Um ROTEIRO é o planejamento escrito do que será dito e mostrado num vídeo, antes de gravar qualquer coisa. Ele pode ser simples — não precisa ser um texto completo, palavra por palavra, mas deve conter os pontos principais na ordem certa, para não esquecer nada importante durante a gravação. Um bom roteiro geralmente responde: qual é o assunto principal? Quais os pontos mais importantes a incluir? Como o vídeo vai começar e terminar? Planejar isso antes evita gravações longas demais, cheias de pausas e repetições.

Você sabia? Muitos criadores de conteúdo profissionais escrevem o roteiro completo antes de ligar a câmera, mesmo para vídeos que parecem ''espontâneos''.

Pergunta para pensar: Por que gravar sem nenhum planejamento pode resultar em muitas tentativas repetidas?

Desafio: Escreva um roteiro simples (em tópicos) para um vídeo curto sobre um assunto que você domina.

Resumo: Roteiro é o planejamento escrito antes de gravar — organiza os pontos principais e evita retrabalho durante a gravação.

Exemplo do cotidiano: Um roteiro simples para um vídeo sobre ''como cuidar de uma planta'' pode ter tópicos como: introdução, quanta água dar, quanto sol precisa, e uma dica final.', 'Um roteiro simples para um vídeo sobre ''como cuidar de uma planta'' pode ter tópicos como: introdução, quanta água dar, quanto sol precisa, e uma dica final.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu roteiro em tópicos', '{"tipo": "formulario_projeto", "campos": ["Assunto do vídeo", "Ponto principal 1", "Ponto principal 2", "Como vai terminar"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Escrever antes de gravar economiza tempo') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um roteiro?', '["A edição final do vídeo", "O planejamento escrito do que será dito e mostrado, antes de gravar", "Um tipo de câmera", "A legenda do vídeo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que fazer um roteiro antes de gravar?', '["Não é necessário", "Evita retrabalho e esquecimentos durante a gravação", "Deixa o vídeo mais longo", "Só serve para vídeos profissionais"]'::jsonb, 1, 2);

  -- MODULO 3: Enquadramento e Fotografia
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Enquadramento e Fotografia', 'Como posicionar a câmera para comunicar melhor.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Onde colocar a câmera importa', 'A mesma cena pode parecer completamente diferente dependendo de como a câmera está posicionada.', 'ENQUADRAMENTO é a forma como a câmera é posicionada para capturar uma cena — o que aparece dentro do quadro e o que fica de fora. Um princípio simples e muito usado é a REGRA DOS TERÇOS: imaginar a tela dividida em 3 partes (como um jogo da velha) e posicionar o elemento principal perto de uma dessas linhas, ao invés de sempre no centro exato — isso costuma deixar a composição mais interessante visualmente. Também é importante pensar em ILUMINAÇÃO: gravar de frente para uma janela ou luz costuma deixar a imagem mais clara e agradável do que gravar contra a luz (o que deixa a pessoa escura, como uma silhueta).

Você sabia? A regra dos terços é usada há séculos em pinturas, e continua sendo usada hoje em fotografia e vídeo profissional.

Pergunta para pensar: Por que gravar de costas para uma janela pode deixar a imagem escura demais?

Desafio: Se você tiver uma câmera disponível, tente posicionar um objeto seguindo a regra dos terços, ao invés de deixar ele sempre no centro.

Resumo: Enquadramento é como a câmera captura a cena. A regra dos terços e a boa iluminação (de frente para a luz) melhoram bastante a qualidade visual.

Exemplo do cotidiano: Ao gravar um vídeo em um quarto, posicionar a câmera de frente para a janela (não de costas) deixa o rosto bem iluminado, ao invés de escuro e difícil de ver.', 'Ao gravar um vídeo em um quarto, posicionar a câmera de frente para a janela (não de costas) deixa o rosto bem iluminado, ao invés de escuro e difícil de ver.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Boa ou má iluminação?', '{"tipo": "classificacao", "situacoes": [{"item": "Gravar de frente para uma janela iluminada", "resposta": "necessidade"}, {"item": "Gravar de costas para uma janela iluminada", "resposta": "desejo"}, {"item": "Gravar num ambiente com luz suficiente para ver o rosto claramente", "resposta": "necessidade"}, {"item": "Gravar num ambiente completamente escuro", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Onde colocar a câmera importa') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é a regra dos terços?', '["Filmar sempre no centro exato", "Dividir a tela em 3 partes e posicionar o elemento principal perto de uma linha", "Um tipo de edição", "Uma regra sobre áudio"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que gravar de frente para a luz costuma ser melhor?', '["Não faz diferença", "Deixa a imagem mais clara e agradável, evitando silhueta escura", "Deixa a imagem sempre pior", "Só importa em fotos profissionais"]'::jsonb, 1, 2);

  -- MODULO 4: Áudio: O Som Também Conta a História
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Áudio: O Som Também Conta a História', 'Por que um bom áudio é tão importante quanto uma boa imagem.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Um áudio ruim pode arruinar um vídeo bom', 'Você já assistiu um vídeo com imagem boa, mas o som tão ruim que ficou difícil de entender? Isso mostra como o áudio importa.', 'Áudio de qualidade é tão importante quanto uma boa imagem — muitas vezes, as pessoas toleram mais um vídeo com imagem simples e áudio claro, do que o contrário. Alguns cuidados simples fazem grande diferença: gravar em um ambiente sem muito barulho de fundo (ventilador, trânsito, conversas), falar de forma clara e num ritmo que não seja rápido demais, e ficar numa distância razoável do microfone (nem muito perto, o que distorce o som, nem muito longe, o que deixa o áudio baixo e cheio de eco). Testar o áudio antes de gravar o vídeo inteiro evita ter que regravar tudo depois.

Você sabia? Muitos criadores de conteúdo investem primeiro num bom microfone antes de investir numa câmera melhor, porque o áudio ruim afasta mais o público do que uma imagem simples.

Pergunta para pensar: Por que um ambiente silencioso é importante para gravar um bom áudio?

Desafio: Se possível, grave um áudio curto de teste e ouça de volta, prestando atenção em ruídos de fundo.

Resumo: Áudio claro é essencial — ambiente silencioso, fala clara, e distância adequada do microfone fazem grande diferença na qualidade.

Exemplo do cotidiano: Gravar perto de um ventilador ligado pode fazer o áudio final ficar cheio de ruído de fundo, mesmo que a imagem esteja perfeita.', 'Gravar perto de um ventilador ligado pode fazer o áudio final ficar cheio de ruído de fundo, mesmo que a imagem esteja perfeita.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'O que evitar num bom áudio?', '{"tipo": "checklist_situacoes", "perguntas_checklist": ["Tem barulho de fundo?", "A fala está clara?", "A distância do microfone está adequada?"], "situacoes": ["Gravar perto de um ventilador ligado", "Gravar num quarto silencioso, falando de forma pausada", "Gravar gritando muito perto do microfone", "Gravar muito longe do microfone, com voz baixa"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Um áudio ruim pode arruinar um vídeo bom') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que o áudio é tão importante quanto a imagem num vídeo?', '["Não é importante", "Um áudio ruim pode afastar quem está assistindo, mesmo com boa imagem", "Áudio nunca importa em vídeos", "Só imagem importa"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que ajuda a ter um bom áudio na gravação?', '["Gravar perto de ruídos altos", "Ambiente silencioso e distância adequada do microfone", "Falar o mais rápido possível", "Ignorar o som completamente"]'::jsonb, 1, 2);

  -- MODULO 5: Edição Básica: Dando Ritmo ao Conteúdo
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Edição Básica: Dando Ritmo ao Conteúdo', 'Como cortes e organização tornam um vídeo mais interessante.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'A mágica acontece na edição', 'Muito do que torna um vídeo interessante acontece depois da gravação: na edição!', 'EDIÇÃO é o processo de organizar, cortar e ajustar as partes gravadas para formar o vídeo final. Um dos recursos mais básicos e importantes é o CORTE: remover partes desnecessárias, pausas longas, ou erros de fala, deixando o vídeo mais dinâmico e direto. Um bom RITMO de edição significa que o vídeo não fica nem rápido demais (difícil de acompanhar) nem lento demais (cansativo de assistir). Editores também costumam adicionar elementos simples como texto na tela para reforçar pontos importantes, sem exagerar na quantidade de efeitos.

Você sabia? Muitos vídeos profissionais passam bem mais tempo sendo editados do que sendo gravados — a edição é onde a história realmente ganha forma final.

Pergunta para pensar: Por que cortar pausas longas e erros de fala deixa um vídeo mais agradável de assistir?

Desafio: Se você gravar um vídeo de teste, tente identificar quais partes você cortaria na edição.

Resumo: Edição é organizar e cortar o material gravado, criando ritmo e removendo o desnecessário — é onde o vídeo final ganha forma.

Exemplo do cotidiano: Um vídeo de 5 minutos gravado pode virar um vídeo final de 2 minutos depois da edição, removendo pausas, repetições e erros de fala.', 'Um vídeo de 5 minutos gravado pode virar um vídeo final de 2 minutos depois da edição, removendo pausas, repetições e erros de fala.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'O que cortar na edição?', '{"tipo": "classificacao", "situacoes": [{"item": "Uma pausa longa de 10 segundos sem falar nada", "resposta": "desejo"}, {"item": "Um erro de fala repetido, corrigido logo depois", "resposta": "desejo"}, {"item": "A explicação principal do assunto", "resposta": "necessidade"}, {"item": "A conclusão do vídeo", "resposta": "necessidade"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: A mágica acontece na edição') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é edição de vídeo?', '["Só gravar o vídeo", "Organizar, cortar e ajustar as partes gravadas para formar o vídeo final", "Um tipo de roteiro", "A publicação do vídeo apenas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que cortar pausas longas e erros na edição é útil?', '["Não é útil", "Deixa o vídeo mais dinâmico e agradável de assistir", "Deixa o vídeo mais longo", "Atrapalha a compreensão"]'::jsonb, 1, 2);

  -- MODULO 6: Thumbnail e Legenda: A Primeira Impressão
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Thumbnail e Legenda: A Primeira Impressão', 'Como a capa e o texto de apresentação influenciam quem assiste.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Antes de assistir, a pessoa vê a capa', 'Antes de clicar em qualquer vídeo, você já formou uma primeira impressão pela imagem e pelo texto que apareceram, certo?', 'THUMBNAIL é a imagem de capa que representa um vídeo antes de ser assistido — geralmente a primeira coisa que a pessoa vê. Uma boa thumbnail costuma ser clara, com boa iluminação, e dá uma pista honesta sobre o que o vídeo mostra, sem enganar quem vai assistir. A LEGENDA (ou título e descrição) é o texto que acompanha o vídeo, resumindo do que se trata de forma clara e interessante. É importante que a thumbnail e a legenda sejam honestas com o conteúdo real do vídeo — usar imagens ou textos enganosos só para conseguir cliques (chamado de ''clickbait'') quebra a confiança de quem assiste.

Você sabia? Muitos criadores de conteúdo passam bastante tempo pensando só na thumbnail e no título, porque eles determinam se alguém vai clicar ou não no vídeo.

Pergunta para pensar: Você já clicou num vídeo por causa da thumbnail e ficou decepcionado porque o conteúdo não tinha nada a ver? Como isso te fez sentir?

Desafio: Pense num título e numa ideia de thumbnail honesta para um vídeo educativo que você criaria.

Resumo: Thumbnail e legenda formam a primeira impressão de um vídeo — devem ser claras, atrativas e honestas sobre o conteúdo real.

Exemplo do cotidiano: Uma thumbnail mostrando exatamente o assunto do vídeo, com um título claro como ''Como plantar uma horta em casa'', é mais honesta do que uma imagem exagerada prometendo algo que o vídeo não entrega.', 'Uma thumbnail mostrando exatamente o assunto do vídeo, com um título claro como ''Como plantar uma horta em casa'', é mais honesta do que uma imagem exagerada prometendo algo que o vídeo não entrega.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minha thumbnail e legenda', '{"tipo": "formulario_projeto", "campos": ["Título do vídeo", "Descrição da thumbnail (o que apareceria na imagem)", "Legenda curta explicando do que se trata"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Antes de assistir, a pessoa vê a capa') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma thumbnail?', '["O roteiro do vídeo", "A imagem de capa que representa o vídeo", "O áudio do vídeo", "A edição final"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é ''clickbait''?', '["Uma boa prática de edição", "Usar imagens ou textos enganosos só para conseguir cliques", "Um tipo de roteiro", "Uma forma honesta de apresentar conteúdo"]'::jsonb, 1, 2);

  -- MODULO 7: Direitos Autorais e Uso Responsável de Imagens
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Direitos Autorais e Uso Responsável de Imagens', 'Entendendo o que pode e o que não pode ser usado em conteúdos.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Nem tudo que está na internet pode ser usado livremente', 'Você sabia que usar uma música ou imagem de outra pessoa sem permissão pode causar problemas, mesmo em conteúdo feito por diversão?', 'DIREITOS AUTORAIS são as regras que protegem o trabalho de quem criou algo (uma música, imagem, vídeo) — significa que outras pessoas não podem simplesmente usar esse conteúdo sem permissão. Isso vale mesmo para conteúdos encontrados livremente na internet: só porque uma imagem apareceu numa busca, não significa que ela pode ser usada livremente em qualquer projeto. Existem imagens, músicas e vídeos disponibilizados com licenças que permitem uso livre (geralmente indicadas explicitamente) — vale sempre buscar por esse tipo de conteúdo, ou criar material próprio, ao invés de usar qualquer coisa encontrada sem checar a permissão.

Você sabia? Existem bancos de imagens e músicas gratuitas feitos especificamente para uso livre em projetos, criados exatamente para resolver esse problema.

Pergunta para pensar: Por que não é justo usar o trabalho de outra pessoa sem dar crédito ou pedir permissão?

Desafio: Se você fosse criar um vídeo, pense em como conseguiria imagens ou músicas de forma responsável (fazendo você mesmo, ou buscando conteúdo livre).

Resumo: Direitos autorais protegem o trabalho de criadores. Usar conteúdo de outras pessoas requer permissão ou uma licença de uso livre — nem tudo na internet pode ser usado livremente.

Exemplo do cotidiano: Ao invés de usar uma música popular protegida por direitos autorais num vídeo, um criador responsável busca músicas com licença de uso livre, criadas especificamente para esse fim.', 'Ao invés de usar uma música popular protegida por direitos autorais num vídeo, um criador responsável busca músicas com licença de uso livre, criadas especificamente para esse fim.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Posso usar isso no meu vídeo?', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Usar qualquer imagem ou música encontrada na internet sem checar nada", "consequencia": "Isso pode violar direitos autorais de quem criou o conteúdo."}, {"texto": "Usar apenas conteúdo próprio ou com licença de uso livre", "consequencia": "Essa é a forma responsável e segura de criar conteúdo."}, {"texto": "Nunca usar nenhuma imagem ou música", "consequencia": "Não é necessário evitar completamente, só é preciso checar a permissão de uso."}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Nem tudo que está na internet pode ser usado livremente') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que são direitos autorais?', '["Uma regra sem importância", "Regras que protegem o trabalho de quem criou algo", "Um tipo de câmera", "Uma edição especial"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Toda imagem encontrada numa busca na internet pode ser usada livremente?', '["Sim, sempre", "Não, é preciso checar a licença de uso", "Só imagens coloridas", "Só se for antiga"]'::jsonb, 1, 2);

  -- MODULO 8: Publicando com Segurança
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Publicando com Segurança', 'Cuidados finais antes de compartilhar um conteúdo.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Antes de publicar, uma última checagem', 'Depois de gravar e editar, ainda falta um passo importante: publicar com responsabilidade.', 'Antes de publicar qualquer conteúdo, vale fazer uma checagem final de segurança: o vídeo revela informações pessoais sem querer (endereço, escola, rotina)? Um responsável já viu e aprovou o conteúdo? As imagens e sons usados são próprios ou têm permissão de uso? O conteúdo é verdadeiro e não engana quem vai assistir? Publicar conteúdo online, especialmente para crianças e adolescentes, deve sempre envolver a supervisão de um responsável — desde a escolha da plataforma até a decisão do que realmente vale a pena compartilhar publicamente.

Você sabia? Muitas plataformas de vídeo têm configurações de privacidade que permitem compartilhar conteúdo só com pessoas específicas, ao invés de publicamente para qualquer um — vale conhecer essas opções com ajuda de um responsável.

Pergunta para pensar: Por que é importante ter a aprovação de um responsável antes de publicar qualquer conteúdo online?

Desafio: Se você fosse publicar um vídeo, liste 3 coisas que você checaria antes de compartilhar.

Resumo: Antes de publicar, cheque se o conteúdo é seguro, honesto, respeita direitos autorais, e tem a aprovação de um responsável.

Exemplo do cotidiano: Antes de publicar um vídeo, um criador responsável revisa se apareceu algo pessoal sem querer no fundo da gravação, como um endereço ou uniforme escolar visível.', 'Antes de publicar um vídeo, um criador responsável revisa se apareceu algo pessoal sem querer no fundo da gravação, como um endereço ou uniforme escolar visível.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Checklist antes de publicar', '{"tipo": "checklist_situacoes", "perguntas_checklist": ["Revela informações pessoais?", "Um responsável aprovou?", "Uso conteúdo próprio ou com permissão?", "É honesto com quem vai assistir?"], "situacoes": ["Vídeo com endereço de casa visível no fundo, sem querer", "Vídeo revisado e aprovado por um responsável antes de publicar", "Vídeo usando apenas fotos e músicas criadas pelo próprio autor", "Vídeo com thumbnail enganosa (clickbait)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Antes de publicar, uma última checagem') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é importante checar antes de publicar um conteúdo?', '["Nada, pode publicar direto", "Se é seguro, honesto, e tem aprovação de um responsável", "Só o número de curtidas esperado", "Apenas a duração do vídeo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que a supervisão de um responsável é importante antes de publicar?', '["Não é importante", "Ajuda a garantir segurança e uso responsável do conteúdo", "Atrapalha a criatividade", "Só serve para adultos"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('mestre_do_storytelling', 'Mestre do Storytelling', 'Completou o módulo Storytelling', '📖') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('roteirista', 'Roteirista', 'Completou o módulo Roteiro', '✍️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('fotografo_iniciante', 'Fotógrafo Iniciante', 'Completou o módulo Enquadramento e Fotografia', '📸') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('engenheiro_de_som', 'Engenheiro de Som', 'Completou o módulo Áudio', '🎙️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('editor_de_video', 'Editor de Vídeo', 'Completou o módulo Edição Básica', '✂️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_da_thumbnail', 'Mestre da Thumbnail', 'Completou o módulo Thumbnail e Legenda', '🖼️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('respeitador_de_direitos', 'Respeitador de Direitos Autorais', 'Completou o módulo Direitos Autorais', '©️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('publicador_seguro', 'Publicador Seguro', 'Completou o módulo Publicando com Segurança', '🔒') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('criador_de_conteudo', 'Criador de Conteúdo', 'Concluiu o curso inteiro e o Primeiro Vídeo Educativo', '📱') on conflict (code) do nothing;
end $$;