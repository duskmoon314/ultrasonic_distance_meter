set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {clk}]
create_clock -period 10.000 -name CLK -waveform {0.000 5.000} [get_ports clk]

set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {reset}]

set_property -dict {PACKAGE_PIN E15 IOSTANDARD LVCMOS33} [get_ports {sig_mod}]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {sig_in}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sig_in]

set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS33} [get_ports {leds[0]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {leds[1]}]
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {leds[2]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports {leds[3]}]
set_property -dict {PACKAGE_PIN A1 IOSTANDARD LVCMOS33} [get_ports {leds[4]}]
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports {leds[5]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {leds[6]}]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports {leds[7]}]

set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports {an[2]}]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports {an[1]}]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {an[0]}]
