do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('seguranca-na-internet', 'Segurança na Internet', 'Senhas, privacidade, golpes e comportamento responsável online.', '🔐', true, 4)
  returning id into v_course_id;

  -- MODULO 1: Senhas Fortes e Seguras
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Senhas Fortes e Seguras', 'Como criar e proteger senhas de verdade.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'A chave que só você deve ter', 'Você tranca a porta de casa à noite, certo? Uma senha faz o mesmo trabalho no mundo digital: protege o que é seu.', 'Uma SENHA é como uma chave secreta que protege suas contas (jogos, e-mail, aplicativos). Uma senha forte tem letras maiúsculas e minúsculas, números, e de preferência um símbolo, além de ser longa — evite coisas óbvias como ''123456'', seu nome, ou sua data de nascimento, porque são fáceis de adivinhar. A regra mais importante de todas: senha é para guardar, não para compartilhar — nem com amigos, nem com pessoas que você conhece só pela internet. Só um responsável de confiança deveria conhecer suas senhas, para ajudar em caso de emergência.

Você sabia? Uma senha simples como ''123456'' pode ser descoberta por um programa em menos de 1 segundo, enquanto uma senha longa e variada pode levar anos.

Pergunta para pensar: Por que compartilhar uma senha, mesmo com um amigo próximo, pode ser arriscado?

Desafio: Pense numa senha forte (sem usar de verdade em nenhuma conta agora) misturando letras, números e um símbolo.

Resumo: Senhas fortes misturam letras, números e símbolos, e nunca devem ser compartilhadas, nem com amigos.

Exemplo do cotidiano: Uma senha como ''Estrela7*Azul'' é muito mais segura do que ''estrela'' sozinha, porque mistura maiúsculas, números e símbolo.', 'Uma senha como ''Estrela7*Azul'' é muito mais segura do que ''estrela'' sozinha, porque mistura maiúsculas, números e símbolo.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Senha forte ou fraca?', '{"tipo": "classificacao", "situacoes": [{"item": "123456", "resposta": "desejo"}, {"item": "MeuCao2020!", "resposta": "necessidade"}, {"item": "seu próprio nome", "resposta": "desejo"}, {"item": "Gt7#pLuma9", "resposta": "necessidade"}, {"item": "senha", "resposta": "desejo"}, {"item": "sua data de nascimento", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: A chave que só você deve ter') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que torna uma senha forte?', '["Ser curta e simples", "Misturar letras, números e símbolos", "Ser seu próprio nome", "Ser igual em todas as contas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Com quem você deve compartilhar suas senhas?', '["Com qualquer amigo que pedir", "Só com um responsável de confiança, em caso de necessidade", "Com qualquer pessoa da internet", "Com todo mundo da escola"]'::jsonb, 1, 2);

  -- MODULO 2: Privacidade: O Que é Meu, é Meu
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Privacidade: O Que é Meu, é Meu', 'Dados pessoais e o que nunca deve ser compartilhado.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Guardando minhas informações', 'Existem coisas sobre você que só as pessoas de confiança deveriam saber. Vamos entender quais.', 'DADOS PESSOAIS são informações que identificam você: nome completo, endereço, escola que estuda, telefone, ou a rotina do seu dia. Compartilhar esses dados com desconhecidos na internet pode ser perigoso, porque uma pessoa mal-intencionada pode usar essas informações para te localizar ou te enganar. A regra de ouro é: se um site, jogo ou pessoa desconhecida pede informações pessoais, o ideal é não responder e contar para um responsável. Privacidade não é sobre esconder tudo de todo mundo — é sobre escolher com cuidado quem pode saber o quê.

Você sabia? Muitos jogos e aplicativos pedem informações que não são realmente necessárias para funcionar — por isso é importante sempre ter um responsável por perto ao criar contas novas.

Pergunta para pensar: Por que alguém desconhecido pediria seu endereço ou nome da escola?

Desafio: Converse com um responsável sobre quais aplicativos ou jogos você usa e quais informações eles pedem.

Resumo: Dados pessoais (nome completo, endereço, escola, rotina) não devem ser compartilhados com desconhecidos. Privacidade é escolher com cuidado quem sabe o quê.

Exemplo do cotidiano: Se um jogo pede para você digitar seu endereço completo para ''ganhar um prêmio'', o ideal é desconfiar e chamar um responsável antes de continuar.', 'Se um jogo pede para você digitar seu endereço completo para ''ganhar um prêmio'', o ideal é desconfiar e chamar um responsável antes de continuar.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Compartilhar ou não compartilhar?', '{"tipo": "checklist_situacoes", "perguntas_checklist": ["Isso identifica onde eu moro ou estudo?", "Um desconhecido está pedindo isso?", "Eu perguntei a um responsável antes?"], "situacoes": ["Um site pede seu nome completo e endereço para ''liberar um brinde''", "Um app de jogo pede sua localização em tempo real", "Alguém desconhecido no chat de um jogo pergunta em qual escola você estuda", "Um formulário oficial da escola, preenchido com um responsável, pede seu nome"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Guardando minhas informações') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que são dados pessoais?', '["Qualquer informação sem importância", "Informações que identificam você, como nome, endereço e escola", "Apenas fotos", "Só a senha do e-mail"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer se um desconhecido pedir informações pessoais online?', '["Responder rapidamente", "Não responder e contar para um responsável", "Compartilhar só um pouco", "Ignorar e continuar conversando sobre outros assuntos"]'::jsonb, 1, 2);

  -- MODULO 3: Golpes e Links Suspeitos
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Golpes e Links Suspeitos', 'Reconhecendo tentativas de engano na internet.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Nem tudo que brilha é confiável', 'Você já recebeu uma mensagem prometendo um prêmio incrível do nada? Isso pode ser um golpe.', 'Um GOLPE digital é uma tentativa de enganar alguém para roubar dinheiro, senhas ou informações. Um sinal comum de golpe é uma mensagem que promete algo bom demais para ser verdade (como ganhar um celular grátis) ou que cria urgência (''responda agora ou vai perder''). LINKS SUSPEITOS são endereços de internet estranhos, com erros de escrita ou vindos de mensagens desconhecidas — clicar neles pode levar a páginas falsas feitas para roubar senhas. A regra de segurança mais simples: na dúvida, não clique, e pergunte a um responsável antes.

Você sabia? Golpistas costumam copiar o visual de sites famosos (como bancos ou lojas) para parecerem confiáveis, mesmo sendo falsos.

Pergunta para pensar: O que te faria desconfiar de uma mensagem prometendo um prêmio?

Desafio: Se você receber uma mensagem ou link suspeito, pratique o hábito de mostrar para um responsável antes de clicar em qualquer coisa.

Resumo: Golpes prometem coisas boas demais ou criam urgência. Links suspeitos podem ser perigosos — na dúvida, não clique e pergunte a um adulto de confiança.

Exemplo do cotidiano: Uma mensagem dizendo ''Você ganhou um celular! Clique aqui e informe seus dados em 5 minutos'' tem os sinais clássicos de golpe: promessa boa demais e urgência.', 'Uma mensagem dizendo ''Você ganhou um celular! Clique aqui e informe seus dados em 5 minutos'' tem os sinais clássicos de golpe: promessa boa demais e urgência.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'É golpe ou não é?', '{"tipo": "classificacao", "situacoes": [{"item": "Mensagem dizendo que você ganhou um prêmio sem participar de nada", "resposta": "desejo"}, {"item": "E-mail da escola avisando sobre uma reunião de pais", "resposta": "necessidade"}, {"item": "Link estranho pedindo para ''confirmar sua senha urgentemente''", "resposta": "desejo"}, {"item": "Aviso do próprio jogo sobre uma atualização, dentro do aplicativo oficial", "resposta": "necessidade"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Nem tudo que brilha é confiável') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é um sinal comum de golpe digital?', '["Uma mensagem clara e sem pressa", "Promessas boas demais e urgência para agir rápido", "Vir de uma pessoa conhecida", "Não pedir nada em troca"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer diante de um link suspeito?', '["Clicar para ver o que é", "Não clicar e perguntar a um responsável", "Compartilhar com amigos primeiro", "Clicar só se for rápido"]'::jsonb, 1, 2);

  -- MODULO 4: Desconhecidos na Internet
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Desconhecidos na Internet', 'Como agir diante de contato de pessoas que você não conhece.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Nem todo mundo online é quem diz ser', 'Na internet, uma pessoa pode dizer que tem qualquer idade ou é qualquer um — por isso, um cuidado extra é sempre importante.', 'Na internet, é possível conversar com pessoas de qualquer lugar do mundo, mas isso também significa que nem sempre dá para saber quem realmente está do outro lado de uma conversa. Um DESCONHECIDO é qualquer pessoa que você não conhece pessoalmente, mesmo que pareça simpática ou amigável em uma conversa online. É importante nunca aceitar combinar encontros pessoais com alguém conhecido só pela internet, nunca enviar fotos ou informações pessoais para desconhecidos, e sempre contar para um responsável se alguém insistir em conversas que deixam você desconfortável.

Você sabia? Pessoas com más intenções às vezes fingem ser mais jovens do que realmente são para conversar com crianças e adolescentes online — por isso a idade que alguém diz ter na internet nem sempre é verdadeira.

Pergunta para pensar: O que você faria se um desconhecido insistisse para você guardar segredo de uma conversa dos seus responsáveis?

Desafio: Combine com um responsável um sinal ou uma frase-código para usar caso você se sinta desconfortável com alguma conversa online.

Resumo: Desconhecidos na internet nem sempre são quem dizem ser. Nunca combine encontros, nunca envie informações pessoais, e sempre conte para um responsável se algo parecer estranho.

Exemplo do cotidiano: Se alguém desconhecido em um jogo online insiste para saber onde você mora ou pede para manter a conversa em segredo dos seus pais, isso é um sinal de alerta importante.', 'Se alguém desconhecido em um jogo online insiste para saber onde você mora ou pede para manter a conversa em segredo dos seus pais, isso é um sinal de alerta importante.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'O que fazer nessa situação?', '{"tipo": "simulacao_dialogo", "situacoes": [{"cliente": "Oi! Você é bem legal, não conta pra ninguém que a gente conversa, tá? É nosso segredo.", "opcoes": ["Combinado, é nosso segredo!", "Isso é estranho — vou contar para um responsável.", "Vou ignorar mas continuar conversando escondido."], "correta": 1}, {"cliente": "Me manda uma foto sua e me diz onde você mora?", "opcoes": ["Manda os dados", "Não vou compartilhar isso e vou contar a um responsável", "Manda só a foto"], "correta": 1}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Nem todo mundo online é quem diz ser') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer se um desconhecido pedir segredo sobre a conversa?', '["Manter o segredo", "Contar para um responsável, pois isso é um sinal de alerta", "Ignorar e seguir conversando", "Pedir mais informações à pessoa"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'É seguro combinar um encontro pessoal com alguém que você só conhece pela internet?', '["Sim, sem problema", "Não, nunca sem um responsável sabendo e supervisionando", "Só se a pessoa parecer legal", "Só uma vez para conhecer"]'::jsonb, 1, 2);

  -- MODULO 5: Fotos, Vídeos e Localização
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Fotos, Vídeos e Localização', 'Cuidados ao compartilhar imagens e sua localização.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Pensando antes de compartilhar', 'Uma foto ou vídeo publicado pode ser visto, salvo e compartilhado por muito mais gente do que você imagina.', 'Fotos e vídeos publicados na internet podem ser vistos, salvos e compartilhados por outras pessoas, mesmo depois de apagados do post original — por isso vale sempre pensar antes de publicar. Além disso, muitas fotos guardam informações escondidas sobre onde e quando foram tiradas (chamado de LOCALIZAÇÃO ou geolocalização), o que pode revelar onde você mora ou estuda sem querer. Antes de compartilhar qualquer imagem ou vídeo, vale se perguntar: essa imagem revela informações pessoais? Eu ficaria à vontade se qualquer pessoa (não só amigos) visse isso? Tenho autorização de um responsável para postar?

Você sabia? Muitos aplicativos têm uma configuração para desativar o compartilhamento automático de localização nas fotos — vale pedir ajuda de um responsável para checar isso.

Pergunta para pensar: Por que uma foto continua existindo na internet mesmo depois de você apagar o post original?

Desafio: Converse com um responsável sobre como checar se a localização está ativada nas fotos do seu celular ou tablet.

Resumo: Fotos e vídeos podem ser salvos e compartilhados por outras pessoas, e podem revelar localização sem querer. Pense e peça autorização antes de publicar.

Exemplo do cotidiano: Uma foto tirada no quintal de casa pode, sem querer, mostrar o número da casa ou uma placa de rua que revela onde a pessoa mora.', 'Uma foto tirada no quintal de casa pode, sem querer, mostrar o número da casa ou uma placa de rua que revela onde a pessoa mora.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'escolha', 'Posso postar isso?', '{"tipo": "escolha_multipla_com_consequencia", "opcoes": [{"texto": "Postar qualquer foto sem pensar duas vezes", "consequencia": "Isso pode expor informações pessoais sem querer, como localização."}, {"texto": "Pensar no que a imagem revela e pedir autorização de um responsável antes", "consequencia": "Essa é a forma mais segura de compartilhar com consciência."}, {"texto": "Nunca tirar fotos nem vídeos", "consequencia": "Não é necessário evitar completamente, só é preciso ter cuidado ao compartilhar."}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Pensando antes de compartilhar') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Por que uma foto pode continuar circulando mesmo depois de apagada?', '["Isso nunca acontece", "Outras pessoas podem tê-la salvo ou compartilhado antes", "As fotos se apagam sozinhas em todo lugar", "Não é possível salvar fotos de outras pessoas"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é geolocalização numa foto?', '["A cor da imagem", "Informação escondida sobre onde e quando a foto foi tirada", "O tamanho do arquivo", "Um tipo de filtro"]'::jsonb, 1, 2);

  -- MODULO 6: Cyberbullying: Respeito Também Online
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Cyberbullying: Respeito Também Online', 'Reconhecendo e enfrentando o bullying no ambiente digital.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Ser gentil também é coisa de internet', 'As mesmas regras de respeito que valem na escola valem na internet — só que às vezes é mais fácil esquecer disso atrás de uma tela.', 'CYBERBULLYING é quando alguém usa a internet para intimidar, humilhar ou machucar outra pessoa repetidamente — através de mensagens ofensivas, exclusão intencional de grupos, ou espalhar coisas maldosas sobre alguém. Isso causa dor de verdade, mesmo sendo digital. Se você vir isso acontecendo (seja com você ou com outra pessoa), o mais importante é: não revidar com mais agressão, guardar prints como prova se possível, e contar para um responsável de confiança. Ser uma pessoa que ajuda quem está sendo maltratado, ao invés de ficar calado, faz toda a diferença.

Você sabia? Muitas plataformas têm uma opção de ''denunciar'' ou ''bloquear'' especificamente para casos de cyberbullying — usar essas ferramentas é uma atitude válida e importante.

Pergunta para pensar: Por que pode ser mais fácil alguém ser cruel escondido atrás de uma tela do que pessoalmente?

Desafio: Se você seguir alguém que está sofrendo cyberbullying, mande uma mensagem de apoio para essa pessoa.

Resumo: Cyberbullying machuca de verdade. Não revide, guarde provas, conte para um responsável, e apoie quem está sofrendo.

Exemplo do cotidiano: Se um grupo de colegas está excluindo e zombando de alguém repetidamente num chat de jogo, isso é cyberbullying — e merece ser levado a sério, não ignorado.', 'Se um grupo de colegas está excluindo e zombando de alguém repetidamente num chat de jogo, isso é cyberbullying — e merece ser levado a sério, não ignorado.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Como agir diante do cyberbullying', '{"tipo": "simulacao_dialogo", "situacoes": [{"cliente": "Um colega está mandando mensagens maldosas repetidas para outro colega num grupo.", "opcoes": ["Ignorar, não é comigo", "Não participar, apoiar quem está sofrendo e contar a um responsável", "Rir junto para não ser o próximo alvo"], "correta": 1}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Ser gentil também é coisa de internet') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é cyberbullying?', '["Uma brincadeira sem problema", "Intimidar ou humilhar alguém repetidamente pela internet", "Jogar online com amigos", "Compartilhar memes engraçados"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que fazer se você presenciar cyberbullying?', '["Ficar calado e não se envolver", "Apoiar quem está sofrendo e contar para um responsável", "Participar também", "Rir para não ser excluído"]'::jsonb, 1, 2);

  -- MODULO 7: Fake News: Nem Tudo que Circula é Verdade
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Fake News: Nem Tudo que Circula é Verdade', 'Aprendendo a checar informações antes de acreditar ou compartilhar.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Verificando antes de acreditar', 'Você já viu uma notícia chocante circulando e depois descobriu que era mentira? Isso é uma fake news.', 'FAKE NEWS são notícias falsas espalhadas como se fossem verdadeiras, geralmente para enganar, causar pânico, ou conseguir cliques. Elas se espalham rápido porque costumam ser chocantes ou emocionantes — e as pessoas compartilham antes mesmo de checar se é verdade. Algumas formas simples de checar uma informação: ver se ela aparece em fontes confiáveis e conhecidas, prestar atenção a erros de escrita ou títulos exagerados demais, e desconfiar quando algo parece feito para gerar raiva ou medo instantâneo. Antes de compartilhar qualquer coisa, vale se perguntar: eu confirmei se isso é verdade?

Você sabia? Estudos mostram que notícias falsas costumam se espalhar mais rápido do que notícias verdadeiras, justamente porque são feitas para chamar mais atenção.

Pergunta para pensar: Por que uma notícia chocante te deixa com mais vontade de compartilhar rápido, sem checar?

Desafio: Da próxima vez que ver uma notícia impressionante, tente encontrar a mesma informação em pelo menos uma fonte confiável antes de acreditar ou compartilhar.

Resumo: Fake news são notícias falsas feitas para enganar. Checar fontes confiáveis antes de acreditar ou compartilhar é essencial.

Exemplo do cotidiano: Uma mensagem dizendo ''Cientistas descobrem que X é perigoso!'' sem citar nenhuma fonte real é um sinal clássico de fake news.', 'Uma mensagem dizendo ''Cientistas descobrem que X é perigoso!'' sem citar nenhuma fonte real é um sinal clássico de fake news.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Verdade ou fake news?', '{"tipo": "classificacao", "situacoes": [{"item": "Notícia sem fonte, cheia de erros de escrita, prometendo algo chocante", "resposta": "desejo"}, {"item": "Reportagem de um veículo de notícias conhecido, com fonte identificada", "resposta": "necessidade"}, {"item": "Mensagem de corrente pedindo para ''compartilhar antes que seja tarde demais''", "resposta": "desejo"}, {"item": "Informação confirmada em mais de uma fonte confiável", "resposta": "necessidade"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Verificando antes de acreditar') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é fake news?', '["Uma notícia sempre verdadeira", "Uma notícia falsa espalhada como se fosse verdadeira", "Um tipo de propaganda paga", "Um vídeo educativo"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Uma boa forma de checar uma notícia é:', '["Compartilhar rápido antes de checar", "Ver se aparece em fontes confiáveis conhecidas", "Confiar só porque parece chocante", "Não checar nada"]'::jsonb, 1, 2);

  -- MODULO 8: Tempo de Tela e Uso Responsável
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Tempo de Tela e Uso Responsável', 'Equilibrando o tempo online com outras partes da vida.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Encontrando o equilíbrio digital', 'Telas são ótimas ferramentas — mas, como qualquer coisa boa, funcionam melhor com equilíbrio.', 'TEMPO DE TELA é o tempo que passamos usando celular, computador ou tablet. Usar tecnologia não é ruim — ela ajuda a aprender, se comunicar e se divertir. Mas passar tempo demais nas telas pode atrapalhar outras partes importantes da vida: dormir bem, se exercitar, conversar pessoalmente com a família e amigos, e até prestar atenção na escola. Um uso equilibrado geralmente envolve ter horários combinados com os responsáveis, fazer pausas regulares, e priorizar atividades fora da tela também, como esportes, leitura e tempo com a família.

Você sabia? Muitos especialistas recomendam que o uso de telas seja combinado em família, com horários definidos, ao invés de ilimitado.

Pergunta para pensar: O que você poderia fazer no seu tempo livre além de usar telas?

Desafio: Combine com seus responsáveis um horário equilibrado de uso de telas para essa semana.

Resumo: Tecnologia é uma ferramenta útil, mas o uso equilibrado — com horários combinados e pausas — é importante para uma vida saudável.

Exemplo do cotidiano: Alguém que passa o dia inteiro no celular pode acabar dormindo tarde demais e ficando cansado para a escola no dia seguinte.', 'Alguém que passa o dia inteiro no celular pode acabar dormindo tarde demais e ficando cansado para a escola no dia seguinte.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Meu equilíbrio digital', '{"tipo": "distribuicao_valor", "valor_total": 100, "categorias": ["Telas", "Sono", "Atividades físicas", "Família e amigos"], "instrucao": "Distribua 100 pontos representando como você gostaria de equilibrar seu tempo entre essas áreas."}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Encontrando o equilíbrio digital') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Usar tecnologia é sempre ruim?', '["Sim, deve ser evitado completamente", "Não, mas o uso equilibrado é importante", "Só é ruim para adultos", "Não tem nenhum impacto na vida"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Um uso equilibrado de telas geralmente envolve:', '["Uso ilimitado, sem horários", "Horários combinados e pausas regulares", "Usar telas o tempo todo, inclusive para dormir", "Nunca usar tecnologia"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('mestre_das_senhas', 'Mestre das Senhas', 'Completou o módulo Senhas Fortes e Seguras', '🔑') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('guardiao_da_privacidade', 'Guardião da Privacidade', 'Completou o módulo Privacidade', '🔒') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('detetive_de_golpes', 'Detetive de Golpes', 'Completou o módulo Golpes e Links Suspeitos', '🕵️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('alerta_ligado', 'Alerta Ligado', 'Completou o módulo Desconhecidos na Internet', '🚨') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cuidadoso_com_imagens', 'Cuidadoso com Imagens', 'Completou o módulo Fotos, Vídeos e Localização', '📸') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('gentileza_online', 'Gentileza Online', 'Completou o módulo Cyberbullying', '💙') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('verificador_de_fatos', 'Verificador de Fatos', 'Completou o módulo Fake News', '🔍') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('equilibrio_digital', 'Equilíbrio Digital', 'Completou o módulo Tempo de Tela', '⏱️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('guardiao_digital', 'Guardião Digital', 'Concluiu o curso inteiro e o Manual de Segurança Digital', '🔐') on conflict (code) do nothing;
end $$;