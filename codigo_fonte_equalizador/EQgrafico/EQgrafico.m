function sinalEqualizado = EQgrafico(Fs, sinal, ganhosdB)
	% Fs = taxa de amostragem do sinal
	% sinal = sinal a ser equalizado
	% ganhosdB = vetor de 10 posicoes, cada posicao representa um slider
	%			de um equalizador grafico e o valor representa o ganho em dB


	% limita o ganho entre -12dB e 12dB:
	ganhosdB(ganhosdB > 12) = 12;
	ganhosdB(ganhosdB < -12) = -12;

	% frequencias de corte de cada slider do equalizado grafico, obtidas da
	% tabela da ISO:
	fc = [31.25 63.5 125 250 500 1000 2000 4000 8000 16000];

	for i = 1:10
		% obtem os coeficientes da funcao de transferencia de cada filtro
		% peak:
		[b, a] = peak(Fs, fc(i), ganhosdB(i), 1);

		% aplica o filtro peak ao sinal:
		sinal = filter(b, a, sinal);
		
		% o sinal vai sendo modificado pelos filtros peaks em cascata
		% cada iteracao do for representa o filtro de um slider sendo
		% aplicado
	end

	sinalEqualizado = sinal;
end