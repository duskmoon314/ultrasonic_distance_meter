`timescale  1ns / 1ns

module tb_USDistMeter;

// USDistMeter Parameters
parameter PERIOD = 10;


// USDistMeter Inputs
reg clk = 0 ;
reg reset = 1 ;
reg sig_in = 0 ;

// USDistMeter Outputs
wire sig_mod ;
wire [2: 0] an ;
wire [7: 0] leds ;


initial
  begin
    forever
      #(PERIOD / 2) clk = ~clk;
  end

initial
  begin
    #100;
    #(PERIOD * 2) reset = 0;
  end

USDistMeter u_USDistMeter (
              .clk ( clk ),
              .reset ( reset ),
              .sig_in ( sig_in ),

              .sig_mod ( sig_mod ),
              .an ( an [2: 0] ),
              .leds ( leds [7: 0] )
            );

initial
  begin
    #50000000;
    $finish;
  end

always @( posedge clk )
  begin
    sig_in <= #2058823 sig_mod;
  end

endmodule
