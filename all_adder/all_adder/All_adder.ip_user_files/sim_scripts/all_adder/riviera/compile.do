vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/all_adder/hdl/all_adder.v" \
"../../../bd/all_adder/ipshared/9f30/src/half_adder.v" \
"../../../bd/all_adder/ip/all_adder_half_adder_0_0/sim/all_adder_half_adder_0_0.v" \
"../../../bd/all_adder/ip/all_adder_half_adder_1_0/sim/all_adder_half_adder_1_0.v" \
"../../../bd/all_adder/ipshared/8139/src/OR1.v" \
"../../../bd/all_adder/ip/all_adder_OR1_0_1/sim/all_adder_OR1_0_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

