function resultado = teste_vogal (arquivo, vogal_esperada)  resultado = 0;  [gk, fs] = audioread (arquivo);                               % transforma um arquivo .wav em um vetor g(k)                                                                % recupera a taxa de amostragem - fs                                                  [gk N Ts ws duracao tempo fmax frequencia resolucao] = resgatar_dados (gk, fs); % recupera dados importantes do sinal    fourier = fourier(gk, N);  formantes = identificar_formantes(frequencia, fourier);     % Reconhece automaticamente f0, f1 e f2  print_formantes(formantes);    %% Formantes da vogal /a/  [f0_a f1_a f2_a formante_sexo_a] = leitura_formantes('csv-formantes/formantes-a.csv');  [media_f0_a media_f1_a media_f2_a] = media_formantes(f0_a, f1_a, f2_a);    %% Formantes da vogal /e/  [f0_e f1_e f2_e formante_sexo_e] = leitura_formantes('csv-formantes/formantes-e.csv');  [media_f0_e media_f1_e media_f2_e] = media_formantes(f0_e, f1_e, f2_e);    %% Formantes da vogal /i/  [f0_i f1_i f2_i formante_sexo_i] = leitura_formantes('csv-formantes/formantes-i.csv');  [media_f0_i media_f1_i media_f2_i] = media_formantes(f0_i, f1_i, f2_i);    %% Formantes da vogal /o/  [f0_o f1_o f2_o formante_sexo_o] = leitura_formantes('csv-formantes/formantes-o.csv');  [media_f0_o media_f1_o media_f2_o] = media_formantes(f0_o, f1_o, f2_o);    %% Formantes da vogal /u/  [f0_u f1_u f2_u formante_sexo_u] = leitura_formantes('csv-formantes/formantes-u.csv');  [media_f0_u media_f1_u media_f2_u] = media_formantes(f0_u, f1_u, f2_u);    % Norma do vetor dis�ncia  dists = [];  try    % distancia em rela��o ao ponto (f0, f1, f2) de /a/    df0_a = media_f0_a - formantes(1);    df1_a = media_f1_a - formantes(2);    df2_a = media_f2_a - formantes(3);    dists(1) = sqrt(df0_a.^2+df1_a.^2+df2_a.^2);    % distancia em rela��o ao ponto (f0, f1, f2) de /e/    df0_e = media_f0_e - formantes(1);    df1_e = media_f1_e - formantes(2);    df2_e = media_f2_e - formantes(3);    dists(2) = sqrt(df0_e.^2+df1_e.^2+df2_e.^2);    % distancia em rela��o ao ponto (f0, f1, f2) de /i/    df0_i = media_f0_i - formantes(1);    df1_i = media_f1_i - formantes(2);    df2_i = media_f2_i - formantes(3);    dists(3) = sqrt(df0_i.^2+df1_i.^2+df2_i.^2);    % distancia em rela��o ao ponto (f0, f1, f2) de /o/    df0_o = media_f0_o - formantes(1);    df1_o = media_f1_o - formantes(2);    df2_o = media_f2_o - formantes(3);    dists(4) = sqrt(df0_o.^2+df1_o.^2+df2_o.^2);    % distancia em rela��o ao ponto (f0, f1, f2) de /u/    df0_u = media_f0_u - formantes(1);    df1_u = media_f1_u - formantes(2);    df2_u = media_f2_u - formantes(3);    dists(5) = sqrt(df0_u.^2+df1_u.^2+df2_u.^2);        % Encontrando a dist�ncia m�nima    idx_min = 1;    for k=2:length(dists)      if dists(k)<dists(idx_min)        idx_min = k;      endif    endfor        switch(idx_min)    case 1      resultado = strcmp('a', vogal_esperada);    case 2      resultado = strcmp('e', vogal_esperada);    case 3      resultado = strcmp('i', vogal_esperada);    case 4      resultado = strcmp('o', vogal_esperada);    case 5      resultado = strcmp('u', vogal_esperada);  otherwise    fprintf('N�o foi poss�vel determinar a vogal');endswitchcatchfprintf('\nErro na aquisi��o de formantes (poss�vel �udio ruim)\n');end_try_catch