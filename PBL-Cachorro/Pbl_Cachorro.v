module Pbl_Cachorro(clk, T2s, T4s, T8s, LD, Botao, SA, SB, SC, SD, SE, SF, SG, SP, Led, Disp1, Disp2, Disp3, Disp4);

	input clk, T2s, T4s, T8s, LD, Botao;
	output SA, SB, SC, SD, SE, SF, SG, SP, Led;
	output Disp1, Disp2, Disp3, Disp4; 
	
// Negações
	not(Disp2, 0);
	not(Disp3, 0);
	not(notFS, FS);
	not(notLD, LD);
	not(notBotao, Botao);
	
// Logica de ligar e desligar
	and(aux1, FS, LD);
	and(aux2, notFS, LD);
	
	not(Disp1, aux1);
	not(Disp4, aux2);
	not(Led, notLD);
	
// Modulos de tempo e movimentos
	Tempo_Movimento (T2s, T4s, T8s, clk, LD, TA7, TB7, TC7, TD7, TE7, TF7, TG7, TP7, Tempo, FS, Erro);
	
	Movimento (Tempo, reset, preset, notBotao, A7, B7, C7, D7, E7, F7, G7, P7);

// Modulo do multiplexador
	Mux(FS, TA7, A7, SA);
	Mux(FS, TB7, B7, SB);
	Mux(FS, TC7, C7, SC);
	Mux(FS, TD7, D7, SD);
	Mux(FS, TE7, E7, SE);
	Mux(FS, TF7, F7, SF);
	Mux(FS, TG7, G7, SG);
	Mux(FS, TP7, P7, SP);
	
endmodule 