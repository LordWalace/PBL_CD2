module Tempo_Movimento(T2s, T4s, T8s, clk, LD, A7, B7, C7, D7, E7, F7, G7, P7, Tempo, FS, Erro);

	input T2s, T4s, T8s, clk, LD;
	output A7, B7, C7, D7, E7, F7, G7, P7, Tempo, FS, Erro;

// Negações
	not(not2s, T2s); // 2.6s
	not(not4s, T4s); // 5.2s
	not(not8s, T8s); // 10.4s

// Fios
	wire aux, and0, and1, and2, and3, and4, and0_1, and0_2, and0_3;
	
// Seleçao de velocidade
	DivisorFrequencia(clk, F1s, F8s, F4s, F2s, FS);
	
	and(and0_1, F2s, T2s, not4s, not8s);
	and(and0_2, F4s, not2s, T4s, not8s);
	and(and0_3, F8s, not2s, not4s, T8s);
	or(aux, and0_1, and0_2, and0_3);
	and(Tempo, aux, LD);
	
// Saida do erro RGB
	//and(aux0_1, T2s, T4s, T8s);
	//and(aux0_2, not2s, T4s, T8s);
	//and(aux0_3, T2s, not4s, T8s);
	//and(aux0_4, T2s, T4s, not8s);
	//or(Erro, aux0_1, aux0_2, aux0_3, aux0_4);
	
	
// Expressão para A: F = !2s 4s !8s
	and(A7, not2s, T4s, not8s);
	
// Expressão para B: F = 2s 4s + 2s 8s + 4s 8s
	and(and0, T2s, T4s);
	and(and1, T2s, T8s);
	and(and2, T4s, T8s);
	
	or(B7, and0, and1, and2);
		
// Expressão para C: F = 2s + 4s 8s + !4s !8s
	and(and3, T4s, T8s);
	and(and4, not4s, not8s);
	
	or(C7, T2s, and3, and4);
	
// Expressão para D: F = !2s !8s
	and(D7, not2s, not8s);
		
// Expressão para E: F = !2s 4s !8s
	and(E7, not2s, T4s, not8s);
		
// Expressão para F: F = 2s !4s !8s
	and(F7, T2s, not4s, not8s);
		
// Expressão para G: F = 0
	not(G7, 1);
	
// Expressão para P: F = 1		
	not(P7, 0);
	
endmodule