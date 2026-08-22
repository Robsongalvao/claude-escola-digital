do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('informatica-do-zero', 'Informática do Zero', 'Computador, arquivos, internet, e-mail e os primeiros documentos digitais.', '💻', true, 3)
  returning id into v_course_id;

  -- MODULO 1: O que é um computador?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'O que é um computador?', 'Hardware, software e as partes que você usa todo dia.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Por dentro do computador', 'Você já imaginou como seu computador consegue entender o que você digita e mostrar isso na tela?', 'HARDWARE são as partes físicas do computador — as que você pode tocar: o monitor (a tela), o teclado (onde você digita), o mouse (para clicar e apontar), e o gabinete (onde ficam as peças que processam tudo). SOFTWARE são os programas — as instruções que fazem o hardware funcionar de um jeito útil, como o navegador de internet, um editor de texto ou um jogo. Pense assim: o hardware é o corpo do computador, e o software é como uma receita que diz o que esse corpo deve fazer. Sem software, o hardware é só uma caixa de peças; sem hardware, o software não tem onde rodar.

Você sabia? O primeiro mouse de computador foi inventado nos anos 1960 e era feito de madeira!

Pergunta para pensar: Se seu celular também tem hardware e software, quais partes dele você consegue identificar?

Desafio: Olhe para o computador ou celular mais próximo e tente identificar 3 partes de hardware.

Resumo: Hardware são as partes físicas; software são os programas que fazem o hardware funcionar de forma útil.

Exemplo do cotidiano: O monitor mostrando a tela é hardware. O navegador que você usa para acessar sites é software rodando dentro daquele hardware.', 'O monitor mostrando a tela é hardware. O navegador que você usa para acessar sites é software rodando dentro daquele hardware.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Hardware ou Software?', '{"tipo": "classificacao", "situacoes": [{"item": "Teclado", "resposta": "necessidade"}, {"item": "Navegador de internet", "resposta": "desejo"}, {"item": "Mouse", "resposta": "necessidade"}, {"item": "Editor de texto", "resposta": "desejo"}, {"item": "Monitor", "resposta": "necessidade"}, {"item": "Aplicativo de jogos", "resposta": "desejo"}, {"item": "Gabinete (a caixa do computador)", "resposta": "necessidade"}, {"item": "Sistema operacional", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Por dentro do computador') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é hardware?', '["Os programas do computador", "As partes físicas do computador", "A internet", "Um tipo de arquivo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é software?', '["As peças físicas", "Os programas e instruções que rodam no hardware", "O monitor", "O teclado"]'::jsonb, 1, 2);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual desses é um exemplo de hardware?', '["Navegador de internet", "Mouse", "Editor de texto", "Aplicativo de mensagens"]'::jsonb, 1, 3);

  -- MODULO 2: Organização Digital
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Organização Digital', 'Arquivos, pastas e como manter tudo em ordem no computador.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Arquivos e pastas: minha gaveta digital', 'Você organiza roupas em gavetas e livros em estantes — no computador, usamos pastas e arquivos do mesmo jeito!', 'Um ARQUIVO é qualquer coisa salva no computador: um texto, uma foto, uma música, um vídeo. Uma PASTA é como uma gaveta digital que guarda arquivos (e até outras pastas dentro dela) organizados por assunto. Organizar bem os arquivos em pastas com nomes claros evita perder tempo procurando algo depois. Uma boa prática é criar uma pasta principal para cada assunto grande (como ''Escola'' ou ''Fotos'') e, dentro dela, subpastas mais específicas (como ''Escola > Matemática'' ou ''Fotos > Aniversário'').

Você sabia? Um computador pode guardar milhões de arquivos — por isso a organização em pastas é tão importante, senão fica impossível encontrar as coisas depois.

Pergunta para pensar: Como você organizaria seus arquivos escolares em pastas?

Desafio: Se você tem acesso a um computador, crie uma pasta nova com um nome claro para guardar algo que você usa com frequência.

Resumo: Arquivos são os itens salvos; pastas organizam esses arquivos por assunto, facilitando encontrar tudo depois.

Exemplo do cotidiano: Ao invés de salvar todos os trabalhos escolares soltos numa única pasta bagunçada, um aluno organizado cria ''Escola > Português'', ''Escola > Matemática'', e assim por diante.', 'Ao invés de salvar todos os trabalhos escolares soltos numa única pasta bagunçada, um aluno organizado cria ''Escola > Português'', ''Escola > Matemática'', e assim por diante.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Organize as pastas', '{"tipo": "formulario_projeto", "campos": ["Nome de uma pasta principal que você criaria", "3 subpastas que ficariam dentro dela"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Arquivos e pastas: minha gaveta digital') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um arquivo?', '["Uma gaveta digital", "Algo salvo no computador, como um texto ou foto", "Um tipo de internet", "Um programa apenas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para que servem as pastas?', '["Para deixar o computador mais lento", "Para organizar arquivos por assunto", "Não servem para nada", "Só para fotos"]'::jsonb, 1, 2);

  -- MODULO 3: Navegando na Internet
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Navegando na Internet', 'Navegadores, pesquisa e como buscar informações com segurança.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Como funciona a internet que eu uso', 'Você já se perguntou como um site do outro lado do mundo aparece na sua tela em segundos?', 'A internet é uma gigantesca rede que conecta computadores do mundo todo, permitindo trocar informações. Para acessar sites, usamos um NAVEGADOR (como Chrome, Firefox ou Edge) — um programa feito especialmente para mostrar páginas da internet. Para encontrar informações, usamos um MECANISMO DE PESQUISA (como o Google), digitando palavras-chave sobre o que queremos saber. Uma boa pesquisa usa palavras específicas (não frases muito longas) e, o mais importante: nem tudo que aparece na internet é verdade, então é essencial checar se a informação vem de uma fonte confiável antes de acreditar nela.

Você sabia? A internet não tem um único ''dono'' — ela é formada por milhões de redes de computadores conectadas entre si ao redor do mundo.

Pergunta para pensar: Como você poderia checar se uma informação que você leu na internet é verdadeira?

Desafio: Da próxima vez que pesquisar algo, tente usar 2-3 palavras-chave específicas ao invés de uma frase inteira, e veja se o resultado melhora.

Resumo: Navegadores mostram sites; mecanismos de pesquisa ajudam a encontrar informação. Nem tudo na internet é verdade — é preciso checar as fontes.

Exemplo do cotidiano: Pesquisar ''capital da França'' é mais eficiente do que digitar ''eu queria saber qual é a capital do país França por favor''.', 'Pesquisar ''capital da França'' é mais eficiente do que digitar ''eu queria saber qual é a capital do país França por favor''.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Pesquisa boa vs. pesquisa ruim', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Acreditar em qualquer informação só porque estava na internet", "consequencia": "Isso pode te fazer acreditar em informações falsas, então é arriscado."}, {"texto": "Checar se a informação aparece em mais de uma fonte confiável", "consequencia": "Essa é a forma mais segura de confirmar se algo é verdade."}, {"texto": "Nunca pesquisar nada na internet", "consequencia": "Isso te impede de aproveitar uma ferramenta útil de aprendizado."}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Como funciona a internet que eu uso') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um navegador?', '["Um tipo de arquivo", "Um programa para acessar sites na internet", "Um mecanismo de pesquisa apenas", "Um tipo de pasta"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que é importante checar fontes na internet?', '["Não é importante", "Porque nem tudo que aparece é verdade", "Só para deixar mais lento", "Porque é proibido pesquisar"]'::jsonb, 1, 2);

  -- MODULO 4: E-mail: Minha Caixa de Mensagens
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'E-mail: Minha Caixa de Mensagens', 'Como funciona o e-mail e boas práticas de uso.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Enviando minha primeira mensagem digital', 'Você sabia que uma mensagem de e-mail pode chegar do outro lado do mundo em poucos segundos?', 'E-mail é uma forma de enviar mensagens digitais para qualquer pessoa que tenha um endereço de e-mail, em qualquer lugar do mundo. Um e-mail tem partes importantes: o DESTINATÁRIO (para quem vai), o ASSUNTO (um resumo curto do que a mensagem trata) e o CORPO (o texto da mensagem em si). Escrever um e-mail educado e claro é uma habilidade importante — começar com uma saudação, explicar o motivo da mensagem com clareza, e terminar de forma educada. E-mails são frequentemente usados para assuntos importantes (escola, trabalho), por isso vale caprichar mais do que numa mensagem informal de chat.

Você sabia? O e-mail existe desde antes da internet como conhecemos hoje — uma das primeiras formas de comunicação digital que existiram!

Pergunta para pensar: Qual seria um bom assunto para um e-mail avisando que você vai faltar a uma atividade?

Desafio: Se você (com ajuda de um responsável) tiver acesso a um e-mail, pratique escrever uma mensagem educada para alguém da família.

Resumo: E-mail é uma forma de enviar mensagens digitais, com destinatário, assunto e corpo. Uma boa escrita de e-mail é clara e educada.

Exemplo do cotidiano: Um e-mail com o assunto ''Dúvida sobre a tarefa de matemática'' é muito mais claro do que um sem assunto nenhum, porque a pessoa já sabe do que se trata antes de abrir.', 'Um e-mail com o assunto ''Dúvida sobre a tarefa de matemática'' é muito mais claro do que um sem assunto nenhum, porque a pessoa já sabe do que se trata antes de abrir.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Escreva um e-mail educado', '{"tipo": "formulario_projeto", "campos": ["Assunto do e-mail", "Saudação inicial", "Corpo da mensagem", "Despedida"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Enviando minha primeira mensagem digital') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é o ''assunto'' de um e-mail?', '["O nome de quem envia", "Um resumo curto do que a mensagem trata", "A hora que foi enviado", "O tamanho do arquivo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Escrever um e-mail educado envolve:', '["Ser direto sem nenhuma saudação", "Saudação, clareza no motivo e despedida educada", "Usar só gírias", "Escrever tudo em letras maiúsculas"]'::jsonb, 1, 2);

  -- MODULO 5: Criando Documentos de Texto
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Criando Documentos de Texto', 'Editores de texto e como formatar um documento.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Meu primeiro documento digital', 'Antigamente, documentos importantes eram só escritos à mão ou na máquina de escrever — hoje, um editor de texto faz tudo isso (e muito mais) na tela.', 'Um EDITOR DE TEXTO é um programa (como Word ou Google Docs) usado para escrever e formatar documentos digitais. Formatar significa ajustar a aparência do texto: escolher um TÍTULO em destaque, deixar palavras em NEGRITO para dar ênfase, organizar o texto em parágrafos, e até inserir imagens quando fizer sentido. Um documento bem organizado é mais fácil de ler do que um bloco de texto corrido sem nenhuma estrutura. Isso vale tanto para trabalhos escolares quanto para qualquer texto que você queira compartilhar com outras pessoas.

Você sabia? A tecla de atalho Ctrl+B (ou Cmd+B no Mac) coloca o texto selecionado em negrito instantaneamente, sem precisar usar o mouse.

Pergunta para pensar: Por que um documento com título e parágrafos organizados é mais fácil de entender do que um texto corrido?

Desafio: Escreva um pequeno texto (3-4 frases) sobre um assunto que você gosta, com um título em destaque.

Resumo: Editores de texto permitem escrever e formatar documentos com título, negrito e parágrafos, deixando a leitura mais clara.

Exemplo do cotidiano: Um trabalho escolar com título grande, subtítulos e parágrafos bem divididos é muito mais fácil de ler do que um texto inteiro sem quebras.', 'Um trabalho escolar com título grande, subtítulos e parágrafos bem divididos é muito mais fácil de ler do que um texto inteiro sem quebras.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Meu Primeiro Documento Digital', '{"tipo": "formulario_projeto", "campos": ["Título do documento", "Parágrafo de introdução", "Parágrafo principal (com uma palavra em destaque)"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Meu primeiro documento digital') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um editor de texto?', '["Um mecanismo de pesquisa", "Um programa para escrever e formatar documentos", "Um tipo de e-mail", "Um navegador"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Formatar um documento significa:', '["Apagar o texto", "Ajustar a aparência: título, negrito, parágrafos", "Enviar por e-mail", "Salvar em pasta"]'::jsonb, 1, 2);

  -- MODULO 6: Apresentações: Contando Ideias em Slides
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Apresentações: Contando Ideias em Slides', 'Como estruturar uma apresentação simples e clara.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Montando minha primeira apresentação', 'Já viu alguém apresentando um trabalho com slides na tela? Hoje você vai aprender a montar o seu.', 'Uma APRESENTAÇÃO é um conjunto de SLIDES (telas) usado para expor uma ideia de forma visual e organizada, geralmente enquanto a pessoa fala sobre o assunto. Um bom slide não deve ter texto demais — o ideal é usar poucas palavras-chave e deixar a explicação detalhada para a fala, não para o slide cheio de texto pequeno. Uma apresentação simples geralmente segue essa estrutura: um slide de título (apresentando o tema), alguns slides de conteúdo (um assunto por slide) e um slide de conclusão (resumindo a ideia principal).

Você sabia? Especialistas em apresentações costumam recomendar no máximo 6 linhas de texto por slide — o foco deve estar em quem está falando, não em ler o slide.

Pergunta para pensar: Por que um slide com texto demais pode atrapalhar quem está assistindo à apresentação?

Desafio: Escolha um assunto que você gosta e planeje 3 slides: título, um ponto principal, e conclusão.

Resumo: Apresentações usam slides com poucas palavras-chave para apoiar visualmente uma fala, não substituí-la.

Exemplo do cotidiano: Ao invés de colocar um parágrafo inteiro num slide sobre o sistema solar, é melhor colocar ''Sistema Solar: 8 planetas'' e explicar os detalhes falando.', 'Ao invés de colocar um parágrafo inteiro num slide sobre o sistema solar, é melhor colocar ''Sistema Solar: 8 planetas'' e explicar os detalhes falando.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Planeje sua apresentação', '{"tipo": "formulario_projeto", "campos": ["Título da apresentação", "Ponto principal do slide 2", "Frase de conclusão"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Montando minha primeira apresentação') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é um slide?', '["Um tipo de arquivo de música", "Uma tela dentro de uma apresentação", "Um e-mail", "Uma pasta"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Um bom slide geralmente tem:', '["Muito texto detalhado", "Poucas palavras-chave", "Nenhuma palavra", "Só imagens sem nenhum texto"]'::jsonb, 1, 2);

  -- MODULO 7: Planilhas: Organizando Números
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Planilhas: Organizando Números', 'O que são planilhas e para que servem no dia a dia.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Números organizados em linhas e colunas', 'Já viu uma tabela cheia de números organizados em linhas e colunas? Isso é uma planilha!', 'Uma PLANILHA é um programa (como Excel ou Google Sheets) que organiza informação em CÉLULAS, dispostas em LINHAS (horizontais) e COLUNAS (verticais). Planilhas são ótimas para organizar listas, calcular somas automaticamente, e visualizar dados de forma clara. Por exemplo, você pode fazer uma planilha simples para controlar sua mesada: uma coluna para o que você ganhou, outra para o que gastou. A grande vantagem é que, ao mudar um número, os cálculos que dependem dele se atualizam sozinhos.

Você sabia? Planilhas conseguem fazer cálculos automáticos usando fórmulas — por exemplo, somar uma coluna inteira de números com um único comando, sem precisar somar cada um manualmente.

Pergunta para pensar: Que tipo de lista do seu dia a dia poderia ser organizada numa planilha?

Desafio: No papel ou numa planilha real, organize uma lista simples (como seus gastos da semana) em linhas e colunas.

Resumo: Planilhas organizam dados em linhas e colunas, permitindo cálculos automáticos e visualização clara de números.

Exemplo do cotidiano: Uma planilha de mesada pode ter colunas ''Data'', ''Ganhei'' e ''Gastei'', mostrando de forma clara para onde o dinheiro está indo.', 'Uma planilha de mesada pode ter colunas ''Data'', ''Ganhei'' e ''Gastei'', mostrando de forma clara para onde o dinheiro está indo.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Minha planilha de mesada', '{"tipo": "distribuicao_valor", "valor_total": 50, "categorias": ["Guardado", "Gasto com lanche", "Gasto com lazer"], "instrucao": "Distribua uma mesada fictícia de R$ 50 entre as categorias, como faria numa planilha simples."}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Números organizados em linhas e colunas') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é uma célula numa planilha?', '["Um tipo de arquivo", "O espaço onde uma linha e uma coluna se cruzam", "Um e-mail", "Um slide"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual a vantagem de usar fórmulas numa planilha?', '["Não tem vantagem", "Cálculos se atualizam automaticamente quando os números mudam", "Deixa a planilha mais lenta", "Serve só para decorar"]'::jsonb, 1, 2);

  -- MODULO 8: Digitação e Atalhos
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Digitação e Atalhos', 'Digitando com mais confiança e rapidez.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Digitando mais rápido e com menos erros', 'No início, digitar parece devagar e cansativo — mas, com prática, isso muda rápido!', 'Digitação é a habilidade de escrever no teclado. Uma boa digitação não é sobre velocidade no início — é sobre praticar regularmente até ficar mais natural. Alguns ATALHOS DE TECLADO comuns economizam bastante tempo: Ctrl+C copia algo selecionado, Ctrl+V cola o que foi copiado, Ctrl+Z desfaz a última ação, e Ctrl+S salva o documento. Aprender esses atalhos evita precisar usar o mouse toda hora para ações simples e repetitivas, deixando o trabalho no computador mais fluido.

Você sabia? Os atalhos Ctrl+C e Ctrl+V (copiar e colar) são usados bilhões de vezes por dia ao redor do mundo — são alguns dos atalhos mais usados de toda a informática.

Pergunta para pensar: Qual tarefa no computador você acha que ficaria mais rápida se você soubesse mais atalhos de teclado?

Desafio: Pratique usar Ctrl+C e Ctrl+V para copiar e colar um texto pequeno.

Resumo: Digitação melhora com prática regular. Atalhos de teclado (como Ctrl+C, Ctrl+V, Ctrl+Z, Ctrl+S) tornam o trabalho no computador mais rápido.

Exemplo do cotidiano: Ao invés de clicar com o mouse em ''copiar'' e depois em ''colar'' em menus, usar Ctrl+C e Ctrl+V faz a mesma coisa muito mais rápido.', 'Ao invés de clicar com o mouse em ''copiar'' e depois em ''colar'' em menus, usar Ctrl+C e Ctrl+V faz a mesma coisa muito mais rápido.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Quiz de atalhos', '{"tipo": "classificacao", "situacoes": [{"item": "Copiar um texto selecionado", "resposta": "necessidade"}, {"item": "Colar o que foi copiado", "resposta": "desejo"}, {"item": "Desfazer a última ação", "resposta": "necessidade"}, {"item": "Salvar o documento", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Digitando mais rápido e com menos erros') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que faz o atalho Ctrl+Z?', '["Salva o documento", "Desfaz a última ação", "Copia o texto", "Fecha o programa"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que aprender atalhos de teclado é útil?', '["Não é útil", "Torna ações repetitivas mais rápidas", "Deixa o computador mais lento", "Só serve para jogos"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('explorador_digital', 'Explorador Digital', 'Completou o módulo O que é um computador?', '💻') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('organizador_de_arquivos', 'Organizador de Arquivos', 'Completou o módulo Organização Digital', '🗂️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('navegador_seguro', 'Navegador Seguro', 'Completou o módulo Navegando na Internet', '🌐') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mensageiro_digital', 'Mensageiro Digital', 'Completou o módulo E-mail', '✉️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('criador_de_documentos', 'Criador de Documentos', 'Completou o módulo Criando Documentos de Texto', '📝') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('apresentador', 'Apresentador', 'Completou o módulo Apresentações', '🎤') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('planilheiro', 'Planilheiro', 'Completou o módulo Planilhas', '📊') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('digitador_rapido', 'Digitador Rápido', 'Completou o módulo Digitação e Atalhos', '⌨️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_da_informatica', 'Mestre da Informática', 'Concluiu o curso inteiro e o Primeiro Documento Digital', '🖥️') on conflict (code) do nothing;
end $$;