module Mux(
    input Seletor,
	 input DM,
	 input DT,
	 output S
); 

	 //Negação
	 not(notSeletor, Seletor);
    
	 // Mux (If Else do Verilog)
	 and(aux0, Seletor, DM);
	 and(aux1, notSeletor, DT);
	 or(S, aux0, aux1);
	 
	 
endmodule 