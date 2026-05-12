read_liberty /home/hawk/.volare/sky130/variants/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog build/moore_mapped.v
link_design moore
create_clock -period 10 [get_ports clk]
report_checks -path_delay min_max
report_tns
report_wns
exit
