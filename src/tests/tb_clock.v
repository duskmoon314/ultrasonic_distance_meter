`timescale  1ns / 1ps

module tb_clock;

// clock Parameters
parameter PERIOD = 10;


// clock Inputs
reg clk = 0 ;
reg reset = 0 ;

// clock Outputs
wire clk_40k ;
wire clk_17k ;
wire clk_34 ;


initial
  begin
    forever
      #(PERIOD / 2) clk = ~clk;
  end

initial
  begin
    #100;
    #(PERIOD * 2) reset = 1;
  end

clock u_clock (
        .clk ( clk ),
        .reset ( reset ),

        .clk_40k ( clk_40k ),
        .clk_17k ( clk_17k ),
        .clk_34 ( clk_34 )
      );

initial
  begin
    #50000000;
    $finish;
  end

endmodule
