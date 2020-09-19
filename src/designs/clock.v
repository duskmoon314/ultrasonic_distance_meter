`timescale  1ns / 1ps

module clock (
         // 100 MHz onboard
         clk,
         clk_40k,
         clk_17k,
         clk_1k,
         clk_34,
         reset
       );

input clk, reset;
output clk_40k, clk_17k, clk_1k, clk_34;

reg clk_40k, clk_17k, clk_1k, clk_34;

reg [11: 0] cnt_40k;
reg [12: 0] cnt_17k;
reg [15: 0] cnt_1k;
reg [8: 0] cnt_34;

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        clk_40k <= 0;
        cnt_40k <= 0;
      end
    else
      begin
        if (cnt_40k >= 12'd1249)
          begin
            cnt_40k <= 0;
            clk_40k <= ~clk_40k;
          end
        else
          begin
            cnt_40k <= cnt_40k + 1;
          end
      end
  end

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        clk_17k <= 0;
        cnt_17k <= 0;
      end
    else
      begin
        if (cnt_17k >= 13'd2940)
          begin
            cnt_17k <= 0;
            clk_17k <= ~clk_17k;
          end
        else
          begin
            cnt_17k <= cnt_17k + 1;
          end
      end
  end

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        cnt_1k <= 0;
        clk_1k <= 0;
      end
    else
      begin
        if (cnt_1k == 16'd49999)
          begin
            cnt_1k <= 0;
            clk_1k <= ~clk_1k;
          end
        else
          begin
            cnt_1k <= cnt_1k + 1;
          end
      end
  end

always @(posedge clk_17k or posedge reset)
  begin
    if (reset)
      begin
        clk_34 <= 0;
        cnt_34 <= 0;
      end
    else
      begin
        if (cnt_34 < 9'd1)
          begin
            clk_34 <= 1;
          end
        else
          begin
            clk_34 <= 0;
          end

        if (cnt_34 >= 9'd499)
          begin
            cnt_34 <= 0;
          end
        else
          begin
            cnt_34 <= cnt_34 + 1;
          end
      end
  end
endmodule
