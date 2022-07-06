function [b, a] = peak(Fs, fc, ganhodB, BW)
	% Fs = frequencia de amostragem
	% fc = frequencia de corte
	% ganhodB = ganho do filtro peak em dB
	% BW = largura de banda em oitava
	%	   em um equalizador de uma oitava (ou de 10 bandas), a largura de
	%	   banda é de 1 oitava

	% obtem as variaveis intermediarias que vao ser usadas para calcular
	% os coeficientes da funcao de transferencias
	[A, wc, alpha] = var_intermediarias(Fs, fc, ganhodB, 'BW', BW);

	b0 = 1 + alpha*A;
	b1 = -2*cos(wc);
	b2 = 1 - alpha*A;
	a0 = 1 + alpha/A;
	a1 = -2*cos(wc);
	a2 = 1 - alpha/A;
	
	a = [a0 a1 a2];
	b = [b0 b1 b2];
end