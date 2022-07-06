function [b, a] = lowshelving(Fs, fc, ganhodB, S)
	% Fs = taxa de amostragem do sinal
	% sinal = sinal a ser equalizado
	% ganhosdB = vetor de 10 posicoes, cada posicao representa um slider
	%			de um equalizador grafico e o valor representa o ganho em dB

	% S = slope ou inclinacao da curva de resposta em frequencia, entre 0 e
	% 2. O valor máximo de inclinacao em que a curva nao apresenta
	% picos é 1.

% variaveis intermediarias
	[A, wc, alpha] = var_intermediarias(Fs, fc, ganhodB, 'S', S);
	B = 2*sqrt(A)*alpha;

% coeficientes da funcao de transferencia
	b0 = A*((A+1) - (A-1)*cos(wc) + B);
	b1 = 2*A*((A-1) - (A+1)*cos(wc));
	b2 = A*((A+1) - (A-1)*cos(wc) - B);
	a0 = (A+1) + (A-1)*cos(wc) + B;
	a1 = -2*( (A-1) + (A+1)*cos(wc));
	a2 = (A+1) + (A-1)*cos(wc) - B;

	a = [a0 a1 a2];
	b = [b0 b1 b2];
end