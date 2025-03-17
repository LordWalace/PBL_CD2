module Movimento(clkd, reset, preset, Botao, A7, B7, C7, D7, E7, F7, G7, P7, Q1, Q2, Q3);

	input clkd, reset, preset, Botao;
	output A7, B7, C7, D7, E7, F7, G7, P7, Q1, Q2, Q3;
	
// Flip Flop
	Flip_Flop_D(M1, clkd, reset, Botao, Q1);
	Flip_Flop_D(M2, clkd, Botao, preset, Q2);
	Flip_Flop_D(M3, clkd, reset, Botao, Q3);
	
// Negações
	not(notM1, M1);
	not(notM2, M2);
	not(notM3, M3);
	not(notQ1, Q1);
	not(notQ2, Q2);
	not(notQ3, Q3);

// Fios
	wire and0, and1, and2, and3, and4, and5, and6, and7, and8;

// Expressão para	Q1: F = M1 !M3 + M2 M3
	and(and0, Q1, notQ3);
	and(and1, Q2, Q3);

	or(M1, and0, and1);

// Expressão para	Q2: F = M2 !M3 + !M1 !M2 M3
	and(and2, Q2, notQ3);
	and(and3, notQ1, notQ2, Q3);	

	or(M2, and2, and3);

// Expressão para	Q3: F = !M3	
	not(M3, Q3);

// Expressão para	A: F = Q1 !Q3 + !Q1 !Q2 Q3
	and(and4, Q1, notQ3);
	and(and5, notQ1, notQ2, Q3);

	or(A7, and4, and5);

// Expressão para	B: F = Q1 Q3
	and(B7, Q1, Q3);

// Expressão para	C: F = Q2 !Q3
	and(C7, Q2, notQ3);

// Expressão para D: F = Q1 !Q3 + !Q1 !Q2 Q3
	and(and6, Q1, notQ3);
	and(and7, notQ1, notQ2, Q3);
	
	or(D7, and6, and7);
	
// Expressão para	E: F = Q1 + Q3
	or(E7, Q1, Q3);

// Expressão para F: F = Q2 + !Q1 Q3
	and(and8, notQ1, Q3);

	or(F7, Q2, and8);

// Expressão para	G: F = !Q1 !Q2
	and(G7, notQ1, notQ2);

// Expressão para	P: F = 1
	not(P7, 0);

endmodule 