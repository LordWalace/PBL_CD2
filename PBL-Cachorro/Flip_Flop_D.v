module Flip_Flop_D(d, clk, reset, preset, q);
	input d, clk, reset, preset;
	output reg q;
	
	always @(posedge clk or posedge preset or posedge reset) begin
        if (preset) begin
            q <= 1'b1;  // Preset assincrono, q se torna 1
        end else if (reset) begin
            q <= 1'b0;  // Reset assíncrono, q se torna 0
        end else begin
            q <= d;     // Na borda de subida do clock, q recebe d
        end
    end


endmodule 