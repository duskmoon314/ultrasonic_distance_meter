`timescale  1ns / 1ps

module nixieTube(
         clk,
         count,
         reset,
         an,
         leds
       );

input clk, reset;
input [11: 0] count;
output [2: 0] an;
output [7: 0] leds;

wire [6: 0] out0, out1, out2;
reg [7: 0] leds;
reg [2: 0] an;

BCD7 bcd0(.din(count[3: 0]), .dout(out0));
BCD7 bcd1(.din(count[7: 4]), .dout(out1));
BCD7 bcd2(.din(count[11: 8]), .dout(out2));

always @(posedge clk or posedge reset)
  begin
    if (reset)
      begin
        an <= 3'b001;
        leds <= {1'b0, out0};
      end
    else
      begin
        case (an)
          3'b001:
            begin
              an <= 3'b100;
              leds <= {1'b1, out2};
            end
          3'b100:
            begin
              an <= 3'b010;
              leds <= {1'b0, out1};
            end
          3'b010:
            begin
              an <= 3'b001;
              leds <= {1'b0, out0};
            end
          default:
            begin
              an <= 3'b001;
              leds <= {1'b0, out0};
            end
        endcase
      end
  end
endmodule
