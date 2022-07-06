function teste_EQgrafico(arquivoWAV)

%% leitura
% 	% ler o arquivo .wav para obter a taxa de amostragem
% 	[~, Fs] = audioread(arquivoWAV);
% 
% 	% tempo inicial e final do arquivo .wav a ser lido em segundos
% 	tempo = [5 12];
% 
% 	% le o arquivo .wav no intervalo descrito anteriormente
% 	[sinal, Fs] = audioread(arquivoWAV, Fs*tempo);

	% le o arquivo WAV:
	[sinal, Fs] = audioread(arquivoWAV);

%% equalizacao
	%						    32.25	62.5	125    250    500
	configuracaoEqualizador =   [8        4.8    -5.6   -8      -3.2 ...
	%							1000  2000    4000    8000    16000
								4     8.8     11.2    11.2    11.2];

	sinalEqualizado = EQgrafico(Fs, sinal, configuracaoEqualizador);

%% execucao

	% toca a musica sem equalizacao
	player = audioplayer(sinal, Fs);
	playblocking(player);

	% espera um tempo...
	pause(0.5);

	% toca a musica com equalizacao
	player = audioplayer(sinalEqualizado, Fs);
	playblocking(player);
end
