onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.all_adder xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {all_adder.udo}

run -all

quit -force
