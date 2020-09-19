`timescale  1ns / 1ps

/*
 * in signal
 * out 3 * BCD
**/

module counter(
         en,
         sig,
         reset,
         out,
       );
input en, sig, reset;
output [11: 0] out;

reg [3: 0] out_2, out_1, out_0;
reg overflow;

always @(posedge sig or posedge reset)
  begin
    if (reset)
      begin
        out_2 <= 4'd0;
        out_1 <= 4'd0;
        out_0 <= 4'd0;
        overflow <= 0;
      end
    else
      begin
        if (en)
          begin
            out_0 <= out_0 + 1;
            if (out_0 == 4'd9)
              begin
                out_0 <= 4'd0;
                out_1 <= out_1 + 1;
                if (out_1 == 4'd9)
                  begin
                    out_1 <= 4'd0;
                    out_2 <= out_2 + 1;
                    if (out_2 == 4'd9)
                      begin
                        out_2 <= 4'd0;
                      end
                  end
              end
          end
      end
  end

assign out = {out_2[3: 0], out_1[3: 0], out_0[3: 0]};

endmodule
