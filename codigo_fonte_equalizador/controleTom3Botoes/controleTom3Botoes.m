function sinalEqualizado = controleTom3Botoes(Fs, sinal, ganhosdB)
	% Fs = taxa de amostragem do sinal
	% sinal = sinal a ser equalizado
	% ganhosdB = vetor de 2 posicoes, cada posicao representa um knob
	%			de um controle de tom e o valor representa o ganho em dB


	% limita o ganho entre -12dB e 12dB:
	ganhosdB(ganhosdB > 12) = 12;
	ganhosdB(ganhosdB < -12) = -12;

	% frequencias de corte de cada knob:
	fc = [250 1000 4000];

	% obtem os coeficientes da funcao de transferencia do filtro
	% lowshelving:
	[b, a] = lowshelving(Fs, fc(1), ganhosdB(1), 1);

	% aplica o filtro highshelving ao sinal:
	sinal = filter(b, a, sinal);

	% obtem os coeficientes da funcao de transferencia do filtro peak:
	[b, a] = peak(Fs, fc(2), ganhosdB(2), 1);

	sinal = filter(b, a, sinal);

	% aplica o filtro highshelving ao sinal:
	sinal = filter(b, a, sinal);
	% obtem os coeficientes da funcao de transferencia do filtro
	% highshelving:
	[b, a] = highshelving(Fs, fc(3), ganhosdB(3), 1);

	% aplica o filtro highshelving ao sinal:
	sinal = filter(b, a, sinal);

	sinalEqualizado = sinal;
end