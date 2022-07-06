function [A, wc, alpha] = var_intermediarias(Fs, fc, ganhodB, ...
							tipo_parametro_largura, parametro_largura)

	% Fs = taxa de amostragem do sinal
	% fc = frequencia de corte do filtro
	% ganhodB = ganho do filtro
	% tipo_parametro = parametro que representa a abrangencia de
	%					frequencias que o filtro afeta, pode ser Q: fator
	%					de qualidade, BW: largura de banda em dB ou S 
	%					(aplicavel apenas para o shelving filter): 
	%					inclinacao do filtro shelf
	% tipo_parametro_largura = string que seleciona qual parametro que esta
	%						 sendo calculado, Q, BW ou S

	A = 10^(ganhodB/40);
	wc = 2*pi*fc/Fs;		% frequencia de corte normalizada
	switch tipo_parametro_largura
		case 'Q'	% fator de qualidade
			Q = parametro_largura;
			alpha = sin(wc)/(2*Q);
		case 'BW'	% largura de banda em dB
			BW = parametro_largura;
			alpha = sin(wc)*sinh(log(2)/2 * BW * wc/sin(wc));
		case 'S'	% inclinacao da curva do shelving filter
			S = parametro_largura;
			alpha = sin(wc)/2 * sqrt((A + 1/A)*(1/S - 1) + 2 );
	end

	
end