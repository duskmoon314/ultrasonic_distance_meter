set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {clk}]
create_clock -period 10.000 -name CLK -waveform {0.000 5.000} [get_ports clk]

set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {reset}]

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {clk_40k}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {clk_17k}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {clk_34}]