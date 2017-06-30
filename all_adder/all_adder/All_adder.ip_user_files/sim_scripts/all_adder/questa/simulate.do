onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib all_adder_opt

do {wave.do}

view wave
view structure
view signals

do {all_adder.udo}

run -all

quit -force
