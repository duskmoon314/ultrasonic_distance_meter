module USDistMeter (
         clk,
         reset,
         sig_mod,
         sig_in,
         an,
         leds
       );
input clk, reset, sig_in;
output sig_mod;
output [2: 0] an;
output [7: 0] leds;

wire clk_40k, clk_17k, clk_1k, clk_34;
wire [11: 0] cnt_out;

reg enable;
reg [11: 0] cnt_out_reg;

assign sig_mod = clk_40k && clk_34;

clock clk_source(
        .clk(clk),
        .clk_40k(clk_40k),
        .clk_17k(clk_17k),
        .clk_1k(clk_1k),
        .clk_34(clk_34),
        .reset(reset));

counter cnt(
          .en(enable),
          .sig(clk_17k),
          .reset(clk_34),
          .out(cnt_out));

nixieTube cathodes(
            .clk(clk_1k),
            .count(cnt_out_reg),
            .reset(reset),
            .an(an),
            .leds(leds));

always @(posedge clk_34 or posedge sig_in)
  begin
    if (clk_34)
      begin
        enable <= 1;
      end
    else if (sig_in)
      begin
        if (~((cnt_out[7: 4] < 4'd2) && (cnt_out[11: 8] == 4'd0)))
          begin
            enable <= 0;
          end
      end
  end

always @(posedge clk_34)
  begin
    cnt_out_reg <= cnt_out;
  end

endmodule
