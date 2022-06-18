#--------------输入信号---------------------#
# clk
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN W5 [get_ports clk]
# rst
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN U18 [get_ports rst]
# switches
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN R2 [get_ports {sw[7]}]
set_property PACKAGE_PIN T1 [get_ports {sw[6]}]
set_property PACKAGE_PIN U1 [get_ports {sw[5]}]
set_property PACKAGE_PIN W2 [get_ports {sw[4]}]
set_property PACKAGE_PIN R3 [get_ports {sw[3]}]
set_property PACKAGE_PIN T2 [get_ports {sw[2]}]
set_property PACKAGE_PIN T3 [get_ports {sw[1]}]
set_property PACKAGE_PIN V2 [get_ports {sw[0]}]

#--------------输出信号---------------------#
# EnSample
set_property IOSTANDARD LVCMOS33 [get_ports EnSample]
set_property PACKAGE_PIN L1 [get_ports EnSample]
# ClearInt
set_property IOSTANDARD LVCMOS33 [get_ports ClearInt]
set_property PACKAGE_PIN P1 [get_ports ClearInt]
# SigOn
set_property IOSTANDARD LVCMOS33 [get_ports SigOn]
set_property PACKAGE_PIN N3 [get_ports SigOn]
# RefOn
set_property IOSTANDARD LVCMOS33 [get_ports RefOn]
set_property PACKAGE_PIN P3 [get_ports RefOn]
# LEDs
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property PACKAGE_PIN U16 [get_ports {led[0]}]


# connect_debug_port u_ila_0/probe0 [get_nets [list {inst_nFlagGen/counter[0]} {inst_nFlagGen/counter[1]} {inst_nFlagGen/counter[2]} {inst_nFlagGen/counter[3]} {inst_nFlagGen/counter[4]} {inst_nFlagGen/counter[5]} {inst_nFlagGen/counter[6]} {inst_nFlagGen/counter[7]} {inst_nFlagGen/counter[8]}]]
# connect_debug_port u_ila_0/probe5 [get_nets [list inst_top/clk500k]]
# connect_debug_port u_ila_0/probe6 [get_nets [list EnSample_OBUF]]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 9 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {inst_nFlagGen/counter[0]} {inst_nFlagGen/counter[1]} {inst_nFlagGen/counter[2]} {inst_nFlagGen/counter[3]} {inst_nFlagGen/counter[4]} {inst_nFlagGen/counter[5]} {inst_nFlagGen/counter[6]} {inst_nFlagGen/counter[7]} {inst_nFlagGen/counter[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {sw_IBUF[0]} {sw_IBUF[1]} {sw_IBUF[2]} {sw_IBUF[3]} {sw_IBUF[4]} {sw_IBUF[5]} {sw_IBUF[6]} {sw_IBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {led_OBUF[0]} {led_OBUF[1]} {led_OBUF[2]} {led_OBUF[3]} {led_OBUF[4]} {led_OBUF[5]} {led_OBUF[6]} {led_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {inst_top/cntOut[0]} {inst_top/cntOut[1]} {inst_top/cntOut[2]} {inst_top/cntOut[3]} {inst_top/cntOut[4]} {inst_top/cntOut[5]} {inst_top/cntOut[6]} {inst_top/cntOut[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list ClearInt_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list clk500k]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list EnSample_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list inst_top/Load]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list nFlag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list RefOn_OBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list rst_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list SigOn_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
