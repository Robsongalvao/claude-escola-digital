do $$
declare
  v_course_id uuid;
  v_module_id uuid;
  v_lesson_id uuid;
  v_quiz_id uuid;
begin
  insert into public.courses (slug, title, description, icon, is_published, order_index)
  values ('matematica-na-vida-real', 'Matemática na Vida Real', 'Porcentagem, medidas, tempo, gráficos e como planejar com números.', '🧩', true, 10)
  returning id into v_course_id;

  -- MODULO 1: Dinheiro e Matemática
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Dinheiro e Matemática', 'Contas rápidas do dia a dia envolvendo dinheiro.', 1)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Fazendo contas de cabeça no mercado', 'Você já tentou calcular rapidinho se tinha dinheiro suficiente para comprar algo? Isso é matemática na vida real!', 'A matemática do dinheiro está presente o tempo todo: somar preços, calcular troco, comparar qual opção é mais barata. Uma habilidade útil é ARREDONDAR números para fazer contas de cabeça mais rápido — por exemplo, ao invés de somar R$ 4,90 + R$ 7,80 exatamente, você pode pensar ''5 + 8 = 13'' como uma estimativa rápida, e depois ajustar se precisar de precisão exata. Comparar preços também envolve matemática: um produto de 500g por R$ 10 e outro de 1kg por R$ 22 — qual é mais barato por grama? Fazer esse tipo de comparação ajuda a tomar decisões mais espertas nas compras.

Você sabia? Fazer estimativas rápidas (arredondando números) é uma habilidade tão valorizada que é ensinada separadamente em muitas escolas, chamada de ''cálculo mental''.

Pergunta para pensar: Da próxima vez que for a um mercado, como você poderia estimar rapidamente se tem dinheiro suficiente para o que está no carrinho?

Desafio: Se você tiver R$ 50, some mentalmente (arredondando) se consegue comprar 3 itens de R$ 12,90, R$ 8,50 e R$ 15,90.

Resumo: Matemática do dinheiro envolve somar, calcular troco e comparar preços — arredondar números ajuda a fazer estimativas rápidas de cabeça.

Exemplo do cotidiano: Se um item custa R$ 19,90, uma boa estimativa rápida é pensar nele como R$ 20 para fazer contas de cabeça mais fácil, ajustando depois se precisar de exatidão.', 'Se um item custa R$ 19,90, uma boa estimativa rápida é pensar nele como R$ 20 para fazer contas de cabeça mais fácil, ajustando depois se precisar de exatidão.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'calculadora', 'Calculadora de compras', '{"tipo": "calculadora", "produtos_ficticios": [{"nome": "Suco de caixinha", "custo": 4.5}, {"nome": "Pacote de biscoito", "custo": 6}, {"nome": "Fruta (unidade)", "custo": 2}, {"nome": "Iogurte", "custo": 3.5}, {"nome": "Pão de forma", "custo": 8}], "instrucao": "Para cada produto, o aluno estima um valor de venda e o sistema calcula automaticamente a diferença."}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Fazendo contas de cabeça no mercado') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para que serve arredondar números ao fazer contas de cabeça?', '["Para errar de propósito", "Para fazer estimativas rápidas", "Não serve para nada", "Só complica"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Comparar o preço por grama de dois produtos ajuda a:', '["Confundir mais a compra", "Descobrir qual opção é mais econômica", "Não faz diferença nenhuma", "Só serve para adultos"]'::jsonb, 1, 2);

  -- MODULO 2: Porcentagem no Dia a Dia
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Porcentagem no Dia a Dia', 'Entendendo o que porcentagens realmente significam.', 2)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'O que significa 20% de desconto?', 'Você já viu uma placa de ''30% OFF'' numa loja e ficou em dúvida sobre quanto isso realmente representa em dinheiro?', 'PORCENTAGEM é uma forma de representar uma parte de um total, sempre em relação a 100. Por exemplo, 50% significa metade de qualquer quantidade, porque é 50 em cada 100. Uma forma simples de calcular porcentagens do dia a dia: para achar 10% de um valor, basta dividir esse valor por 10. Para achar 50%, divide por 2. Para achar 25%, divide por 4. Essas contas rápidas ajudam bastante para entender descontos em lojas, por exemplo: um produto de R$ 100 com 20% de desconto tem uma redução de R$ 20 (porque 10% é R$ 10, e 20% é o dobro disso).

Você sabia? A palavra ''porcentagem'' vem do latim ''per centum'', que significa ''por cem'' — por isso porcentagens sempre se referem a uma parte de 100.

Pergunta para pensar: Se um produto de R$ 50 está com 10% de desconto, quanto você vai pagar?

Desafio: Calcule 10% de três valores diferentes (por exemplo, R$ 30, R$ 80 e R$ 150).

Resumo: Porcentagem representa uma parte de 100. Truques simples como dividir por 10 (para 10%) ou por 2 (para 50%) ajudam a calcular rapidamente.

Exemplo do cotidiano: Um produto de R$ 200 com 25% de desconto tem uma redução de R$ 50 (porque 25% é R$ 200 dividido por 4), então o preço final seria R$ 150.', 'Um produto de R$ 200 com 25% de desconto tem uma redução de R$ 50 (porque 25% é R$ 200 dividido por 4), então o preço final seria R$ 150.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Calculando descontos', '{"tipo": "formulario_calculado", "campos": ["Preço original do produto", "Porcentagem de desconto", "Cálculo automático: valor final com desconto"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: O que significa 20% de desconto?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que significa 50%?', '["A quantidade total", "Metade de uma quantidade", "Um quarto de uma quantidade", "O dobro de uma quantidade"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como calcular 10% de um valor rapidamente?', '["Multiplicando por 10", "Dividindo o valor por 10", "Somando 10 ao valor", "Não é possível calcular rápido"]'::jsonb, 1, 2);

  -- MODULO 3: Medidas: Do Tamanho ao Peso
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Medidas: Do Tamanho ao Peso', 'Entendendo unidades de medida usadas no cotidiano.', 3)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Quanto isso mede, pesa ou cabe?', 'Você já se perguntou por que usamos centímetros para uma coisa e quilômetros para outra?', 'MEDIDAS ajudam a descrever o tamanho, peso ou volume de algo, usando unidades padronizadas para que todo mundo entenda da mesma forma. Para COMPRIMENTO, usamos centímetros (cm) para coisas pequenas e metros (m) ou quilômetros (km) para distâncias maiores. Para PESO, usamos gramas (g) para quantidades pequenas e quilogramas (kg) para quantidades maiores. Para VOLUME (líquidos), usamos mililitros (ml) e litros (l). Saber converter entre essas unidades (por exemplo, que 1.000 gramas equivalem a 1 quilograma) é útil para entender embalagens, receitas culinárias e até planejar uma viagem.

Você sabia? O sistema de medidas usado no Brasil e na maioria dos países (chamado de sistema métrico) foi criado para ser mais fácil de converter, já que sempre usa múltiplos de 10.

Pergunta para pensar: Por que faz mais sentido medir a distância entre duas cidades em quilômetros do que em centímetros?

Desafio: Converta: quantos gramas há em 2,5 quilogramas?

Resumo: Medidas padronizadas (comprimento, peso, volume) ajudam a descrever tamanhos de forma que todos entendam igual — e é útil saber converter entre elas.

Exemplo do cotidiano: Uma receita que pede 500 ml de leite está pedindo meio litro, já que 1 litro equivale a 1.000 ml.', 'Uma receita que pede 500 ml de leite está pedindo meio litro, já que 1 litro equivale a 1.000 ml.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Conversões do dia a dia', '{"tipo": "classificacao", "situacoes": [{"item": "1000 gramas equivalem a 1 quilograma", "resposta": "necessidade"}, {"item": "1000 gramas equivalem a 10 quilogramas", "resposta": "desejo"}, {"item": "1000 ml equivalem a 1 litro", "resposta": "necessidade"}, {"item": "100 cm equivalem a 1 metro", "resposta": "necessidade"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Quanto isso mede, pesa ou cabe?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quantos gramas há em 1 quilograma?', '["100", "1.000", "10", "10.000"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Para medir a distância entre duas cidades, qual unidade faz mais sentido?', '["Centímetros", "Quilômetros", "Gramas", "Mililitros"]'::jsonb, 1, 2);

  -- MODULO 4: Tempo: Calculando Duração e Horários
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Tempo: Calculando Duração e Horários', 'Fazendo contas com horas, minutos e durações.', 4)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Quanto tempo falta? Quanto tempo passou?', 'Calcular tempo é diferente de outras contas, porque não usamos base 10 — usamos base 60 para minutos e segundos!', 'Calcular TEMPO tem uma particularidade importante: uma hora tem 60 minutos (não 100), e um minuto tem 60 segundos. Por isso, contas com tempo funcionam um pouco diferente de contas com dinheiro, por exemplo. Se um evento começa às 14h e dura 1h30min, ele termina às 15h30min — somando as horas e os minutos separadamente, e ajustando se os minutos passarem de 60. Calcular DURAÇÃO (quanto tempo passou entre dois horários) também é uma habilidade útil: se algo começou às 10h15 e terminou às 11h45, a duração foi de 1h30min.

Você sabia? O sistema de 60 minutos numa hora vem de civilizações antigas, como os babilônios, que usavam um sistema de contagem baseado no número 60.

Pergunta para pensar: Se uma viagem começa às 8h e demora 2h45min, a que horas ela termina?

Desafio: Calcule quanto tempo passa entre 9h20 e 11h05.

Resumo: Cálculos com tempo usam base 60 (minutos e segundos), diferente de outras contas em base 10 — é importante ajustar quando os minutos ultrapassam 60.

Exemplo do cotidiano: Se uma aula começa às 13h50 e dura 50 minutos, ela termina às 14h40 (13h50 + 10 minutos completa a hora, e sobram mais 40 minutos).', 'Se uma aula começa às 13h50 e dura 50 minutos, ela termina às 14h40 (13h50 + 10 minutos completa a hora, e sobram mais 40 minutos).', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Calculando horários', '{"tipo": "formulario_calculado", "campos": ["Horário de início", "Duração em horas e minutos", "Cálculo automático: horário de término"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Quanto tempo falta? Quanto tempo passou?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Quantos minutos tem uma hora?', '["100", "60", "24", "10"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Se um evento começa às 14h e dura 1h30min, a que horas termina?', '["15h", "15h30", "14h30", "16h"]'::jsonb, 1, 2);

  -- MODULO 5: Distância e Velocidade
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Distância e Velocidade', 'Entendendo como tempo, distância e velocidade se relacionam.', 5)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Quanto tempo leva para chegar lá?', 'Você já se perguntou como um aplicativo de mapas calcula quanto tempo vai levar para chegar a um lugar?', 'DISTÂNCIA, VELOCIDADE e TEMPO estão relacionados de uma forma simples: quanto maior a velocidade, menos tempo leva para percorrer a mesma distância. A relação básica é: tempo = distância dividida pela velocidade. Por exemplo, se um carro percorre 120 km numa velocidade média de 60 km/h, a viagem leva 2 horas (120 dividido por 60). Entender essa relação ajuda a planejar viagens, calcular quanto tempo algo vai demorar, e até entender por que um avião chega muito mais rápido a um lugar do que um carro.

Você sabia? A velocidade média de uma viagem raramente é igual à velocidade máxima do veículo, porque inclui paradas, trânsito e variações no caminho.

Pergunta para pensar: Se dois carros percorrem a mesma distância, mas um vai mais rápido que o outro, qual deles chega primeiro?

Desafio: Se uma viagem de 200 km é feita numa velocidade média de 100 km/h, quanto tempo ela leva?

Resumo: Tempo de viagem é calculado dividindo a distância pela velocidade — quanto maior a velocidade, menor o tempo para a mesma distância.

Exemplo do cotidiano: Uma viagem de 300 km numa velocidade média de 100 km/h leva 3 horas (300 dividido por 100).', 'Uma viagem de 300 km numa velocidade média de 100 km/h leva 3 horas (300 dividido por 100).', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Calculando o tempo de viagem', '{"tipo": "formulario_calculado", "campos": ["Distância em km", "Velocidade média em km/h", "Cálculo automático: tempo estimado de viagem"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Quanto tempo leva para chegar lá?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como se calcula o tempo de uma viagem?', '["Multiplicando distância por velocidade", "Dividindo a distância pela velocidade", "Somando distância e velocidade", "Não é possível calcular"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Se a velocidade aumenta e a distância continua a mesma, o tempo de viagem:', '["Aumenta", "Diminui", "Não muda", "Fica impossível calcular"]'::jsonb, 1, 2);

  -- MODULO 6: Gráficos: Lendo Informações Visuais
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Gráficos: Lendo Informações Visuais', 'Como interpretar gráficos de barras, linhas e pizza.', 6)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Números que viram imagens', 'Já reparou como é mais fácil entender uma informação através de um gráfico do que de uma tabela cheia de números?', 'GRÁFICOS são formas visuais de representar dados numéricos, facilitando a compreensão rápida de informações. O GRÁFICO DE BARRAS compara quantidades diferentes usando barras de tamanhos proporcionais — quanto maior o valor, maior a barra. O GRÁFICO DE LINHAS mostra como algo muda ao longo do tempo, sendo útil para ver tendências (crescimento ou queda). O GRÁFICO DE PIZZA mostra como um total se divide em partes, sendo útil para ver proporções (como porcentagens de um todo). Saber ler gráficos rapidamente é uma habilidade cada vez mais importante, já que notícias, pesquisas e até jogos usam gráficos para apresentar informações.

Você sabia? Um bom gráfico consegue comunicar uma informação complexa muito mais rápido do que uma tabela cheia de números, por isso são tão usados em notícias e apresentações.

Pergunta para pensar: Se você quisesse mostrar como sua altura mudou ao longo dos anos, qual tipo de gráfico usaria?

Desafio: Pense em uma informação do seu dia a dia (como horas de sono por dia da semana) e imagine que tipo de gráfico representaria bem essa informação.

Resumo: Gráficos representam números visualmente. Barras comparam quantidades, linhas mostram mudanças ao longo do tempo, e pizza mostra proporções de um total.

Exemplo do cotidiano: Um gráfico de linhas mostrando a temperatura ao longo dos meses do ano ajuda a visualizar rapidamente quais meses são mais quentes ou frios, sem precisar ler uma tabela de números.', 'Um gráfico de linhas mostrando a temperatura ao longo dos meses do ano ajuda a visualizar rapidamente quais meses são mais quentes ou frios, sem precisar ler uma tabela de números.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'classificacao', 'Qual gráfico usar?', '{"tipo": "classificacao", "situacoes": [{"item": "Comparar as notas de 5 alunos diferentes", "resposta": "necessidade"}, {"item": "Mostrar como a temperatura mudou ao longo do ano", "resposta": "desejo"}, {"item": "Mostrar como um total de gastos se divide entre categorias", "resposta": "necessidade"}, {"item": "Comparar a altura de 4 plantas diferentes", "resposta": "desejo"}]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Números que viram imagens') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual gráfico é melhor para mostrar mudanças ao longo do tempo?', '["Gráfico de pizza", "Gráfico de linhas", "Não existe diferença", "Nenhum gráfico serve para isso"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Um gráfico de pizza é útil para mostrar:', '["Mudanças ao longo do tempo apenas", "Como um total se divide em partes/proporções", "Não serve para nada", "Só números negativos"]'::jsonb, 1, 2);

  -- MODULO 7: Probabilidade: Qual a Chance?
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Probabilidade: Qual a Chance?', 'Entendendo as chances de algo acontecer.', 7)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Qual a chance de dar cara ou coroa?', 'Você já jogou uma moeda para decidir algo? Isso envolve probabilidade — as chances de cada resultado acontecer.', 'PROBABILIDADE é a medida das chances de algo acontecer. Ela é geralmente expressa como uma fração, decimal ou porcentagem entre 0 (impossível) e 1 ou 100% (certeza absoluta). Por exemplo, jogar uma moeda tem 50% de chance de dar cara e 50% de chance de dar coroa, porque existem 2 resultados possíveis e igualmente prováveis. Já um dado de 6 lados tem 1/6 (cerca de 16,7%) de chance de cair em qualquer número específico, porque existem 6 resultados possíveis. Entender probabilidade ajuda a tomar decisões mais informadas em jogos, e até a entender previsões (como ''chance de chuva de 70%'').

Você sabia? A probabilidade é a base matemática de praticamente todos os jogos de tabuleiro e cartas que usam dados ou sorteios.

Pergunta para pensar: Se você tem 4 bolas coloridas numa sacola (1 vermelha e 3 azuis), qual é a chance de tirar a vermelha sem olhar?

Desafio: Calcule a probabilidade de tirar um número par ao jogar um dado de 6 lados (números 1 a 6).

Resumo: Probabilidade mede as chances de algo acontecer, geralmente entre 0% (impossível) e 100% (certeza) — depende de quantos resultados possíveis existem.

Exemplo do cotidiano: Numa sacola com 10 bolinhas, sendo 2 vermelhas e 8 azuis, a chance de tirar uma vermelha sem olhar é de 2 em 10, ou 20%.', 'Numa sacola com 10 bolinhas, sendo 2 vermelhas e 8 azuis, a chance de tirar uma vermelha sem olhar é de 2 em 10, ou 20%.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'simulacao', 'Calculando probabilidades', '{"tipo": "formulario_calculado", "campos": ["Número de resultados favoráveis (ex: bolinhas vermelhas)", "Número total de resultados possíveis (ex: total de bolinhas)", "Cálculo automático: probabilidade em porcentagem"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Qual a chance de dar cara ou coroa?') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é probabilidade?', '["Uma certeza absoluta sempre", "A medida das chances de algo acontecer", "Um tipo de gráfico", "Não tem relação com matemática"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Qual é a chance de dar cara ao jogar uma moeda?', '["100%", "50%", "0%", "25%"]'::jsonb, 1, 2);

  -- MODULO 8: Planejando com Números: Minha Viagem
  insert into public.modules (course_id, title, description, order_index)
  values (v_course_id, 'Planejando com Números: Minha Viagem', 'Juntando várias habilidades matemáticas num planejamento real.', 8)
  returning id into v_module_id;
  insert into public.lessons (module_id, title, introduction, content, examples, xp_reward, order_index)
  values (v_module_id, 'Toda viagem começa com boas contas', 'Planejar uma viagem envolve muito mais matemática do que parece — orçamento, distância, tempo e muito mais!', 'Planejar uma viagem combina praticamente tudo que você aprendeu neste curso: ORÇAMENTO (quanto dinheiro será gasto, dividido entre transporte, alimentação e hospedagem), DISTÂNCIA e TEMPO (quantos quilômetros até o destino, e quanto tempo a viagem vai levar), e até PROBABILIDADE (qual a chance de chover no dia escolhido, por exemplo). Também é importante considerar a QUANTIDADE DE PESSOAS na viagem, porque isso afeta diretamente os custos — dividir despesas entre mais pessoas pode tornar a viagem mais barata por pessoa, mas também aumenta o custo total. Planejar bem com números ajuda a evitar surpresas e a aproveitar melhor o passeio.

Você sabia? Muitas famílias e empresas de viagem usam planilhas inteiras só para organizar o orçamento e a logística de uma viagem, exatamente combinando esses conceitos matemáticos.

Pergunta para pensar: Se uma viagem custa R$ 800 no total e é dividida entre 4 pessoas, quanto cada uma paga?

Desafio: Planeje uma viagem fictícia, decidindo destino, orçamento total, distância aproximada e quantidade de pessoas.

Resumo: Planejar uma viagem combina orçamento, distância, tempo, probabilidade e número de pessoas — matemática aplicada de forma prática e útil.

Exemplo do cotidiano: Uma viagem de 400 km, com um carro que roda em média 80 km/h, levaria cerca de 5 horas — esse tipo de cálculo ajuda a planejar quando parar para descansar ou almoçar no caminho.', 'Uma viagem de 400 km, com um carro que roda em média 80 km/h, levaria cerca de 5 horas — esse tipo de cálculo ajuda a planejar quando parar para descansar ou almoçar no caminho.', 20, 1)
  returning id into v_lesson_id;
  insert into public.activities (lesson_id, type, title, config, order_index)
  values (v_lesson_id, 'texto_livre', 'Minha Viagem Planejada', '{"tipo": "formulario_projeto", "campos": ["Destino da viagem", "Orçamento total disponível", "Distância aproximada em km", "Quantidade de pessoas na viagem"]}'::jsonb, 1);
  insert into public.quizzes (lesson_id, title) values (v_lesson_id, 'Quiz: Toda viagem começa com boas contas') returning id into v_quiz_id;
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'O que é importante considerar ao planejar o orçamento de uma viagem?', '["Só o transporte", "Transporte, alimentação, hospedagem e quantidade de pessoas", "Nada, viagens não precisam de planejamento", "Só a distância"]'::jsonb, 1, 1);
  insert into public.quiz_questions (quiz_id, question, options, correct_option, order_index)
  values (v_quiz_id, 'Como a quantidade de pessoas afeta o custo por pessoa numa viagem dividida?', '["Não afeta nada", "Mais pessoas dividindo geralmente reduz o custo por pessoa", "Sempre aumenta o custo por pessoa", "Só afeta o custo total, nunca o individual"]'::jsonb, 1, 2);

  -- CONQUISTAS
  insert into public.achievements (code, title, description, icon) values ('calculista_do_dinheiro', 'Calculista do Dinheiro', 'Completou o módulo Dinheiro e Matemática', '💵') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_da_porcentagem', 'Mestre da Porcentagem', 'Completou o módulo Porcentagem no Dia a Dia', '📊') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('medidor_experiente', 'Medidor Experiente', 'Completou o módulo Medidas', '📏') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('cronometrista', 'Cronometrista', 'Completou o módulo Tempo', '🕐') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('navegador_de_distancias', 'Navegador de Distâncias', 'Completou o módulo Distância e Velocidade', '🗺️') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('leitor_de_graficos', 'Leitor de Gráficos', 'Completou o módulo Gráficos', '📈') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('estatistico_iniciante', 'Estatístico Iniciante', 'Completou o módulo Probabilidade', '🎲') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('planejador_de_viagem', 'Planejador de Viagem', 'Completou o módulo Planejando com Números', '🧳') on conflict (code) do nothing;
  insert into public.achievements (code, title, description, icon) values ('mestre_da_matematica', 'Mestre da Matemática', 'Concluiu o curso inteiro e a Viagem Planejada', '🧩') on conflict (code) do nothing;
end $$;