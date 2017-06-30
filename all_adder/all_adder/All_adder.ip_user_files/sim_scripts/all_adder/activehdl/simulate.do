onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+all_adder -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.all_adder xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {all_adder.udo}

run -all

endsim

quit -force
