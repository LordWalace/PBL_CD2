module Flip_Flop_T(
    input wire clk,      // Sinal de clock
    input wire reset,    // Sinal de reset assíncrono
    input wire T,        // Sinal de controle T
    output reg Q         // Saída do flip-flop
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 0;          // Reset assíncrono
    end else if (T) begin
        Q <= ~Q;         // Toggle quando T é alto
    end
end

endmodule 