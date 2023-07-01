transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib ipselector
vmap ipselector ipselector
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/ipselector.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter_003.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter_001.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_seg7.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_sdram.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector_cpu.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector_cpu_debug_slave_tck.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_ipselector_cpu_test_bench.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_debug.v}
vlog -vlog01compat -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_button.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/lenet_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/max_index_10.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/larger_index.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/ipselector {C:/Users/minut/Desktop/ipselector/blk_mem_gen_0.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/ipselector {C:/Users/minut/Desktop/ipselector/blk_mem_gen_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/ipselector {C:/Users/minut/Desktop/ipselector/blk_mem_gen_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/relu_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/pool_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/pool_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/multi_add.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/max_pool.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/fc_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/fc_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/conv_3.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/conv_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/layers/conv_1.v}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_irq_mapper.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter_003_error_adapter_0.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router_005.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router_004.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router_003.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router_002.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router_001.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/ipselector_mm_interconnect_0_router.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work ipselector +incdir+C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules {C:/Users/minut/Desktop/ipselector/ipselector/synthesis/submodules/tops.sv}
vlog -sv -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/x7seg {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/x7seg/x7seg_scan.sv}
vlog -sv -work work +incdir+C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/x7seg {C:/Users/minut/Desktop/licentaaaa/LeNet-5_FPGA-main/LeNet-5_FPGA-main/src/LeNet_verilog/x7seg/x7seg_dec.sv}

