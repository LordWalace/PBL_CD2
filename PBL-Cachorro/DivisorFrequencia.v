module DivisorFrequencia(clk, Frequencia1s, Frequencia8s, Frequencia4s, Frequencia2s, Q15);

input clk;
output Frequencia1s, Frequencia8s, Frequencia4s, Frequencia2s, Q15;

Flip_Flop_T(clk, 0, 1, Q);
Flip_Flop_T(Q, 0, 1, Q0);
Flip_Flop_T(Q0, 0, 1, Q1);
Flip_Flop_T(Q1, 0, 1, Q2);
Flip_Flop_T(Q2, 0, 1, Q3);
Flip_Flop_T(Q3, 0, 1, Q4);
Flip_Flop_T(Q4, 0, 1, Q5);
Flip_Flop_T(Q5, 0, 1, Q6);
Flip_Flop_T(Q6, 0, 1, Q7);
Flip_Flop_T(Q7, 0, 1, Q8);
Flip_Flop_T(Q8, 0, 1, Q9);
Flip_Flop_T(Q9, 0, 1, Q10);
Flip_Flop_T(Q10, 0, 1, Q11);
Flip_Flop_T(Q11, 0, 1, Q12);
Flip_Flop_T(Q12, 0, 1, Q13);
Flip_Flop_T(Q13, 0, 1, Q14);
Flip_Flop_T(Q14, 0, 1, Q15); // Talvez eu tenha que subir mais (Caso seja necessario)
Flip_Flop_T(Q15, 0, 1, Q16);
Flip_Flop_T(Q16, 0, 1, Q17);
Flip_Flop_T(Q17, 0, 1, Q18);
Flip_Flop_T(Q18, 0, 1, Q19);
Flip_Flop_T(Q19, 0, 1, Q20);
Flip_Flop_T(Q20, 0, 1, Q21); 
Flip_Flop_T(Q21, 0, 1, Q22); 
Flip_Flop_T(Q22, 0, 1, Q23);
Flip_Flop_T(Q23, 0, 1, Frequencia1s); // 1.3s
Flip_Flop_T(Frequencia1s, 0, 1,Frequencia2s ); //2.6 s
Flip_Flop_T(Frequencia2s, 0, 1, Frequencia4s); // 5.2s
Flip_Flop_T(Frequencia4s, 0, 1, Frequencia8s); // 10.4s

endmodule 